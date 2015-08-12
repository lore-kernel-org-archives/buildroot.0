From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 13 Aug 2015 01:20:02 +0300
Subject: [Buildroot] [PATCH 3/4] xtensa: switch from text-section-literals
	to auto-litpools
In-Reply-To: <1439418003-23805-1-git-send-email-jcmvbkbc@gmail.com>
References: <1439418003-23805-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <1439418003-23805-4-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that both binutils and gcc support auto-litpools use that option
instead of text-section-literals to be able to compile huge functions.

Fixes:
  http://autobuild.buildroot.net/results/dd384fe0ef02a4205bea66a4a16ca2062afe53b4/
  http://autobuild.buildroot.net/results/87dd357a4b883ea3cd75546b3d63c4c28245beee/
  http://autobuild.buildroot.net/results/b5bca00dec1ecb118c7fb9c10dee74c94809c831/
and many others.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 package/Makefile.in | 4 ++--
 package/gcc/gcc.mk  | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 545694f..5038e50 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -91,7 +91,7 @@ endif
 # code size and performance, the linker can usually optimize away the
 # overhead when a call ends up within a certain range.
 #
-# Use text-section-literals for Xtensa globally.
+# Use auto-litpools for Xtensa globally.
 # Collecting literals into separate section can be advantageous if that
 # section is placed into DTCM at link time. This is applicable for code
 # running on bare metal, but makes no sense under linux, where userspace
@@ -100,7 +100,7 @@ endif
 # instruction can only access literals in 256 KBytes range.
 #
 ifeq ($(BR2_xtensa),y)
-TARGET_ABI += -mlongcalls -mtext-section-literals
+TARGET_ABI += -mlongcalls -mauto-litpools
 endif
 
 ifeq ($(BR2_arc)$(BR2_ARC_ATOMIC_EXT),yy)
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 501fcea..6b9ef92 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -112,11 +112,11 @@ GCC_COMMON_TARGET_CXXFLAGS = $(filter-out -Os,$(GCC_COMMON_TARGET_CXXFLAGS))
 endif
 endif
 
-# Xtensa libgcc can't be built with -mtext-section-literals
+# Xtensa libgcc can't be built with -mauto-litpools
 # because of the trick used to generate .init/.fini sections.
 ifeq ($(BR2_xtensa),y)
-GCC_COMMON_TARGET_CFLAGS = $(filter-out -mtext-section-literals,$(TARGET_CFLAGS))
-GCC_COMMON_TARGET_CXXFLAGS = $(filter-out -mtext-section-literals,$(TARGET_CXXFLAGS))
+GCC_COMMON_TARGET_CFLAGS = $(filter-out -mauto-litpools,$(TARGET_CFLAGS))
+GCC_COMMON_TARGET_CXXFLAGS = $(filter-out -mauto-litpools,$(TARGET_CXXFLAGS))
 endif
 
 # Propagate options used for target software building to GCC target libs
-- 
1.8.1.4
