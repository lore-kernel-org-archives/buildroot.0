From: Bryce Ferguson <bryce.ferguson@rockwellcollins.com>
Date: Mon, 19 Dec 2016 15:17:29 -0600
Subject: [Buildroot] [PATCH 1/1] pure-ftpd: Added pure-ftpwho config option
Message-ID: <1482182249-40400-1-git-send-email-bryce.ferguson@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added the pure-ftpwho config option. When selected, the --with-ftpwho
compiler option is passed which enabled the pure-ftpwho command.

Signed-off-by: Bryce Ferguson <bryce.ferguson@rockwellcollins.com>
---
 package/pure-ftpd/Config.in    | 11 +++++++++++
 package/pure-ftpd/pure-ftpd.mk |  4 ++++
 2 files changed, 15 insertions(+)

diff --git a/package/pure-ftpd/Config.in b/package/pure-ftpd/Config.in
index c1b2529..85fdef3 100644
--- a/package/pure-ftpd/Config.in
+++ b/package/pure-ftpd/Config.in
@@ -10,3 +10,14 @@ config BR2_PACKAGE_PURE_FTPD
 	  well as hosting providers.
 
 	  http://www.pureftpd.org
+
+if BR2_PACKAGE_PURE_FTPD
+
+config BR2_PACKAGE_PURE_FTPD_FTPWHO
+	bool "ftpwho"
+	help
+	  Enable the pure-ftpd command.  Pure-ftpwho shows current Pure-ftpd
+	  client sessions.  Only the system administrator may run this.  Output
+	  can be text (default), HTML, XML data and parser-optimized.
+
+endif
diff --git a/package/pure-ftpd/pure-ftpd.mk b/package/pure-ftpd/pure-ftpd.mk
index ba4096c..80e432a 100644
--- a/package/pure-ftpd/pure-ftpd.mk
+++ b/package/pure-ftpd/pure-ftpd.mk
@@ -45,4 +45,8 @@ ifeq ($(BR2_TOOLCHAIN_SUPPORTS_PIE),)
 PURE_FTPD_CONF_ENV += ax_cv_check_cflags___fPIE=no ax_cv_check_ldflags___fPIE=no
 endif
 
+ifeq ($(BR2_PACKAGE_PURE_FTPD_FTPWHO),y)
+PURE_FTPD_CONF_OPTS += --with-ftpwho
+endif
+
 $(eval $(autotools-package))
-- 
1.9.1
