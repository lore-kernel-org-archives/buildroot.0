From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 9 Oct 2012 09:36:35 +0200
Subject: [Buildroot] [git commit] netkittelnet: fix build on toolchains
	without C++ support
Message-ID: <20121009073905.21ABD9980B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eaef48367e24724da6533b3b78978cf9f0da19d7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The configure script checks for C++ support as telnet (but not telnetd)
contains C++ code. This used to work by accident if the host had g++,
as we didn't pass TARGET_CONFIGURE_OPTS to configure (which sets CXX to
/bin/false).

Fix it by removing the g++ check and rewriting the configure checks to
use the C compiler instead.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/netkittelnet/netkittelnet.mk    |    2 ++
 package/netkittelnet/netkittelnet.patch |   25 ++++++++++++++++++-------
 2 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/package/netkittelnet/netkittelnet.mk b/package/netkittelnet/netkittelnet.mk
index 7bcfaf8..a0f2786 100644
--- a/package/netkittelnet/netkittelnet.mk
+++ b/package/netkittelnet/netkittelnet.mk
@@ -14,6 +14,8 @@ define NETKITTELNET_CONFIGURE_CMDS
 	$(SED) "s/main()/main(void)/;" $(@D)/configure
 	# Disable termcap support
 	$(SED) "s~\(.*termcap\.h.*\)~/* \1 */~;" $(@D)/telnetd/telnetd.c
+	# C++ support not needed for telnetd
+	$(SED) 's/CXX/CC/g' -e 's/conftest.cc/conftest.c/g' $(@D)/configure
 	(cd $(@D); \
 		$(TARGET_CONFIGURE_OPTS) \
 		./configure \
diff --git a/package/netkittelnet/netkittelnet.patch b/package/netkittelnet/netkittelnet.patch
index 863bbcd..ee4f37e 100644
--- a/package/netkittelnet/netkittelnet.patch
+++ b/package/netkittelnet/netkittelnet.patch
@@ -24,14 +24,25 @@
         ) >/dev/null 2>&1 || continue;
         CXX=$TRY
         break;
-@@ -141,7 +138,6 @@
-     echo -n 'Checking if C++ compiler works... '
-     if (
-           $CXX __conftest.cc -o __conftest || exit 1
+@@ -138,18 +135,5 @@
+     fi
+     echo "$CXX"
+-else
+-    echo -n 'Checking if C++ compiler works... '
+-    if (
+-          $CXX __conftest.cc -o __conftest || exit 1
 -          ./__conftest || exit 1
-        ) >/dev/null 2>&1; then
-          echo 'yes'
-      else
+-       ) >/dev/null 2>&1; then
+-         echo 'yes'
+-     else
+-         echo 'no'
+-         echo 'Compiler '"$CXX"' does not exist or cannot compile C++; try another.'
+-         rm -f __conftest*
+-         exit
+-     fi
+ fi
+ 
+ echo -n "Checking if $CXX accepts gcc warnings... "
 @@ -278,13 +274,11 @@
  EOF
  if (
