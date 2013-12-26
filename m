From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Dec 2013 08:34:42 -0300
Subject: [Buildroot] [PATCH] ulogd: disable DB backends if no threads
Message-ID: <1388057682-2912-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Database backends need threads even if sqlite does not.
The mysql client libs need them too but include them in the exclusion
closure anyway to state it very clearly. Fixes:
http://autobuild.buildroot.net/results/1ce/1cece0db309dfe5cecc69e88b02428615ed87316/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ulogd/ulogd.mk | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/package/ulogd/ulogd.mk b/package/ulogd/ulogd.mk
index 24a5838..03958bb 100644
--- a/package/ulogd/ulogd.mk
+++ b/package/ulogd/ulogd.mk
@@ -11,15 +11,21 @@ ULOGD_CONF_OPT = --with-dbi=no --with-pgsql=no
 ULOGD_AUTORECONF = YES
 ULOGD_DEPENDENCIES = host-pkgconf \
 	libmnl libnetfilter_acct libnetfilter_conntrack libnetfilter_log \
-	libnfnetlink $(if $(BR2_PACKAGE_SQLITE),sqlite)
+	libnfnetlink
 ULOGD_LICENSE = GPLv2
 ULOGD_LICENSE_FILES = COPYING
 
+# DB backends need threads
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 ifeq ($(BR2_PACKAGE_MYSQL_CLIENT),y)
-ULOGD_CONF_OPT += --with-mysql=$(STAGING_DIR)/usr
-ULOGD_DEPENDENCIES += mysql_client
+	ULOGD_CONF_OPT += --with-mysql=$(STAGING_DIR)/usr
+	ULOGD_DEPENDENCIES += mysql_client
+endif
+ifeq ($(BR2_PACKAGE_SQLITE),y)
+	ULOGD_DEPENDENCIES += sqlite
+endif
 else
-ULOGD_CONF_OPT += --with-mysql=no
+	ULOGD_CONF_OPT += --with-mysql=no --without-sqlite
 endif
 
 $(eval $(autotools-package))
-- 
1.8.3.2
