From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Dec 2017 21:57:39 +0100
Subject: [Buildroot] [git commit branch/2017.02.x]
 package/x11r7/xlib_libXfont: bump version to 1.5.3
Message-ID: <20171220210025.08BC0835D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a275c43241fb33ed4cf45c3d0df0f359d9ccaf2c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Added all hashes provided by upstream.

Removed patches applied upstream:
https://cgit.freedesktop.org/xorg/lib/libXfont/commit/?h=libXfont-1.5-branch&id=a2a5fa591762b430037e33f1df55b460550ab406
https://cgit.freedesktop.org/xorg/lib/libXfont/commit/?h=libXfont-1.5-branch&id=3b08934dca75e4c559db7d83797bc3d365c2a50a

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 80dc50e71695c62bae72840ebaf0ab8ab568b411)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...nd-of-string-in-PatternMatch-CVE-2017-137.patch | 34 --------------
 ...rties-Check-string-boundaries-CVE-2017-13.patch | 52 ----------------------
 package/x11r7/xlib_libXfont/xlib_libXfont.hash     |  7 ++-
 package/x11r7/xlib_libXfont/xlib_libXfont.mk       |  2 +-
 4 files changed, 6 insertions(+), 89 deletions(-)

diff --git a/package/x11r7/xlib_libXfont/0001-Check-for-end-of-string-in-PatternMatch-CVE-2017-137.patch b/package/x11r7/xlib_libXfont/0001-Check-for-end-of-string-in-PatternMatch-CVE-2017-137.patch
deleted file mode 100644
index 3795179..0000000
--- a/package/x11r7/xlib_libXfont/0001-Check-for-end-of-string-in-PatternMatch-CVE-2017-137.patch
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
diff --git a/package/x11r7/xlib_libXfont/0002-pcfGetProperties-Check-string-boundaries-CVE-2017-13.patch b/package/x11r7/xlib_libXfont/0002-pcfGetProperties-Check-string-boundaries-CVE-2017-13.patch
deleted file mode 100644
index 709e446..0000000
--- a/package/x11r7/xlib_libXfont/0002-pcfGetProperties-Check-string-boundaries-CVE-2017-13.patch
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
diff --git a/package/x11r7/xlib_libXfont/xlib_libXfont.hash b/package/x11r7/xlib_libXfont/xlib_libXfont.hash
index 6db8339..78700d3 100644
--- a/package/x11r7/xlib_libXfont/xlib_libXfont.hash
+++ b/package/x11r7/xlib_libXfont/xlib_libXfont.hash
@@ -1,2 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2016-August/002702.html
-sha256 02945ea68da447102f3e6c2b896c1d2061fd115de99404facc2aca3ad7010d71  libXfont-1.5.2.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2017-October/002816.html
+md5 9ba75bf38ba62a6ad52550ab716da9b3  libXfont-1.5.3.tar.bz2
+sha1 628b8ca2207f09324b8926084318a2fa2edb16d1  libXfont-1.5.3.tar.bz2
+sha256 ab85c10fd2683481dfef672a77fe60e6a2039558cbc0e9bf56b5e1df471c93d0  libXfont-1.5.3.tar.bz2
+sha512 e7c8a09c4d174129e5d550194d3c3dc2b4abf797e52fe588c6002920727c52cf33b7db8d07fc69c2987e766d3af2d6ddda72f0c70eb21b135c691c97656a81b4  libXfont-1.5.3.tar.bz2
diff --git a/package/x11r7/xlib_libXfont/xlib_libXfont.mk b/package/x11r7/xlib_libXfont/xlib_libXfont.mk
index 422c01d..13e3b21 100644
--- a/package/x11r7/xlib_libXfont/xlib_libXfont.mk
+++ b/package/x11r7/xlib_libXfont/xlib_libXfont.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXFONT_VERSION = 1.5.2
+XLIB_LIBXFONT_VERSION = 1.5.3
 XLIB_LIBXFONT_SOURCE = libXfont-$(XLIB_LIBXFONT_VERSION).tar.bz2
 XLIB_LIBXFONT_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXFONT_LICENSE = MIT
