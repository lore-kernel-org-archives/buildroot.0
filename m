From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 17 Aug 2018 18:06:52 +0200
Subject: [Buildroot] [PATCH 6/7 v4] linux: kconfig needs the toolchain
In-Reply-To: <cover.1534522005.git.yann.morin.1998@free.fr>
References: <cover.1534522005.git.yann.morin.1998@free.fr>
Message-ID: <67cb563b2b89c6aed36e2ef6564409678f405e84.1534522005.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Starting with linux-4.18, the kconfig from the kernel can call
to the compiler to test its capabilities; see:

    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/scripts/Kconfig.include

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Jan Kundr?t <jan.kundrat@cesnet.cz>
Tested-by: Jan Kundr?t <jan.kundrat@cesnet.cz>
Reviewed-by: Jan Kundr?t <jan.kundrat@cesnet.cz>

---
Changes v1 -> v2:
  - take advantage of the kconfig-package infra  (Thomas)
---
 linux/linux.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index d6b0853518..675e7906a8 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -71,6 +71,11 @@ LINUX_KCONFIG_DEPENDENCIES = \
 	$(BR2_BISON_HOST_DEPENDENCY) \
 	$(BR2_FLEX_HOST_DEPENDENCY)
 
+# Starting with 4.18, the kconfig in the kernel calls the
+# cross-compiler to check its capabilities. So we need the
+# toolchain before we can call the configurators.
+LINUX_KCONFIG_DEPENDENCIES += toolchain
+
 # host tools needed for kernel compression
 ifeq ($(BR2_LINUX_KERNEL_LZ4),y)
 LINUX_DEPENDENCIES += host-lz4
-- 
2.14.1
