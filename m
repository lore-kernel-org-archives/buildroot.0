From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 20 Jul 2015 13:33:42 +0300
Subject: [Buildroot] [PATCH] busybox: linux-pam support requires threads
Message-ID: <6d2d86487b691cfe8c1c66a9630d0e51461290c4.1437388422.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 083aeac94e19 (busybox: added linux-pam support, 2015-07-14) enabled
CONFIG_PAM when the linux-pam package is selected. Busybox build system adds
-lpthread unconditionally when CONFIG_PAM is enabled, which leads to build
failure when the toolchain does not support pthreads. Enable CONFIG_PAM only
when the toolchain supports threads.

Fixes:
http://autobuild.buildroot.net/results/8df/8df14bde19a41b78aa6422a1649a570914f747ee/
http://autobuild.buildroot.net/results/30d/30dd11b576b590de513031fce5e034353f2f5544/
http://autobuild.buildroot.net/results/de6/de628d84b0ed49be8f5d021c789357b2e66f2b02/

Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/busybox/busybox.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index ce6652b017d7..54351b115e90 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -141,7 +141,7 @@ define BUSYBOX_SET_INIT
 endef
 endif
 
-ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
+ifeq ($(BR2_PACKAGE_LINUX_PAM)$(BR2_TOOLCHAIN_HAS_THREADS),yy)
 define BUSYBOX_LINUX_PAM
 	$(call KCONFIG_ENABLE_OPT,CONFIG_PAM,$(BUSYBOX_BUILD_CONFIG))
 endef
-- 
2.1.4
