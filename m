From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 28 Jan 2020 23:21:40 +0100
Subject: [Buildroot] [PATCH/RFC 1/1] package/libiconv: enable extra encodings
Message-ID: <20200128222140.367045-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

The size of libiconv.so.2.6.0 grows from 941K to 1,1M.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libiconv/libiconv.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libiconv/libiconv.mk b/package/libiconv/libiconv.mk
index 9a8133612b..785b1cac6b 100644
--- a/package/libiconv/libiconv.mk
+++ b/package/libiconv/libiconv.mk
@@ -9,6 +9,7 @@ LIBICONV_SITE = $(BR2_GNU_MIRROR)/libiconv
 LIBICONV_INSTALL_STAGING = YES
 LIBICONV_LICENSE = GPL-3.0+ (iconv program), LGPL-2.0+ (library)
 LIBICONV_LICENSE_FILES = COPYING COPYING.LIB
+LIBICONV_CONF_OPTS = --enable-extra-encodings
 
 # Don't build the preloadable library, as we don't need it (it's only
 # for LD_PRELOAD to replace glibc's iconv, but we never build libiconv
-- 
2.20.1
