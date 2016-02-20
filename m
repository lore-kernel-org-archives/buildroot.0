From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Feb 2016 20:51:15 +0100
Subject: [Buildroot] [PATCH 1/3] package/syslog-ng: add optional support for
	libcap
Message-ID: <1455997877-9594-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When libcap was compiled before, syslog-ng will use it as optional
dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/sbin/syslog-ng | grep NEEDED | sort
 0x0000000000000001 (NEEDED)             Shared library: [libcap.so.2]
[...]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/syslog-ng/syslog-ng.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index 5f48a79..54593e4 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -20,6 +20,13 @@ ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 SYSLOG_NG_DEPENDENCIES += busybox
 endif
 
+ifeq ($(BR2_PACKAGE_LIBCAP),y)
+SYSLOG_NG_DEPENDENCIES += libcap
+SYSLOG_NG_CONF_OPTS += --enable-linux-caps
+else
+SYSLOG_NG_CONF_OPTS += --disable-linux-caps
+endif
+
 ifeq ($(BR2_PACKAGE_PYTHON),y)
 SYSLOG_NG_DEPENDENCIES += python
 SYSLOG_NG_CONF_OPTS += \
-- 
2.7.0
