From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Aug 2020 20:06:23 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] Makefile: properly
 account for custom tags in BR2_VERSION_FULL
Message-ID: <20200813180042.5B221813FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9e4ffdc8cfdf4c73f4fa8c66259a5aadaee4ae88
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

BR2_VERSION_FULL is currently defined as follows:

  BR2_VERSION_FULL := $(BR2_VERSION)$(shell $(TOPDIR)/support/scripts/setlocalversion)

This BR2_VERSION_FULL value then gets used as the "VERSION" variable
in the /etc/os-release file.

The logic of "setlocalversion" is that if it is exactly on a tag, it
returns nothing.

If it is on a tag + a number of commits, then it returns only
-XYZ-gABC where XYZ is the number of commits since the last tag, and
ABC the git commit hash (these are extracted from git describe).

This output then gets concatenated to BR2_VERSION which gives
something like 2020.05 or 2020.05-00123-g5bc6a.

The issue is that when you're on a tag specific to your project, which
is not a Buildroot YYYY.MM tag, then the output of setlocalversion is
empty, and all you get as VERSION in os-release is $(BR2_VERSION)
which is not really nice. Worse, if you have another non-official
Buildroot tag between the last official Buildroot tag/version and
where you are, you will get $(BR2_VERSION)-XYZ-gABC, but XYZ will not
correspond to the number of commits since BR2_VERSION, but since the
last tag that "git describe" as found, which is clearly incorrect.

Here is an example: you're on master, "make print-version" (which
displays BR2_VERSION_FULL) will show:

$ make print-version
2020.08-git-00758-gc351877a6e

So far so good. Now, you create a tag say 5 commits "before" master,
and show BR2_VERSION_FULL again:

$ git tag -a -m "dummy tag" dummy-tag HEAD~5
$ make print-version
2020.08-git-00005-gc351877a6e

This makes you believe you are 5 commits above 2020.08, which is
absolutely wrong.

So this commit simplifies the logic of setlocalversion to simply
return what "git describe" provides, and not prepend $(BR2_VERSION) in
the main Makefile. Since official Buildroot tags match official
Buildroot version names, you get the same output when you're on an
official Buildroot tag, or some commits above a Buildroot tag. An in
other cases, you get a sensible output. The logic is also adjusted for
the Mercurial case.

In the above situation, with this commit applied, we get:

$ make print-version
dummy-tag-6-g6258cdddeb

(6 commits instead of 5 as we have this very commit applied, but at
least it's 6 commits on top of the dummy-tag)

Finally, if you're not using a version control system, setlocalversion
was already returning nothing, so in this case, the Makefile simply
sets BR2_VERSION_FULL to BR2_VERSION to preserve this behavior.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 98c99556e3ec19fe0e746b7b291fb56e909041a9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile                        |  8 +++++++-
 support/scripts/setlocalversion | 23 ++++++++++-------------
 2 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/Makefile b/Makefile
index b2dfce197a..7eb08a7972 100644
--- a/Makefile
+++ b/Makefile
@@ -113,7 +113,13 @@ DATE := $(shell date +%Y%m%d)
 
 # Compute the full local version string so packages can use it as-is
 # Need to export it, so it can be got from environment in children (eg. mconf)
-export BR2_VERSION_FULL := $(BR2_VERSION)$(shell $(TOPDIR)/support/scripts/setlocalversion)
+
+BR2_LOCALVERSION := $(shell $(TOPDIR)/support/scripts/setlocalversion)
+ifeq ($(BR2_LOCALVERSION),)
+export BR2_VERSION_FULL := $(BR2_VERSION)
+else
+export BR2_VERSION_FULL := $(BR2_LOCALVERSION)
+endif
 
 # List of targets and target patterns for which .config doesn't need to be read in
 noconfig_targets := menuconfig nconfig gconfig xconfig config oldconfig randconfig \
diff --git a/support/scripts/setlocalversion b/support/scripts/setlocalversion
index b39b751f03..e04c955d9e 100755
--- a/support/scripts/setlocalversion
+++ b/support/scripts/setlocalversion
@@ -19,19 +19,14 @@ cd "${1:-.}" || usage
 # Check for git and a git repo.
 if head=`git rev-parse --verify --short HEAD 2>/dev/null`; then
 
-	# If we are at a tagged commit (like "v2.6.30-rc6"), we ignore it,
-	# because this version is defined in the top level Makefile.
-	if [ -z "`git describe --exact-match 2>/dev/null`" ]; then
-
-		# If we are past a tagged commit (like "v2.6.30-rc5-302-g72357d5"),
-		# we pretty print it.
-		if atag="`git describe 2>/dev/null`"; then
-			echo "$atag" | awk -F- '{printf("-%05d-%s", $(NF-1),$(NF))}'
-
-		# If we don't have a tag at all we print -g{commitish}.
-		else
-			printf '%s%s' -g $head
-		fi
+	atag="`git describe 2>/dev/null`"
+
+	# Show -g<commit> if we have no tag, or just the tag
+	# otherwise.
+	if [ -z "${atag}" ] ; then
+		printf "%s%s" -g ${head}
+	else
+		printf ${atag}
 	fi
 
 	# Is this git on svn?
@@ -60,6 +55,8 @@ if hgid=`HGRCPATH= hg id --id --tags 2>/dev/null`; then
 	if [ -z "$tag" -o "$tag" = tip ]; then
 		id=`printf '%s' "$hgid" | sed 's/[+ ].*//'`
 		printf '%s%s' -hg "$id"
+	else
+		printf ${tag}
 	fi
 
 	# Are there uncommitted changes?
