From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 16 May 2020 10:19:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/lrzip: security bump to
 8781292dd5833c04eeead51d4a5bd02dc6432dc7
Message-ID: <20200516081938.642974-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump to latest upstream commit as it fixes a huge number of CVEs. Some
of them can't be linked to a given commit (e.g.
https://github.com/ckolivas/lrzip/issues/67). Moreover, upstream does
not plan to tag a new release any time soon:
https://github.com/ckolivas/lrzip/issues/99

- Fix CVE-2017-8842: The bufRead::get() function in libzpaq/libzpaq.h in
  liblrzip.so in lrzip 0.631 allows remote attackers to cause a denial
  of service (divide-by-zero error and application crash) via a crafted
  archive.
- Fix CVE-2017-8843: The join_pthread function in stream.c in
  liblrzip.so in lrzip 0.631 allows remote attackers to cause a denial
  of service (NULL pointer dereference and application crash) via a
  crafted archive.
- Fix CVE-2017-8844: The read_1g function in stream.c in liblrzip.so in
  lrzip 0.631 allows remote attackers to cause a denial of service
  (heap-based buffer overflow and application crash) or possibly have
  unspecified other impact via a crafted archive.
- Fix CVE-2017-8845: The lzo1x_decompress function in lzo1x_d.ch in LZO
  2.08, as used in lrzip 0.631, allows remote attackers to cause a
  denial of service (invalid memory read and application crash) via a
  crafted archive.
- Fix CVE-2017-8846: The read_stream function in stream.c in
  liblrzip.so in lrzip 0.631 allows remote attackers to cause a denial
  of service (use-after-free and application crash) via a crafted
  archive.
- Fix CVE-2017-8847: The bufRead::get() function in libzpaq/libzpaq.h in
  liblrzip.so in lrzip 0.631 allows remote attackers to cause a denial
  of service (NULL pointer dereference and application crash) via a
  crafted archive.
- Fix CVE-2017-9928: In lrzip 0.631, a stack buffer overflow was found
  in the function get_fileinfo in lrzip.c:979, which allows attackers to
  cause a denial of service via a crafted file.
- Fix CVE-2017-9929: In lrzip 0.631, a stack buffer overflow was found
  in the function get_fileinfo in lrzip.c:1074, which allows attackers
  to cause a denial of service via a crafted file.
- Fix CVE-2018-5747: In Long Range Zip (aka lrzip) 0.631, there is a
  use-after-free in the ucompthread function (stream.c). Remote
  attackers could leverage this vulnerability to cause a denial of
  service via a crafted lrz file.
- Fix CVE-2018-11496: In Long Range Zip (aka lrzip) 0.631, there is a
  use-after-free in read_stream in stream.c, because decompress_file in
  lrzip.c lacks certain size validation.

Also:
 - update indentation of hash file (two spaces)
 - drop patch (already in version)
 - manage host-nasm dependency which is enabled by default and has been
   fixed by:
   https://github.com/ckolivas/lrzip/commit/9f16f65705e2f1e11c41647405adcce6a12d286c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lrzip/0001-missing-stdarg.patch | 26 -------------------------
 package/lrzip/lrzip.hash                |  4 ++--
 package/lrzip/lrzip.mk                  | 11 +++++++++--
 3 files changed, 11 insertions(+), 30 deletions(-)
 delete mode 100644 package/lrzip/0001-missing-stdarg.patch

diff --git a/package/lrzip/0001-missing-stdarg.patch b/package/lrzip/0001-missing-stdarg.patch
deleted file mode 100644
index 9ce0117a3c..0000000000
--- a/package/lrzip/0001-missing-stdarg.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 5ae1754025315d85fac11cb4eb2474789ee6475e Mon Sep 17 00:00:00 2001
-From: Sam Lancia <sam@gpsm.co.uk>
-Date: Sat, 7 Sep 2019 20:54:29 +0100
-Subject: [PATCH] Lrzip.h: add missing header for va_list on some platforms
-
-Signed-off-by: Sam Lancia <sam@gpsm.co.uk>
----
- Lrzip.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/Lrzip.h b/Lrzip.h
-index 29bc2a9..8934c59 100644
---- a/Lrzip.h
-+++ b/Lrzip.h
-@@ -20,6 +20,7 @@
- #ifndef LIBLRZIP_H
- #define LIBLRZIP_H
- 
-+#include <stdarg.h>
- #include <stdbool.h>
- #include <stdio.h>
- #ifdef _WIN32
--- 
-2.17.1
-
-
diff --git a/package/lrzip/lrzip.hash b/package/lrzip/lrzip.hash
index bdf63f0ed8..f3d5742620 100644
--- a/package/lrzip/lrzip.hash
+++ b/package/lrzip/lrzip.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 10315c20d5a47590e7220c210735ba169677824d5672509266682eccec84d952  lrzip-0.631.tar.gz
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  7f886b248c996ef9d327e0a8ede4eb7e067186185cad7b37084607098d35c75a  lrzip-8781292dd5833c04eeead51d4a5bd02dc6432dc7.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/lrzip/lrzip.mk b/package/lrzip/lrzip.mk
index 24edc847d3..32388b8e20 100644
--- a/package/lrzip/lrzip.mk
+++ b/package/lrzip/lrzip.mk
@@ -4,11 +4,18 @@
 #
 ################################################################################
 
-LRZIP_VERSION = 0.631
-LRZIP_SITE = $(call github,ckolivas,lrzip,v$(LRZIP_VERSION))
+LRZIP_VERSION = 8781292dd5833c04eeead51d4a5bd02dc6432dc7
+LRZIP_SITE = $(call github,ckolivas,lrzip,$(LRZIP_VERSION))
 LRZIP_AUTORECONF = YES
 LRZIP_LICENSE = GPL-2.0+
 LRZIP_LICENSE_FILES = COPYING
 LRZIP_DEPENDENCIES = zlib lzo bzip2
 
+ifeq ($(BR2_i386)$(BR2_x86_64),y)
+LRZIP_DEPENDENCIES += host-nasm
+LRZIP_CONF_OPTS += --enable-asm
+else
+LRZIP_CONF_OPTS += --disable-asm
+endif
+
 $(eval $(autotools-package))
-- 
2.26.2
