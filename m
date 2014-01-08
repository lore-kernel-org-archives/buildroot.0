From: Matt Weber <mlweber1@rockwellcollins.com>
Date: Tue, 7 Jan 2014 22:34:07 -0600
Subject: [Buildroot] [PATCH v3] added python unicode selection to menu
Message-ID: <1389155647-17521-1-git-send-email-mlweber1@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Matthew Weber <mlweber1@rockwellcollins.com>

This patch is based on the original new pkg patch submitted last Jan
and is part of the "Patchwork oldest patches cleanup #5".

Signed-off-by: Matt Weber <mlweber1@rockwellcollins.com>
--

Changes v2 -> v3:
 - Removed host-python unicode configuration
   (No usecase and host doesn't have to match target) Suggested by Thomas P.

Changes v1 -> v2:
 - None, resubmit after testing against current tip.
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
index bc42e8f..42ca538 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -102,6 +102,11 @@ ifneq ($(BR2_PACKAGE_PYTHON_UNICODEDATA),y)
 PYTHON_CONF_OPT += --disable-unicodedata
 endif
 
+# Default is UCS2 w/o a conf opt
+ifeq ($(BR2_PACKAGE_PYTHON_UCS4),y)
+PYTHON_CONF_OPT      += --enable-unicode=ucs4
+endif
+
 ifeq ($(BR2_PACKAGE_PYTHON_BZIP2),y)
 PYTHON_DEPENDENCIES += bzip2
 else
-- 
1.7.1
