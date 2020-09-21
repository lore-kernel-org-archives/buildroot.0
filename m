From: David GOUARIN <dgouarin@gmail.com>
Date: Mon, 21 Sep 2020 18:58:34 +0200
Subject: [Buildroot] [PATCH 2/2] packages/rsyslog: add support for RELP
In-Reply-To: <20200921165834.7514-1-dgouarin@gmail.com>
References: <20200921165834.7514-1-dgouarin@gmail.com>
Message-ID: <20200921165834.7514-3-dgouarin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: David GOUARIN <dgouarin@gmail.com>
---
 package/rsyslog/Config.in  | 7 +++++++
 package/rsyslog/rsyslog.mk | 6 ++++++
 2 files changed, 13 insertions(+)

diff --git a/package/rsyslog/Config.in b/package/rsyslog/Config.in
index 8c024e69c7..286de804e3 100644
--- a/package/rsyslog/Config.in
+++ b/package/rsyslog/Config.in
@@ -17,6 +17,13 @@ config BR2_PACKAGE_RSYSLOG
 
 	  http://www.rsyslog.com
 
+config BR2_PACKAGE_RSYSLOG_RELP
+	bool "enable support for relp logging protocol"
+	depends on BR2_PACKAGE_RSYSLOG
+	select BR2_PACKAGE_LIBRELP
+	help
+	  Enable relp rsyslog plugin.
+
 comment "rsyslog needs a uClibc or glibc toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index 90f21559f8..0d95ee6f36 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -14,6 +14,12 @@ RSYSLOG_PLUGINS = imdiag imfile impstats imptcp \
 	mmanon mmaudit mmfields mmjsonparse mmpstrucdata mmsequence mmutf8fix \
 	mail omprog omruleset omstdout omuxsock \
 	pmaixforwardedfrom pmciscoios pmcisconames pmlastmsg pmsnare
+
+ifeq ($(BR2_PACKAGE_RSYSLOG_RELP),y)
+RSYSLOG_DEPENDENCIES += librelp
+RSYSLOG_PLUGINS += relp
+endif
+
 RSYSLOG_CONF_OPTS = --disable-generate-man-pages \
 	$(foreach x,$(call qstrip,$(RSYSLOG_PLUGINS)),--enable-$(x))
 
-- 
2.17.1
