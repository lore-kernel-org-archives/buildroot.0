From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 12 Apr 2015 16:21:46 +0200
Subject: [Buildroot] [PATCH 1/2] package/exim: Adjust libnsl detection to
	include musl
Message-ID: <1428848507-2117-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Only (e)glibc provides libnsl, uclibc provides only a stub

Fixes compilation using this defconfig

    BR2_arm=y
    BR2_cortex_a7=y
    BR2_STATIC_LIBS=y
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_PACKAGE_OPENSSL=y
    BR2_PACKAGE_EXIM=y

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/exim/exim.mk |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index 0a70c42..fcf2be5 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -81,8 +81,9 @@ define EXIM_USE_DEFAULT_CONFIG_FILE_OPENSSL
 endef
 endif
 
-# this specific toolchain lacks libnsl
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_2014_12),y)
+# only (e)glibc provides libnsl, remove -lnsl for all other toolchains
+# http://bugs.exim.org/show_bug.cgi?id=1564
+ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),)
 define EXIM_REMOVE_LIBNSL_FROM_MAKEFILE
 	$(SED) 's/-lnsl//g' $(@D)/OS/Makefile-Linux
 endef
-- 
1.7.10.4
