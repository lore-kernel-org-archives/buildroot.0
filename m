From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Thu, 27 Sep 2018 12:15:44 +0200
Subject: [Buildroot] [PATCH] chrony: fix build failure due to missing
 inclusion of util.h
Message-ID: <20180927101544.9495-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

During build package stops with linker error:
hash_intmd5.o: In function `HSH_Hash':
hash_intmd5.c:(.text+0x963): undefined reference to `MIN'

This is due to missing util.h inclusion.
util.h contains MIN() macro definition.

Add upstream patch:
https://git.tuxfamily.org/chrony/chrony.git/commit/?id=948ecf84314f78da82e0e2b07b6570ca9cff86c8
to add #include "util.h" in hash_intmd5.c

Fixes:
http://autobuild.buildroot.net/results/8f0/8f0d53b1d5a899e56540c859b908cbc1eaa223d5/
http://autobuild.buildroot.net/results/3c6/3c609f94aff182c9ab47ef8ec4b9de03a4d20ffb/
http://autobuild.buildroot.net/results/f1f/f1fcae399fb640c19cf88c9333a92cbfab547932/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 ...02-hash-include-util.h-for-MIN-macro.patch | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/chrony/0002-hash-include-util.h-for-MIN-macro.patch

diff --git a/package/chrony/0002-hash-include-util.h-for-MIN-macro.patch b/package/chrony/0002-hash-include-util.h-for-MIN-macro.patch
new file mode 100644
index 0000000000..1fd5bd9984
--- /dev/null
+++ b/package/chrony/0002-hash-include-util.h-for-MIN-macro.patch
@@ -0,0 +1,28 @@
+From 948ecf84314f78da82e0e2b07b6570ca9cff86c8 Mon Sep 17 00:00:00 2001
+From: Miroslav Lichvar <mlichvar@redhat.com>
+Date: Thu, 20 Sep 2018 15:01:16 +0200
+Subject: [PATCH] hash: include util.h for MIN macro
+
+The hash_intmd5.c file inadvertently relied on the system headers to
+provide the MIN macro, but it is missing with some libc implementations.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
+---
+ hash_intmd5.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/hash_intmd5.c b/hash_intmd5.c
+index 0b60f9b..49da1cf 100644
+--- a/hash_intmd5.c
++++ b/hash_intmd5.c
+@@ -29,6 +29,7 @@
+ #include "sysincl.h"
+ #include "hash.h"
+ #include "memory.h"
++#include "util.h"
+ 
+ #include "md5.c"
+ 
+-- 
+2.17.1
+
-- 
2.17.1
