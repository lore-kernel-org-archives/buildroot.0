From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Nov 2016 22:45:35 +0100
Subject: [Buildroot] [git commit] ntp: fix missing optional dependencies
Message-ID: <20161128214557.C1E6581D5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=008ab8d590e59b34bb5d0eebd48bd97e1a553dd0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
[Thomas: use --without-lineeditlibs.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ntp/ntp.mk | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index 0b6304b..7f9e0d6 100644
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
+NTP_CONF_OPTS += --without-lineeditlibs
+endif
+
 ifeq ($(BR2_PACKAGE_NTP_NTPSNMPD),y)
 NTP_CONF_OPTS += \
 	--with-net-snmp-config=$(STAGING_DIR)/usr/bin/net-snmp-config
