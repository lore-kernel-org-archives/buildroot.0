From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 13 Apr 2019 23:54:42 +0200
Subject: [Buildroot] [git commit] package/most: new package
Message-ID: <20190413220301.11EE58E16E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f40ceb857e7f4e5b01bf0867e729240df3c977da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

--with-slang has to be given explicitly, otherwise the configure script
looks for slang.h in host directories.

Signed-off-by: Sven Oliver Moll <svolli@svolli.de>
[Arnout: add --with-slang config option]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS             |  3 +++
 package/Config.in      |  1 +
 package/most/Config.in | 12 ++++++++++++
 package/most/most.hash |  6 ++++++
 package/most/most.mk   | 24 ++++++++++++++++++++++++
 5 files changed, 46 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 40d0642c2e..a77a730603 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2113,6 +2113,9 @@ F:	package/libmms/
 F:	package/orc/
 F:	package/wampcc/
 
+N:	Sven Oliver Moll <svolli@svolli.de>
+F:	package/most/
+
 N:	Theo Debrouwere <t.debrouwere@televic.com>
 F:	package/pugixml/
 
diff --git a/package/Config.in b/package/Config.in
index ceb78fac0b..158a030e53 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2231,6 +2231,7 @@ menu "Text editors and viewers"
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
index 0000000000..151caadc3a
--- /dev/null
+++ b/package/most/most.hash
@@ -0,0 +1,6 @@
+# From https://www.jedsoft.org/releases/most/
+sha1 db811669a6b22c15478c957b439b5e4483ce1c95 most-5.1.0.tar.gz
+# Locally computed
+sha256 db805d1ffad3e85890802061ac8c90e3c89e25afb184a794e03715a3ed190501  most-5.1.0.tar.gz
+sha256 1b2a567f289f66a143c56353e7b3d4fa5862514a5e3c5cfdf8b02ee5e5aaa953  COPYING
+sha256 47ad1c3f9b94d6ec42d9bee6c5df980c5c2daa5b9d22113545ae6a3f21ca2f52  COPYRIGHT
diff --git a/package/most/most.mk b/package/most/most.mk
new file mode 100644
index 0000000000..d24e67f936
--- /dev/null
+++ b/package/most/most.mk
@@ -0,0 +1,24 @@
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
+MOST_CONF_OPTS = --with-slang=$(STAGING_DIR)/usr
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
