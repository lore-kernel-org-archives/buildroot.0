From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Jul 2015 15:48:04 +0200
Subject: [Buildroot] [git commit] busybox: PAM support needs thread support
Message-ID: <20150704134927.AF51F803F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=98e1848db11e707f96504ccf9cb2ed09e6787dd1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit f21b2558a097d07b53b6f20a47770468e9e4f7ed ("busybox: added
linux-pam support"), we added optional support for PAM in
Busybox. However, this support requires the toolchain to have thread
support, which causes build failures with non-thread capable
toolchains.

This commit therefore enables Busybox PAM support only if the
linux-pam package is available *and the toolchain has thread support.

Fixes:

  http://autobuild.buildroot.org/results/1a3/1a380aaca9303b67cc59165d56cf12f35966fe26/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/busybox/busybox.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 34eb1f3..51b35bc 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -152,7 +152,8 @@ define BUSYBOX_INSTALL_WATCHDOG_SCRIPT
 endef
 endif
 
-ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
+# PAM support requires thread support in the toolchain
+ifeq ($(BR2_PACKAGE_LINUX_PAM)$(BR2_TOOLCHAIN_HAS_THREADS),yy)
 define BUSYBOX_LINUX_PAM
 	$(call KCONFIG_ENABLE_OPT,CONFIG_PAM,$(BUSYBOX_BUILD_CONFIG))
 endef
