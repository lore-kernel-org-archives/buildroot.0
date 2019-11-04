From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon,  4 Nov 2019 14:30:52 -0600
Subject: [Buildroot] [PATCH] package/libcurl: enable options when libcurl is
 enabled
Message-ID: <20191104203052.52584-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Following the bump to 8.1910.0, items requiring libcurl were
disabled by default. This patch selectively enables options
which depend on libcurl when that package is enabled in the
build.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/rsyslog/rsyslog.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index 5bd6b59ba3..e3a634a868 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -17,7 +17,7 @@ RSYSLOG_PLUGINS = imdiag imfile impstats imptcp \
 RSYSLOG_CONF_OPTS = --disable-generate-man-pages \
 	$(foreach x,$(call qstrip,$(RSYSLOG_PLUGINS)),--enable-$(x))
 
-# Disable items requiring libcurl
+ifeq ($(BR2_PACKAGE_LIBCURL),)
 RSYSLOG_CONF_OPTS += --disable-elasticsearch \
 	--disable-clickhouse \
 	--disable-omhttp \
@@ -25,6 +25,9 @@ RSYSLOG_CONF_OPTS += --disable-elasticsearch \
 	--disable-imdocker \
 	--disable-omhttpfs \
 	--disable-mmkubernetes
+else
+RSYSLOG_DEPENDENCIES += libcurl
+endif
 
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
 RSYSLOG_DEPENDENCIES += gnutls
-- 
2.17.1
