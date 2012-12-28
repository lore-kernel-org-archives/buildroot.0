From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 28 Dec 2012 10:05:55 -0300
Subject: [Buildroot] [PATCH 2/2] ulogd: add support for mysql output
In-Reply-To: <1356699955-27479-1-git-send-email-gustavo@zacarias.com.ar>
References: <1356699955-27479-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1356699955-27479-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ulogd/ulogd.mk |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/package/ulogd/ulogd.mk b/package/ulogd/ulogd.mk
index 4620bbd..34d8665 100644
--- a/package/ulogd/ulogd.mk
+++ b/package/ulogd/ulogd.mk
@@ -7,7 +7,7 @@
 ULOGD_VERSION = 2.0.1
 ULOGD_SOURCE = ulogd-$(ULOGD_VERSION).tar.bz2
 ULOGD_SITE = http://www.netfilter.org/projects/ulogd/files
-ULOGD_CONF_OPT = --with-dbi=no --with-mysql=no --with-pgsql=no
+ULOGD_CONF_OPT = --with-dbi=no --with-pgsql=no
 ULOGD_AUTORECONF = YES
 ULOGD_DEPENDENCIES = host-pkgconf \
 	libmnl libnetfilter_acct libnetfilter_conntrack libnetfilter_log \
@@ -15,4 +15,11 @@ ULOGD_DEPENDENCIES = host-pkgconf \
 ULOGD_LICENSE = GPLv2
 ULOGD_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_PACKAGE_MYSQL_CLIENT),y)
+ULOGD_CONF_OPT += --with-mysql=$(STAGING_DIR)/usr
+ULOGD_DEPENDENCIES += mysql_client
+else
+ULOGD_CONF_OPT += --with-mysql=no
+endif
+
 $(eval $(autotools-package))
-- 
1.7.8.6
