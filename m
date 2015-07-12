From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Jul 2015 02:21:35 +0200
Subject: [Buildroot] [PATCH 05/11 v3] package/ktap: use kernel-module helper
In-Reply-To: <cover.1436660369.git.yann.morin.1998@free.fr>
References: <cover.1436660369.git.yann.morin.1998@free.fr>
Message-ID: <fb4b6ed7812e3a847c65cda08a3fd7046493db9a.1436660369.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Passing the KERNEL_SRC variable is no longer needed, since it was only
used to run commands like:
    $(MAKE) -C $(KERNEL_SRC) M=$(PWD) modules

which is basically what the new kernel-module infra is now doing.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
Changes v1 -> v2;
  - explain why we get rid of a variable  (Thomas)
---
 package/ktap/ktap.mk | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

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
-- 
1.9.1
