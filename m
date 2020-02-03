From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 3 Feb 2020 17:36:55 +0100
Subject: [Buildroot] [git commit] package/libiconv: enable extra encodings
Message-ID: <20200203162630.5B1818897E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0d711a64d4753c0efa4158519907cca7ec284573
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Quoting https://www.gnu.org/software/libiconv/

"When configured with the option --enable-extra-encodings, it also
 provides support for a few extra encodings:

European languages
    CP{437,737,775,852,853,855,857,858,860,861,863,865,869,1125}
Semitic languages
    CP864
Japanese
    EUC-JISX0213, Shift_JISX0213, ISO-2022-JP-3
Chinese
    BIG5-2003 (experimental)
Turkmen
    TDS565
Platform specifics
    ATARIST, RISCOS-LATIN1"

Updating Kodi from version 17.6 to 18.5 caused runtime errors on systems
with locale support disabled, here Kodi uses libiconv but needs CP437:

ERROR: customConvert: iconv_open() for "CP437" -> "UTF-8" failed,
 errno = 22 (Invalid argument)

Due to the size increase of libiconv.so.2.6.0 from 941K to 1,1M a new
Config.in option was added.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[yann.morin.1998 at free.fr: fix check-package warning]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libiconv/Config.in   | 22 ++++++++++++++++++++++
 package/libiconv/libiconv.mk |  4 ++++
 2 files changed, 26 insertions(+)

diff --git a/package/libiconv/Config.in b/package/libiconv/Config.in
index ee4fd62011..c08a844b0f 100644
--- a/package/libiconv/Config.in
+++ b/package/libiconv/Config.in
@@ -5,3 +5,25 @@ config BR2_PACKAGE_LIBICONV
 	  unicode conversion library
 
 	  http://ftp.gnu.org/pub/gnu/libiconv
+
+if BR2_PACKAGE_LIBICONV
+
+config BR2_PACKAGE_LIBICONV_EXTRA_ENCODINGS
+	bool "extra encodings"
+	help
+	  Provide support for a few extra encodings:
+
+	  European languages
+	    CP{437,737,775,852,853,855,857,858,860,861,863,865,869,1125}
+	  Semitic languages
+	    CP864
+	  Japanese
+	    EUC-JISX0213, Shift_JISX0213, ISO-2022-JP-3
+	  Chinese
+	    BIG5-2003 (experimental)
+	  Turkmen
+	    TDS565
+	  Platform specifics
+	    ATARIST, RISCOS-LATIN1
+
+endif
diff --git a/package/libiconv/libiconv.mk b/package/libiconv/libiconv.mk
index 9a8133612b..ec79a5d735 100644
--- a/package/libiconv/libiconv.mk
+++ b/package/libiconv/libiconv.mk
@@ -10,6 +10,10 @@ LIBICONV_INSTALL_STAGING = YES
 LIBICONV_LICENSE = GPL-3.0+ (iconv program), LGPL-2.0+ (library)
 LIBICONV_LICENSE_FILES = COPYING COPYING.LIB
 
+ifeq ($(BR2_PACKAGE_LIBICONV_EXTRA_ENCODINGS),y)
+LIBICONV_CONF_OPTS = --enable-extra-encodings
+endif
+
 # Don't build the preloadable library, as we don't need it (it's only
 # for LD_PRELOAD to replace glibc's iconv, but we never build libiconv
 # when glibc is used). And it causes problems for static only builds.
