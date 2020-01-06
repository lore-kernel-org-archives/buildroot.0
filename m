From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  6 Jan 2020 19:24:20 +0100
Subject: [Buildroot] [PATCH 2/2] package/bluez_utils: fix build with c99
In-Reply-To: <20200106182420.2833708-1-fontaine.fabrice@gmail.com>
References: <20200106182420.2833708-1-fontaine.fabrice@gmail.com>
Message-ID: <20200106182420.2833708-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This will fix a build failure with libsigrok

Fixes:
 - http://autobuild.buildroot.org/results/005a16e63518716c6e99c74c618d01be453c76d4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0007-fix-lib-bluetooth-h-with-c99.patch   | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 package/bluez_utils/0007-fix-lib-bluetooth-h-with-c99.patch

diff --git a/package/bluez_utils/0007-fix-lib-bluetooth-h-with-c99.patch b/package/bluez_utils/0007-fix-lib-bluetooth-h-with-c99.patch
new file mode 100644
index 0000000000..3738baf1f5
--- /dev/null
+++ b/package/bluez_utils/0007-fix-lib-bluetooth-h-with-c99.patch
@@ -0,0 +1,31 @@
+http://permalink.gmane.org/gmane.linux.bluez.kernel/22306
+
+[Retrieved from:
+https://428282.bugs.gentoo.org/attachment.cgi?id=319374]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+
+diff --git a/lib/bluetooth.h b/lib/bluetooth.h
+index 0541842..5b2153d 100644
+--- a/lib/bluetooth.h
++++ b/lib/bluetooth.h
+@@ -140,16 +140,16 @@ enum {
+ #define bt_get_unaligned(ptr)			\
+ ({						\
+ 	struct __attribute__((packed)) {	\
+-		typeof(*(ptr)) __v;		\
+-	} *__p = (typeof(__p)) (ptr);		\
++		__typeof__(*(ptr)) __v;		\
++	} *__p = (__typeof__(__p)) (ptr);	\
+ 	__p->__v;				\
+ })
+ 
+ #define bt_put_unaligned(val, ptr)		\
+ do {						\
+ 	struct __attribute__((packed)) {	\
+-		typeof(*(ptr)) __v;		\
+-	} *__p = (typeof(__p)) (ptr);		\
++		__typeof__(*(ptr)) __v;		\
++	} *__p = (__typeof__(__p)) (ptr);	\
+ 	__p->__v = (val);			\
+ } while(0)
+ 
-- 
2.24.1
