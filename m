From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Jun 2017 18:00:48 +0200
Subject: [Buildroot] [git commit] uclibc: properly set UCLIBC_HAS_MMU option
Message-ID: <20170611160107.150A1802E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ffd28041da86d721a4eca7ced1a48324cb8235e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gdbserver's code looks at both UCLIBC_USE_MMU *and* UCLIBC_HAS_MMU to
decide whether to enable the no-MMU code. So far, on noMMU platforms,
UCLIBC_HAS_MMU was still set to 'y'. This commit adjusts this, which is
a step forward in getting gdbserver to build on m68k/coldfire.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
Changes since v2:
 - None
Changes since v1:
 - New patch in the series
---
 package/uclibc/uclibc.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index a5a20ea..fa970df 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -253,10 +253,12 @@ endif
 
 ifeq ($(BR2_USE_MMU),y)
 define UCLIBC_MMU_CONFIG
+	$(call KCONFIG_ENABLE_OPT,ARCH_HAS_MMU,$(@D)/.config)
 	$(call KCONFIG_ENABLE_OPT,ARCH_USE_MMU,$(@D)/.config)
 endef
 else
 define UCLIBC_MMU_CONFIG
+	$(call KCONFIG_DISABLE_OPT,ARCH_HAS_MMU,$(@D)/.config)
 	$(call KCONFIG_DISABLE_OPT,ARCH_USE_MMU,$(@D)/.config)
 endef
 endif
