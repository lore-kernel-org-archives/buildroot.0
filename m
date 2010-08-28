From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 29 Aug 2010 00:14:40 +0200
Subject: [Buildroot] [git commit master 1/1] uClibc: fix ppc e500 handling
Message-ID: <20100828221610.2A0B687345@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e8fdc08dc39ea28e5e098f696477e4a13f4ebd94
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #2449

Signed-off-by: Stanislav Bogatyrev <bogatyrev_stanislav@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                    |    1 +
 toolchain/uClibc/uclibc.mk |    8 +-------
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/CHANGES b/CHANGES
index 86a2cc2..c18edab 100644
--- a/CHANGES
+++ b/CHANGES
@@ -24,6 +24,7 @@
 
 	#635:  util-linux fails to build in 2009.08
 	#2239: netcat package installs its binary to target as avr32-linux...
+	#2449: Minor fixes for squashfs makefile and correct PowerPC e500 ...
 
 2010.08-rc1, Released July 30th, 2010:
 
diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index b9ef551..4fb9393 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -217,13 +217,7 @@ ifeq ($(UCLIBC_TARGET_ARCH),sparc)
 	$(SED) 's/^.*$(UCLIBC_SPARC_TYPE)[^B].*/$(UCLIBC_SPARC_TYPE)=y/g' $(UCLIBC_DIR)/.oldconfig
 endif
 ifeq ($(UCLIBC_TARGET_ARCH),powerpc)
-ifeq ($(BR2_powerpc_8540),y)
-	TARGET_POWERPC_CORE_E500:=y
-endif
-ifeq ($(BR2_powerpc_e500mc),y)
-	TARGET_POWERPC_CORE_E500:=y
-endif
-ifeq ($(TARGET_POWERPC_CORE_E500),y)
+ifeq ($(BR2_powerpc_8540)$(BR2_powerpc_e500mc),y)
 	/bin/echo "# CONFIG_CLASSIC is not set" >> $(UCLIBC_DIR)/.oldconfig
 	/bin/echo "CONFIG_E500=y" >> $(UCLIBC_DIR)/.oldconfig
 else
-- 
1.7.1
