From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 19 Mar 2014 00:33:49 +0100
Subject: [Buildroot] [PATCH] support: properly check bash is available
Message-ID: <1395185629-728-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

The current check is broken, as it only checks if the user's login
shell is bash, not what the system shell is.

Mimick the sequence found in the top-level Makefile to search for
bash, except for the fallback case, where we explicitly check that
'sh' is bash, by checking if it sets $BASH, so we know the fallback
case, in the top-level Makefile, to use 'sh' will indeed use bash.

Remove superfluous semi-colons ';' at the end of lines, they are
not needed in a shell script (this is not C!)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Andrew Barnes <andy@outsideglobe.com>
---
 support/dependencies/dependencies.sh | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index a8261b3..0566814 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -139,11 +139,15 @@ if [ ! -z "$CXXCOMPILER" ] ; then
 fi
 
 # Check bash
-if ! $SHELL --version 2>&1 | grep -q '^GNU bash'; then
+# We only check bash is available, setting SHELL appropriately is done
+# in the top-level Makefile, and we mimick the same sequence here
+if   [ -n "${BASH}" ]; then :
+elif [ -x /bin/bash ]; then :
+elif [ -z "$( sh -c 'echo $BASH' )" ]; then
 	echo
-	echo "You must install 'bash' on your build machine";
-	exit 1;
-fi;
+	echo "You must install 'bash' on your build machine"
+	exit 1
+fi
 
 # Check that a few mandatory programs are installed
 missing_progs="no"
-- 
1.8.3.2
