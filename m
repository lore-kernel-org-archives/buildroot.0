From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 4 Sep 2013 11:58:12 +0200
Subject: [Buildroot] [git commit] setlocalversion: sync with Linux kernel
	version (2.6.34)
Message-ID: <20130904095831.D0E169B6EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=33699aac06334fe5b8c36fae3897ce16e9acd475
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Brings a number of fixes, and most importantly no longer tries to figure
out if the tree contains uncommitted changes when using svn, as that can
be very slow.

This only syncs with setlocalversion as of 2.6.34 as later kernel versions
aren't directly compatible with our use cases since 09155120c (kbuild:
Clean up and speed up the localversion logic).

We still have one delta from the kernel version (setlocalversion: fix i18n
issue with svn), as that has only later been fixed in the kernel version.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 support/scripts/setlocalversion |   40 ++++++++++++++++++++++++--------------
 1 files changed, 25 insertions(+), 15 deletions(-)

diff --git a/support/scripts/setlocalversion b/support/scripts/setlocalversion
index a6edd71..adeeb78 100755
--- a/support/scripts/setlocalversion
+++ b/support/scripts/setlocalversion
@@ -1,5 +1,13 @@
 #!/bin/sh
-# Print additional version information for non-release trees.
+#
+# This scripts adds local version information from the version
+# control systems git, mercurial (hg) and subversion (svn).
+#
+# If something goes wrong, send a mail the kernel build mailinglist
+# (see MAINTAINERS) and CC Nico Schottelius
+# <nico-linuxsetlocalversion -at- schottelius.org>.
+#
+#
 
 usage() {
 	echo "Usage: $0 [srctree]" >&2
@@ -10,10 +18,17 @@ cd "${1:-.}" || usage
 
 # Check for git and a git repo.
 if head=`git rev-parse --verify --short HEAD 2>/dev/null`; then
-	# Do we have an untagged version?
-	if git name-rev --tags HEAD | grep -E '^HEAD[[:space:]]+(.*~[0-9]*|undefined)$' > /dev/null; then
-		if tag=`git describe 2>/dev/null`; then
-			echo $tag | awk -F- '{printf("-%05d-%s", $(NF-1),$(NF))}'
+
+	# If we are at a tagged commit (like "v2.6.30-rc6"), we ignore it,
+	# because this version is defined in the top level Makefile.
+	if [ -z "`git describe --exact-match 2>/dev/null`" ]; then
+
+		# If we are past a tagged commit (like "v2.6.30-rc5-302-g72357d5"),
+		# we pretty print it.
+		if atag="`git describe 2>/dev/null`"; then
+			echo "$atag" | awk -F- '{printf("-%05d-%s", $(NF-1),$(NF))}'
+
+		# If we don't have a tag at all we print -g{commitish}.
 		else
 			printf '%s%s' -g $head
 		fi
@@ -24,8 +39,10 @@ if head=`git rev-parse --verify --short HEAD 2>/dev/null`; then
 	        printf -- '-svn%s' "`git svn find-rev $head`"
 	fi
 
-	# Are there uncommitted changes?
-	git update-index --refresh --unmerged > /dev/null
+	# Update index only on r/w media
+	[ -w . ] && git update-index --refresh --unmerged > /dev/null
+
+	# Check for uncommitted changes
 	if git diff-index --name-only HEAD | grep -v "^scripts/package" \
 	    | read dummy; then
 		printf '%s' -dirty
@@ -58,14 +75,7 @@ fi
 # Check for svn and a svn repo.
 if rev=`LC_ALL=C svn info 2>/dev/null | grep '^Last Changed Rev'`; then
 	rev=`echo $rev | awk '{print $NF}'`
-	changes=`LC_ALL=C svn status 2>/dev/null | grep '^[AMD]' | wc -l`
-
-	# Are there uncommitted changes?
-	if [ $changes != 0 ]; then
-		printf -- '-svn%s%s' "$rev" -dirty
-	else
-		printf -- '-svn%s' "$rev"
-	fi
+	printf -- '-svn%s' "$rev"
 
 	# All done with svn
 	exit
