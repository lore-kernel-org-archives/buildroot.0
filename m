From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 1 Nov 2019 08:03:51 +0100
Subject: [Buildroot] [git commit] package/rsyslog: bump to 8.1910.0
Message-ID: <20191101070350.AAEC78E44A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b406bef7c6b3ed56ad9f21d0ba9a4a4aca87e2b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The rsyslog project removed the ability to toggle libcurl dependencies in
https://github.com/rsyslog/rsyslog/commit/dc95ef09bdb07cfb7b7df4ce87df629fc2c94f8f,
however there are a series of options that now add a libcurl dependency.

This bump disables the following options to prevent libcurl as a new dependency.
	--disable-elasticsearch
        --disable-clickhouse
        --disable-omhttp
        --disable-fmhttp
        --disable-imdocker
        --disable-omhttpfs
        --disable-mmkubernetes

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rsyslog/rsyslog.hash |  2 +-
 package/rsyslog/rsyslog.mk   | 11 ++++++++++-
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/package/rsyslog/rsyslog.hash b/package/rsyslog/rsyslog.hash
index fb3a552b0b..a963b4e7bb 100644
--- a/package/rsyslog/rsyslog.hash
+++ b/package/rsyslog/rsyslog.hash
@@ -1,5 +1,5 @@
 # From http://www.rsyslog.com/downloads/download-v8-stable/
-sha256	06e2884181333dccecceaca82827ae24ca7a258b4fbf7b1e07a80d4caae640ca	rsyslog-8.22.0.tar.gz
+sha256	0219ee692f31a39743acb62aaf4196b644ce94edf386df4605fd6a11a4fe0c93	rsyslog-8.1910.0.tar.gz
 
 # Locally calculated
 sha256	054b3a047d9232376a46b87356b19b0c0c2924cb5e6911ab96a01fc4b515f083	COPYING
diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index fcd476cee3..5bd6b59ba3 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RSYSLOG_VERSION = 8.22.0
+RSYSLOG_VERSION = 8.1910.0
 RSYSLOG_SITE = http://rsyslog.com/files/download/rsyslog
 RSYSLOG_LICENSE = GPL-3.0, LGPL-3.0, Apache-2.0
 RSYSLOG_LICENSE_FILES = COPYING COPYING.LESSER COPYING.ASL20
@@ -17,6 +17,15 @@ RSYSLOG_PLUGINS = imdiag imfile impstats imptcp \
 RSYSLOG_CONF_OPTS = --disable-generate-man-pages \
 	$(foreach x,$(call qstrip,$(RSYSLOG_PLUGINS)),--enable-$(x))
 
+# Disable items requiring libcurl
+RSYSLOG_CONF_OPTS += --disable-elasticsearch \
+	--disable-clickhouse \
+	--disable-omhttp \
+	--disable-fmhttp \
+	--disable-imdocker \
+	--disable-omhttpfs \
+	--disable-mmkubernetes
+
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
 RSYSLOG_DEPENDENCIES += gnutls
 RSYSLOG_CONF_OPTS += --enable-gnutls
