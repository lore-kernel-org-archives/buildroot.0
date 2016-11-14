From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Mon, 14 Nov 2016 14:22:36 +0100
Subject: [Buildroot] [PATCH 4/6] ntp: fix missing optional dependencies
In-Reply-To: <20161114132238.6569-1-jezz@sysmic.org>
References: <20161114132238.6569-1-jezz@sysmic.org>
Message-ID: <20161114132238.6569-5-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ntpq and ntpdc may depends on libedit and libcap.

$ arm-linux-readelf -d ./usr/bin/ntpdc | grep NEEDED
 0x00000001 (NEEDED)                     Shared library: [libcap.so.2]
 0x00000001 (NEEDED)                     Shared library: [libm.so.6]
 0x00000001 (NEEDED)                     Shared library: [libedit.so.0]
 0x00000001 (NEEDED)                     Shared library: [libncursesw.so.6]
 0x00000001 (NEEDED)                     Shared library: [libssl.so.1.0.0]
 0x00000001 (NEEDED)                     Shared library: [libcrypto.so.1.0.0]
 0x00000001 (NEEDED)                     Shared library: [libpthread.so.0]
 0x00000001 (NEEDED)                     Shared library: [libc.so.6]

However, build order with these libraries is not defined.

In order to keep things simple, we enforce build order even if ntpq/ntpdc are
not selected.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/ntp/ntp.mk | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index 0b6304b..11061f4 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -28,6 +28,20 @@ else
 NTP_CONF_OPTS += --without-crypto --disable-openssl-random
 endif
 
+ifeq ($(BR2_PACKAGE_LIBCAP),y)
+NTP_CONF_OPTS += --enable-linuxcaps
+NTP_DEPENDENCIES += libcap
+else
+NTP_CONF_OPTS += --disable-linuxcaps
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEDIT),y)
+NTP_CONF_OPTS += --with-lineeditlibs=edit
+NTP_DEPENDENCIES += libedit
+else
+NTP_CONF_OPTS += --with-lineeditlibs=""
+endif
+
 ifeq ($(BR2_PACKAGE_NTP_NTPSNMPD),y)
 NTP_CONF_OPTS += \
 	--with-net-snmp-config=$(STAGING_DIR)/usr/bin/net-snmp-config
-- 
2.9.3
