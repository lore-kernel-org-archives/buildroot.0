From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Jul 2015 11:56:18 +0200
Subject: [Buildroot] [git commit] package/ktap: use kernel-module helper
Message-ID: <20150712095704.748C68010C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=84d97e6200f3f0b97485825728e9bdcc644f5830
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Passing the KERNEL_SRC variable is no longer needed, since it was only
used to run commands like:
    $(MAKE) -C $(KERNEL_SRC) M=$(PWD) modules

which is basically what the new kernel-module infra is now doing.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ktap/ktap.mk |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/ktap/ktap.mk b/package/ktap/ktap.mk
index 4a0e51c..966b51c 100644
--- a/package/ktap/ktap.mk
+++ b/package/ktap/ktap.mk
@@ -9,8 +9,6 @@ KTAP_SITE = $(call github,ktap,ktap,$(KTAP_VERSION))
 KTAP_LICENSE = GPLv2
 KTAP_LICENSE_FILES = LICENSE-GPL
 
-KTAP_DEPENDENCIES = linux
-
 ifeq ($(BR2_PACKAGE_ELFUTILS),y)
 KTAP_DEPENDENCIES += elfutils
 else
@@ -19,12 +17,13 @@ endif
 
 define KTAP_BUILD_CMDS
 	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) $(KTAP_FLAGS) ktap
-	$(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) KERNEL_SRC=$(LINUX_DIR) KVERSION=$(LINUX_VERSION_PROBED) mod
 endef
 
 define KTAP_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m755 $(@D)/ktap  $(TARGET_DIR)/usr/bin/ktap
-	$(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) KERNEL_SRC=$(LINUX_DIR) KVERSION=$(LINUX_VERSION_PROBED) modules_install
 endef
 
+KTAP_MODULE_MAKE_OPTS = KVERSION=$(LINUX_VERSION_PROBED)
+
+$(eval $(kernel-module))
 $(eval $(generic-package))
