From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 10 Oct 2020 22:43:19 +0200
Subject: [Buildroot] [git commit branch/2020.05.x]
 support/scripts/apply-patches.sh: do not blindly remove *.orig files
Message-ID: <20201010203802.494B28F1AB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ed9ef373aba7ed27e0cd6d93c3ffe9c4a6cef142
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

apply-patches currently blindly removes *.orig / .*.orig files as GNU patch
by default writes these as backup files when patches only apply with fuzz.

This is unfortunate as package sources may contain files ending in .orig as
well, breaking the build.  Luckily GNU patch can be told to not write these
backup files using the --no-backup-if-mismatch option, so used that instead
of the .orig removal step.

--no-backup-if-mismatch is supported since GNU patch 2.3.8 (1997-06-17) and
busybox patch if built with CONFIG_DESKTOP, but E.G.  isn't supported by the
BSD patch, so add logic to dependencies.sh to error out if patch doesn't
support the flag.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 42f61e759a977d75a2c8a1580c3187c92e155b04)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/dependencies/dependencies.sh | 6 ++++++
 support/scripts/apply-patches.sh     | 5 +----
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 98469bd70c..891e234045 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -180,6 +180,12 @@ if test "${missing_progs}" = "yes" ; then
 	exit 1
 fi
 
+# apply-patches.sh needs patch with --no-backup-if-mismatch support (GNU, busybox w/DESKTOP)
+if ! patch --no-backup-if-mismatch </dev/null 2>/dev/null; then
+	echo "Your patch program does not support the --no-backup-if-mismatch option. Install GNU patch"
+	exit 1
+fi
+
 if grep ^BR2_NEEDS_HOST_UTF8_LOCALE=y $BR2_CONFIG > /dev/null; then
 	if ! which locale > /dev/null ; then
 		echo
diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index 66fef262ee..2d39d63da1 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -119,7 +119,7 @@ function apply_patch {
         exit 1
     fi
     echo "${path}/${patch}" >> ${builddir}/.applied_patches_list
-    ${uncomp} "${path}/$patch" | patch -g0 -p1 -E -d "${builddir}" -t -N $silent
+    ${uncomp} "${path}/$patch" | patch -g0 -p1 -E --no-backup-if-mismatch -d "${builddir}" -t -N $silent
     if [ $? != 0 ] ; then
         echo "Patch failed!  Please fix ${patch}!"
         exit 1
@@ -168,6 +168,3 @@ if [ "`find $builddir/ '(' -name '*.rej' -o -name '.*.rej' ')' -print`" ] ; then
     echo "Aborting.  Reject files found."
     exit 1
 fi
-
-# Remove backup files
-find $builddir/ '(' -name '*.orig' -o -name '.*.orig' ')' -exec rm -f {} \;
