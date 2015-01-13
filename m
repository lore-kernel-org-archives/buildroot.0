From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 13 Jan 2015 20:17:02 -0300
Subject: [Buildroot] [PATCH 7/7] rsyslog: enable more basic features
In-Reply-To: <1421191022-5509-1-git-send-email-gustavo@zacarias.com.ar>
References: <1421191022-5509-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1421191022-5509-7-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enable all of the basic modules that don't require any dependencies.
Reasoning is simple, if someone wants rsyslog over a smaller busybox
logger or sysklogd it's probably looking for features.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/rsyslog/rsyslog.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index fb5249c..f0e8a63 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -10,7 +10,12 @@ RSYSLOG_LICENSE = GPLv3 LGPLv3 Apache-2.0
 RSYSLOG_LICENSE_FILES = COPYING COPYING.LESSER COPYING.ASL20
 RSYSLOG_DEPENDENCIES = zlib libestr liblogging json-c host-pkgconf
 RSYSLOG_CONF_ENV = ac_cv_prog_cc_c99='-std=c99'
-RSYSLOG_CONF_OPTS = --disable-generate-man-pages
+RSYSLOG_PLUGINS = imdiag imfile impstats imptcp \
+	mmanon mmaudit mmfields mmjsonparse mmpstrucdata mmsequence mmutf8fix \
+	mail omprog omruleset omstdout omuxsock \
+	pmaixforwardedfrom pmciscoios pmcisconames pmlastmsg pmsnare
+RSYSLOG_CONF_OPTS = --disable-generate-man-pages \
+		$(foreach x,$(call qstrip,$(RSYSLOG_PLUGINS)),--enable-$(x))
 
 # Build after BusyBox
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-- 
2.0.5
