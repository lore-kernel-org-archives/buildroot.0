From: Waldemar Brodkorb <wbx@openadk.org>
Date: Tue, 19 Jan 2016 23:45:51 +0100
Subject: [Buildroot] [PATCH] mpd: allow to enable/disable httpd output
Message-ID: <20160119224551.GA16917@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It might be useful to disable this plugin.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
While testing sparcv8 compile I tried to disable failing features
and plugins and this couldn't be disabled.
---
 package/mpd/Config.in |    5 +++++
 package/mpd/mpd.mk    |    6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 0b3bb72..be0843f 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -223,6 +223,11 @@ config BR2_PACKAGE_MPD_AO
 	help
 	  Enable libao output support.
 
+config BR2_PACKAGE_MPD_HTTPD_OUTPUT
+	bool "httpd output"
+	help
+	  Enable httpd output support.
+
 config BR2_PACKAGE_MPD_JACK2
 	bool "jack2"
 	depends on BR2_ARCH_HAS_ATOMICS
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index c794e82..7a265f4 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -92,6 +92,12 @@ else
 MPD_CONF_OPTS += --disable-flac
 endif
 
+ifeq ($(BR2_PACKAGE_MPD_HTTPD_OUTPUT),y)
+MPD_CONF_OPTS += --enable-httpd-output
+else
+MPD_CONF_OPTS += --disable-httpd-output
+endif
+
 ifeq ($(BR2_PACKAGE_MPD_JACK2),y)
 MPD_DEPENDENCIES += jack2
 MPD_CONF_OPTS += --enable-jack
-- 
1.7.10.4
