From: Samuel MARTIN <s.martin49@gmail.com>
Date: Wed, 21 Mar 2012 00:09:59 +0100
Subject: [Buildroot] [PATCH 09/11] manual: update writing-rules.txt
In-Reply-To: <1332285001-12881-1-git-send-email-s.martin49@gmail.com>
References: <1332285001-12881-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1332285001-12881-10-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Samuel MARTIN <s.martin49@gmail.com>
---
 docs/manual/adding-packages-directory.txt |    5 ++
 docs/manual/writing-rules.txt             |  108 +++++++++++++++++++++++++++++
 2 files changed, 113 insertions(+)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 1428f37..e36eafc 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -145,6 +145,9 @@ is also enabled, but not necessarily built before your package. To do
 so, the dependency also needs to be expressed in the +.mk+ file of the
 package.
 
+Further formating details: see xref:writing-rules-config-in[the
+writing rules].
+
 The +.mk+ file
 ^^^^^^^^^^^^^^
 
@@ -185,3 +188,5 @@ different way, using different infrastructures:
   many of them in the tree, we keep them documented in a
   xref:handwritten-tutorial[tutorial].
 
+Further formating details: see xref:writing-rules-mk[the writing
+rules].
diff --git a/docs/manual/writing-rules.txt b/docs/manual/writing-rules.txt
index 284cee2..b18f30b 100644
--- a/docs/manual/writing-rules.txt
+++ b/docs/manual/writing-rules.txt
@@ -1,11 +1,119 @@
 Writing rules
 -------------
 
+Overall, those writing rules are here to help you adding new files in
+Buildroot or refactoring existing ones. In these cases, should be followed.
+
+If you slightly modify some existing file, the important thing is
+keeping th consistency of the whole file, so you can:
+* either follow the potentially deprecated rules used all over this
+file
+* or entirely rework it in order to make it comply with those rules.
+
+[[writing-rules-config-in]]
+
 +Config.in+ file
 ~~~~~~~~~~~~~~~~
 
++Config.in+ files contain entry for almost anything configurable in
+buildroot.
+
+Entry has the following pattern:
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
+
+[[writing-rules-mk]]
+
 The +.mk+ file
 ~~~~~~~~~~~~~~
 
+* Affectation: use +=+ preceeded and followed by one space:
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
+* Optional hook: Keep hook function definition close hooks variable
+  affection nested in the +if+ block:
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
 The documentation
 ~~~~~~~~~~~~~~~~~
+
+The documentation uses the
+http://www.methods.co.nz/asciidoc/[asciidoc] format.
+
+Further details about the http://www.methods.co.nz/asciidoc/[asciidoc]
+syntax: refer to http://www.methods.co.nz/asciidoc/userguide.html[].
-- 
1.7.9.4
