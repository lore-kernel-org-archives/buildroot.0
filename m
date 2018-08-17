From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 17 Aug 2018 18:06:47 +0200
Subject: [Buildroot] [PATCH 1/7 v4] linux: explain why we need host-{flex,
 bison}
In-Reply-To: <cover.1534522005.git.yann.morin.1998@free.fr>
References: <cover.1534522005.git.yann.morin.1998@free.fr>
Message-ID: <625814ff31c1c985e01a6cf51f58b28811b3af71.1534522005.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The commit that added the dependency on host-{bison,flex} did
so because the pre-generated kconfig parser source files were
removed from the kernel tree, in linux-4.16.

But then, in linux-4.17, the pre-generated dtc parser source
files were in turn removed as well.

So, document the two reasons why they are needed, so we don't
accidentally remove them when we (soon) introduce the kconfig
dependencies.

(Also fix the first assignment to LINUX_DEPENDENCIES to be a
simple assignement, not an append-assignment.)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 linux/linux.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index e0d437427d..d307970065 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -62,7 +62,13 @@ LINUX_PATCHES = $(call qstrip,$(BR2_LINUX_KERNEL_PATCH))
 LINUX_PATCH = $(filter ftp://% http://% https://%,$(LINUX_PATCHES))
 
 LINUX_INSTALL_IMAGES = YES
-LINUX_DEPENDENCIES += host-bison host-flex host-kmod
+LINUX_DEPENDENCIES = host-kmod
+
+# Starting with 4.16, the generated kconfig paser code is no longer
+# shipped with the kernel sources, so we need flex and bison.
+# Starting with 4.17, the generated dtc parser code is no longer
+# shipped with the kernel sources, so we need flex and bison.
+LINUX_DEPENDENCIES += host-bison host-flex
 
 # host tools needed for kernel compression
 ifeq ($(BR2_LINUX_KERNEL_LZ4),y)
-- 
2.14.1
