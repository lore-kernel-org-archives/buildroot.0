From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon,  7 Mar 2016 22:56:45 +0100
Subject: [Buildroot] [PATCH 2/2] libpjsip: fix optional dependency on libsrtp
In-Reply-To: <1457387805-4084-1-git-send-email-luca@lucaceresoli.net>
References: <1457387805-4084-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1457387805-4084-2-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libpjsip does not correctly detect whether libsrtp is installed in staging.

Symptom:
  .../libpjmedia.so: undefined reference to `srtp_deinit'
  collect2: error: ld returned 1 exit status

Fixes:
  http://autobuild.buildroot.org/results/305/305fdc8442cd2e8f51b90485be0dca83ffa36603/
  http://autobuild.buildroot.org/results/a2f/a2f407c1361ac5c24af122445e84645e9aee309d/
  ...and other similar failures.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/libpjsip/libpjsip.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index ee250f5b11ef..9316dd7998e6 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -31,6 +31,11 @@ else
 LIBPJSIP_CONF_OPTS += --disable-ssl
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSRTP),y)
+LIBPJSIP_DEPENDENCIES += libsrtp
+LIBPJSIP_CONF_OPTS += --with-external-srtp=$(STAGING_DIR)/usr
+endif
+
 ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
 LIBPJSIP_DEPENDENCIES += util-linux
 endif
-- 
1.9.1
