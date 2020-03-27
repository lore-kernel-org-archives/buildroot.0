From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 27 Mar 2020 22:23:05 +0100
Subject: [Buildroot] [PATCH 1/1] package/gcc: define _REENTRANT for OpenRISC
 when -pthread is passed
Message-ID: <20200327212305.2032057-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/ceb802eea0fee5812efd717ae4cdbd9673d9507e/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...TRANT-for-RISC-V-when-pthread-is-pas.patch | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 package/gcc/9.3.0/0003-gcc-define-_REENTRANT-for-RISC-V-when-pthread-is-pas.patch

diff --git a/package/gcc/9.3.0/0003-gcc-define-_REENTRANT-for-RISC-V-when-pthread-is-pas.patch b/package/gcc/9.3.0/0003-gcc-define-_REENTRANT-for-RISC-V-when-pthread-is-pas.patch
new file mode 100644
index 0000000000..3ff64b71f8
--- /dev/null
+++ b/package/gcc/9.3.0/0003-gcc-define-_REENTRANT-for-RISC-V-when-pthread-is-pas.patch
@@ -0,0 +1,31 @@
+From 2aefc4ee703ce3ff70ad25915005cacfbaae0c49 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Fri, 27 Mar 2020 21:23:53 +0100
+Subject: [PATCH] gcc: define _REENTRANT for OpenRISC when -pthread is passed
+
+The detection of pthread support fails on OpenRISC unless _REENTRANT
+is defined. Added the CPP_SPEC definition to correct this.
+
+Patch sent upstream: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=94372
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ gcc/config/or1k/linux.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/gcc/config/or1k/linux.h b/gcc/config/or1k/linux.h
+index 4b2f7b6e1fd..b00d23ddfa0 100644
+--- a/gcc/config/or1k/linux.h
++++ b/gcc/config/or1k/linux.h
+@@ -32,6 +32,8 @@
+ #undef MUSL_DYNAMIC_LINKER
+ #define MUSL_DYNAMIC_LINKER  "/lib/ld-musl-or1k.so.1"
+ 
++#define CPP_SPEC "%{pthread:-D_REENTRANT}"
++
+ #undef LINK_SPEC
+ #define LINK_SPEC "%{h*}			\
+    %{static:-Bstatic}				\
+-- 
+2.21.0
+
-- 
2.25.0
