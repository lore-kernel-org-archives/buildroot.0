From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 12 Oct 2015 21:21:03 +0200
Subject: [Buildroot] [PATCH 2/2] package/dbus: Add optional dependency to
	xlib_libSM
In-Reply-To: <1444677663-28725-1-git-send-email-bernd.kuhls@t-online.de>
References: <1444677663-28725-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1444677663-28725-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To detect X11 support dbus uses the autoconf macro AC_PATH_XTRA
http://cgit.freedesktop.org/dbus/dbus/tree/configure.ac#n1264

This macro checks for the optional presence of libICE:
http://git.savannah.gnu.org/gitweb/?p=autoconf.git;a=blob;f=lib/autoconf/libs.m4;h=d2040d731f81fc1693e01d118c45d51ad169d56a;hb=HEAD#l472

quoting dbus configure with libICE not present:
checking for IceConnectionNumber in -lICE... no

quoting dbus configure with libICE being present:
checking for IceConnectionNumber in -lICE... yes

The binary usr/bin/dbus-launch is being linked to libICE and libSM if
the packages are available:

$ output/host/usr/bin/i586-buildroot-linux-uclibc-readelf -a
  output/target/usr/bin/dbus-launch | grep NEEDED
 0x00000001 (NEEDED)                     Shared library: [libdbus-1.so.3]
 0x00000001 (NEEDED)                     Shared library: [libSM.so.6]
 0x00000001 (NEEDED)                     Shared library: [libICE.so.6]
 0x00000001 (NEEDED)                     Shared library: [libX11.so.6]
 0x00000001 (NEEDED)                     Shared library: [libc.so.1]

To get a reproducable build add libSM as optional dependency to dbus,
libSM pulls in the dependency to libICE.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/dbus/dbus.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 84fbdfa..139a5d7 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -60,6 +60,9 @@ endif
 ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
 DBUS_CONF_OPTS += --with-x
 DBUS_DEPENDENCIES += xlib_libX11
+ifeq ($(BR2_PACKAGE_XLIB_LIBSM),y)
+DBUS_DEPENDENCIES += xlib_libSM
+endif
 else
 DBUS_CONF_OPTS += --without-x
 endif
-- 
2.6.1
