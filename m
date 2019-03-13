From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 13 Mar 2019 19:15:11 +0100
Subject: [Buildroot] [PATCH 1/2] package/ulogd: add postgresql optional
 dependency
Message-ID: <20190313181512.2668-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ulogd/ulogd.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/ulogd/ulogd.mk b/package/ulogd/ulogd.mk
index 5b0e558930..5ea127f630 100644
--- a/package/ulogd/ulogd.mk
+++ b/package/ulogd/ulogd.mk
@@ -7,7 +7,7 @@
 ULOGD_VERSION = 2.0.5
 ULOGD_SOURCE = ulogd-$(ULOGD_VERSION).tar.bz2
 ULOGD_SITE = http://www.netfilter.org/projects/ulogd/files
-ULOGD_CONF_OPTS = --with-dbi=no --with-pgsql=no
+ULOGD_CONF_OPTS = --with-dbi=no
 ULOGD_DEPENDENCIES = host-pkgconf \
 	libmnl libnetfilter_acct libnetfilter_conntrack libnetfilter_log \
 	libnfnetlink
@@ -22,11 +22,17 @@ ULOGD_DEPENDENCIES += mysql
 else
 ULOGD_CONF_OPTS += --with-mysql=no
 endif
+ifeq ($(BR2_PACKAGE_POSTGRESQL),y)
+ULOGD_CONF_OPTS += --with-pgsql
+ULOGD_DEPENDENCIES += postgresql
+else
+ULOGD_CONF_OPTS += --without-pgsql
+endif
 ifeq ($(BR2_PACKAGE_SQLITE),y)
 ULOGD_DEPENDENCIES += sqlite
 endif
 else
-ULOGD_CONF_OPTS += --with-mysql=no --without-sqlite
+ULOGD_CONF_OPTS += --with-mysql=no --without-pgsql --without-sqlite
 endif
 
 ifeq ($(BR2_PACKAGE_LIBPCAP),y)
-- 
2.14.1
