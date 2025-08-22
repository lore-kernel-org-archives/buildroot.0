Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBC67CAC581
	for <buildroot@archiver.kernel.org>; Mon,  8 Sep 2025 14:17:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 887F080616;
	Mon,  8 Sep 2025 14:17:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jyE7uFvnu2DJ; Mon,  8 Sep 2025 14:17:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 038858060F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 038858060F;
	Mon,  8 Sep 2025 14:17:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 10444234
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 14:16:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3314B605B0
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 14:16:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W_LTB3YmXd-0 for <buildroot@buildroot.org>;
 Mon,  8 Sep 2025 14:16:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B8C8605C0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B8C8605C0
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 14:16:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2D33983CAF; Mon,  8 Sep 2025 14:16:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 22 Aug 2025 22:23:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 90576d681c2d6c5173e7ec4066267ef4a6a8a5ce
X-Git-Newrev: ca70913684eed045d10a22328d483264852ac7bf
X-Patchwork-Hint: ignore
Message-Id: <20250908141622.2D33983CAF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tinycbor: bump to version 0.6.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7197193919186109053=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7197193919186109053==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=ca70913684eed045d10a22328d483264852ac7bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is nominally a bugfix release which now also includes the patch we
previously backported, so we can remove it.

However, it also introduced some breakage:

 - Builds with older toolchains (like br-arm-full-static, GCC 9) fail
   because the introduction of C23 [[fallthrough]] to the code was not
   properly gated on compiler support.

 - Compiling for x86 without SSE2 support (e.g. with
   bootlin-x86-i686-musl) fails because the check for native half-with
   float arithmetic support on the target was not strict enough.

Import unreleased upstream patches that fix these issues.

Release notes: https://github.com/intel/tinycbor/releases/tag/v0.6.1

Signed-off-by: Florian Larysch <fl@n621.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  1 -
 ...ith-GCC-11-fallthrough-is-supported-but-n.patch | 55 ++++++++++++++++++++
 .../0001-Makefile-add-DISABLE_WERROR.patch         | 44 ----------------
 .../0002-fix-build-on-i386-without-SSE2.patch      | 59 ++++++++++++++++++++++
 package/tinycbor/tinycbor.hash                     |  2 +-
 package/tinycbor/tinycbor.mk                       |  2 +-
 6 files changed, 116 insertions(+), 47 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 7697fd2ea1..ca7fec588a 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1131,7 +1131,6 @@ package/ti-sgx-um/0001-Makefile-do-not-install-init-script.patch lib_patch.Upstr
 package/ti-sgx-um/S80ti-sgx lib_sysv.Variables
 package/ti-utils/0001-plt.h-fix-build-with-gcc-10.patch lib_patch.Upstream
 package/tinyalsa/0001-include-time.h-before-asound.h.patch lib_patch.Upstream
-package/tinycbor/0001-Makefile-add-DISABLE_WERROR.patch lib_patch.Upstream
 package/tinycompress/0001-wave-add-time.h-missing-header-inclusion.patch lib_patch.Upstream
 package/tinydtls/0001-sha2-sha2.c-fix-build-on-big-endian.patch lib_patch.Upstream
 package/tinyxml/0001-In-stamp-always-advance-the-pointer-if-p-0xef.patch lib_patch.Upstream
diff --git a/package/tinycbor/0001-Fix-build-with-GCC-11-fallthrough-is-supported-but-n.patch b/package/tinycbor/0001-Fix-build-with-GCC-11-fallthrough-is-supported-but-n.patch
new file mode 100644
index 0000000000..e54e8db6e2
--- /dev/null
+++ b/package/tinycbor/0001-Fix-build-with-GCC-11-fallthrough-is-supported-but-n.patch
@@ -0,0 +1,55 @@
+From 45e4641059709862b4e46f3608d140337566334b Mon Sep 17 00:00:00 2001
+From: Thiago Macieira <thiago.macieira@intel.com>
+Date: Wed, 2 Apr 2025 08:39:04 -0700
+Subject: [PATCH] Fix build with GCC < 11: [[fallthrough]] is supported but not
+ allowed in C
+
+I think GCC says `__has_cpp_attribute(fallthrough)` is true because C++
+supports it (it means "has C++ attribute"), but that doesn't apply to
+the C language. This causes a compilation error:
+
+```
+compilersupport_p.h:57:41: error: expected expression before '[' token
+   57 | #    define CBOR_FALLTHROUGH            [[fallthrough]]
+      |                                         ^
+cborparser.c:225:13: note: in expansion of macro 'CBOR_FALLTHROUGH'
+  225 |             CBOR_FALLTHROUGH;
+      |             ^~~~~~~~~~~~~~~~
+```
+
+Instead, we should use the C23 `__has_c_attribute` to detect the C
+attribute.
+
+Fixes #293.
+
+Signed-off-by: Thiago Macieira <thiago.macieira@intel.com>
+
+Upstream: https://github.com/intel/tinycbor/commit/45e4641059709862b4e46f3608d140337566334b
+Signed-off-by: Florian Larysch <fl@n621.de>
+---
+ src/compilersupport_p.h | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/src/compilersupport_p.h b/src/compilersupport_p.h
+index c91ea93..9251799 100644
+--- a/src/compilersupport_p.h
++++ b/src/compilersupport_p.h
+@@ -52,10 +52,14 @@
+ #  define cbor_static_assert(x)         ((void)sizeof(char[2*!!(x) - 1]))
+ #endif
+ 
+-#if defined(__has_cpp_attribute)    // C23 and C++17
++#if defined(__has_cpp_attribute) && defined(__cplusplus)    // C++17
+ #  if __has_cpp_attribute(fallthrough)
+ #    define CBOR_FALLTHROUGH            [[fallthrough]]
+ #  endif
++#elif defined(__has_c_attribute) && !defined(__cplusplus)   // C23
++#  if __has_c_attribute(fallthrough)
++#    define CBOR_FALLTHROUGH            [[fallthrough]]
++#  endif
+ #endif
+ #ifndef CBOR_FALLTHROUGH
+ #  ifdef __GNUC__
+-- 
+2.50.1
+
diff --git a/package/tinycbor/0001-Makefile-add-DISABLE_WERROR.patch b/package/tinycbor/0001-Makefile-add-DISABLE_WERROR.patch
deleted file mode 100644
index 334bea7eb0..0000000000
--- a/package/tinycbor/0001-Makefile-add-DISABLE_WERROR.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 5f26eaf8d7be760fafe11ef4a6e0f907e7e8c3f0 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 10 Jan 2022 23:17:45 +0100
-Subject: [PATCH] Makefile: add DISABLE_WERROR
-
-Allow the user to disable -Werror to avoid the following build failure
-with gcc 4.8 raised since version 0.6.0 and
-https://github.com/intel/tinycbor/commit/e2a4ed135c4d9101c4df83f2dd033cd249b6ef07:
-
-/home/buildroot/autobuild/instance-1/output-1/host/bin/arm-none-linux-gnueabi-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I./src -std=gnu99 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0 -D_FORTIFY_SOURCE=1 -Werror=incompatible-pointer-types -Werror=implicit-function-declaration -Werror=int-conversion -fPIC  -c -o src/cborerrorstrings.pic.o src/cborerrorstrings.c
-cc1: error: -Werror=incompatible-pointer-types: no option -Wincompatible-pointer-types
-cc1: error: -Werror=int-conversion: no option -Wint-conversion
-
-Fixes:
- - http://autobuild.buildroot.org/results/a9f/a9fe64c42bb96f9e7b4af3050464f6570c1c00fa
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/intel/tinycbor/commit/5f26eaf8d7be760fafe11ef4a6e0f907e7e8c3f0]
----
- Makefile | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 6492ea16..3cde2b3d 100644
---- a/Makefile
-+++ b/Makefile
-@@ -236,10 +236,15 @@ tag: distcheck
- .SECONDARY:
- 
- cflags := $(CPPFLAGS) -I$(SRCDIR)src
--cflags += -std=gnu99 $(CFLAGS) \
-+cflags += -std=gnu99 $(CFLAGS)
-+
-+ifneq ($(DISABLE_WERROR),1)
-+cflags += \
- 	-Werror=incompatible-pointer-types \
- 	-Werror=implicit-function-declaration \
- 	-Werror=int-conversion
-+endif
-+
- %.o: %.c
- 	@test -d $(@D) || $(MKDIR) $(@D)
- 	$(CC) $(cflags) $($(basename $(notdir $@))_CCFLAGS) -c -o $@ $<
diff --git a/package/tinycbor/0002-fix-build-on-i386-without-SSE2.patch b/package/tinycbor/0002-fix-build-on-i386-without-SSE2.patch
new file mode 100644
index 0000000000..45611e6f23
--- /dev/null
+++ b/package/tinycbor/0002-fix-build-on-i386-without-SSE2.patch
@@ -0,0 +1,59 @@
+From 48a22bddfcc67b3a433ded695f906cc314a0bd5f Mon Sep 17 00:00:00 2001
+From: Florian Larysch <fl@n621.de>
+Date: Sun, 17 Aug 2025 00:20:57 +0200
+Subject: [PATCH] fix build on i386 without SSE2
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Commit 3cba6b1 ("Use _Float16 for half conversions if available") added
+support for using half-width float support in the compiler to perform
+encoding operations, using the FLT16_MANT_DIG macro to check for
+support on the given target.
+
+However, on x86 GCC only supports this when SSE2 is enabled[1]. Unlike
+clang and the other architectures where support for this is conditional,
+GCC *does* define those macros even without SSE2 support, causing a
+build failure:
+
+  In file included from cborencoder_float.c:29:
+  cborinternal_p.h: In function ‘encode_half’:
+  cborinternal_p.h:56:5: error: invalid conversion to type ‘_Float16’ without option ‘-msse2’
+     56 |     _Float16 f = (_Float16)x;
+        |     ^~~~~~~~
+  cborinternal_p.h: In function ‘decode_half’:
+  cborinternal_p.h:65:5: error: invalid conversion from type ‘_Float16’ without option ‘-msse2’
+     65 |     return (float)f;
+        |
+
+Work around this by additionally checking for this specific condition.
+
+[1] https://gcc.gnu.org/onlinedocs/gcc/Half-Precision.html
+
+Upstream: https://github.com/intel/tinycbor/commit/48a22bddfcc67b3a433ded695f906cc314a0bd5f
+Signed-off-by: Florian Larysch <fl@n621.de>
+---
+ src/cborinternal_p.h | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/src/cborinternal_p.h b/src/cborinternal_p.h
+index 19273ac..ee9c117 100644
+--- a/src/cborinternal_p.h
++++ b/src/cborinternal_p.h
+@@ -48,8 +48,12 @@
+ /* Check for FLT16_MANT_DIG using integer comparison. Clang headers incorrectly
+  * define this macro unconditionally when __STDC_WANT_IEC_60559_TYPES_EXT__
+  * is defined (regardless of actual support for _Float16).
++ *
++ * GCC defines these macros but doesn't support arithmetic including
++ * conversions on x86 without SSE2.
+  */
+-#  if FLT16_MANT_DIG > 0 || __FLT16_MANT_DIG__ > 0
++#  if (FLT16_MANT_DIG > 0 || __FLT16_MANT_DIG__ > 0) && \
++      !(defined(__i386__) && !defined(__SSE2__))
+ static inline unsigned short encode_half(float x)
+ {
+     unsigned short h;
+-- 
+2.50.1
+
diff --git a/package/tinycbor/tinycbor.hash b/package/tinycbor/tinycbor.hash
index 0e616d1e9f..dd63822908 100644
--- a/package/tinycbor/tinycbor.hash
+++ b/package/tinycbor/tinycbor.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  512e2c9fce74f60ef9ed3af59161e905f9e19f30a52e433fc55f39f4c70d27e4  tinycbor-0.6.0.tar.gz
+sha256  0f9944496d1143935e9c996bc6233ca0dd5451299def33ef400a409942f8f34b  tinycbor-0.6.1.tar.gz
 sha256  3c6ba0b5bfa7830505301ffb336a17b0748e0d61c4d34216e9dc98f10e40395e  LICENSE
diff --git a/package/tinycbor/tinycbor.mk b/package/tinycbor/tinycbor.mk
index d2fb583e67..03067edbd7 100644
--- a/package/tinycbor/tinycbor.mk
+++ b/package/tinycbor/tinycbor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TINYCBOR_VERSION = 0.6.0
+TINYCBOR_VERSION = 0.6.1
 TINYCBOR_SITE = $(call github,intel,tinycbor,v$(TINYCBOR_VERSION))
 TINYCBOR_LICENSE = MIT
 TINYCBOR_LICENSE_FILES = LICENSE

--===============7197193919186109053==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7197193919186109053==--
