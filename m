From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 21 Mar 2021 14:58:42 +0100
Subject: [Buildroot] [PATCH v3,
 1/1] package/rsyslog: enable options when libcurl is enabled
Message-ID: <20210321135842.1165539-1-fontaine.fabrice@gmail.com>
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
[Fabrice: Disable mmkubernetes which also depends on lognorm and while
at it also disable mmnormalize which is available since version 6.1.2
(from 2010) and
https://github.com/rsyslog/rsyslog/commit/b9d3cdceabf91bc28f8f6d31cfe9332724e37bbf]
Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v2 -> v3:
 - Disable mmnormalize and mmkubernetes

Changes v1 -> v2
[Thomas
 - Flipped libcurl conditional and name of this patchset to rsyslog

 package/rsyslog/rsyslog.mk | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index 99e80ae268..70adcd553b 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -24,14 +24,27 @@ endif
 RSYSLOG_CONF_OPTS = --disable-generate-man-pages \
 	$(foreach x,$(call qstrip,$(RSYSLOG_PLUGINS)),--enable-$(x))
 
-# Disable items requiring libcurl
+# Disable items requiring lognorm
+RSYSLOG_CONF_OPTS += \
+	--disable-mmkubernetes \
+	--disable-mmnormalize
+
+ifeq ($(BR2_PACKAGE_LIBCURL),y)
+RSYSLOG_DEPENDENCIES += libcurl
+RSYSLOG_CONF_OPTS += --enable-elasticsearch \
+	--enable-clickhouse \
+	--enable-omhttp \
+	--enable-fmhttp \
+	--enable-imdocker \
+	--enable-omhttpfs
+else
 RSYSLOG_CONF_OPTS += --disable-elasticsearch \
 	--disable-clickhouse \
 	--disable-omhttp \
 	--disable-fmhttp \
 	--disable-imdocker \
-	--disable-omhttpfs \
-	--disable-mmkubernetes
+	--disable-omhttpfs
+endif
 
 ifeq ($(BR2_PACKAGE_CIVETWEB_LIB),y)
 RSYSLOG_DEPENDENCIES += civetweb
-- 
2.30.1
