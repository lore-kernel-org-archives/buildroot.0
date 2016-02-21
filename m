From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 15:38:56 +0100
Subject: [Buildroot] [git commit branch/next] font-awesome:new package
Message-ID: <20160221144434.8EE8C8023D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4f6ba8cd458e3fa78789c8848493712b8574a294
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Font Awesome is a full suite of 605 pictographic icons for easy
scalable vector graphics on websites.

Signed-off-by: Atul Singh <atul.singh.mandla@rockwellcollins.com>
[Thomas: fix misc minor typos.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                      |  1 +
 package/font-awesome/Config.in         |  7 +++++++
 package/font-awesome/font-awesome.hash |  2 ++
 package/font-awesome/font-awesome.mk   | 18 ++++++++++++++++++
 4 files changed, 28 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 422978f..96b780c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -199,6 +199,7 @@ comment "Fonts"
 	source "package/bitstream-vera/Config.in"
 	source "package/cantarell/Config.in"
 	source "package/dejavu/Config.in"
+	source "package/font-awesome/Config.in"
 	source "package/ghostscript-fonts/Config.in"
 	source "package/inconsolata/Config.in"
 	source "package/liberation/Config.in"
diff --git a/package/font-awesome/Config.in b/package/font-awesome/Config.in
new file mode 100644
index 0000000..694d74e
--- /dev/null
+++ b/package/font-awesome/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_FONT_AWESOME
+	bool "font-awesome"
+	help
+	  Font Awesome is a full suite of 605 pictographic icons for
+	  easy scalable vector graphics on websites.
+
+	  https://github.com/FortAwesome/Font-Awesome
diff --git a/package/font-awesome/font-awesome.hash b/package/font-awesome/font-awesome.hash
new file mode 100644
index 0000000..9f3715e
--- /dev/null
+++ b/package/font-awesome/font-awesome.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  7813f416057da622b16229b10fef550e1dc64c5bb59871cd38fa86e76dfdbae8  font-awesome-v4.5.0.tar.gz
diff --git a/package/font-awesome/font-awesome.mk b/package/font-awesome/font-awesome.mk
new file mode 100644
index 0000000..6ebb92c
--- /dev/null
+++ b/package/font-awesome/font-awesome.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# font-awesome
+#
+################################################################################
+
+FONT_AWESOME_VERSION = v4.5.0
+FONT_AWESOME_SITE = $(call github,FortAwesome,Font-Awesome,$(FONT_AWESOME_VERSION))
+FONT_AWESOME_LICENSE = OFLv1.1 (font), MIT (CSS, LESS and Sass files)
+FONT_AWESOME_DIRECTORIES_LIST = css fonts less scss
+
+define FONT_AWESOME_INSTALL_TARGET_CMDS
+        mkdir -p $(TARGET_DIR)/usr/share/font-awesome/
+        $(foreach d,$(FONT_AWESOME_DIRECTORIES_LIST),\
+                cp -dpfr $(@D)/$(d) $(TARGET_DIR)/usr/share/font-awesome$(sep))
+endef
+
+$(eval $(generic-package))
