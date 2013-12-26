From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 Dec 2013 18:44:57 +0100
Subject: [Buildroot] [git commit] ulogd: disable DB backends if no threads
Message-ID: <20131226175122.235949BBF9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1f226a2e382938abdf886218adb46e399f465c92
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Database backends need threads even if sqlite does not.
The mysql client libs need them too but include them in the exclusion
closure anyway to state it very clearly. Fixes:
http://autobuild.buildroot.net/results/1ce/1cece0db309dfe5cecc69e88b02428615ed87316/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ulogd/ulogd.mk |   14 ++++++++++----
 1 files changed, 10 insertions(+), 4 deletions(-)

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
