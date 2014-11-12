From: Jens Stimpfle <debian@jstimpfle.de>
Date: Wed, 12 Nov 2014 13:31:44 +0000
Subject: [Buildroot] [PATCH 1/2] Avoid misleading error output caused by
	missing shell quotes
Message-ID: <1415799105-27566-1-git-send-email-debian@jstimpfle.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jens Stimpfle <debian@jstimpfle.de>
---

Notes:
    When g++ is not installed, a misleading error message turns up because
    of a bad combination of an unquoted shell variable and control flow.
    
    > ~/buildroot$ make
    >
    > You may have to install 'g++' on your build machine
    > /home/testuser/buildroot/support/dependencies/dependencies.sh: 136: [: -lt: unexpected operator
    
    This is a nonintrusive workaround.

 support/dependencies/dependencies.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index a9c5b31..4b8991d 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -118,7 +118,6 @@ CXXCOMPILER=$(which $HOSTCXX_NOCCACHE 2> /dev/null)
 if [ -z "$CXXCOMPILER" ] ; then
 	CXXCOMPILER=$(which c++ 2> /dev/null)
 fi
-
 if [ -z "$CXXCOMPILER" ] ; then
 	echo
 	echo "You may have to install 'g++' on your build machine"
@@ -130,7 +129,8 @@ if [ ! -z "$CXXCOMPILER" ] ; then
 		echo
 		echo "You may have to install 'g++' on your build machine"
 	fi
-
+fi
+if [ ! -z "$CXXCOMPILER_VERSION" ] ; then
 	CXXCOMPILER_MAJOR=$(echo $CXXCOMPILER_VERSION | sed -e "s/\..*//g")
 	CXXCOMPILER_MINOR=$(echo $CXXCOMPILER_VERSION | sed -e "s/^$CXXCOMPILER_MAJOR\.//g" -e "s/\..*//g")
 	if [ $CXXCOMPILER_MAJOR -lt 3 -o $CXXCOMPILER_MAJOR -eq 2 -a $CXXCOMPILER_MINOR -lt 95 ] ; then
-- 
2.1.1
