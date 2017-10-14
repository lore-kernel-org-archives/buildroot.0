From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 14 Oct 2017 13:37:25 +0200
Subject: [Buildroot] [PATCH 1/4] package/x11r7/xlib_libXfont2: bump version
	to 2.0.2
Message-ID: <20171014113728.22890-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patches applied upstream, added all upstream hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...nd-of-string-in-PatternMatch-CVE-2017-137.patch | 34 --------------
 ...rties-Check-string-boundaries-CVE-2017-13.patch | 52 ----------------------
 package/x11r7/xlib_libXfont2/xlib_libXfont2.hash   |  7 ++-
 package/x11r7/xlib_libXfont2/xlib_libXfont2.mk     |  2 +-
 4 files changed, 6 insertions(+), 89 deletions(-)
 delete mode 100644 package/x11r7/xlib_libXfont2/0001-Check-for-end-of-string-in-PatternMatch-CVE-2017-137.patch
 delete mode 100644 package/x11r7/xlib_libXfont2/0002-pcfGetProperties-Check-string-boundaries-CVE-2017-13.patch

diff --git a/package/x11r7/xlib_libXfont2/0001-Check-for-end-of-string-in-PatternMatch-CVE-2017-137.patch b/package/x11r7/xlib_libXfont2/0001-Check-for-end-of-string-in-PatternMatch-CVE-2017-137.patch
deleted file mode 100644
index 3795179af1..0000000000
--- a/package/x11r7/xlib_libXfont2/0001-Check-for-end-of-string-in-PatternMatch-CVE-2017-137.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From d1e670a4a8704b8708e493ab6155589bcd570608 Mon Sep 17 00:00:00 2001
-From: Michal Srb <msrb@suse.com>
-Date: Thu, 20 Jul 2017 13:38:53 +0200
-Subject: [PATCH] Check for end of string in PatternMatch (CVE-2017-13720)
-
-If a pattern contains '?' character, any character in the string is skipped,
-even if it is '\0'. The rest of the matching then reads invalid memory.
-
-Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
-Signed-off-by: Julien Cristau <jcristau@debian.org>
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- src/fontfile/fontdir.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/src/fontfile/fontdir.c b/src/fontfile/fontdir.c
-index 4ce2473..996b7d1 100644
---- a/src/fontfile/fontdir.c
-+++ b/src/fontfile/fontdir.c
-@@ -400,8 +400,10 @@ PatternMatch(char *pat, int patdashes, char *string, int stringdashes)
- 		}
- 	    }
- 	case '?':
--	    if (*string++ == XK_minus)
-+	    if ((t = *string++) == XK_minus)
- 		stringdashes--;
-+	    if (!t)
-+		return 0;
- 	    break;
- 	case '\0':
- 	    return (*string == '\0');
--- 
-2.11.0
-
diff --git a/package/x11r7/xlib_libXfont2/0002-pcfGetProperties-Check-string-boundaries-CVE-2017-13.patch b/package/x11r7/xlib_libXfont2/0002-pcfGetProperties-Check-string-boundaries-CVE-2017-13.patch
deleted file mode 100644
index 709e446efe..0000000000
--- a/package/x11r7/xlib_libXfont2/0002-pcfGetProperties-Check-string-boundaries-CVE-2017-13.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 672bb944311392e2415b39c0d63b1e1902905bcd Mon Sep 17 00:00:00 2001
-From: Michal Srb <msrb@suse.com>
-Date: Thu, 20 Jul 2017 17:05:23 +0200
-Subject: [PATCH] pcfGetProperties: Check string boundaries (CVE-2017-13722)
-
-Without the checks a malformed PCF file can cause the library to make
-atom from random heap memory that was behind the `strings` buffer.
-This may crash the process or leak information.
-
-Signed-off-by: Julien Cristau <jcristau@debian.org>
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- src/bitmap/pcfread.c | 13 +++++++++++--
- 1 file changed, 11 insertions(+), 2 deletions(-)
-
-diff --git a/src/bitmap/pcfread.c b/src/bitmap/pcfread.c
-index dab1c44..ae34c28 100644
---- a/src/bitmap/pcfread.c
-+++ b/src/bitmap/pcfread.c
-@@ -45,6 +45,7 @@ from The Open Group.
- 
- #include <stdarg.h>
- #include <stdint.h>
-+#include <string.h>
- 
- void
- pcfError(const char* message, ...)
-@@ -311,11 +312,19 @@ pcfGetProperties(FontInfoPtr pFontInfo, FontFilePtr file,
-     if (IS_EOF(file)) goto Bail;
-     position += string_size;
-     for (i = 0; i < nprops; i++) {
-+	if (props[i].name >= string_size) {
-+	    pcfError("pcfGetProperties(): String starts out of bounds (%ld/%d)\n", props[i].name, string_size);
-+	    goto Bail;
-+	}
- 	props[i].name = MakeAtom(strings + props[i].name,
--				 strlen(strings + props[i].name), TRUE);
-+				 strnlen(strings + props[i].name, string_size - props[i].name), TRUE);
- 	if (isStringProp[i]) {
-+	    if (props[i].value >= string_size) {
-+		pcfError("pcfGetProperties(): String starts out of bounds (%ld/%d)\n", props[i].value, string_size);
-+		goto Bail;
-+	    }
- 	    props[i].value = MakeAtom(strings + props[i].value,
--				      strlen(strings + props[i].value), TRUE);
-+				      strnlen(strings + props[i].value, string_size - props[i].value), TRUE);
- 	}
-     }
-     free(strings);
--- 
-2.11.0
-
diff --git a/package/x11r7/xlib_libXfont2/xlib_libXfont2.hash b/package/x11r7/xlib_libXfont2/xlib_libXfont2.hash
index 81a3c9f1ea..3e763b268f 100644
--- a/package/x11r7/xlib_libXfont2/xlib_libXfont2.hash
+++ b/package/x11r7/xlib_libXfont2/xlib_libXfont2.hash
@@ -1,2 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2015-December/002663.html
-sha256 e9fbbb475ddd171b3a6a54b989cbade1f6f874fc35d505ebc5be426bc6e4db7e  libXfont2-2.0.1.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2017-October/002813.html
+md5 d39e6446e46f939486d1a8b856e8b67b  libXfont2-2.0.2.tar.bz2
+sha1 d5117914a026b3fd47123cb1c2a22daaae3b63e4  libXfont2-2.0.2.tar.bz2
+sha256 94088d3b87f7d42c7116d9adaad155859e93330c6e47f5989f2de600b9a6c111  libXfont2-2.0.2.tar.bz2
+sha512 d62b0c3d663a2c668796cca8c6c2a90f83feeae1253b7d946668d33502cd8099c963285b88db4f745efb0d4ff783c118eb3d84cb8e6e1724586e1ef2be23e593  libXfont2-2.0.2.tar.bz2
diff --git a/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk b/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
index fef1e68323..696c605a36 100644
--- a/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
+++ b/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXFONT2_VERSION = 2.0.1
+XLIB_LIBXFONT2_VERSION = 2.0.2
 XLIB_LIBXFONT2_SOURCE = libXfont2-$(XLIB_LIBXFONT2_VERSION).tar.bz2
 XLIB_LIBXFONT2_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXFONT2_LICENSE = MIT
-- 
2.11.0
