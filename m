From: Samuel Martin <s.martin49@gmail.com>
Date: Fri,  3 Nov 2017 11:30:34 +0100
Subject: [Buildroot] [PATCH 2/2] package/ussp-push: add patches fixing the
 build
In-Reply-To: <20171103103034.24937-1-s.martin49@gmail.com>
References: <20171103103034.24937-1-s.martin49@gmail.com>
Message-ID: <20171103103034.24937-2-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
  http://autobuild.buildroot.net/results/bdd932424a45399836f27c435d6f1f6fb8b97c29
  http://autobuild.buildroot.net/results/287b7d35d64d72cbc587192cce1271bda9647608
  http://autobuild.buildroot.net/results/82e1484d9a43df7387137a1bd679a4d74d460a79

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 .../0002-fix-build-again-obex-bluez.patch          | 28 +++++++++++++
 .../ussp-push/0003-add-OBEX_CharToUnicode.patch    | 47 ++++++++++++++++++++++
 2 files changed, 75 insertions(+)
 create mode 100644 package/ussp-push/0002-fix-build-again-obex-bluez.patch
 create mode 100644 package/ussp-push/0003-add-OBEX_CharToUnicode.patch

diff --git a/package/ussp-push/0002-fix-build-again-obex-bluez.patch b/package/ussp-push/0002-fix-build-again-obex-bluez.patch
new file mode 100644
index 0000000000..e98fe6ef13
--- /dev/null
+++ b/package/ussp-push/0002-fix-build-again-obex-bluez.patch
@@ -0,0 +1,28 @@
+From 2d732026044d8e6cd16465ee87a73ac9692c021b Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Fri, 3 Nov 2017 09:04:12 +0100
+Subject: [PATCH] fix build again obex/bluez
+
+[fetch from debian source: http://http.debian.net/debian/pool/main/u/ussp-push/ussp-push_0.11-4.debian.tar.xz]
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ src/obex_main.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/obex_main.c b/src/obex_main.c
+index a7126e6..6233d7e 100644
+--- a/src/obex_main.c
++++ b/src/obex_main.c
+@@ -197,7 +197,7 @@ obex_t *__obex_connect(int devid, void *addr, int timeout, int *err)
+ 		*err = -1;
+ 		return NULL;
+ 	}
+-	if (!(handle = OBEX_Init(OBEX_TRANS_CUST, obex_event, 0))) {
++	if (!(handle = OBEX_Init(OBEX_TRANS_CUSTOM, obex_event, 0))) {
+ 		BTERROR("OBEX_Init failed: %s\n", strerror(errno));
+ 		obex_free(gt);
+ 		*err = -1;
+-- 
+2.15.0
+
diff --git a/package/ussp-push/0003-add-OBEX_CharToUnicode.patch b/package/ussp-push/0003-add-OBEX_CharToUnicode.patch
new file mode 100644
index 0000000000..a660b5526b
--- /dev/null
+++ b/package/ussp-push/0003-add-OBEX_CharToUnicode.patch
@@ -0,0 +1,47 @@
+From eafac77d76d2a23c191a56f715d6c4afc0800da8 Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Fri, 3 Nov 2017 09:10:01 +0100
+Subject: [PATCH] add OBEX_CharToUnicode
+
+[fetch from debian source: http://http.debian.net/debian/pool/main/u/ussp-push/ussp-push_0.11-4.debian.tar.xz]
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ src/obex_main.c | 20 ++++++++++++++++++++
+ 1 file changed, 20 insertions(+)
+
+diff --git a/src/obex_main.c b/src/obex_main.c
+index 6233d7e..971cc37 100644
+--- a/src/obex_main.c
++++ b/src/obex_main.c
+@@ -84,7 +84,27 @@ void request_done(obex_t * handle, obex_object_t * object, int obex_cmd, int obe
+ 
+ int bt_debug;
+ 
++static int OBEX_CharToUnicode(uint8_t *uc, const uint8_t *c, int size)
++{
++	int len, n;
++
++	if (uc == NULL || c == NULL)
++		return -1;
++
++	len = n = strlen((char *) c);
++	if (n*2+2 > size)
++		return -1;
++
++	uc[n*2+1] = 0;
++	uc[n*2] = 0;
+ 
++	while (n--) {
++		uc[n*2+1] = c[n];
++		uc[n*2] = 0;
++	}
++
++	return (len * 2) + 2;
++}
+ 
+ /*
+  * These two functions are from affix/profiles/obex/obex_io.c
+-- 
+2.15.0
+
-- 
2.15.0
