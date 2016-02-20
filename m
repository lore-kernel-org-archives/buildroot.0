From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Feb 2016 20:51:16 +0100
Subject: [Buildroot] [PATCH 2/3] package/syslog-ng: add optional support for
	libuuid from util-linux
In-Reply-To: <1455997877-9594-1-git-send-email-bernd.kuhls@t-online.de>
References: <1455997877-9594-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1455997877-9594-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When libuuid was compiled before, syslog-ng will use it as optional
dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/lib/libsyslog-ng-3.7.so.0.0.0 | grep NEEDED | sort
[...]
 0x0000000000000001 (NEEDED)             Shared library: [libuuid.so.1]

The build system offers no option to en-/disable libuuid support:
https://github.com/balabit/syslog-ng/blob/master/configure.ac#L1291

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/syslog-ng/syslog-ng.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index 54593e4..f11d895 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -58,6 +58,10 @@ else
 SYSLOG_NG_CONF_OPTS += --disable-json
 endif
 
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
+SYSLOG_NG_DEPENDENCIES += util-linux
+endif
+
 ifeq ($(BR2_INIT_SYSTEMD),y)
 SYSLOG_NG_DEPENDENCIES += systemd
 SYSLOG_NG_CONF_OPTS += \
-- 
2.7.0
