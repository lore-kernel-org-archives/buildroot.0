From: Alvaro G. M. <alvaro.gamez@hazent.com>
Date: Wed, 18 Jan 2017 12:22:49 +0100
Subject: [Buildroot] [PATCH] package/libcap: fix build with gperf >= 3.1
In-Reply-To: <20170117221723.10235-1-romain.naour@gmail.com>
References: <20170117221723.10235-1-romain.naour@gmail.com>
Message-ID: <20170118112249.uyk3bhcdzlt6ggcu@collins.gmr.ssr.upm.es>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jan 17, 2017 at 11:17:23PM +0100, Romain Naour wrote:
> I haven't checked how many packages are affected by this breakage...

rgrep host-gperf packages/ helps getting this useful list:

systemd webkitgtk libsvgtiny libcap x11r7/xcb-util eudev qt5 kodi

I've had the time to test only a few of these packages, I'll test the
remaining later on today as they are quite big and take a while to compile
on my machine.

* To be tested: systemd webkitgtk qt5 kodi

* Tested and needs patch: libcap, libsvgtiny, eudev

- libcap: compiles with Romain's patch

- libsvgtiny: needs patch:

diff -urN libsvgtiny-ea9d99fc8b231c22d06168135e181d61f4eb2f06.old/src/svgtiny_internal.h libsvgtiny-ea9d99fc8b231c22d06168135e181d61f4eb2f06/src/svgtiny_internal.h
--- libsvgtiny-ea9d99fc8b231c22d06168135e181d61f4eb2f06.old/src/svgtiny_internal.h	2011-03-21 23:07:10.000000000 +0100
+++ libsvgtiny-ea9d99fc8b231c22d06168135e181d61f4eb2f06/src/svgtiny_internal.h	2017-01-18 12:05:14.338053788 +0100
@@ -90,6 +90,6 @@
 /* colors.gperf */
 const struct svgtiny_named_color *
 		svgtiny_color_lookup(register const char *str,
-				register unsigned int len);
+				register size_t len);
 
 #endif


- eudev: needs patch too:

diff -urN eudev-3.2.1.orig/src/udev/udev-builtin-keyboard.c eudev-3.2.1/src/udev/udev-builtin-keyboard.c
--- eudev-3.2.1.orig/src/udev/udev-builtin-keyboard.c	2017-01-18 12:02:25.937207350 +0100
+++ eudev-3.2.1/src/udev/udev-builtin-keyboard.c	2017-01-18 12:02:42.149288589 +0100
@@ -28,7 +28,7 @@
 
 #include "udev.h"
 
-static const struct key *keyboard_lookup_key(const char *str, unsigned len);
+static const struct key *keyboard_lookup_key(const char *str, size_t len);
 #include "keyboard-keys-from-name.h"
 #include "keyboard-keys-to-name.h"
 

* Tested and doesn't need patch: x11r7/xcb-util

From xcb-util-0.3.9/{NEWS, ChangeLog}:
Do not rely anymore on gperf and m4 following removal of deprecated atoms.

I've grepped for gperf on xcb-util and the only references are those two and
it's built without issue, so I've already sent a patch to fix this obsolete
dependency.


Best regards

-- 
Alvaro G. M.
