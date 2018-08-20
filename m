From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Aug 2018 16:02:17 +0200
Subject: [Buildroot] [git commit] linux: host-{flex,
 bison} only needed for DTS
Message-ID: <20180820140105.5FCB28DEF9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=43ac3c8432a48b30c64b4c3ceac3ffdeb4befbca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

host-{flex,bison} are only needed to generate the dtc parser, so we
don't need them if the kernel does not have support for device tree.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
