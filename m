From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 05 Oct 2014 09:58:32 +0200
Subject: [Buildroot] [PATCH 2 of 2] check-deprecated-variable: move call to
 respective infra where appropriate
In-Reply-To: <98b4f7f5e2ea63e41fa1.1412495911@localhost>
References: <98b4f7f5e2ea63e41fa1.1412495911@localhost>
Message-ID: <17b8f7627130f84d5e80.1412495912@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Move the checks for AUTORECONF_OPT, GETTEXTIZE_OPT to pkg-autotools.mk,
and for KCONFIG_OPT to pkg-kconfig.mk.

The other checks are used by several infras and are therefore better placed
in pkg-generic.mk.

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -103,6 +103,10 @@
  $(2)_AUTORECONF_OPTS ?= $$($(3)_AUTORECONF_OPTS)
 endif
 
+# These options have been renamed from _OPT to _OPTS in 2014.11
+$(eval $(call check-deprecated-variable,$(2)_GETTEXTIZE_OPT,$(2)_GETTEXTIZE_OPTS))
+$(eval $(call check-deprecated-variable,$(2)_AUTORECONF_OPT,$(2)_AUTORECONF_OPTS))
+
 $(2)_CONF_ENV			?=
 $(2)_CONF_OPTS			?=
 $(2)_MAKE_ENV			?=
@@ -111,7 +115,6 @@
 $(2)_INSTALL_STAGING_OPTS	?= DESTDIR=$$(STAGING_DIR) install
 $(2)_INSTALL_TARGET_OPTS		?= DESTDIR=$$(TARGET_DIR)  install
 
-
 #
 # Configure step. Only define it if not already defined by the package
 # .mk file. And take care of the differences between host and target
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -708,11 +708,8 @@
 $(eval $(call check-deprecated-variable,$(2)_INSTALL_TARGET_OPT,$(2)_INSTALL_TARGET_OPTS))
 $(eval $(call check-deprecated-variable,$(2)_INSTALL_STAGING_OPT,$(2)_INSTALL_STAGING_OPTS))
 $(eval $(call check-deprecated-variable,$(2)_INSTALL_HOST_OPT,$(2)_INSTALL_HOST_OPTS))
-$(eval $(call check-deprecated-variable,$(2)_AUTORECONF_OPT,$(2)_AUTORECONF_OPTS))
 $(eval $(call check-deprecated-variable,$(2)_CONF_OPT,$(2)_CONF_OPTS))
 $(eval $(call check-deprecated-variable,$(2)_BUILD_OPT,$(2)_BUILD_OPTS))
-$(eval $(call check-deprecated-variable,$(2)_GETTEXTIZE_OPT,$(2)_GETTEXTIZE_OPTS))
-$(eval $(call check-deprecated-variable,$(2)_KCONFIG_OPT,$(2)_KCONFIG_OPTS))
 
 TARGETS += $(1)
 
diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -36,6 +36,9 @@
 $(2)_KCONFIG_OPTS ?=
 $(2)_KCONFIG_FIXUP_CMDS ?=
 
+# This option has been renamed from _OPT to _OPTS in 2014.11
+$(eval $(call check-deprecated-variable,$(2)_KCONFIG_OPT,$(2)_KCONFIG_OPTS))
+
 # FOO_KCONFIG_FILE is required
 ifndef $(2)_KCONFIG_FILE
 $$(error Internal error: no value specified for $(2)_KCONFIG_FILE)
