From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 23 Jul 2017 15:36:19 +0200
Subject: [Buildroot] [PATCH 2/3] package/samba4: add optional dependency to
	dbus
In-Reply-To: <20170723133620.13487-1-bernd.kuhls@t-online.de>
References: <20170723133620.13487-1-bernd.kuhls@t-online.de>
Message-ID: <20170723133620.13487-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

samba4 picks up dbus as dependency if it was built before:

Checking for dbus                : yes
Checking for header dbus/dbus.h  : yes
Checking for library dbus-1      : yes

There is no configure option to control dbus support so we just make
sure dbus is built before samba4 to have reproducible builds.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/samba4/samba4.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index ccdd13e2f..ab3f67dc9 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -40,6 +40,10 @@ else
 SAMBA4_CONF_OPTS += --disable-cups
 endif
 
+ifeq ($(BR2_PACKAGE_DBUS),y)
+SAMBA4_DEPENDENCIES += dbus
+endif
+
 ifeq ($(BR2_PACKAGE_DBUS)$(BR2_PACKAGE_AVAHI_DAEMON),yy)
 SAMBA4_CONF_OPTS += --enable-avahi
 SAMBA4_DEPENDENCIES += avahi
-- 
2.11.0
