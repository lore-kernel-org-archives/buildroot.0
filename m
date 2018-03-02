From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Fri,  2 Mar 2018 11:28:12 -0500
Subject: [Buildroot] [PATCH v3] qt5webkit: fix build issue with 32-bits
 armv8-a
Message-ID: <20180302162812.17475-1-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adds WTF platform support for the 32-bits armv8-a architectures.

Fixes:

	In file included from ./config.h:30:0,
	                 from ...
	./wtf/Platform.h:323:6: error: #error "Not supported ARM architecture"
	 #    error "Not supported ARM architecture"
	      ^~~~~

The patch is an adaptation of an upstream fix in version 5.212 of
qtwebkit[1].

Unfortunately, the commit cannot be backported and has to be fixed since
the toolchain does not define __ARM_ARCH_8__ but __ARM_ARCH_8A__.

	$ host/bin/arm-buildroot-linux-gnueabihf-g++ -dM -E - < /dev/null | grep -i ARM
	#define __ARM_SIZEOF_WCHAR_T 4
	#define __ARM_FEATURE_SAT 1
	#define __ARM_ARCH_ISA_ARM 1
	#define __ARMEL__ 1
	#define __ARM_FEATURE_UNALIGNED 1
	#define __ARM_FEATURE_IDIV 1
	#define __ARM_FP 14
	#define __ARM_ARCH_8A__ 1
	#define __ARM_NEON_FP 6
	#define __ARM_SIZEOF_MINIMAL_ENUM 4
	#define __ARM_PCS_VFP 1
	#define __ARM_FEATURE_LDREX 15
	#define __ARM_FEATURE_QBIT 1
	#define __ARM_FEATURE_FMA 1
	#define __ARM_NEON__ 1
	#define __ARM_ARCH_PROFILE 65
	#define __ARM_32BIT_STATE 1
	#define __ARM_FEATURE_CLZ 1
	#define __ARM_ARCH_ISA_THUMB 2
	#define __ARM_ARCH 8
	#define __arm__ 1
	#define __ARM_FEATURE_SIMD32 1
	#define __ARM_FEATURE_CRC32 1
	#define __ARM_NEON 1
	#define __ARM_ARCH_EXT_IDIV__ 1
	#define __ARM_EABI__ 1
	#define __ARM_FEATURE_DSP 1

[1]: https://github.com/qt/qtwebkit/blob/35655d5f4bad248ead1700b59c381cc568b4e98b/Source/WTF/wtf/Platform.h#L241-L242

Cc: Arnout Vandecappelle <arnout@mind.be>
Reported-by: Brock Williams <brock@cottonwoodcomputer.com>
Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
---

Changes since v1:
 - double check for __ARM_ARCH_8__ and __ARM_ARCH_8A__
 - add Reviewed-by Adrian Perez de Castro

Changes since v2:
 - join two lines in error log from commit message
 - reformat patch using -N
 - fix Upstream-Status 

 .../0005-Detect-32-bits-armv8-a-architecture.patch | 48 ++++++++++++++++++++++
 .../0003-Detect-32-bits-armv8-a-architecture.patch | 48 ++++++++++++++++++++++
 2 files changed, 96 insertions(+)
 create mode 100644 package/qt5/qt5webkit/5.6.3/0005-Detect-32-bits-armv8-a-architecture.patch
 create mode 100644 package/qt5/qt5webkit/5.9.1/0003-Detect-32-bits-armv8-a-architecture.patch

diff --git a/package/qt5/qt5webkit/5.6.3/0005-Detect-32-bits-armv8-a-architecture.patch b/package/qt5/qt5webkit/5.6.3/0005-Detect-32-bits-armv8-a-architecture.patch
new file mode 100644
index 0000000000..9c2205dd94
--- /dev/null
+++ b/package/qt5/qt5webkit/5.6.3/0005-Detect-32-bits-armv8-a-architecture.patch
@@ -0,0 +1,48 @@
+From 068bf2d2d91382ea0d8ec24a142a30ea429704db Mon Sep 17 00:00:00 2001
+From: =?utf-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
+Date: Tue, 15 Aug 2017 18:28:49 -0400
+Subject: [PATCH] Detect 32-bits armv8-a architecture
+MIME-Version: 1.0
+Content-Type: text/plain; charset=utf-8
+Content-Transfer-Encoding: 8bit
+
+Adds WTF platform support for the 32-bits armv8-a architectures.
+
+Theses toolchains define __ARM_ARCH_8A__ (for ARM architecture version)
+and __arm__ (for 32-bits word-size; __aarch64__ for 64-bits).
+
+This commit catches this new architecture (armv8a) within a #ifdef/#endif
+inside the if statement dedicated for 32-bits ARM detection.
+
+Fixes:
+
+	In file included from ./config.h:30:0,
+	                 from ...
+	./wtf/Platform.h:323:6: error: #error "Not supported ARM architecture"
+	 #    error "Not supported ARM architecture"
+	      ^~~~~
+
+Upstream-Status: Backport [with adaptations]
+Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
+---
+ Source/WTF/wtf/Platform.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/Source/WTF/wtf/Platform.h b/Source/WTF/wtf/Platform.h
+index 562840cf7..9cf656845 100644
+--- a/Source/WTF/wtf/Platform.h
++++ b/Source/WTF/wtf/Platform.h
+@@ -243,6 +243,10 @@
+     || defined(__ARM_ARCH_7S__)
+ #define WTF_ARM_ARCH_VERSION 7
+ 
++#elif defined(__ARM_ARCH_8__) \
++    || defined(__ARM_ARCH_8A__)
++#define WTF_ARM_ARCH_VERSION 8
++
+ /* MSVC sets _M_ARM */
+ #elif defined(_M_ARM)
+ #define WTF_ARM_ARCH_VERSION _M_ARM
+-- 
+2.16.1
+
diff --git a/package/qt5/qt5webkit/5.9.1/0003-Detect-32-bits-armv8-a-architecture.patch b/package/qt5/qt5webkit/5.9.1/0003-Detect-32-bits-armv8-a-architecture.patch
new file mode 100644
index 0000000000..9c2205dd94
--- /dev/null
+++ b/package/qt5/qt5webkit/5.9.1/0003-Detect-32-bits-armv8-a-architecture.patch
@@ -0,0 +1,48 @@
+From 068bf2d2d91382ea0d8ec24a142a30ea429704db Mon Sep 17 00:00:00 2001
+From: =?utf-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
+Date: Tue, 15 Aug 2017 18:28:49 -0400
+Subject: [PATCH] Detect 32-bits armv8-a architecture
+MIME-Version: 1.0
+Content-Type: text/plain; charset=utf-8
+Content-Transfer-Encoding: 8bit
+
+Adds WTF platform support for the 32-bits armv8-a architectures.
+
+Theses toolchains define __ARM_ARCH_8A__ (for ARM architecture version)
+and __arm__ (for 32-bits word-size; __aarch64__ for 64-bits).
+
+This commit catches this new architecture (armv8a) within a #ifdef/#endif
+inside the if statement dedicated for 32-bits ARM detection.
+
+Fixes:
+
+	In file included from ./config.h:30:0,
+	                 from ...
+	./wtf/Platform.h:323:6: error: #error "Not supported ARM architecture"
+	 #    error "Not supported ARM architecture"
+	      ^~~~~
+
+Upstream-Status: Backport [with adaptations]
+Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
+---
+ Source/WTF/wtf/Platform.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/Source/WTF/wtf/Platform.h b/Source/WTF/wtf/Platform.h
+index 562840cf7..9cf656845 100644
+--- a/Source/WTF/wtf/Platform.h
++++ b/Source/WTF/wtf/Platform.h
+@@ -243,6 +243,10 @@
+     || defined(__ARM_ARCH_7S__)
+ #define WTF_ARM_ARCH_VERSION 7
+ 
++#elif defined(__ARM_ARCH_8__) \
++    || defined(__ARM_ARCH_8A__)
++#define WTF_ARM_ARCH_VERSION 8
++
+ /* MSVC sets _M_ARM */
+ #elif defined(_M_ARM)
+ #define WTF_ARM_ARCH_VERSION _M_ARM
+-- 
+2.16.1
+
-- 
2.11.0
