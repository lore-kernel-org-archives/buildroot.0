From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 17 Aug 2018 18:06:51 +0200
Subject: [Buildroot] [PATCH 5/7 v4] linux: host-{flex,
 bison} only needed for DTS
In-Reply-To: <cover.1534522005.git.yann.morin.1998@free.fr>
References: <cover.1534522005.git.yann.morin.1998@free.fr>
Message-ID: <7df293032b336d58e0a8aed21fc21695ef4ffd20.1534522005.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

host-{flex,bison} are only needed to generate the dtc parser, so we
don't need them if the kernel does not have support for device tree.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 linux/linux.mk | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index deb5a4ac57..d6b0853518 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -64,11 +64,6 @@ LINUX_PATCH = $(filter ftp://% http://% https://%,$(LINUX_PATCHES))
 LINUX_INSTALL_IMAGES = YES
 LINUX_DEPENDENCIES = host-kmod
 
-# Starting with 4.17, the generated dtc parser code is no longer
-# shipped with the kernel sources, so we need flex and bison. For
-# reproducibility, we use our owns rather than the host ones.
-LINUX_DEPENDENCIES += host-bison host-flex
-
 # Starting with 4.16, the generated kconfig paser code is no longer
 # shipped with the kernel sources, so we need flex and bison, but
 # only if the host does not have them.
@@ -352,6 +347,11 @@ define LINUX_KCONFIG_FIXUP_CMDS
 endef
 
 ifeq ($(BR2_LINUX_KERNEL_DTS_SUPPORT),y)
+# Starting with 4.17, the generated dtc parser code is no longer
+# shipped with the kernel sources, so we need flex and bison. For
+# reproducibility, we use our owns rather than the host ones.
+LINUX_DEPENDENCIES += host-bison host-flex
+
 ifeq ($(BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT),)
 define LINUX_BUILD_DTB
 	$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_DTBS)
-- 
2.14.1
