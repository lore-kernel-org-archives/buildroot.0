From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Feb 2016 23:02:05 +0100
Subject: [Buildroot] [git commit] package/avahi: add optional support for
	libcap
Message-ID: <20160225220654.BE2388191F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=38d404b8cfa4b6df13225118e400b8c8684bf7e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When libcap was compiled before, avahi daemon will use it as optional
dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/sbin/avahi-daemon | grep NEEDED | sort
 0x0000000000000001 (NEEDED)             Shared library: [libavahi-common.so.3]
 0x0000000000000001 (NEEDED)             Shared library: [libavahi-core.so.7]
 0x0000000000000001 (NEEDED)             Shared library: [libcap.so.2]
[...]

The build system offers no option to en-/disable libcap support:
http://git.0pointer.net/avahi.git/tree/configure.ac#n382

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Thomas: make the test unconditionally, even if libcap is only used by
avahi-daemon for the moment.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/avahi/avahi.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 5d6e6a8..b7ad81d 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -115,6 +115,10 @@ else
 AVAHI_CONF_OPTS += --disable-libdaemon
 endif
 
+ifeq ($(BR2_PACKAGE_LIBCAP),y)
+AVAHI_DEPENDENCIES += libcap
+endif
+
 ifeq ($(BR2_PACKAGE_AVAHI_DAEMON),y)
 AVAHI_DEPENDENCIES += expat
 AVAHI_CONF_OPTS += --with-xml=expat
