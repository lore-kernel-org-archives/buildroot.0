From: Matt Weber <rc.lsw.collaborate@gmail.com>
Date: Wed, 16 Jan 2013 06:14:41 -0600
Subject: [Buildroot] [PATCH 1/1] added python unicode selection to menu
Message-ID: <1358338481-8467-1-git-send-email-rc.lsw.collaborate@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Matthew Weber <matthew.l.weber@gmail.com>


Signed-off-by: Matt Weber <rc.lsw.collaborate@gmail.com>
---
 package/python/Config.in |   18 ++++++++++++++++++
 package/python/python.mk |    6 ++++++
 2 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/package/python/Config.in b/package/python/Config.in
index 4089cce..cb032da 100644
--- a/package/python/Config.in
+++ b/package/python/Config.in
@@ -83,6 +83,24 @@ config BR2_PACKAGE_PYTHON_UNICODEDATA
 	help
 	  Unicode character database (used by stringprep module) (large).
 
+if BR2_PACKAGE_PYTHON_UNICODEDATA
+
+choice
+>.......prompt "Python unicode database format"
+>.......default BR2_PACKAGE_PYTHON_UCS2
+>.......help
+>.......  Select Python unicode database format for target
+
+config BR2_PACKAGE_PYTHON_UCS2
+>.......bool "Universal Character Set 2-byte (UCS2)"
+
+config BR2_PACKAGE_PYTHON_UCS4
+>.......bool "Universal Character Set 4-byte (UCS4)"
+
+endchoice
+
+endif
+
 config BR2_PACKAGE_PYTHON_SQLITE
 	bool "sqlite module"
 	select BR2_PACKAGE_SQLITE
diff --git a/package/python/python.mk b/package/python/python.mk
index 71591b7..66a9db5 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -96,6 +96,12 @@ ifneq ($(BR2_PACKAGE_PYTHON_UNICODEDATA),y)
 PYTHON_CONF_OPT += --disable-unicodedata
 endif
 
+# Default is UCS2 w/o a conf opt
+ifeq ($(BR2_PACKAGE_PYTHON_UCS4),y)
+HOST_PYTHON_CONF_OPT += --enable-unicode=ucs4
+PYTHON_CONF_OPT      += --enable-unicode=ucs4
+endif
+
 ifeq ($(BR2_PACKAGE_PYTHON_BZIP2),y)
 PYTHON_DEPENDENCIES += bzip2
 else
-- 
1.7.1
