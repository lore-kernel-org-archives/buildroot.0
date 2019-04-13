From: Sven Oliver Moll <buildroot@svol.li>
Date: Sat, 13 Apr 2019 22:40:57 +0200 (CEST)
Subject: [Buildroot] [PATCH] package/most: new package
Message-ID: <alpine.DEB.2.20.1904132238530.19094@defender.svolli.xa>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Sven Oliver Moll <svolli@svolli.de>
---
  DEVELOPERS             |  3 +++
  package/Config.in      |  1 +
  package/most/Config.in | 12 ++++++++++++
  package/most/most.hash |  7 +++++++
  package/most/most.mk   | 22 ++++++++++++++++++++++
  5 files changed, 45 insertions(+)
  create mode 100644 package/most/Config.in
  create mode 100644 package/most/most.hash
  create mode 100644 package/most/most.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index e2ee7cbf69..121acedf99 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2112,6 +2112,9 @@ F:	package/libmms/
  F:	package/orc/
  F:	package/wampcc/

+N:	Sven Oliver Moll <svolli@svolli.de>
+F:	package/most/
+
  N:	Theo Debrouwere <t.debrouwere@televic.com>
  F:	package/pugixml/

diff --git a/package/Config.in b/package/Config.in
index eed842c67a..ac7c0595ae 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2230,6 +2230,7 @@ menu "Text editors and viewers"
  	source "package/joe/Config.in"
  	source "package/less/Config.in"
  	source "package/mc/Config.in"
+	source "package/most/Config.in"
  	source "package/nano/Config.in"
  	source "package/uemacs/Config.in"
  	source "package/vim/Config.in"
diff --git a/package/most/Config.in b/package/most/Config.in
new file mode 100644
index 0000000000..943042c3fd
--- /dev/null
+++ b/package/most/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_MOST
+	bool "most"
+	depends on BR2_USE_MMU # slang
+	select BR2_PACKAGE_SLANG
+	help
+	  most is a powerful pager, including features like multi
+	  document support, hex view and unpack on-the-fly.
+
+	  https://www.jedsoft.com/most/
+
+	  Note: this program depends on the slang library which is
+	  rather large to be used just for this pager.
diff --git a/package/most/most.hash b/package/most/most.hash
new file mode 100644
index 0000000000..647b3ed4e8
--- /dev/null
+++ b/package/most/most.hash
@@ -0,0 +1,7 @@
+# From https://www.jedsoft.org/releases/most/
+sha1 db811669a6b22c15478c957b439b5e4483ce1c95 most-5.1.0.tar.gz
+# Locally computed
+sha256 db805d1ffad3e85890802061ac8c90e3c89e25afb184a794e03715a3ed190501  most-5.1.0.tar.gz
+sha256 1b2a567f289f66a143c56353e7b3d4fa5862514a5e3c5cfdf8b02ee5e5aaa953  COPYING
+sha256 47ad1c3f9b94d6ec42d9bee6c5df980c5c2daa5b9d22113545ae6a3f21ca2f52  COPYRIGHT
+
diff --git a/package/most/most.mk b/package/most/most.mk
new file mode 100644
index 0000000000..3e6618b621
--- /dev/null
+++ b/package/most/most.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# most
+#
+################################################################################
+
+MOST_SITE = http://www.jedsoft.org/releases/most
+MOST_VERSION = 5.1.0
+MOST_LICENSE = GPL-2.0+
+MOST_LICENSE_FILES = COPYING COPYRIGHT
+MOST_DEPENDENCIES = slang
+
+define MOST_REMOVE_LOCAL_SLANG_CHECK
+	$(SED) 's/ slangversion / /g' $(@D)/src/Makefile.in
+endef
+MOST_POST_PATCH_HOOKS += MOST_REMOVE_LOCAL_SLANG_CHECK
+
+define MOST_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/src/objs/most $(TARGET_DIR)/usr/bin/most
+endef
+
+$(eval $(autotools-package))
-- 
2.11.0
