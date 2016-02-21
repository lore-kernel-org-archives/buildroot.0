From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 Feb 2016 15:48:44 +0100
Subject: [Buildroot] [PATCH 6/7] package/avahi: add optional support for
	libcap
In-Reply-To: <1456066125-28379-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456066125-28379-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1456066125-28379-6-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When libcap was compiled before, avahi will use it as optional
dependency:

$ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/sbin/avahi-daemon | grep NEEDED | sort
 0x0000000000000001 (NEEDED)             Shared library: [libavahi-common.so.3]
 0x0000000000000001 (NEEDED)             Shared library: [libavahi-core.so.7]
 0x0000000000000001 (NEEDED)             Shared library: [libcap.so.2]
[...]

The build system offers no option to en-/disable libcap support:
http://git.0pointer.net/avahi.git/tree/configure.ac#n382

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/avahi/avahi.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 5d6e6a8..ce89e42 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -117,6 +117,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_AVAHI_DAEMON),y)
 AVAHI_DEPENDENCIES += expat
+ifeq ($(BR2_PACKAGE_LIBCAP),y)
+AVAHI_DEPENDENCIES += libcap
+endif
 AVAHI_CONF_OPTS += --with-xml=expat
 else
 AVAHI_CONF_OPTS += --with-xml=none
-- 
2.7.0
