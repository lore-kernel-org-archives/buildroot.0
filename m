From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Aug 2018 16:02:10 +0200
Subject: [Buildroot] [git commit] linux: kconfig may need host-{flex,
 bison} to build the configurators
Message-ID: <20180820140105.553078DEF9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b01100cc901a83c480f86bc81545a011f65d6771
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rely on the system provided ones if avalable, and only resort to use our
owns if the sytem does not provide them.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Jan Kundr??t <jan.kundrat@cesnet.cz>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
