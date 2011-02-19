From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 19 Feb 2011 23:52:40 +0100
Subject: [Buildroot] [git commit master 1/1] libmicrohttpd: make https
	support optional
Message-ID: <20110219225351.52A1C8F5A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7ee387f43b8daa8e749472a9b1153941a44e688e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Libmicrohttpd works nicely without https support, so make it optional.
Also ensure the cross-libgcrypt-config is found, rather than whatever
is installed on the host.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libmicrohttpd/Config.in        |    8 +++++++-
 package/libmicrohttpd/libmicrohttpd.mk |    8 +++++++-
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/package/libmicrohttpd/Config.in b/package/libmicrohttpd/Config.in
index de656ad..cfedc8f 100644
--- a/package/libmicrohttpd/Config.in
+++ b/package/libmicrohttpd/Config.in
@@ -1,8 +1,14 @@
 config BR2_PACKAGE_LIBMICROHTTPD
 	bool "libmicrohttpd"
-	select BR2_PACKAGE_LIBGCRYPT
 	help
 	  GNU libmicrohttpd is a small C library that makes it easy to
 	  run an HTTP server as part of another application.
 
 	  http://www.gnu.org/software/libmicrohttpd/
+
+config BR2_PACKAGE_LIBMICROHTTPD_SSL
+       bool "https support"
+       depends on BR2_PACKAGE_LIBMICROHTTPD
+       select BR2_PACKAGE_LIBGCRYPT
+       help
+         Enable HTTPS (SSL) support.
diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index 8273d90..626c046 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -8,6 +8,12 @@ LIBMICROHTTPD_SOURCE:=libmicrohttpd-$(LIBMICROHTTPD_VERSION).tar.gz
 LIBMICROHTTPD_SITE:=$(BR2_GNU_MIRROR)/libmicrohttpd
 LIBMICROHTTPD_INSTALL_STAGING = YES
 
-LIBMICROHTTPD_DEPENDENCIES = libgcrypt
+ifeq ($(BR2_PACKAGE_LIBMICROHTTPD_SSL),y)
+LIBMICROHTTPD_DEPENDENCIES += libgcrypt
+LIBMICROHTTPD_CONF_OPT += --enable-https \
+			  --with-libgcrypt-prefix=$(STAGING_DIR)/usr
+else
+LIBMICROHTTPD_CONF_OPT += --disable-https
+endif
 
 $(eval $(call AUTOTARGETS,package,libmicrohttpd))
-- 
1.7.3.4
