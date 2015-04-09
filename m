From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Apr 2015 22:57:51 +0200
Subject: [Buildroot] [git commit] linux: simplify adding new extensions
Message-ID: <20150409211053.88A6C81963@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9bd541d3b2a0256d59bc84fb2d204401dcdedb8e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Curently, all three linux extensions follow the same layout:
  - test if the extension is enabled
  - add itself to linux' patch-dependencies
  - declare a macro, added as the pre-patch hook

Except for the macro, all can be commonalised.

Add a simple infrastructure for that:
  - extensions declare themselves in the list of extensions
  - extensions define their macro
  - the infra adds them to the patch-dependencies and pre-patch
    hooks as appropriate

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 21eb3c9..deed073 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -327,6 +327,13 @@ endef
 # included here *must* be in the same directory!
 include $(sort $(wildcard linux/linux-ext-*.mk))
 
+LINUX_PATCH_DEPENDENCIES += $(foreach ext,$(LINUX_EXTENSIONS),\
+	$(if $(BR2_LINUX_KERNEL_EXT_$(call UPPERCASE,$(ext))),$(ext)))
+
+LINUX_PRE_PATCH_HOOKS += $(foreach ext,$(LINUX_EXTENSIONS),\
+	$(if $(BR2_LINUX_KERNEL_EXT_$(call UPPERCASE,$(ext))),\
+		$(call UPPERCASE,$(ext))_PREPARE_KERNEL))
+
 $(eval $(kconfig-package))
 
 # Support for rebuilding the kernel after the cpio archive has
