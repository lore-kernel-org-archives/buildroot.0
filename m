From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Mar 2013 09:26:44 +0100
Subject: [Buildroot] [PATCH 20/22] dependencies: test all programs before
	bailing out
In-Reply-To: <1364113606-20836-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1364113606-20836-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1364113606-20836-21-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The current dependencies code abort as soon as one program is
missing. It is quite annoying when multiple programs are
missing. Instead, bail out if needed after testing all programs.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/dependencies/dependencies.sh |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

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
-- 
1.7.9.5
