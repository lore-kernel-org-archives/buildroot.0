From: James Knight <james.knight@rockwellcollins.com>
Date: Mon, 19 Dec 2016 19:05:15 -0500
Subject: [Buildroot] [PATCH 2/2] rsyslog: enable journal plugins when using
	systemd
In-Reply-To: <20161220000515.7996-1-james.knight@rockwellcollins.com>
References: <20161220000515.7996-1-james.knight@rockwellcollins.com>
Message-ID: <20161220000515.7996-2-james.knight@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The rsyslog package provides input and output plugins for journald which
are disabled by default. The following adds the option to include
`imjournal` and `omjournal` modules when building for a systemd target.

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
---
 package/rsyslog/rsyslog.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index 9e74e49..3254d99 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -66,8 +66,14 @@ endif
 
 ifeq ($(BR2_INIT_SYSTEMD),y)
 RSYSLOG_CONF_OPTS += \
+	--enable-imjournal \
+	--enable-omjournal \
 	--with-systemdsystemunitdir=/usr/lib/systemd/system
 RSYSLOG_DEPENDENCIES += systemd
+else
+RSYSLOG_CONF_OPTS += \
+	--disable-imjournal \
+	--disable-omjournal
 endif
 
 define RSYSLOG_INSTALL_INIT_SYSV
-- 
2.8.4.windows.1
