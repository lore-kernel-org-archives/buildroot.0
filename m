From: Vadim Kochan <vadim4j@gmail.com>
Date: Mon, 24 Dec 2018 00:37:41 +0200
Subject: [Buildroot] [PATCH 1/2] package: pkg-autotools: Add option to run
 autogen.sh
In-Reply-To: <20181223223742.23710-1-vadim4j@gmail.com>
References: <20181223223742.23710-1-vadim4j@gmail.com>
Message-ID: <20181223223742.23710-2-vadim4j@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add $(PKG)_AUTOGEN variable which allows to execute autogen.sh script
on pre-configure stage.

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
---
 docs/manual/adding-packages-autotools.txt |  4 ++++
 package/pkg-autotools.mk                  | 20 ++++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/docs/manual/adding-packages-autotools.txt b/docs/manual/adding-packages-autotools.txt
index a041d91eb6..105c038961 100644
--- a/docs/manual/adding-packages-autotools.txt
+++ b/docs/manual/adding-packages-autotools.txt
@@ -159,6 +159,10 @@ cases, typical packages will therefore only use a few of them.
   value is correct for most autotools packages, but it is still possible
   to override it if needed.
 
+* +LIBFOO_AUTOGEN+, tells whether the autogen.sh script should be
+  executed to generate 'configure' script. Valid values are +YES+ and +NO+.
+  By default, the value is +NO+
+
 With the autotools infrastructure, all the steps required to build
 and install the packages are already defined, and they generally work
 well for most autotools-based packages. However, when required, it is
diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 45de99356f..4f0f93d71c 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -103,6 +103,14 @@ define AUTORECONF_HOOK
 	$(Q)cd $($(PKG)_SRCDIR) && $($(PKG)_AUTORECONF_ENV) $(AUTORECONF) $($(PKG)_AUTORECONF_OPTS)
 endef
 
+#
+# Hook to call autogen.sh if needed
+#
+define AUTOGEN_HOOK
+	@$(call MESSAGE,"Running autogen.sh")
+	$(Q)cd $($(PKG)_SRCDIR) && PATH=$(BR_PATH) ./autogen.sh
+endef
+
 ################################################################################
 # inner-autotools-package -- defines how the configuration, compilation and
 # installation of an autotools package should be done, implements a
@@ -144,6 +152,14 @@ ifndef $(2)_AUTORECONF
  endif
 endif
 
+ifndef $(2)_AUTOGEN
+ ifdef $(3)_AUTOGEN
+  $(2)_AUTOGEN = $$($(3)_AUTOGEN)
+ else
+  $(2)_AUTOGEN ?= NO
+ endif
+endif
+
 ifndef $(2)_GETTEXTIZE
  ifdef $(3)_GETTEXTIZE
   $(2)_GETTEXTIZE = $$($(3)_GETTEXTIZE)
@@ -241,6 +257,10 @@ endif
 
 $(2)_POST_PATCH_HOOKS += UPDATE_CONFIG_HOOK
 
+ifeq ($$($(2)_AUTOGEN),YES)
+$(2)_PRE_CONFIGURE_HOOKS += AUTOGEN_HOOK
+endif
+
 ifeq ($$($(2)_AUTORECONF),YES)
 
 # This has to come before autoreconf
-- 
2.14.1
