From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 24 Mar 2013 13:56:45 +0100
Subject: [Buildroot] [git commit] dependencies: test all programs before
	bailing out
Message-ID: <20130324130053.33E7C9B258@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=11f4c694e97f9610148b043f1c4119af047dba6a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The current dependencies code abort as soon as one program is
missing. It is quite annoying when multiple programs are
missing. Instead, bail out if needed after testing all programs.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 support/dependencies/dependencies.sh |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index ab7f4a4..c11d362 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -131,9 +131,11 @@ if ! $SHELL --version 2>&1 | grep -q '^GNU bash'; then
 fi;
 
 # Check that a few mandatory programs are installed
+missing_progs="no"
 for prog in patch perl tar wget cpio python unzip rsync ${DL_TOOLS} ; do
     if ! which $prog > /dev/null ; then
 	/bin/echo -e "You must install '$prog' on your build machine";
+	missing_progs="yes"
 	if test $prog = "svn" ; then
 	    /bin/echo -e "  svn is usually part of the subversion package in your distribution"
 	elif test $prog = "hg" ; then
@@ -143,10 +145,13 @@ for prog in patch perl tar wget cpio python unzip rsync ${DL_TOOLS} ; do
 	elif test $prog = "bzcat" ; then
             /bin/echo -e "  bzcat is usually part of the bzip2 package in your distribution"
 	fi
-	exit 1;
     fi
 done
 
+if test "${missing_progs}" = "yes" ; then
+    exit 1
+fi
+
 if grep ^BR2_TOOLCHAIN_BUILDROOT=y $BUILDROOT_CONFIG > /dev/null && \
    grep ^BR2_ENABLE_LOCALE=y       $BUILDROOT_CONFIG > /dev/null ; then
    if ! which locale > /dev/null ; then
