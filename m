From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  3 Aug 2018 22:16:55 +0200
Subject: [Buildroot] [PATCH 2/3 v3] linux: kconfig needs host-{flex,
 bison} to build the configurators
In-Reply-To: <cover.1533327111.git.yann.morin.1998@free.fr>
References: <cover.1533327111.git.yann.morin.1998@free.fr>
Message-ID: <c85b3d3994261356bedfa3daeaddbc4329836fe9.1533327111.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Take this opportunity to also drop the append-assignment as the first
assignment to LINUX_DEPENDENCIES.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

---
Changes v2 -> v3:
  - also fix the append-assignment
---
 linux/linux.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 7527b11673..60dad3a249 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -62,7 +62,11 @@ LINUX_PATCHES = $(call qstrip,$(BR2_LINUX_KERNEL_PATCH))
 LINUX_PATCH = $(filter ftp://% http://% https://%,$(LINUX_PATCHES))
 
 LINUX_INSTALL_IMAGES = YES
-LINUX_DEPENDENCIES += host-bison host-flex host-kmod
+LINUX_DEPENDENCIES = host-kmod
+
+# Starting with 4.16, the generated kconfig code is no longer
+# shipped with the kernel sources, so we need flex and bison.
+LINUX_KCONFIG_DEPENDENCIES = host-bison host-flex
 
 # host tools needed for kernel compression
 ifeq ($(BR2_LINUX_KERNEL_LZ4),y)
-- 
2.14.1
