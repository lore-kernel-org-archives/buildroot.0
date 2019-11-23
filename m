From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 23 Nov 2019 17:59:50 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/tinycbor: bump to version 0.5.3
Message-ID: <20191123165950.664680-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove patch (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...x-undefined-encode_half-in-json2cbor.patch | 44 -------------------
 package/tinycbor/tinycbor.hash                |  2 +-
 package/tinycbor/tinycbor.mk                  |  2 +-
 3 files changed, 2 insertions(+), 46 deletions(-)
 delete mode 100644 package/tinycbor/0001-fix-undefined-encode_half-in-json2cbor.patch

diff --git a/package/tinycbor/0001-fix-undefined-encode_half-in-json2cbor.patch b/package/tinycbor/0001-fix-undefined-encode_half-in-json2cbor.patch
deleted file mode 100644
index 0547758bd5..0000000000
--- a/package/tinycbor/0001-fix-undefined-encode_half-in-json2cbor.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 77325101e41c149507c071c64a8dc9a21bf469d6 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 20 Sep 2018 19:23:54 +0200
-Subject: [PATCH] fix undefined encode_half in json2cbor
-
-encode_half has been moved from compilersupport_p.h to cborinternal_p.h
-in commit bfc40dcf909f1998d7760c2bc0e1409979d3c8cb so include this file
-in json2cbor to avoid the following build failure:
-
-/home/buildroot/autobuild/run/instance-0/output/host/bin/microblazeel-linux-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I./src -std=gnu99 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os    -c -o tools/json2cbor/json2cbor.o tools/json2cbor/json2cbor.c
-tools/json2cbor/json2cbor.c: In function 'decode_json_with_metadata':
-tools/json2cbor/json2cbor.c:295:50: warning: implicit declaration of function 'encode_half' [-Wimplicit-function-declaration]
-                                          (half = encode_half(v), cbor_encode_half_float(encoder, &half));
-                                                  ^~~~~~~~~~~
-/home/buildroot/autobuild/run/instance-0/output/host/bin/microblazeel-linux-gcc -o bin/json2cbor  tools/json2cbor/json2cbor.o lib/libtinycbor.so -lcjson -lm
-tools/json2cbor/json2cbor.o: In function `decode_json_with_metadata':
-(.text+0xe54): undefined reference to `encode_half'
-collect2: error: ld returned 1 exit status
-Makefile:151: recipe for target 'bin/json2cbor' failed
-
-Fixes:
- - http://autobuild.buildroot.net/results/afd8d24f2a4e501264abff618cf421d4bd088ebf
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/intel/tinycbor/pull/139]
----
- tools/json2cbor/json2cbor.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/tools/json2cbor/json2cbor.c b/tools/json2cbor/json2cbor.c
-index 008a7de..c13a751 100644
---- a/tools/json2cbor/json2cbor.c
-+++ b/tools/json2cbor/json2cbor.c
-@@ -25,6 +25,7 @@
- #define _POSIX_C_SOURCE 200809L
- #define _GNU_SOURCE
- #include "cbor.h"
-+#include "cborinternal_p.h"
- #include "compilersupport_p.h"
- 
- #include <cjson/cJSON.h>
--- 
-2.17.1
-
diff --git a/package/tinycbor/tinycbor.hash b/package/tinycbor/tinycbor.hash
index 007eac6490..8ff706bb67 100644
--- a/package/tinycbor/tinycbor.hash
+++ b/package/tinycbor/tinycbor.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	dfa2a4550eb145a5f62ffff39e36accf2704987922c194e8e845124175c00441	tinycbor-0.5.2.tar.gz
+sha256	956eb4b670ea4969eaee67395b5bb6437b153960385b77357d6692e979d1b12d	tinycbor-0.5.3.tar.gz
 sha256	3c6ba0b5bfa7830505301ffb336a17b0748e0d61c4d34216e9dc98f10e40395e	LICENSE
diff --git a/package/tinycbor/tinycbor.mk b/package/tinycbor/tinycbor.mk
index 9506e0d89c..ef095ea67d 100644
--- a/package/tinycbor/tinycbor.mk
+++ b/package/tinycbor/tinycbor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TINYCBOR_VERSION = 0.5.2
+TINYCBOR_VERSION = 0.5.3
 TINYCBOR_SITE = $(call github,intel,tinycbor,v$(TINYCBOR_VERSION))
 TINYCBOR_LICENSE = MIT
 TINYCBOR_LICENSE_FILES = LICENSE
-- 
2.24.0
