From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 15:02:12 +0100
Subject: [Buildroot] [git commit] package/syslog-ng: add optional support
	for libuuid from util-linux
Message-ID: <20160221140231.9421C7F936@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aacc651dce40f406f74c90d92dd798e4df812c91
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When libuuid was compiled before, syslog-ng will use it as optional
dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/lib/libsyslog-ng-3.7.so.0.0.0 | grep NEEDED | sort
[...]
 0x0000000000000001 (NEEDED)             Shared library: [libuuid.so.1]

The build system offers no option to en-/disable libuuid support:
https://github.com/balabit/syslog-ng/blob/master/configure.ac#L1291

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
