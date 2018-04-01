From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 1 Apr 2018 20:21:39 +0200
Subject: [Buildroot] [git commit] qt5webkit: fix build issue with 32-bits
 armv8-a
Message-ID: <20180401182148.9DB8D83581@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cea7aa873aa1b6034c3ac93aec21d74d9901b270
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adds WTF platform support for the 32-bits armv8-a architectures.

Fixes:

	In file included from ./config.h:30:0,
	                 from ...
	./wtf/Platform.h:323:6: error: #error "Not supported ARM architecture"
	 #    error "Not supported ARM architecture"
	      ^~~~~
from this defconfig:

BR2_arm=y
BR2_cortex_a72=y
BR2_ARM_FPU_VFPV3D16=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_INIT_NONE=y
BR2_PACKAGE_QT5=y
BR2_PACKAGE_QT5WEBKIT=y

The patch is an adaptation of an upstream fix in version 5.212 of
qtwebkit[1].

Unfortunately, the commit cannot be backported and has to be fixed since
the toolchain does not define __ARM_ARCH_8__ but __ARM_ARCH_8A__.

	$ host/bin/arm-buildroot-linux-gnueabihf-g++ -dM -E - < /dev/null | grep ARM_ARCH
	#define __ARM_ARCH_ISA_ARM 1
	#define __ARM_ARCH_8A__ 1
	#define __ARM_ARCH_PROFILE 65
	#define __ARM_ARCH_ISA_THUMB 2
	#define __ARM_ARCH 8
	#define __ARM_ARCH_EXT_IDIV__ 1

[1]: https://github.com/qt/qtwebkit/blob/35655d5f4bad248ead1700b59c381cc568b4e98b/Source/WTF/wtf/Platform.h#L241-L242

Cc: Arnout Vandecappelle <arnout@mind.be>
Reported-by: Brock Williams <brock@cottonwoodcomputer.com>
Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Ga??l PORTAY <gael.portay@savoirfairelinux.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0005-Detect-32-bits-armv8-a-architecture.patch | 48 ++++++++++++++++++++++
 .../0003-Detect-32-bits-armv8-a-architecture.patch | 48 ++++++++++++++++++++++
 2 files changed, 96 insertions(+)

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
+Signed-off-by: Ga??l PORTAY <gael.portay@savoirfairelinux.com>
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
+Signed-off-by: Ga??l PORTAY <gael.portay@savoirfairelinux.com>
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
