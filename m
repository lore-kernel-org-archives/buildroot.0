From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 15:02:20 +0100
Subject: [Buildroot] [git commit] package/syslog-ng: add optional support
	for geoip
Message-ID: <20160221140236.E199A7FC59@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1811fd8cb1c681d1ff59dacb1c65992190ef926e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When geoip was compiled before, syslog-ng will use it as optional
dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/lib/syslog-ng/libgeoip-plugin.so | grep NEEDED | sort
 0x0000000000000001 (NEEDED)             Shared library: [ld64-uClibc.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libGeoIP.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libpthread.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [librt.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libsyslog-ng-3.7.so.0]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/syslog-ng/syslog-ng.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index f11d895..1acaad8 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -20,6 +20,13 @@ ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 SYSLOG_NG_DEPENDENCIES += busybox
 endif
 
+ifeq ($(BR2_PACKAGE_GEOIP),y)
+SYSLOG_NG_DEPENDENCIES += geoip
+SYSLOG_NG_CONF_OPTS += --enable-geoip
+else
+SYSLOG_NG_CONF_OPTS += --disable-geoip
+endif
+
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
 SYSLOG_NG_DEPENDENCIES += libcap
 SYSLOG_NG_CONF_OPTS += --enable-linux-caps
