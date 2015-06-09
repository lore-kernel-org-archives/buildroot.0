From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Jun 2015 23:37:46 +0200
Subject: [Buildroot] [git commit] moarvm: new package
Message-ID: <20150609215551.A08CB81DA6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=55a5200b59ab24c8f024d99096ae8238c6d42bd0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 [use buildroot's libatomic_ops, libuv and host-luajit; add
  dependencies from libuv]
[Thomas: indicate that the hash has been locally calculated.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in          |    1 +
 package/moarvm/Config.in   |   19 ++++++++++++++++++
 package/moarvm/moarvm.hash |    2 +
 package/moarvm/moarvm.mk   |   46 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 68 insertions(+), 0 deletions(-)

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
index 0000000..95f3752
--- /dev/null
+++ b/package/moarvm/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_MOARVM
+	bool "moarvm"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libuv
+	depends on !BR2_STATIC_LIBS # libuv
+	depends on BR2_USE_MMU # libuv
+	depends on BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS # libatomic_ops
+	select BR2_PACKAGE_LIBUV
+	select BR2_PACKAGE_LIBATOMIC_OPS
+	help
+	  Short for "Metamodel On A Runtime", MoarVM is a virtual machine
+	  built especially for Rakudo Perl 6 and the NQP Compiler Toolchain.
+
+	  http://moarvm.com
+
+comment "moarvm needs a toolchain w/ threads, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS
+
diff --git a/package/moarvm/moarvm.hash b/package/moarvm/moarvm.hash
new file mode 100644
index 0000000..2a87855
--- /dev/null
+++ b/package/moarvm/moarvm.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  828843eb3da020ee24ff83933b63aebf4aa774b815a3dfa3a758d6334779565e  MoarVM-2015.05.tar.gz
diff --git a/package/moarvm/moarvm.mk b/package/moarvm/moarvm.mk
new file mode 100644
index 0000000..5889436
--- /dev/null
+++ b/package/moarvm/moarvm.mk
@@ -0,0 +1,46 @@
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
+MOARVM_DEPENDENCIES = host-luajit libuv libatomic_ops
+
+MOARVM_CONF_OPTS = \
+	--build=$(GNU_HOST_NAME) \
+	--host=$(GNU_TARGET_NAME) \
+	--ar="$(TARGET_AR)" \
+	--cc="$(TARGET_CC)" \
+	--ld="$(TARGET_CC)" \
+	--prefix="/usr" \
+	--lua=$(HOST_DIR)/usr/bin/luajit \
+	--has-libuv \
+	--has-libatomic
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
