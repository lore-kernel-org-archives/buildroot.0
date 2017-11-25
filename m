From: Alexander Mukhin <alexander.i.mukhin@gmail.com>
Date: Sat, 25 Nov 2017 13:50:12 +0300
Subject: [Buildroot] [PATCH] hostapd: add support for Realtek driver
In-Reply-To: <20171124215828.47855fdd@windsurf.lan>
References: <20171124215828.47855fdd@windsurf.lan>
Message-ID: <20171125105012.1313-1-alexander.i.mukhin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since kernel drivers for Realtek wireless chips use non-standard
interfaces, upstream hostapd does not support them. One have to apply
an external patch for hostapd to work with these chips. See:
https://github.com/pritambaral/hostapd-rtl871xdrv

A configuration option is added to enable support for Realtek chips,
and it's turned off by default.

Signed-off-by: Alexander Mukhin <alexander.i.mukhin@gmail.com>
---
 DEVELOPERS                   | 3 +++
 package/hostapd/Config.in    | 5 +++++
 package/hostapd/hostapd.hash | 1 +
 package/hostapd/hostapd.mk   | 5 +++++
 4 files changed, 14 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7621f969a0..407641449f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -79,6 +79,9 @@ F:	package/putty/
 N:	Alexander Lukichev <alexander.lukichev@espotel.com>
 F:	package/openpgm/
 
+N:	Alexander Mukhin <alexander.i.mukhin@gmail.com>
+F:	package/hostapd/
+
 N:	Alexander Varnin <fenixk19@mail.ru>
 F:	package/liblog4c-localtime/
 
diff --git a/package/hostapd/Config.in b/package/hostapd/Config.in
index 1609d0df5d..40c7015e73 100644
--- a/package/hostapd/Config.in
+++ b/package/hostapd/Config.in
@@ -14,6 +14,11 @@ config BR2_PACKAGE_HOSTAPD
 
 if BR2_PACKAGE_HOSTAPD
 
+config BR2_PACKAGE_HOSTAPD_DRIVER_RTW
+	bool "Enable rtl871xdrv driver"
+	help
+	  Enable support for Realtek wireless chips.
+
 config BR2_PACKAGE_HOSTAPD_ACS
 	bool "Enable ACS"
 	default y
diff --git a/package/hostapd/hostapd.hash b/package/hostapd/hostapd.hash
index b20c89b184..84647a9c47 100644
--- a/package/hostapd/hostapd.hash
+++ b/package/hostapd/hostapd.hash
@@ -2,3 +2,4 @@
 sha256  01526b90c1d23bec4b0f052039cc4456c2fd19347b4d830d1d58a0a6aea7117d  hostapd-2.6.tar.gz
 sha256  529113cc81256c6178f3c1cf25dd8d3f33e6d770e4a180bd31c6ab7e4917f40b  rebased-v2.6-0001-hostapd-Avoid-key-reinstallation-in-FT-handshake.patch
 sha256  147c8abe07606905d16404fb2d2c8849796ca7c85ed8673c09bb50038bcdeb9e  rebased-v2.6-0005-Fix-PTK-rekeying-to-generate-a-new-ANonce.patch
+sha256  e204da659d0583c71af23cb9b55536fe99598ee26a44104344f456e4d17350c6  rtlxdrv.patch
diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index 3f94c8c4b7..0ed1631421 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -47,6 +47,11 @@ HOSTAPD_CONFIG_DISABLE += CONFIG_EAP_PWD
 HOSTAPD_CONFIG_EDITS += 's/\#\(CONFIG_TLS=\).*/\1internal/'
 endif
 
+ifeq ($(BR2_PACKAGE_HOSTAPD_DRIVER_RTW),y)
+HOSTAPD_PATCH += https://github.com/pritambaral/hostapd-rtl871xdrv/raw/master/rtlxdrv.patch
+HOSTAPD_CONFIG_SET += CONFIG_DRIVER_RTW
+endif
+
 ifeq ($(BR2_PACKAGE_HOSTAPD_ACS),y)
 HOSTAPD_CONFIG_ENABLE += CONFIG_ACS
 endif
-- 
2.11.0
