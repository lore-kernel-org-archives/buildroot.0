From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 26 Jan 2011 14:57:00 +0100
Subject: [Buildroot] [git commit master 1/1] autoconf: don't append -dirty
	to version number if built in buildroot git tree
Message-ID: <20110126135723.6098E82958@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ed3ac88635ce51591f4b7195f7078d86cfbfc382
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Autoconf would append -dirty to it's version number, causing build breakage
with packages explicitly requesting autoconf 2.65, if built in a subdir
of a git tree with uncommitted changes. This is a relatively common
situation when developing on BR.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../autoconf-2.65-dont-add-dirty-to-version.patch  |   30 ++++++++++++++++++++
 1 files changed, 30 insertions(+), 0 deletions(-)
 create mode 100644 package/autoconf/autoconf-2.65-dont-add-dirty-to-version.patch

diff --git a/package/autoconf/autoconf-2.65-dont-add-dirty-to-version.patch b/package/autoconf/autoconf-2.65-dont-add-dirty-to-version.patch
new file mode 100644
index 0000000..38ac163
--- /dev/null
+++ b/package/autoconf/autoconf-2.65-dont-add-dirty-to-version.patch
@@ -0,0 +1,30 @@
+autoconf: don't append -dirty to version
+
+Don't append -dirty to autoconf version number if the buildroot git tree
+has uncommited changes.
+
+This script is meant for the autoconf developers, but it also activates
+if you build autoconf in a subdirectory of a git tree (E.G. like how it's
+commonly done in buildroot).
+
+The affect is that autoconf gets built as being version 2.65-dirty, which
+breaks programs (like Python) which explicitly checks for autoconf-2.65.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ build-aux/git-version-gen |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: autoconf-2.65/build-aux/git-version-gen
+===================================================================
+--- autoconf-2.65.orig/build-aux/git-version-gen
++++ autoconf-2.65/build-aux/git-version-gen
+@@ -135,7 +135,7 @@ case "$dirty" in
+     *) # Append the suffix only if there isn't one already.
+ 	case $v in
+ 	  *-dirty) ;;
+-	  *) v="$v-dirty" ;;
++	  #*) v="$v-dirty" ;;
+ 	esac ;;
+ esac
+ 
-- 
1.7.3.4
