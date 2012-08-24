From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Aug 2012 23:39:29 +0200
Subject: [Buildroot] [git commit] erlang: new package
Message-ID: <20120903200543.638839953E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5886b6f15cefa308c78b575069c560df78bf1050
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Will Newton <will.newton@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                     |    1 +
 package/erlang/Config.in              |   17 ++++++++++
 package/erlang/erlang-build-fix.patch |   13 +++++++
 package/erlang/erlang.mk              |   57 +++++++++++++++++++++++++++++++++
 4 files changed, 88 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index d6a66fd..d1b214c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -247,6 +247,7 @@ source "package/xfsprogs/Config.in"
 endmenu
 
 menu "Interpreter languages and scripting"
+source "package/erlang/Config.in"
 source "package/haserl/Config.in"
 source "package/lua/Config.in"
 source "package/luajit/Config.in"
diff --git a/package/erlang/Config.in b/package/erlang/Config.in
new file mode 100644
index 0000000..6dd5a39
--- /dev/null
+++ b/package/erlang/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_ERLANG
+	bool "erlang"
+	help
+	  Erlang is a programming language used to build massively scalable
+	  soft real-time systems with requirements on high availability.
+	  Some of its uses are in telecoms, banking, e-commerce, computer
+	  telephony and instant messaging. Erlang's runtime system has
+	  built-in support for concurrency, distribution and fault tolerance.
+
+config BR2_PACKAGE_ERLANG_MEGACO
+	bool "install megaco application"
+	depends on BR2_PACKAGE_ERLANG
+	help
+	  The Megaco application is a framework for building applications
+	  on top of the Megaco/H.248 protocol. It is approximately 14MB in
+	  size so if you do not need it then it is recommended not to
+	  enable it.
diff --git a/package/erlang/erlang-build-fix.patch b/package/erlang/erlang-build-fix.patch
new file mode 100644
index 0000000..ff821c9
--- /dev/null
+++ b/package/erlang/erlang-build-fix.patch
@@ -0,0 +1,13 @@
+apply-patches.sh deletes this file from the source directory.
+
+--- erlang-R15B01.old/lib/tools/emacs/Makefile	2012-04-04
++++ erlang-R15B01/lib/tools/emacs/Makefile	2012-04-04 15:55:16.978957307 +0100
+@@ -51,7 +51,7 @@
+
+ ELC_FILES = $(EMACS_FILES:%=%.elc)
+
+-TEST_FILES = test.erl.indented test.erl.orig
++TEST_FILES = test.erl.indented
+
+ # ----------------------------------------------------
+ # Targets
diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
new file mode 100644
index 0000000..6b90627
--- /dev/null
+++ b/package/erlang/erlang.mk
@@ -0,0 +1,57 @@
+#############################################################
+#
+# erlang
+#
+#############################################################
+
+ERLANG_VERSION = R15B01
+ERLANG_SITE = http://www.erlang.org/download
+ERLANG_SOURCE = otp_src_$(ERLANG_VERSION).tar.gz
+ERLANG_DEPENDENCIES = host-erlang
+
+ERLANG_LICENSE = EPL
+ERLANG_LICENSE_FILES = EPLICENCE
+
+# The configure checks for these functions fail incorrectly
+ERLANG_CONF_ENV = ac_cv_func_isnan=yes ac_cv_func_isinf=yes
+
+ERLANG_CONF_OPT = --without-javac
+
+ifeq ($(BR2_PACKAGE_NCURSES),y)
+ERLANG_CONF_OPT += --with-termcap
+ERLANG_DEPENDENCIES += ncurses
+else
+ERLANG_CONF_OPT += --without-termcap
+endif
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+ERLANG_CONF_OPT += --with-ssl
+ERLANG_DEPENDENCIES += openssl
+else
+ERLANG_CONF_OPT += --without-ssl
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+ERLANG_CONF_OPT += --enable-shared-zlib
+ERLANG_DEPENDENCIES += zlib
+endif
+
+# Remove source, example, gs and wx files from the target
+ERLANG_REMOVE_PACKAGES = gs wx
+
+ifneq ($(BR2_PACKAGE_ERLANG_MEGACO),y)
+ERLANG_REMOVE_PACKAGES += megaco
+endif
+
+define ERLANG_REMOVE_UNUSED
+	find $(TARGET_DIR)/usr/lib/erlang -type d -name src -prune -exec rm -rf {} \;
+	find $(TARGET_DIR)/usr/lib/erlang -type d -name examples -prune -exec rm -rf {} \;
+	for package in $(ERLANG_REMOVE_PACKAGES); do \
+		rm -rf $(TARGET_DIR)/usr/lib/erlang/lib/$${package}-*; \
+	done
+endef
+
+ERLANG_POST_INSTALL_TARGET_HOOKS += ERLANG_REMOVE_UNUSED
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
