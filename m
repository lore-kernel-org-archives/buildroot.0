From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 14 Jul 2017 14:15:31 -0400
Subject: [Buildroot] [PATCH 09/15] syslog-ng: support libressl
In-Reply-To: <20170714181537.17479-1-aduskett@gmail.com>
References: <20170714181537.17479-1-aduskett@gmail.com>
Message-ID: <20170714181537.17479-9-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/syslog-ng/Config.in    | 2 +-
 package/syslog-ng/syslog-ng.mk | 8 +++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/syslog-ng/Config.in b/package/syslog-ng/Config.in
index fbc236221..a6c1efc79 100644
--- a/package/syslog-ng/Config.in
+++ b/package/syslog-ng/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_SYSLOG_NG
 	select BR2_PACKAGE_EVENTLOG
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_PCRE
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_LIBRESSL
 	help
 	  syslog-ng is an enhanced log daemon, supporting a wide range
 	  of input and output methods: syslog, unstructured text,
diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index 325fac584..4b182c9e3 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -9,12 +9,18 @@ SYSLOG_NG_SITE = https://github.com/balabit/syslog-ng/releases/download/syslog-n
 SYSLOG_NG_LICENSE = LGPL-2.1+ (syslog-ng core), GPL-2.0+ (modules)
 SYSLOG_NG_LICENSE_FILES = COPYING
 SYSLOG_NG_DEPENDENCIES = host-bison host-flex host-pkgconf \
-	eventlog libglib2 openssl pcre
+	eventlog libglib2 pcre
 # rabbit-mq needs -lrt
 SYSLOG_NG_CONF_ENV = LIBS=-lrt
 SYSLOG_NG_CONF_OPTS = --disable-manpages --localstatedir=/var/run \
 	--disable-java --disable-java-modules --disable-mongodb
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+SYSLOG_NG_DEPENDENCIES += openssl
+else ifeq ($(BR2_PACKAGE_LIBRESSL),y)
+SYSLOG_NG_DEPENDENCIES += libressl
+endif
+
 # We override busybox's S01logging init script
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 SYSLOG_NG_DEPENDENCIES += busybox
-- 
2.13.0
