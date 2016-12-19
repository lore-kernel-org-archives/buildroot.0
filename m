From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon, 19 Dec 2016 22:29:08 +0100
Subject: [Buildroot] [Patch v3 2/9] execline: new package
In-Reply-To: <1482182955-23916-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1482182955-23916-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <1482182955-23916-3-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package provides execline, a (non-interactive) scripting language,
like sh, used in the s6 supervision system.

The host variant is provided as it is required to build and run the host
variants of s6 and s6-rc.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/Config.in              |  1 +
 package/execline/Config.in     | 12 ++++++++
 package/execline/execline.hash |  2 ++
 package/execline/execline.mk   | 70 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 85 insertions(+)
 create mode 100644 package/execline/Config.in
 create mode 100644 package/execline/execline.hash
 create mode 100644 package/execline/execline.mk

diff --git a/package/Config.in b/package/Config.in
index 760eaff..7c0e4e1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -504,6 +504,7 @@ menu "Erlang libraries/modules"
 	source "package/erlang-p1-zlib/Config.in"
 endmenu
 endif
+	source "package/execline/Config.in"
 	source "package/ficl/Config.in"
 	source "package/gauche/Config.in"
 	source "package/guile/Config.in"
diff --git a/package/execline/Config.in b/package/execline/Config.in
new file mode 100644
index 0000000..8e2e6dc
--- /dev/null
+++ b/package/execline/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_EXECLINE
+	bool "execline"
+	select BR2_PACKAGE_SKALIBS
+	depends on BR2_USE_MMU # skalibs
+	help
+	  execline is a (non-interactive) scripting language, like sh ; but its
+	  syntax is quite different from a traditional shell syntax.
+	  The execlineb program is meant to be used as an interpreter for a text
+	  file; the other commands are essentially useful inside an execlineb
+	  script.
+
+	  http://skarnet.org/software/execline/
diff --git a/package/execline/execline.hash b/package/execline/execline.hash
new file mode 100644
index 0000000..61fc99c
--- /dev/null
+++ b/package/execline/execline.hash
@@ -0,0 +1,2 @@
+# Locally generated
+sha256 93bd744f2e3ad204cb89f147efdc6ca4e622f9c6bfc9895e0b2cb8b0480029de execline-2.2.0.0.tar.gz
diff --git a/package/execline/execline.mk b/package/execline/execline.mk
new file mode 100644
index 0000000..ca7c73e
--- /dev/null
+++ b/package/execline/execline.mk
@@ -0,0 +1,70 @@
+################################################################################
+#
+# execline
+#
+################################################################################
+
+EXECLINE_VERSION = 2.2.0.0
+EXECLINE_SITE = http://skarnet.org/software/execline
+EXECLINE_LICENSE = ISC
+EXECLINE_LICENSE_FILES = COPYING
+EXECLINE_INSTALL_STAGING = YES
+EXECLINE_DEPENDENCIES = skalibs
+
+EXECLINE_CONF_OPTS = \
+	--prefix=/usr \
+	--with-sysdeps=$(STAGING_DIR)/usr/lib/skalibs/sysdeps \
+	--with-include=$(STAGING_DIR)/usr/include \
+	--with-dynlib=$(STAGING_DIR)/usr/lib \
+	--with-lib=$(STAGING_DIR)/usr/lib/skalibs \
+	$(if $(BR2_STATIC_LIBS),,--disable-allstatic) \
+	$(SHARED_STATIC_LIBS_OPTS)
+
+define EXECLINE_CONFIGURE_CMDS
+	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure $(EXECLINE_CONF_OPTS))
+endef
+
+define EXECLINE_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define EXECLINE_REMOVE_STATIC_LIB_DIR
+	rm -rf $(TARGET_DIR)/usr/lib/execline
+endef
+
+EXECLINE_POST_INSTALL_TARGET_HOOKS += EXECLINE_REMOVE_STATIC_LIB_DIR
+
+define EXECLINE_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+endef
+
+define EXECLINE_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
+endef
+
+HOST_EXECLINE_DEPENDENCIES = host-skalibs
+
+HOST_EXECLINE_CONF_OPTS = \
+	--prefix=$(HOST_DIR)/usr \
+	--shebangdir=/usr/bin \
+	--with-sysdeps=$(HOST_DIR)/usr/lib/skalibs/sysdeps \
+	--with-include=$(HOST_DIR)/usr/include \
+	--with-dynlib=$(HOST_DIR)/usr/lib \
+	--disable-static \
+	--enable-shared \
+	--disable-allstatic
+
+define HOST_EXECLINE_CONFIGURE_CMDS
+	(cd $(@D); $(HOST_CONFIGURE_OPTS) ./configure $(HOST_EXECLINE_CONF_OPTS))
+endef
+
+define HOST_EXECLINE_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define HOST_EXECLINE_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) install
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
2.5.5
