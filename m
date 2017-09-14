From: Alexander Mukhin <alexander.i.mukhin@gmail.com>
Date: Thu, 14 Sep 2017 14:08:11 +0300
Subject: [Buildroot] [PATCH] hostapd: add support for Realtek driver
In-Reply-To: <874C29DC-F92F-46E8-9323-EF25658D8834@gmail.com>
References: <874C29DC-F92F-46E8-9323-EF25658D8834@gmail.com>
Message-ID: <20170914110811.1670-1-alexander.i.mukhin@gmail.com>
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
index 21eafc9d2..57fc74c25 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -68,6 +68,9 @@ F:	package/putty/
 N:	Alexander Lukichev <alexander.lukichev@espotel.com>
 F:	package/openpgm/
 
+N:	Alexander Mukhin <alexander.i.mukhin@gmail.com>
+F:	package/hostapd/
+
 N:	Alexander Varnin <fenixk19@mail.ru>
 F:	package/liblog4c-localtime/
 
diff --git a/package/hostapd/Config.in b/package/hostapd/Config.in
index 62fbb66d6..cec2a123e 100644
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
index fb891476b..83bfd0e7e 100644
--- a/package/hostapd/hostapd.hash
+++ b/package/hostapd/hostapd.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256  01526b90c1d23bec4b0f052039cc4456c2fd19347b4d830d1d58a0a6aea7117d  hostapd-2.6.tar.gz
+sha256  e204da659d0583c71af23cb9b55536fe99598ee26a44104344f456e4d17350c6  rtlxdrv.patch
diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index dc28d1323..40e28ee67 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -44,6 +44,11 @@ HOSTAPD_CONFIG_DISABLE += CONFIG_EAP_PWD
 HOSTAPD_CONFIG_EDITS += 's/\#\(CONFIG_TLS=\).*/\1internal/'
 endif
 
+ifeq ($(BR2_PACKAGE_HOSTAPD_DRIVER_RTW),y)
+HOSTAPD_PATCH = https://github.com/pritambaral/hostapd-rtl871xdrv/raw/master/rtlxdrv.patch
+HOSTAPD_CONFIG_SET += CONFIG_DRIVER_RTW
+endif
+
 ifeq ($(BR2_PACKAGE_HOSTAPD_ACS),y)
 HOSTAPD_CONFIG_ENABLE += CONFIG_ACS
 endif
-- 
2.11.0
