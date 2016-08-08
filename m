From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon,  8 Aug 2016 23:02:13 +0200
Subject: [Buildroot] [PATCH 2/9] execline: new package
In-Reply-To: <1470690140-18803-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1470690140-18803-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <1470690140-18803-3-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package provides execline, a (non-interactive) scripting language,
like sh, used in the s6 supervision system.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/Config.in               |  1 +
 package/execline/Config.in      | 15 +++++++++
 package/execline/Config.in.host |  7 +++++
 package/execline/execline.mk    | 67 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 90 insertions(+)
 create mode 100644 package/execline/Config.in
 create mode 100644 package/execline/Config.in.host
 create mode 100644 package/execline/execline.mk

diff --git a/package/Config.in b/package/Config.in
index ecda732..d35ee3f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -498,6 +498,7 @@ menu "Erlang libraries/modules"
 	source "package/erlang-p1-zlib/Config.in"
 endmenu
 endif
+	source "package/execline/Config.in"
 	source "package/ficl/Config.in"
 	source "package/gauche/Config.in"
 	source "package/guile/Config.in"
diff --git a/package/execline/Config.in b/package/execline/Config.in
new file mode 100644
index 0000000..a9e0a88
--- /dev/null
+++ b/package/execline/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_EXECLINE
+	bool "execline"
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL
+	select BR2_PACKAGE_SKALIBS
+	help
+	  execline is a (non-interactive) scripting language, like sh ; but its
+	  syntax is quite different from a traditional shell syntax.
+	  The execlineb program is meant to be used as an interpreter for a text
+	  file; the other commands are essentially useful inside an execlineb
+	  script.
+
+	  http://skarnet.org/software/execline/
+
+comment "execline needs an (e)glibc or musl toolchain"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC && !BR2_TOOLCHAIN_USES_MUSL
diff --git a/package/execline/Config.in.host b/package/execline/Config.in.host
new file mode 100644
index 0000000..4e188e1
--- /dev/null
+++ b/package/execline/Config.in.host
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_HOST_EXECLINE
+	bool "host execline"
+	help
+	  Host version of execline, a (non-interactive) scripting language,
+	  like sh.
+
+	  http://skarnet.org/software/execline/
diff --git a/package/execline/execline.mk b/package/execline/execline.mk
new file mode 100644
index 0000000..592195e
--- /dev/null
+++ b/package/execline/execline.mk
@@ -0,0 +1,67 @@
+################################################################################
+#
+# execline
+#
+################################################################################
+
+EXECLINE_VERSION = v2.1.5.0
+EXECLINE_SITE = git://git.skarnet.org/execline.git
+EXECLINE_LICENSE = ISC
+EXECLINE_LICENSE_FILES = COPYING
+EXECLINE_INSTALL_STAGING = YES
+EXECLINE_DEPENDENCIES = skalibs
+
+EXECLINE_CONFIGURE_OPTS = \
+	--prefix=/usr \
+	--with-sysdeps=$(STAGING_DIR)/usr/lib/skalibs/sysdeps \
+	--with-include=$(STAGING_DIR)/usr/include \
+	--with-dynlib=$(STAGING_DIR)/usr/lib \
+	--with-lib=$(STAGING_DIR)/usr/lib/skalibs
+
+ifeq ($(BR2_STATIC_LIBS),y)
+EXECLINE_CONFIGURE_OPTS +=  --enable-static --disable-shared
+else
+EXECLINE_CONFIGURE_OPTS +=  --disable-static --enable-shared --disable-allstatic
+endif
+
+define EXECLINE_CONFIGURE_CMDS
+	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure $(EXECLINE_CONFIGURE_OPTS))
+endef
+
+define EXECLINE_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D)
+endef
+
+define EXECLINE_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) DESTDIR=$(TARGET_DIR) install
+endef
+
+define EXECLINE_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) DESTDIR=$(STAGING_DIR) install
+endef
+
+HOST_EXECLINE_DEPENDENCIES = host-skalibs
+
+HOST_EXECLINE_CONFIGURE_OPTS = \
+	--prefix=/usr \
+	--with-sysdeps=$(HOST_DIR)/usr/lib/skalibs/sysdeps \
+	--with-include=$(HOST_DIR)/usr/include \
+	--with-dynlib=$(HOST_DIR)/usr/lib \
+	--disable-static \
+	--enable-shared \
+	--disable-allstatic
+
+define HOST_EXECLINE_CONFIGURE_CMDS
+	(cd $(@D); $(HOST_CONFIGURE_OPTS) ./configure $(HOST_EXECLINE_CONFIGURE_OPTS))
+endef
+
+define HOST_EXECLINE_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(HOST_DIR)
+endef
+
+define HOST_EXECLINE_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(HOST_DIR) install
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
2.4.11
