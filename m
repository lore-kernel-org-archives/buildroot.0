From: Francois Perrad <fperrad@gmail.com>
Date: Fri,  5 Jun 2015 17:02:21 +0200
Subject: [Buildroot] [V3] moarvm: new package
Message-ID: <1433516541-16421-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in          |  1 +
 package/moarvm/Config.in   | 12 ++++++++++++
 package/moarvm/moarvm.hash |  2 ++
 package/moarvm/moarvm.mk   | 42 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 57 insertions(+)
 create mode 100644 package/moarvm/Config.in
 create mode 100644 package/moarvm/moarvm.hash
 create mode 100644 package/moarvm/moarvm.mk

diff --git a/package/Config.in b/package/Config.in
index e0c2e2a..00c9ce3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -499,6 +499,7 @@ menu "Lua libraries/modules"
 	source "package/xavante/Config.in"
 endmenu
 endif
+	source "package/moarvm/Config.in"
 	source "package/mono/Config.in"
 	source "package/nodejs/Config.in"
 	source "package/perl/Config.in"
diff --git a/package/moarvm/Config.in b/package/moarvm/Config.in
new file mode 100644
index 0000000..198a0e1
--- /dev/null
+++ b/package/moarvm/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_MOARVM
+	bool "moarvm"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libuv embedded
+	depends on BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS # libatomic embedded
+	help
+	  Short for "Metamodel On A Runtime", MoarVM is a virtual machine
+	  built especially for Rakudo Perl 6 and the NQP Compiler Toolchain.
+
+	  http://moarvm.com
+
+comment "moarvm needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/moarvm/moarvm.hash b/package/moarvm/moarvm.hash
new file mode 100644
index 0000000..d5cc911
--- /dev/null
+++ b/package/moarvm/moarvm.hash
@@ -0,0 +1,2 @@
+
+sha256  828843eb3da020ee24ff83933b63aebf4aa774b815a3dfa3a758d6334779565e  MoarVM-2015.05.tar.gz
diff --git a/package/moarvm/moarvm.mk b/package/moarvm/moarvm.mk
new file mode 100644
index 0000000..961f843
--- /dev/null
+++ b/package/moarvm/moarvm.mk
@@ -0,0 +1,42 @@
+################################################################################
+#
+# moarvm
+#
+################################################################################
+
+MOARVM_VERSION = 2015.05
+MOARVM_SITE = http://moarvm.com/releases
+MOARVM_SOURCE = MoarVM-$(MOARVM_VERSION).tar.gz
+MOARVM_LICENSE = Artistic-2.0
+MOARVM_LICENSE_FILES = Artistic2.txt
+MOARVM_INSTALL_STAGING = YES
+
+MOARVM_CONF_OPTS = \
+	--build=$(GNU_HOST_NAME) \
+	--host=$(GNU_TARGET_NAME) \
+	--ar="$(TARGET_AR)" \
+	--cc="$(TARGET_CC)" \
+	--ld="$(TARGET_CC)" \
+	--prefix="/usr"
+
+ifeq ($(BR2_ENDIAN),"BIG")
+MOARVM_CONF_OPTS += --big-endian
+endif
+
+define MOARVM_CONFIGURE_CMDS
+	(cd $(@D); perl Configure.pl $(MOARVM_CONF_OPTS))
+endef
+
+define MOARVM_BUILD_CMDS
+	$(MAKE) -C $(@D)
+endef
+
+define MOARVM_INSTALL_STAGING_CMDS
+	$(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
+endef
+
+define MOARVM_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+endef
+
+$(eval $(generic-package))
-- 
2.1.4
