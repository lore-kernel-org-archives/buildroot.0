From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Sun,  1 May 2016 11:28:03 +0200
Subject: [Buildroot] [PATCH] crda: fix build with GCC 6
Message-ID: <1462094883-8397-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building crda with GCC 6 fails because of all compiler warnings are treated as
errors. Disable the compiler option '-Werror':

keys-gcrypt.c:94:32: error: ?keys? defined but not used [-Werror=unused-const-variable=]
 static const struct key_params keys[] = {
                                ^~~~
cc1: all warnings being treated as errors

Add a patch to drop '-Werror' from CFLAGS.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/crda/0003-drop-werror.patch | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/crda/0003-drop-werror.patch

diff --git a/package/crda/0003-drop-werror.patch b/package/crda/0003-drop-werror.patch
new file mode 100644
index 0000000..072e3fc
--- /dev/null
+++ b/package/crda/0003-drop-werror.patch
@@ -0,0 +1,37 @@
+From f38253e066dee96b148be1b79a6b4a696ee0ae0b Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Sun, 1 May 2016 10:05:48 +0200
+Subject: [PATCH] drop werror
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Building crda with GCC 6 fails because of all compiler warnings are treated as
+errors. Disable the compiler option '-Werror':
+
+keys-gcrypt.c:94:32: error: ?keys? defined but not used [-Werror=unused-const-variable=]
+ static const struct key_params keys[] = {
+                                ^~~~
+cc1: all warnings being treated as errors
+
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 74f1172..e9b417f 100644
+--- a/Makefile
++++ b/Makefile
+@@ -26,7 +26,7 @@ PUBKEY_DIR?=pubkeys
+ RUNTIME_PUBKEY_DIR?=/etc/wireless-regdb/pubkeys
+ 
+ CFLAGS += -O2 -fpic
+-CFLAGS += -std=gnu99 -Wall -Werror -pedantic
++CFLAGS += -std=gnu99 -Wall -pedantic
+ CFLAGS += -Wall -g
+ LDLIBREG += -lreg
+ LDLIBS += $(LDLIBREG)
+-- 
+2.8.2
+
-- 
2.8.2
