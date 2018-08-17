From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 17 Aug 2018 18:06:50 +0200
Subject: [Buildroot] [PATCH 4/7 v4] linux: kconfig may need host-{flex,
 bison} to build the configurators
In-Reply-To: <cover.1534522005.git.yann.morin.1998@free.fr>
References: <cover.1534522005.git.yann.morin.1998@free.fr>
Message-ID: <667c8a0d0beded1ff36af1b415d0282e3d007f0d.1534522005.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rely on the system provided ones if avalable, and only resort to use our
owns if the sytem does not provide them.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Jan Kundr?t <jan.kundrat@cesnet.cz>

---
Notes: I did not carry Jan's Tested-by tag, because the patch is now
using the conditional dependencies, so it would have been a bit
presumptuous of me to carry that tag.

---
Changes v2 -> v3:
  - use the newly-introduced conditional dependencies  (Thomas, Arnout)
---
 linux/linux.mk | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index d307970065..deb5a4ac57 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -64,12 +64,18 @@ LINUX_PATCH = $(filter ftp://% http://% https://%,$(LINUX_PATCHES))
 LINUX_INSTALL_IMAGES = YES
 LINUX_DEPENDENCIES = host-kmod
 
-# Starting with 4.16, the generated kconfig paser code is no longer
-# shipped with the kernel sources, so we need flex and bison.
 # Starting with 4.17, the generated dtc parser code is no longer
-# shipped with the kernel sources, so we need flex and bison.
+# shipped with the kernel sources, so we need flex and bison. For
+# reproducibility, we use our owns rather than the host ones.
 LINUX_DEPENDENCIES += host-bison host-flex
 
+# Starting with 4.16, the generated kconfig paser code is no longer
+# shipped with the kernel sources, so we need flex and bison, but
+# only if the host does not have them.
+LINUX_KCONFIG_DEPENDENCIES = \
+	$(BR2_BISON_HOST_DEPENDENCY) \
+	$(BR2_FLEX_HOST_DEPENDENCY)
+
 # host tools needed for kernel compression
 ifeq ($(BR2_LINUX_KERNEL_LZ4),y)
 LINUX_DEPENDENCIES += host-lz4
-- 
2.14.1
