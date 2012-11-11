From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 11 Nov 2012 14:14:51 +0100
Subject: [Buildroot] [PATCH 13/23] manual: add writing-rules.txt
In-Reply-To: <1352639701-27829-1-git-send-email-s.martin49@gmail.com>
References: <1352639701-27829-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1352639701-27829-14-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Samuel Martin <s.martin49@gmail.com>

 create mode 100644 docs/manual/writing-rules.txt

diff --git a/docs/manual/developer-guide.txt b/docs/manual/developer-guide.txt
index 37f703d..b254b0f 100644
--- a/docs/manual/developer-guide.txt
+++ b/docs/manual/developer-guide.txt
@@ -3,6 +3,8 @@
 Developer Guidelines
 ====================
 
+include::writing-rules.txt[]
+
 include::adding-packages.txt[]
 
 include::board-support.txt[]
diff --git a/docs/manual/writing-rules.txt b/docs/manual/writing-rules.txt
new file mode 100644
index 0000000..e0a5a2a
--- /dev/null
+++ b/docs/manual/writing-rules.txt
@@ -0,0 +1,125 @@
+// -*- mode:doc; -*-
+
+Writing rules
+-------------
+
+Overall, those writing rules are here to help you add new files in
+Buildroot or refactor existing ones.
+
+If you slightly modify some existing file, the important thing is
+keeping the consistency of the whole file, so you can:
+* either follow the potentially deprecated rules used all over this
+file
+* or entirely rework it in order to make it comply with those rules.
+
+[[writing-rules-config-in]]
+
++Config.in+ file
+~~~~~~~~~~~~~~~~
+
++Config.in+ files contain entries for almost anything configurable in
+Buildroot.
+
+An entry has the following pattern:
+
+---------------------
+config BR2_PACKAGE_LIBFOO
+	bool "libfoo"
+	depends on BR2_PACKAGE_LIBBAZ
+	select BR2_PACKAGE_LIBBAR
+	help
+	  This is a comment that explains what libfoo is.
+
+	  http://foosoftware.org/libfoo/
+---------------------
+
+* The +bool+, +depends on+, +select+ and +help+ lines are indented
+  with one tab.
+
+* The help text itself should be indented with one tab and two
+  spaces.
+
+The configuration system used in Buildroot, so the content of the
++Config.in+ files, is regular _Kconfig_. Further details about
+_Kconfig_: refer to
+http://kernel.org/doc/Documentation/kbuild/kconfig-language.txt[].
+
+[[writing-rules-mk]]
+
+The +.mk+ file
+~~~~~~~~~~~~~~
+
+* Assignment: use +=+ preceded and followed by one space:
++
+---------------------
+LIBFOO_VERSION = 1.0
+LIBFOO_CONF_OPT += --without-python-support
+---------------------
+
+* Indentation: use tab only:
++
+---------------------
+define LIBFOO_REMOVE_DOC
+$(RM) -fr $(TARGET_DIR)/usr/share/libfoo/doc \
+	$(TARGET_DIR)/usr/share/man/man3/libfoo*
+endef
+---------------------
+
+* Optional dependency:
+
+** Prefer multi-line syntax.
++
+YES:
++
+---------------------
+ifeq ($(BR2_PACKAGE_PYTHON),y)
+LIBFOO_CONF_OPT += --with-python-support
+LIBFOO_DEPENDENCIES += python
+else
+LIBFOO_CONF_OPT += --without-python-support
+endif
+---------------------
++
+NO:
++
+---------------------
+LIBFOO_CONF_OPT += --with$(if $(BR2_PACKAGE_PYTHON),,out)-python-support
+LIBFOO_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON),python,)
+---------------------
+
+** Keep configure options and dependencies close together.
+
+* Optional hooks: keep hook definition and assignment together in one
+  if block.
++
+YES:
++
+---------------------
+ifneq ($(BR2_LIBFOO_INSTALL_DATA),y)
+define LIBFOO_REMOVE_DATA
+	$(RM) -fr $(TARGET_DIR)/usr/share/libfoo/data
+endef
+LIBFOO_POST_INSTALL_TARGET_HOOKS += LIBFOO_REMOVE_DATA
+endif
+---------------------
++
+NO:
++
+---------------------
+define LIBFOO_REMOVE_DATA
+	$(RM) -fr $(TARGET_DIR)/usr/share/libfoo/data
+endef
+
+ifneq ($(BR2_LIBFOO_INSTALL_DATA),y)
+LIBFOO_POST_INSTALL_TARGET_HOOKS += LIBFOO_REMOVE_DATA
+endif
+---------------------
+
+The documentation
+~~~~~~~~~~~~~~~~~
+
+The documentation uses the
+http://www.methods.co.nz/asciidoc/[asciidoc] format.
+
+Further details about the http://www.methods.co.nz/asciidoc/[asciidoc]
+syntax: refer to http://www.methods.co.nz/asciidoc/userguide.html[].
-- 
1.8.0
