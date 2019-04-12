From: Sven Oliver Moll <buildroot@svol.li>
Date: Fri, 12 Apr 2019 18:07:06 +0200 (CEST)
Subject: [Buildroot] [PATCH] package/most: added version 5.1.0
Message-ID: <alpine.DEB.2.20.1904121806020.19094@defender.svolli.xa>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Sven Oliver Moll <svolli@svolli.de>

diff --git a/DEVELOPERS b/DEVELOPERS
index 01cb34057b..677757556c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2108,6 +2108,9 @@ F:	package/libmms/
  F:	package/orc/
  F:	package/wampcc/

+N:	Sven Oliver Moll <svolli@svolli.de>
+F:	package/most/
+
  N:	Theo Debrouwere <t.debrouwere@televic.com>
  F:	package/pugixml/

diff --git a/package/Config.in b/package/Config.in
index 32f80cb2d0..065933ade1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2228,6 +2228,7 @@ menu "Text editors and viewers"
  	source "package/joe/Config.in"
  	source "package/less/Config.in"
  	source "package/mc/Config.in"
+	source "package/most/Config.in"
  	source "package/nano/Config.in"
  	source "package/uemacs/Config.in"
  	source "package/vim/Config.in"
diff --git a/package/most/Config.in b/package/most/Config.in
new file mode 100644
index 0000000000..c8909a024e
--- /dev/null
+++ b/package/most/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_MOST
+	bool "most"
+	depends on BR2_PACKAGE_SLANG
+	help
+	  most is a powerful pager
+
+	  https://www.jedsoft.org/most/
+
+comment "most depends on slang library"
+	depends on !BR2_PACKAGE_SLANG
diff --git a/package/most/most.hash b/package/most/most.hash
new file mode 100644
index 0000000000..76cbec0cda
--- /dev/null
+++ b/package/most/most.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 db805d1ffad3e85890802061ac8c90e3c89e25afb184a794e03715a3ed190501  most-5.1.0.tar.gz
diff --git a/package/most/most.mk b/package/most/most.mk
new file mode 100644
index 0000000000..7ff8d2ea95
--- /dev/null
+++ b/package/most/most.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# most
+#
+################################################################################
+
+MOST_SITE = http://www.jedsoft.org/releases/most
+MOST_VERSION = 5.1.0
+MOST_SOURCE = most-$(MOST_VERSION).tar.gz
+MOST_LICENSE = GPL-2.0
+MOST_LICENSE_FILES = COPYING
+
+define MOST_BUILD_CMDS
+	# remove version check of slang library
+	# - check assumes self-hosting compile
+	# - slang version is sufficiant due to building from buildroot
+	$(SED) 's/ slangversion / /g' $(@D)/src/Makefile
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
+endef
+
+define MOST_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/src/objs/most $(TARGET_DIR)/usr/bin/most
+endef
+
+$(eval $(autotools-package))
