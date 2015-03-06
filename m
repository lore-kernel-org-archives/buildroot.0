From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri,  6 Mar 2015 17:49:44 +0100
Subject: [Buildroot] [PATCH v2 4/4] package/apr-util: add support for
	unixodbc
In-Reply-To: <1425660584-25189-1-git-send-email-bernd.kuhls@t-online.de>
References: <1425660584-25189-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1425660584-25189-4-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: avoid picking up $(STAGING_DIR)/usr/bin/odbc_config, this file is
    compiled for target and breaks unixodbc detection when used

 package/apr-util/apr-util.mk |    9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/apr-util/apr-util.mk b/package/apr-util/apr-util.mk
index 3b0a71b..bc0572e 100644
--- a/package/apr-util/apr-util.mk
+++ b/package/apr-util/apr-util.mk
@@ -53,4 +53,13 @@ else
 APR_UTIL_CONF_OPTS += --without-crypto
 endif
 
+ifeq ($(BR2_PACKAGE_UNIXODBC),y)
+APR_UTIL_CONF_OPTS += --with-odbc="$(STAGING_DIR)/usr"
+# avoid using target binary $(STAGING_DIR)/usr/bin/odbc_config
+APR_UTIL_CONF_ENV += ac_cv_path_ODBC_CONFIG=""
+APR_UTIL_DEPENDENCIES += unixodbc
+else
+APR_UTIL_CONF_OPTS += --without-odbc
+endif
+
 $(eval $(autotools-package))
-- 
1.7.10.4
