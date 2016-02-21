From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 15:01:47 +0100
Subject: [Buildroot] [git commit] package/syslog-ng: add optional support
	for libcap
Message-ID: <20160221140229.CCFA2817D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fee0703d8cf7ebc99cc8094425e10cb382731f4c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When libcap was compiled before, syslog-ng will use it as optional
dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/sbin/syslog-ng | grep NEEDED | sort
 0x0000000000000001 (NEEDED)             Shared library: [libcap.so.2]
[...]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
