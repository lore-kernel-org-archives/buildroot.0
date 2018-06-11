From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Mon, 11 Jun 2018 09:54:17 -0400
Subject: [Buildroot] [PATCH] qt5script: fix build issue with 32-bits armv8-a
Message-ID: <20180611135417.18259-1-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adds WTF platform support for the 32-bits armv8-a architectures.

Fixes:

	In file included from ../3rdparty/javascriptcore/JavaScriptCore/config.h:26,
	                from ../3rdparty/javascriptcore/JavaScriptCore/pcre/pcre_compile.cpp:44:
	../3rdparty/javascriptcore/JavaScriptCore/wtf/Platform.h:370:6: error: #error "Not supported ARM architecture"
	#    error "Not supported ARM architecture"
	     ^~~~~

The patch is based on two upstream fixes in WebKit[1][2].

See also commit cea7aa873a.

[1]: https://github.com/WebKit/webkit/commit/313d9fc4bdd2f020a5d0cf834c3c61982f161ebb
[2]: https://github.com/WebKit/webkit/commit/98f0de0709786f5d9b09dfd5908266990eb909d6

Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
---
Hi all,

This bug can be repoduced using the raspberrypi3_defconfig + BR2_PACKAGE_QT5SCRIPT.

Regards,
Gael

 .../0001-Detect-32-bits-armv8-a-architecture.patch | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 package/qt5/qt5script/0001-Detect-32-bits-armv8-a-architecture.patch

diff --git a/package/qt5/qt5script/0001-Detect-32-bits-armv8-a-architecture.patch b/package/qt5/qt5script/0001-Detect-32-bits-armv8-a-architecture.patch
new file mode 100644
index 0000000000..7e4e524dc9
--- /dev/null
+++ b/package/qt5/qt5script/0001-Detect-32-bits-armv8-a-architecture.patch
@@ -0,0 +1,49 @@
+From daf2e222903bacf85f27dfb0fffc4459bbf58b77 Mon Sep 17 00:00:00 2001
+From: =?utf-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
+Date: Sun, 10 Jun 2018 08:23:50 -0400
+Subject: [PATCH] Detect 32-bits armv8-a architecture
+MIME-Version: 1.0
+Content-Type: text/plain; charset=utf-8
+Content-Transfer-Encoding: 8bit
+
+These toolchains define __ARM_ARCH_8A__ (for ARM architecture version)
+and __arm__ (for 32-bits word-size; __aarch64__ for 64-bits).
+
+This commit catches this new architecture (armv8a) within a #ifdef/#endif
+inside the if statement dedicated for 32-bits ARM detection. See commit
+from WebKit [1] and [2].
+
+Fixes:
+
+	In file included from ../3rdparty/javascriptcore/JavaScriptCore/config.h:26,
+	                 from ../3rdparty/javascriptcore/JavaScriptCore/pcre/pcre_compile.cpp:44:
+	../3rdparty/javascriptcore/JavaScriptCore/wtf/Platform.h:370:6: error: #error "Not supported ARM architecture"
+	 #    error "Not supported ARM architecture"
+	      ^~~~~
+
+[1]: https://github.com/WebKit/webkit/commit/313d9fc4bdd2f020a5d0cf834c3c61982f161ebb
+[2]: https://github.com/WebKit/webkit/commit/98f0de0709786f5d9b09dfd5908266990eb909d6
+
+Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
+---
+ src/3rdparty/javascriptcore/JavaScriptCore/wtf/Platform.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/3rdparty/javascriptcore/JavaScriptCore/wtf/Platform.h b/src/3rdparty/javascriptcore/JavaScriptCore/wtf/Platform.h
+index 00caa6d..c4b758e 100644
+--- a/src/3rdparty/javascriptcore/JavaScriptCore/wtf/Platform.h
++++ b/src/3rdparty/javascriptcore/JavaScriptCore/wtf/Platform.h
+@@ -306,6 +306,10 @@
+     || defined(__ARM_ARCH_7R__)
+ #define WTF_ARM_ARCH_VERSION 7
+ 
++#elif defined(__ARM_ARCH_8__) \
++    || defined(__ARM_ARCH_8A__)
++#define WTF_ARM_ARCH_VERSION 8
++
+ /* RVCT sets _TARGET_ARCH_ARM */
+ #elif defined(__TARGET_ARCH_ARM)
+ #define WTF_ARM_ARCH_VERSION __TARGET_ARCH_ARM
+-- 
+2.17.1
+
-- 
2.11.0
