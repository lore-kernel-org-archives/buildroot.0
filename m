From: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
Date: Thu, 11 Jun 2015 17:00:59 -0400
Subject: [Buildroot] [PATCH v4 3/3] kyua: new package
In-Reply-To: <1434056459-24075-1-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
References: <1434056459-24075-1-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
Message-ID: <1434056459-24075-4-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Kyua is a testing framework for infrastructure software, originally
designed to equip BSD-based operating systems with a test suite. This
means that Kyua is lightweight and simple, and that Kyua integrates
well with various build systems and continuous integration frameworks.

https://github.com/jmmv/kyua

Signed-off-by: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
---
Changes v3 -> v4:
  - rebase

Changes v2 -> v3:
  - rebase

Changes v1 -> v2:
  - don't generate the doxygen doc

  suggested by Arnout Vandecapelle <arnout@mind.be>:
  - reworks dependencies in Config.in
  - uses the uploaded archive instead of the github automatic one
  - changes the hash
  - removes the useless AUTORECONF
  - changes the license
  - fixes a mistake with POST_INSTALL_HOOK
---
 package/Config.in      |  1 +
 package/kyua/Config.in | 23 +++++++++++++++++++++++
 package/kyua/kyua.hash |  2 ++
 package/kyua/kyua.mk   | 27 +++++++++++++++++++++++++++
 4 files changed, 53 insertions(+)
 create mode 100644 package/kyua/Config.in
 create mode 100644 package/kyua/kyua.hash
 create mode 100644 package/kyua/kyua.mk

diff --git a/package/Config.in b/package/Config.in
index b006211..1d7b7bc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -72,6 +72,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/kexec/Config.in"
 	source "package/kexec-lite/Config.in"
 	source "package/ktap/Config.in"
+	source "package/kyua/Config.in"
 	source "package/latencytop/Config.in"
 	source "package/lmbench/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
diff --git a/package/kyua/Config.in b/package/kyua/Config.in
new file mode 100644
index 0000000..7489782
--- /dev/null
+++ b/package/kyua/Config.in
@@ -0,0 +1,23 @@
+config BR2_PACKAGE_KYUA
+	bool "kyua"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_HAS_LUAINTERPRETER \
+		&& !BR2_PACKAGE_LUAJIT # lutok
+	select BR2_PACKAGE_ATF
+	select BR2_PACKAGE_LUTOK
+	select BR2_PACKAGE_SQLITE
+	help
+	  Kyua is a testing framework for infrastructure software,
+	  originally designed to equip BSD-based operating systems
+	  with a test suite. This means that Kyua is lightweight
+	  and simple, and that Kyua integrates well with various build
+	  systems and continuous integration frameworks.
+
+	  https://github.com/jmmv/kyua
+
+comment "kyua needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
+
+comment "kyua needs a Lua 5.1 interpreter or above"
+	depends on BR2_INSTALL_LIBSTDCPP && \
+		(!BR2_PACKAGE_HAS_LUAINTERPRETER || BR2_PACKAGE_LUAJIT)
diff --git a/package/kyua/kyua.hash b/package/kyua/kyua.hash
new file mode 100644
index 0000000..938e556
--- /dev/null
+++ b/package/kyua/kyua.hash
@@ -0,0 +1,2 @@
+# Locally Calculted
+sha256 2b8b64a458b642df75086eeb73e8073d105b8d9cff04c9b1a905b68bc8502560 kyua-0.11.tar.gz
diff --git a/package/kyua/kyua.mk b/package/kyua/kyua.mk
new file mode 100644
index 0000000..783d3db
--- /dev/null
+++ b/package/kyua/kyua.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# kyua
+#
+################################################################################
+
+KYUA_VERSION = 0.11
+KYUA_SITE = https://github.com/jmmv/kyua/releases/download/kyua-$(KYUA_VERSION)
+KYUA_DEPENDENCIES = host-pkgconf atf lutok sqlite
+KYUA_CONF_OPTS = --without-doxygen
+KYUA_LICENSE = BSD-3c
+KYUA_LICENSE_FILES = COPYING
+KYUA_CONF_ENV = \
+	kyua_cv_attribute_noreturn=yes \
+	kyua_cv_getcwd_dyn=yes \
+	kyua_cv_lchmod_works=no \
+	kyua_cv_getopt_gnu=yes \
+	kyua_cv_getopt_optind_reset_value=0 \
+	kyua_cv_signals_lastno=15
+
+define KYUA_INSTALL_CONFIG
+	$(INSTALL) -D -m 644 $(@D)/examples/kyua.conf $(TARGET_DIR)/etc/kyua/kyua.conf
+endef
+
+KYUA_POST_INSTALL_HOOKS += KYUA_INSTALL_CONFIG
+
+$(eval $(autotools-package))
-- 
2.4.0
