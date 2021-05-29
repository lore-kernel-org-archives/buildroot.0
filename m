From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 29 May 2021 19:16:49 +0200
Subject: [Buildroot] [PATCH 2/2] package/boost: fix log build on riscv32
In-Reply-To: <20210529171649.2843578-1-fontaine.fabrice@gmail.com>
References: <20210529171649.2843578-1-fontaine.fabrice@gmail.com>
Message-ID: <20210529171649.2843578-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/8c8135fd7c0517c66c9b3975c494da6d7934cc1b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...2-src-event-cpp-fix-build-on-riscv32.patch | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 package/boost/0002-src-event-cpp-fix-build-on-riscv32.patch

diff --git a/package/boost/0002-src-event-cpp-fix-build-on-riscv32.patch b/package/boost/0002-src-event-cpp-fix-build-on-riscv32.patch
new file mode 100644
index 0000000000..f1b84284ee
--- /dev/null
+++ b/package/boost/0002-src-event-cpp-fix-build-on-riscv32.patch
@@ -0,0 +1,42 @@
+From d2061419501bdd6761e9380ed5b91233f6c4e67e Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 21 May 2021 21:30:04 +0200
+Subject: [PATCH] src/event.cpp: fix build on riscv32
+
+riscv32 fails to build because __NR_futex is not defined on this
+architecture:
+
+libs/log/src/event.cpp: In member function 'void boost::log::v2_mt_posix::aux::futex_based_event::wait()':
+libs/log/src/event.cpp:38:29: error: '__NR_futex' was not declared in this scope
+   38 | #define BOOST_LOG_SYS_FUTEX __NR_futex
+      |                             ^~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/8c8135fd7c0517c66c9b3975c494da6d7934cc1b
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/boostorg/log/commit/d2061419501bdd6761e9380ed5b91233f6c4e67e]
+---
+ src/event.cpp | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/libs/log/src/event.cpp b/libs/log/src/event.cpp
+index 5485154d7..f576648c6 100644
+--- a/libs/log/src/event.cpp
++++ b/libs/log/src/event.cpp
+@@ -34,8 +34,13 @@
+ // Some Android NDKs (Google NDK and older Crystax.NET NDK versions) don't define SYS_futex
+ #if defined(SYS_futex)
+ #define BOOST_LOG_SYS_FUTEX SYS_futex
+-#else
++#elif defined(__NR_futex)
+ #define BOOST_LOG_SYS_FUTEX __NR_futex
++// riscv32 defines a different system call instead of __NR_futex
++#elif defined(__NR_futex_time64)
++#define BOOST_LOG_SYS_FUTEX __NR_futex_time64
++#else
++#error "Unable to find a suitable futex"
+ #endif
+ 
+ #if defined(FUTEX_WAIT_PRIVATE)
-- 
2.30.2
