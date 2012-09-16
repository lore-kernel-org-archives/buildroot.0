From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 17 Sep 2012 00:57:55 +0200
Subject: [Buildroot] [PATCH 10/11] toolchain/common: introduce blind options
	BR2_NEEDS_GETTEXT{, _IF_LOCALE}
In-Reply-To: <1347836276-24262-1-git-send-email-yann.morin.1998@free.fr>
References: <1347836276-24262-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1347836276-24262-11-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Introduce two new blind config options:
  - BR2_NEEDS_GETTEXT
        selects the gettext package if the toolchain does not provide it
  - BR2_NEEDS_GETTEXT_IF_LOCALE
        ditto, but only if locales are enabled

Packages can then select either if they require gettext (resp. if locales
are enabled).

This will simplify the packages Config.in by no longer requiring that the
'select' be conditional, thus hiding the gory details out of packages,
which don't really need to know about those details.

Also, introduce four new Makefile variables:
  - $(gettext)
        contains the needed dependencies for pacakges that need gettext
        functioanlity: 'gettext' if the gettext pacakge is needed, empty
        otherwise
  - $(gettext-if-locale)
        ditto, but only if locales are enabled
  - $(gettext-LDFLAGS)
        contains the required LDFLAGS ("-lintl") if gettext is provided by
        the gettext package, empty otherwise
  - $(gettext-LDFLAGS-if-locale)
        ditto, but only if locales are enabled

Packages can then add either variable to their own LDFLAGS.

Note: those new options and variables are going to be used in the next
patch, for now they are a no-op.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
CC: Samuel Martin <s.martin49@gmail.com>
---
 Makefile                                |    1 +
 docs/manual/adding-packages-gettext.txt |   55 +++++++++++++++++++++++-------
 toolchain/toolchain-common.in           |   10 +++++-
 toolchain/toolchain-common.mk           |   35 +++++++++++++++++++
 4 files changed, 87 insertions(+), 14 deletions(-)
 create mode 100644 toolchain/toolchain-common.mk

diff --git a/Makefile b/Makefile
index ba5da99..16cfdf1 100644
--- a/Makefile
+++ b/Makefile
@@ -294,6 +294,7 @@ include support/dependencies/dependencies.mk
 # We also need the various per-package makefiles, which also add
 # each selected package to TARGETS if that package was selected
 # in the .config file.
+include toolchain/toolchain-common.mk
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 include toolchain/toolchain-buildroot.mk
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
diff --git a/docs/manual/adding-packages-gettext.txt b/docs/manual/adding-packages-gettext.txt
index 71da62a..ad5b7af 100644
--- a/docs/manual/adding-packages-gettext.txt
+++ b/docs/manual/adding-packages-gettext.txt
@@ -18,23 +18,52 @@ is enabled.
 
 Therefore, Buildroot defines two configuration options:
 
-* +BR2_NEEDS_EXTERNAL_GETTEXT+, which is true as soon as the toolchain doesn't
-  provide its own gettext implementation
+* +BR2_NEEDS_GETTEXT+, which a package **must** +select+ in its +Config.in+,
+  to indicate it requires gettext functionality
 
-* +BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE+, which is true if the toolchain
-  doesn't provide its own gettext implementation and if locale support
-  is enabled
+* +BR2_NEEDS_GETTEXT_IF_LOCALE+, which a package **must** +select+ in its
+  +Config.in+, to indicate it requires gettext functionality if locales
+  are enabled
 
-Therefore, packages that unconditionally need gettext should:
+Buildroot also defines four +Makefile+ variables:
 
-* Use +select BR2_PACKAGE_GETTEXT if BR2_NEEDS_EXTERNAL_GETTEXT+
+* +$(gettext)+, that a package **must** add to its dependency list if it
+  requires gettext functionality
 
-* Use +$(if $(BR2_NEEDS_EXTERNAL_GETTEXT),gettext)+ in the package
-  +DEPENDENCIES+ variable
+* +$(gettext-if-locale)+, that a package **must** add to its dependency
+  list if it requires gettext functionality if locales are enabled
 
-Packages that need gettext only when locale support is enabled should:
+* +$(gettext-LDFLAGS)+, that a package ___can___ add to its +LDFLAGS+ if it
+  requires gettext functionality
 
-* Use +select BR2_PACKAGE_GETTEXT if BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE+
+* +$(gettext-LDFLAGS-if-locale)+, that a package ___can___ add to its
+  +LDFLAGS+ if it requires gettext functionality if locales are enabled
 
-* Use +$(if $(BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE),gettext)+ in the package
-  +DEPENDENCIES+ variable
+Example +Config.in+ excerpts for two packages:
+
+----
+config BR2_PACKAGE_FOO
+	bool "foo"
+	select BR2_NEEDS_GETTEXT
+----
+----
+config BR2_PACKAGE_BAR
+	bool "bar"
+	select BR2_NEEDS_GETTEXT_IF_LOCALE
+----
+
+And the corresponding excerpts from their +.mk+ files:
+
+----
+FOO_DEPENDENCIES += $(gettext)
+FOO_LDFLAGS += $(gettext-LDFLAGS)
+----
+----
+BAR_DEPENDENCIES += $(gettext-if-locale)
+BAR_CONF_ENV += LIBS="$(gettext-LDFLAGS-if-locale)"
+----
+
+___**Note:**___ The two Makefile variable +$(gettext-LDFLAGS)+ and
++$(gettext-LDFLAGS-if-locale)+ should be used **only** if the package's
+build-system does not automatically detects that linking with +-lint+ is
+needed.
diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 091aaa1..4c55578 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -80,7 +80,7 @@ config BR2_GENERATE_LOCALE
 # gettext isn't needed and shouldn't be built to avoid conflicts. Some
 # packages always need gettext, other packages only need gettext when
 # locale support is enabled. See the documentation for how packages
-# should rely on the following two options.
+# should rely on the following four options.
 
 config BR2_NEEDS_EXTERNAL_GETTEXT
 	bool
@@ -92,6 +92,14 @@ config BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE
 	bool
 	default y if (BR2_NEEDS_EXTERNAL_GETTEXT && BR2_ENABLE_LOCALE)
 
+config BR2_NEEDS_GETTEXT
+	bool
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_EXTERNAL_GETTEXT
+
+config BR2_NEEDS_GETTEXT_IF_LOCALE
+	bool
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE
+
 config BR2_USE_MMU
 	bool "Enable MMU support" if BR2_arm || BR2_armeb || BR2_mips || BR2_mipsel || BR2_sh || BR2_xtensa
 	default y if !BR2_bfin
diff --git a/toolchain/toolchain-common.mk b/toolchain/toolchain-common.mk
new file mode 100644
index 0000000..6333808
--- /dev/null
+++ b/toolchain/toolchain-common.mk
@@ -0,0 +1,35 @@
+# Common set of variables
+
+# $(gettext)
+#  - contains the needed dependencies for packages that need gettext
+#    functioanlity: 'gettext' if the gettext package is needed
+#  - empty otherwise
+#
+# $(gettext-if-locale)
+#  - contains the needed dependencies for packages that need gettext
+#    functioanlity: 'gettext' if the gettext package is needed, and
+#    locales are enabled
+#  - empty otherwise
+ifeq ($(BR2_NEEDS_EXTERNAL_GETTEXT),y)
+gettext = $(if $(BR2_PACKAGE_GETTEXT),gettext)
+endif
+ifeq ($(BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE),y)
+gettext-if-locale = $(if $(BR2_PACKAGE_GETTEXT),gettext)
+endif
+
+# $(gettext-LDFLAGS)
+#  - set to "-lintl" if the toolchain does not provide gettext, and
+#    package gettext is selected
+#  - empty otherwise
+#
+# $(gettext-LDFLAGS-if-locale)
+#  - set to "-lintl" if the toolchain does not provide gettext, and
+#    locales are enabled, and package gettext is selected
+#  - empty otherwise
+#
+ifeq ($(BR2_NEEDS_EXTERNAL_GETTEXT),y)
+gettext-LDFLAGS = $(if $(BR2_PACKAGE_GETTEXT),-lintl)
+endif
+ifeq ($(BR2_NEEDS_EXTERNAL_GETTEXT_IF_LOCALE),y)
+gettext-LDFLAGS-if-locale = $(if $(BR2_PACKAGE_GETTEXT),-lintl)
+endif
-- 
1.7.2.5
