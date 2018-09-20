From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Sep 2018 23:57:08 +0200
Subject: [Buildroot] [git commit] tinycbor: fix undefined encode_half in
 json2cbor
Message-ID: <20180920220103.2FB2B88819@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c6dd0a5935a75d70ecabec41398643f3ea8ff89b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

encode_half has been moved from compilersupport_p.h to cborinternal_p.h
in commit
https://github.com/intel/tinycbor/commit/bfc40dcf909f1998d7760c2bc0e1409979d3c8cb
so include this file in json2cbor to avoid the following build failure
on tinycbor 0.5.2:

/home/buildroot/autobuild/run/instance-0/output/host/bin/microblazeel-linux-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I./src -std=gnu99 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os    -c -o tools/json2cbor/json2cbor.o tools/json2cbor/json2cbor.c
tools/json2cbor/json2cbor.c: In function 'decode_json_with_metadata':
tools/json2cbor/json2cbor.c:295:50: warning: implicit declaration of function 'encode_half' [-Wimplicit-function-declaration]
                                          (half = encode_half(v), cbor_encode_half_float(encoder, &half));
                                                  ^~~~~~~~~~~
/home/buildroot/autobuild/run/instance-0/output/host/bin/microblazeel-linux-gcc -o bin/json2cbor  tools/json2cbor/json2cbor.o lib/libtinycbor.so -lcjson -lm
tools/json2cbor/json2cbor.o: In function `decode_json_with_metadata':
(.text+0xe54): undefined reference to `encode_half'
collect2: error: ld returned 1 exit status
Makefile:151: recipe for target 'bin/json2cbor' failed

Fixes:
 - http://autobuild.buildroot.net/results/afd8d24f2a4e501264abff618cf421d4bd088ebf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...01-fix-undefined-encode_half-in-json2cbor.patch | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/package/tinycbor/0001-fix-undefined-encode_half-in-json2cbor.patch b/package/tinycbor/0001-fix-undefined-encode_half-in-json2cbor.patch
new file mode 100644
index 0000000000..0547758bd5
--- /dev/null
+++ b/package/tinycbor/0001-fix-undefined-encode_half-in-json2cbor.patch
@@ -0,0 +1,44 @@
+From 77325101e41c149507c071c64a8dc9a21bf469d6 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 20 Sep 2018 19:23:54 +0200
+Subject: [PATCH] fix undefined encode_half in json2cbor
+
+encode_half has been moved from compilersupport_p.h to cborinternal_p.h
+in commit bfc40dcf909f1998d7760c2bc0e1409979d3c8cb so include this file
+in json2cbor to avoid the following build failure:
+
+/home/buildroot/autobuild/run/instance-0/output/host/bin/microblazeel-linux-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I./src -std=gnu99 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os    -c -o tools/json2cbor/json2cbor.o tools/json2cbor/json2cbor.c
+tools/json2cbor/json2cbor.c: In function 'decode_json_with_metadata':
+tools/json2cbor/json2cbor.c:295:50: warning: implicit declaration of function 'encode_half' [-Wimplicit-function-declaration]
+                                          (half = encode_half(v), cbor_encode_half_float(encoder, &half));
+                                                  ^~~~~~~~~~~
+/home/buildroot/autobuild/run/instance-0/output/host/bin/microblazeel-linux-gcc -o bin/json2cbor  tools/json2cbor/json2cbor.o lib/libtinycbor.so -lcjson -lm
+tools/json2cbor/json2cbor.o: In function `decode_json_with_metadata':
+(.text+0xe54): undefined reference to `encode_half'
+collect2: error: ld returned 1 exit status
+Makefile:151: recipe for target 'bin/json2cbor' failed
+
+Fixes:
+ - http://autobuild.buildroot.net/results/afd8d24f2a4e501264abff618cf421d4bd088ebf
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/intel/tinycbor/pull/139]
+---
+ tools/json2cbor/json2cbor.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tools/json2cbor/json2cbor.c b/tools/json2cbor/json2cbor.c
+index 008a7de..c13a751 100644
+--- a/tools/json2cbor/json2cbor.c
++++ b/tools/json2cbor/json2cbor.c
+@@ -25,6 +25,7 @@
+ #define _POSIX_C_SOURCE 200809L
+ #define _GNU_SOURCE
+ #include "cbor.h"
++#include "cborinternal_p.h"
+ #include "compilersupport_p.h"
+ 
+ #include <cjson/cJSON.h>
+-- 
+2.17.1
+
