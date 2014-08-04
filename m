From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Aug 2014 09:43:42 +0200
Subject: [Buildroot] [git commit] libpcap: handle bluetooth explicitly
Message-ID: <20140804074404.4FC079D367@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=20cb1b90565abab87d950e7ed4d33cb2239c86dc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If bluez_utils is around then add it to dependencies so as to use it,
but if it's not (for instance bluez5_utils is around) then disable it
since the bluez5 API isn't compatible. Fixes:
http://autobuild.buildroot.net/results/6ca/6caeb7f41ac5e14dbee49f87511af3351f6013f1/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libpcap/libpcap.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index a8c056e..7cf731e 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -20,6 +20,13 @@ LIBPCAP_CFLAGS = $(TARGET_CFLAGS)
 LIBPCAP_CONF_OPT = --disable-yydebug --with-pcap=linux
 LIBPCAP_CONFIG_SCRIPTS = pcap-config
 
+# On purpose, not compatible with bluez5
+ifeq ($(BR2_PACKAGE_BLUEZ_UTILS),y)
+LIBPCAP_DEPENDENCIES += bluez_utils
+else
+LIBPCAP_CONF_OPT += --disable-bluetooth
+endif
+
 ifeq ($(BR2_PACKAGE_DBUS),y)
 LIBPCAP_CONF_OPT += --enable-dbus
 LIBPCAP_DEPENDENCIES += dbus
