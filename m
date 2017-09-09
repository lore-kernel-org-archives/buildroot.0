From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  9 Sep 2017 23:39:08 +0200
Subject: [Buildroot] [PATCH 02/49 v2] package/asterisk: enable backtrace
	when available
In-Reply-To: <cover.1504993178.git.yann.morin.1998@free.fr>
References: <cover.1504993178.git.yann.morin.1998@free.fr>
Message-ID: <17231a88705fcf91d91826458d23d819ec63094c.1504993178.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

asterisk uses backtrace() from execinfo.h to print beuatiful backtraces
when it fails. But execinfo is only reliably available with glibc, while
it is optionbal in uClibc and completely missing in musl.

So, only enable backtrace support for glibc toolchains.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/asterisk/asterisk.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 21326ab046..82d69afe49 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -43,7 +43,6 @@ ASTERISK_CONF_OPTS = \
 	--disable-rpath \
 	--without-asound \
 	--without-bfd \
-	--without-execinfo \
 	--without-bluetooth \
 	--without-cap \
 	--without-cpg \
@@ -128,6 +127,12 @@ ASTERISK_CONF_OPTS += --without-avcodec
 ASTERISK_CONF_ENV = \
 	ac_cv_path_CONFIG_LIBXML2=$(STAGING_DIR)/usr/bin/xml2-config
 
+ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
+ASTERISK_CONF_OPTS += --with-execinfo
+else
+ASTERISK_CONF_OPTS += --without-execinfo
+endif
+
 ASTERISK_DIRS = \
 	ASTVARLIBDIR="/usr/lib/asterisk" \
 	ASTDATADIR="/usr/lib/asterisk" \
-- 
2.11.0
