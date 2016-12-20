From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Dec 2016 10:10:05 +0100
Subject: [Buildroot] [git commit] rsyslog: enable journal plugins when using
	systemd
Message-ID: <20161220091252.3651E80AD5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a5ba775ec5c92bd0ac1c2c25e0afad983951cc49
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The rsyslog package provides input and output plugins for journald which
are disabled by default. The following adds the option to include
`imjournal` and `omjournal` modules when building for a systemd target.

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
