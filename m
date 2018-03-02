From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Fri,  2 Mar 2018 05:58:33 -0500
Subject: [Buildroot] [PATCH 1/1] qt5webkit: fix build issue with 32-bits
 armv8-a
Message-ID: <20180302105833.6828-1-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adds WTF platform support for the 32-bits armv8-a architectures.

Fixes:

	In file included from ./config.h:30:0,
	                 from ...
	./wtf/Platform.h:323:6: error: #error "Not supported ARM
architecture"
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
Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
---

Hi,

This issue was reported a while ago[2].

[2]: http://lists.busybox.net/pipermail/buildroot/2017-August/200540.html

Regards,
Gael
 .../0005-Detect-32-bits-armv8-a-architecture.patch | 47 ++++++++++++++++++++++
 .../0003-Detect-32-bits-armv8-a-architecture.patch | 47 ++++++++++++++++++++++
 2 files changed, 94 insertions(+)
 create mode 100644 package/qt5/qt5webkit/5.6.3/0005-Detect-32-bits-armv8-a-architecture.patch
 create mode 100644 package/qt5/qt5webkit/5.9.1/0003-Detect-32-bits-armv8-a-architecture.patch

diff --git a/package/qt5/qt5webkit/5.6.3/0005-Detect-32-bits-armv8-a-architecture.patch b/package/qt5/qt5webkit/5.6.3/0005-Detect-32-bits-armv8-a-architecture.patch
new file mode 100644
index 0000000000..c9ca7e6f96
--- /dev/null
+++ b/package/qt5/qt5webkit/5.6.3/0005-Detect-32-bits-armv8-a-architecture.patch
@@ -0,0 +1,47 @@
+From 69182ba2b2f41cde695c7ec5f8eb285797d23569 Mon Sep 17 00:00:00 2001
+From: =?utf-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
+Date: Tue, 15 Aug 2017 18:28:49 -0400
+Subject: [PATCH 1/1] Detect 32-bits armv8-a architecture
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
+Upstream-Status: Inappropriate
+Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
+---
+ Source/WTF/wtf/Platform.h | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/Source/WTF/wtf/Platform.h b/Source/WTF/wtf/Platform.h
+index 562840cf7..27a9035fd 100644
+--- a/Source/WTF/wtf/Platform.h
++++ b/Source/WTF/wtf/Platform.h
+@@ -243,6 +243,9 @@
+     || defined(__ARM_ARCH_7S__)
+ #define WTF_ARM_ARCH_VERSION 7
+ 
++#elif defined(__ARM_ARCH_8A__)
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
index 0000000000..c9ca7e6f96
--- /dev/null
+++ b/package/qt5/qt5webkit/5.9.1/0003-Detect-32-bits-armv8-a-architecture.patch
@@ -0,0 +1,47 @@
+From 69182ba2b2f41cde695c7ec5f8eb285797d23569 Mon Sep 17 00:00:00 2001
+From: =?utf-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
+Date: Tue, 15 Aug 2017 18:28:49 -0400
+Subject: [PATCH 1/1] Detect 32-bits armv8-a architecture
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
+Upstream-Status: Inappropriate
+Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
+---
+ Source/WTF/wtf/Platform.h | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/Source/WTF/wtf/Platform.h b/Source/WTF/wtf/Platform.h
+index 562840cf7..27a9035fd 100644
+--- a/Source/WTF/wtf/Platform.h
++++ b/Source/WTF/wtf/Platform.h
+@@ -243,6 +243,9 @@
+     || defined(__ARM_ARCH_7S__)
+ #define WTF_ARM_ARCH_VERSION 7
+ 
++#elif defined(__ARM_ARCH_8A__)
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
