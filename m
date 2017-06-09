From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  9 Jun 2017 15:31:54 +0200
Subject: [Buildroot] [PATCH v3 5/6] uclibc: properly set UCLIBC_HAS_MMU
	option
In-Reply-To: <1497015115-8740-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1497015115-8740-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1497015115-8740-5-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
-- 
2.7.4
