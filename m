From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Jan 2017 13:34:32 +0100
Subject: [Buildroot] [git commit] syslog-ng: Bump version to v3.9.1
Message-ID: <20170130125320.8D04F7FC94@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e0e656f423f0bfdd2c3b509d6fe28334c994e45c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Chris Packham <judge.packham@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/syslog-ng/syslog-ng.hash |  2 +-
 package/syslog-ng/syslog-ng.mk   | 13 +++++++++++--
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/package/syslog-ng/syslog-ng.hash b/package/syslog-ng/syslog-ng.hash
index f1dcf52..ba066d1 100644
--- a/package/syslog-ng/syslog-ng.hash
+++ b/package/syslog-ng/syslog-ng.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 49201dcfd59c8992936aa16c694f5e6593d505b44895f6c66b7d7f7895ce2c62  syslog-ng-3.7.3.tar.gz
+sha256 5678856a550ae790618fabde9d1447f932ce7a9080d55dca8fc5df1202c70a17  syslog-ng-3.9.1.tar.gz
diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index cfc7d0d..61fc48f 100644
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
