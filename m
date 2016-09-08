From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Sep 2016 21:56:52 +0200
Subject: [Buildroot] [git commit] syslog-ng: add optional support for libnet
	build
Message-ID: <20160908195815.2D0B482262@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=84a24e736250914ca51e8590de6cf5c6b666bfdb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If libnet is included pass --enable-spoof-source to configure otherwise
pass --disable-spoof-source. This stops syslog-ng's configure from
enabling address spoofing based on the build host having libnet
installed.

Fixes:

  http://autobuild.buildroot.net/results/71c733e4a7275f3a1b79cd19065d94e77af0309b
  http://autobuild.buildroot.net/results/d16ba0b9ef75d5a676a26db788be31556b69772a
  http://autobuild.buildroot.net/results/9659d1db1a128b269459fd9b8be797a9efbd35af

Signed-off-by: Chris Packham <judge.packham@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/syslog-ng/syslog-ng.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index c11d3bd..7e4d407 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -69,6 +69,13 @@ ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
 SYSLOG_NG_DEPENDENCIES += util-linux
 endif
 
+ifeq ($(BR2_PACKAGE_LIBNET),y)
+SYSLOG_NG_DEPENDENCIES += libnet
+SYSLOG_NG_CONF_OPTS += --enable-spoof-source
+else
+SYSLOG_NG_CONF_OPTS += --disable-spoof-source
+endif
+
 ifeq ($(BR2_INIT_SYSTEMD),y)
 SYSLOG_NG_DEPENDENCIES += systemd
 SYSLOG_NG_CONF_OPTS += \
