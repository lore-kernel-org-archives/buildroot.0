From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jan 2014 22:39:36 +0100
Subject: [Buildroot] [git commit] added python unicode selection to menu
Message-ID: <20140122214049.811EB9C5CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9dada44cd886ae3cc5671791a3e181ec963ad0f1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch is based on the original new pkg patch submitted last Jan
and is part of the "Patchwork oldest patches cleanup #5".

[Peter: fix CONF_OPT indentation]
Signed-off-by: Matt Weber <mlweber1@rockwellcollins.com>
Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python/Config.in |   18 ++++++++++++++++++
 package/python/python.mk |    5 +++++
 2 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/package/python/Config.in b/package/python/Config.in
index b1c0935..a0c78c6 100644
--- a/package/python/Config.in
+++ b/package/python/Config.in
@@ -84,6 +84,24 @@ config BR2_PACKAGE_PYTHON_UNICODEDATA
 	help
 	  Unicode character database (used by stringprep module) (large).
 
+if BR2_PACKAGE_PYTHON_UNICODEDATA
+
+choice
+	prompt "Python unicode database format"
+	default BR2_PACKAGE_PYTHON_UCS2
+	help
+	  Select Python unicode database format for target
+
+config BR2_PACKAGE_PYTHON_UCS2
+	bool "Universal Character Set 2-byte (UCS2)"
+
+config BR2_PACKAGE_PYTHON_UCS4
+	bool "Universal Character Set 4-byte (UCS4)"
+
+endchoice
+
+endif
+
 config BR2_PACKAGE_PYTHON_SQLITE
 	bool "sqlite module"
 	select BR2_PACKAGE_SQLITE
diff --git a/package/python/python.mk b/package/python/python.mk
index bc42e8f..6187d66 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -102,6 +102,11 @@ ifneq ($(BR2_PACKAGE_PYTHON_UNICODEDATA),y)
 PYTHON_CONF_OPT += --disable-unicodedata
 endif
 
+# Default is UCS2 w/o a conf opt
+ifeq ($(BR2_PACKAGE_PYTHON_UCS4),y)
+PYTHON_CONF_OPT += --enable-unicode=ucs4
+endif
+
 ifeq ($(BR2_PACKAGE_PYTHON_BZIP2),y)
 PYTHON_DEPENDENCIES += bzip2
 else
