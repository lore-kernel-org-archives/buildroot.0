From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 21 Apr 2017 15:00:27 +0200
Subject: [Buildroot] [PATCH v3 2/2] package/libpng: bump version to 1.6.29
In-Reply-To: <20170421130027.28379-1-bernd.kuhls@t-online.de>
References: <20170421130027.28379-1-bernd.kuhls@t-online.de>
Message-ID: <20170421130027.28379-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Refactored patch 0002, added support for Intel SSE2.

Changelog:
https://sourceforge.net/p/libpng/code/ci/b363e01e6b5e865e536db62ca4480f3a2d4690bd/#diff-2

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v3: removed "=yes" from -enable-intel-sse (Thomas)
v2: removed ppc-specific option due to problems while testing it:
    http://lists.busybox.net/pipermail/buildroot/2017-April/189971.html

 ...02-Don-t-append-prefix-to-symbol-names-in-version-script.patch | 5 ++++-
 package/libpng/libpng.hash                                        | 6 +++---
 package/libpng/libpng.mk                                          | 8 +++++++-
 3 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/package/libpng/0002-Don-t-append-prefix-to-symbol-names-in-version-script.patch b/package/libpng/0002-Don-t-append-prefix-to-symbol-names-in-version-script.patch
index 2a9bfd1e1..de772225b 100644
--- a/package/libpng/0002-Don-t-append-prefix-to-symbol-names-in-version-script.patch
+++ b/package/libpng/0002-Don-t-append-prefix-to-symbol-names-in-version-script.patch
@@ -15,6 +15,9 @@ Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 [Julien: update for 1.6.25]
 Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
 
+[Bernd: update for 1.6.29]
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 ---
  Makefile.am | 2 +-
@@ -44,7 +47,7 @@ index 4e67782..5f468d9 100644
  	-DPNGLIB_VERSION='@PNGLIB_VERSION@' \
 -	-DSYMBOL_PREFIX='$(SYMBOL_PREFIX)' -DPNG_NO_USE_READ_MACROS \
 +	-DSYMBOL_PREFIX='' -DPNG_NO_USE_READ_MACROS \
- 	-DPNG_BUILDING_SYMBOL_TABLE $(am__append_7)
+ 	-DPNG_BUILDING_SYMBOL_TABLE $(am__append_9)
  
  # EXT_LIST is a list of the possibly library directory extensions, this exists
 -- 
diff --git a/package/libpng/libpng.hash b/package/libpng/libpng.hash
index e5bd6ba03..279420a70 100644
--- a/package/libpng/libpng.hash
+++ b/package/libpng/libpng.hash
@@ -1,4 +1,4 @@
-# From http://sourceforge.net/projects/libpng/files/libpng16/1.6.28/
-sha1 ff4dceadb15e2c929ad26283118d56f66f4a6cff libpng-1.6.28.tar.xz
+# From http://sourceforge.net/projects/libpng/files/libpng16/1.6.29/
+sha1 7dbe6a5088b938545fc0857c507d4e0cf5d9023e  libpng-1.6.29.tar.xz
 # Locally computed:
-sha256 d8d3ec9de6b5db740fefac702c37ffcf96ae46cb17c18c1544635a3852f78f7a  libpng-1.6.28.tar.xz
+sha256 4245b684e8fe829ebb76186327bb37ce5a639938b219882b53d64bd3cfc5f239  libpng-1.6.29.tar.xz
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 7ae1dd59f..c82c4efff 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPNG_VERSION = 1.6.28
+LIBPNG_VERSION = 1.6.29
 LIBPNG_SERIES = 16
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
 LIBPNG_SITE = http://downloads.sourceforge.net/project/libpng/libpng${LIBPNG_SERIES}/$(LIBPNG_VERSION)
@@ -21,5 +21,11 @@ else
 LIBPNG_CONF_OPTS += --disable-arm-neon
 endif
 
+ifeq ($(BR2_X86_CPU_HAS_SSE2),y)
+LIBPNG_CONF_OPTS += --enable-intel-sse
+else
+LIBPNG_CONF_OPTS += --disable-intel-sse
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.11.0
