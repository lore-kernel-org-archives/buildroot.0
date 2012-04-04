From: Will Newton <will.newton@gmail.com>
Date: Wed, 4 Apr 2012 17:49:07 +0100
Subject: [Buildroot] [PATCH] erlang: Add new package.
Message-ID: <CAFbHwiTCXTT23fGLnz_w8kr+6NmNzV9kK+=nHYpXOY5NOMt1dg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/Config.in                     |    1 +
 package/erlang/Config.in              |    9 +++++++++
 package/erlang/erlang-build-fix.patch |   13 +++++++++++++
 package/erlang/erlang.mk              |   26 ++++++++++++++++++++++++++
 4 files changed, 49 insertions(+), 0 deletions(-)
 create mode 100644 package/erlang/Config.in
 create mode 100644 package/erlang/erlang-build-fix.patch
 create mode 100644 package/erlang/erlang.mk

diff --git a/package/Config.in b/package/Config.in
index b84d7f1..8c36952 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -227,6 +227,7 @@ source "package/xfsprogs/Config.in"
 endmenu

 menu "Interpreter languages and scripting"
+source "package/erlang/Config.in"
 source "package/haserl/Config.in"
 source "package/lua/Config.in"
 if BR2_PACKAGE_LUA
diff --git a/package/erlang/Config.in b/package/erlang/Config.in
new file mode 100644
index 0000000..78f34ac
--- /dev/null
+++ b/package/erlang/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_ERLANG
+	bool "erlang"
+	select BR2_PACKAGE_NCURSES
+	help
+	  Erlang is a programming language used to build massively scalable
+	  soft real-time systems with requirements on high availability.
+	  Some of its uses are in telecoms, banking, e-commerce, computer
+	  telephony and instant messaging. Erlang's runtime system has
+	  built-in support for concurrency, distribution and fault tolerance.
diff --git a/package/erlang/erlang-build-fix.patch
b/package/erlang/erlang-build-fix.patch
new file mode 100644
index 0000000..d2938a5
--- /dev/null
+++ b/package/erlang/erlang-build-fix.patch
@@ -0,0 +1,13 @@
+apply-patches.sh deletes this file from the source directory.
+
+--- erlang-R15B01.old/lib/tools/emacs/Makefile	2012-04-04
15:54:29.271832192 +0100
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
index 0000000..e8ce8bc
--- /dev/null
+++ b/package/erlang/erlang.mk
@@ -0,0 +1,26 @@
+#############################################################
+#
+# erlang
+#
+#############################################################
+
+ERLANG_VERSION = R15B01
+ERLANG_SITE = http://www.erlang.org/download
+ERLANG_SOURCE = otp_src_$(ERLANG_VERSION).tar.gz
+ERLANG_DEPENDENCIES = ncurses host-erlang
+
+# The configure checks for these functions fail incorrectly
+ERLANG_CONF_ENV = ac_cv_func_isnan=yes ac_cv_func_isinf=yes
+
+# Remove source, example, gs and wx files from the target
+define ERLANG_REMOVE_UNUSED
+	find $(TARGET_DIR)/usr/lib/erlang -type d -name src -prune -exec rm -rf {} \;
+	find $(TARGET_DIR)/usr/lib/erlang -type d -name examples -prune
-exec rm -rf {} \;
+	rm -rf $(TARGET_DIR)/usr/lib/erlang/lib/gs-*
+	rm -rf $(TARGET_DIR)/usr/lib/erlang/lib/wx-*
+endef
+
+ERLANG_POST_INSTALL_TARGET_HOOKS += ERLANG_REMOVE_UNUSED
+
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
-- 
1.7.1
-------------- next part --------------
