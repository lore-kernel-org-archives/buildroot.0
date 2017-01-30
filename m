From: Chris Packham <judge.packham@gmail.com>
Date: Mon, 30 Jan 2017 20:57:29 +1300
Subject: [Buildroot] [PATCH] syslog-ng: Bump version to v3.9.1
Message-ID: <20170130075729.1035-1-judge.packham@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Chris Packham <judge.packham@gmail.com>
---
 package/syslog-ng/syslog-ng.hash |  2 +-
 package/syslog-ng/syslog-ng.mk   | 13 +++++++++++--
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/package/syslog-ng/syslog-ng.hash b/package/syslog-ng/syslog-ng.hash
index f1dcf5241..ba066d138 100644
--- a/package/syslog-ng/syslog-ng.hash
+++ b/package/syslog-ng/syslog-ng.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 49201dcfd59c8992936aa16c694f5e6593d505b44895f6c66b7d7f7895ce2c62  syslog-ng-3.7.3.tar.gz
+sha256 5678856a550ae790618fabde9d1447f932ce7a9080d55dca8fc5df1202c70a17  syslog-ng-3.9.1.tar.gz
diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index cfc7d0df4..61fc48fd4 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSLOG_NG_VERSION = 3.7.3
+SYSLOG_NG_VERSION = 3.9.1
 SYSLOG_NG_SITE = https://github.com/balabit/syslog-ng/releases/download/syslog-ng-$(SYSLOG_NG_VERSION)
 SYSLOG_NG_LICENSE = LGPLv2.1+ (syslog-ng core), GPLv2+ (modules)
 SYSLOG_NG_LICENSE_FILES = COPYING
@@ -12,7 +12,8 @@ SYSLOG_NG_DEPENDENCIES = host-bison host-flex host-pkgconf \
 	eventlog libglib2 openssl pcre
 # rabbit-mq needs -lrt
 SYSLOG_NG_CONF_ENV = LIBS=-lrt
-SYSLOG_NG_CONF_OPTS = --disable-manpages --localstatedir=/var/run
+SYSLOG_NG_CONF_OPTS = --disable-manpages --localstatedir=/var/run \
+	--disable-java --disable-java-modules
 
 # We override busybox's S01logging init script
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
@@ -75,6 +76,14 @@ else
 SYSLOG_NG_CONF_OPTS += --disable-spoof-source
 endif
 
+ifeq ($(BR2_PACKAGE_LIBCURL),y)
+SYSLOG_NG_DEPENDENCIES += libcurl
+SYSLOG_NG_CONF_OPTS += --enable-http
+SYSLOG_NG_CONF_OPTS += --with-libcurl="$(STAGING_DIR)/usr"
+else
+SYSLOG_NG_CONF_OPTS += --disable-http
+endif
+
 ifeq ($(BR2_INIT_SYSTEMD),y)
 SYSLOG_NG_DEPENDENCIES += systemd
 SYSLOG_NG_CONF_OPTS += \
-- 
2.11.0.24.ge6920cf
