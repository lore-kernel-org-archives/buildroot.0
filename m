From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon,  4 Nov 2019 15:12:03 -0600
Subject: [Buildroot] [PATCH v2] packagersyslog: enable options when libcurl
 is enabled
Message-ID: <20191104211203.52912-1-matthew.weber@rockwellcollins.com>
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
Changes
v1 -> v2
[Thomas
 - Flipped libcurl conditional and name of this patchset to rsyslog
---
 package/rsyslog/rsyslog.mk | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index 5bd6b59ba3..d5a88b19d3 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -17,7 +17,16 @@ RSYSLOG_PLUGINS = imdiag imfile impstats imptcp \
 RSYSLOG_CONF_OPTS = --disable-generate-man-pages \
 	$(foreach x,$(call qstrip,$(RSYSLOG_PLUGINS)),--enable-$(x))
 
-# Disable items requiring libcurl
+ifeq ($(BR2_PACKAGE_LIBCURL),y)
+RSYSLOG_DEPENDENCIES += libcurl
+RSYSLOG_CONF_OPTS += --enable-elasticsearch \
+	--enable-clickhouse \
+	--enable-omhttp \
+	--enable-fmhttp \
+	--enable-imdocker \
+	--enable-omhttpfs \
+	--enable-mmkubernetes
+else
 RSYSLOG_CONF_OPTS += --disable-elasticsearch \
 	--disable-clickhouse \
 	--disable-omhttp \
@@ -25,6 +34,7 @@ RSYSLOG_CONF_OPTS += --disable-elasticsearch \
 	--disable-imdocker \
 	--disable-omhttpfs \
 	--disable-mmkubernetes
+endif
 
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
 RSYSLOG_DEPENDENCIES += gnutls
-- 
2.17.1
