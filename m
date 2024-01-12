Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B7FCC4706C
	for <buildroot@archiver.kernel.org>; Fri, 12 Jan 2024 18:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA6B760C20;
	Fri, 12 Jan 2024 18:47:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA6B760C20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T81p3eQyrCsP; Fri, 12 Jan 2024 18:47:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E469D6FAB4;
	Fri, 12 Jan 2024 18:47:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E469D6FAB4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7EB2D1BF83B
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 18:46:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5798542F7F
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 18:46:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5798542F7F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wOupKe10-4kL for <buildroot@lists.busybox.net>;
 Fri, 12 Jan 2024 18:46:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9FD0442F8D
 for <buildroot@buildroot.org>; Fri, 12 Jan 2024 18:46:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FD0442F8D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8191884BE0; Fri, 12 Jan 2024 18:46:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 12 Jan 2024 19:40:54 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: f1c2cbf52d3f574ebbbe249dcf92ec7a9e1881ea
X-Git-Newrev: 85efbb32ecdeee03c915a5e55662fca02489afe5
X-Patchwork-Hint: ignore
Message-Id: <20240112184656.8191884BE0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/gcc: pass
 toolchain wrapper flags during build
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=85efbb32ecdeee03c915a5e55662fca02489afe5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

With [1], [2] & [3] we made sure Buildroot packages get built with
proper MMU page size assumed. This was done nicely through insertion of
required flags into the toolchain wrapper so that there's no need to
pass these flags to each and every package separately - toolchain
wrapper used for real building has all set internally and so proper
flags are implicitly used.

But there's yet another corner case which is not handled that way -
these are binaries or rather libraries which are being used as a part of
GCC compilation: libgcc_s.so.1 and libstdc++.so.

And so to make sure both the libraries get built properly we need to
set TARGET_CFLAGS (cures libgcc_s.so) & TARGET_LDFLAGS (cures
libstdc++.so).

In case of ARM by defaut 64 KiB page size seems to be used, as w/o
that patch we see the following for BR2_ARM64_PAGE_SIZE_4K=y:

--------------------------->8----------------------------
$ ./output/host/bin/aarch64-linux-readelf -l ./output/target/lib/libgcc_s.so.1

Elf file type is DYN (Shared object file)
Entry point 0x0
There are 6 program headers, starting at offset 64

Program Headers:
  Type           Offset             VirtAddr           PhysAddr
                 FileSiz            MemSiz              Flags  Align
  LOAD           0x0000000000000000 0x0000000000000000 0x0000000000000000
                 0x0000000000013d1c 0x0000000000013d1c  R E    0x10000
  LOAD           0x000000000001fd98 0x000000000002fd98 0x000000000002fd98
                 0x0000000000000438 0x00000000000005c8  RW     0x10000
  DYNAMIC        0x000000000001fdb8 0x000000000002fdb8 0x000000000002fdb8
                 0x0000000000000200 0x0000000000000200  RW     0x8

$ ./output/host/bin/aarch64-linux-readelf -l ./output/target/usr/lib/libstdc++.so.6.0.32

Elf file type is DYN (Shared object file)
Entry point 0x0
There are 7 program headers, starting at offset 64

Program Headers:
  Type           Offset             VirtAddr           PhysAddr
                 FileSiz            MemSiz              Flags  Align
  LOAD           0x0000000000000000 0x0000000000000000 0x0000000000000000
                 0x00000000001d3462 0x00000000001d3462  R E    0x10000
  LOAD           0x00000000001d5760 0x00000000001e5760 0x00000000001e5760
                 0x000000000000e528 0x0000000000012de8  RW     0x10000
  DYNAMIC        0x00000000001deef0 0x00000000001eeef0 0x00000000001eeef0
                 0x0000000000000240 0x0000000000000240  RW     0x8
--------------------------->8----------------------------

Note alignment of 0x10000 in sections marked for loading.

And with the patch applied we get expected alignment of 0x1000 (4
KiB):

--------------------------->8----------------------------
$ ./output/host/bin/aarch64-linux-readelf -l ./output/target/lib/libgcc_s.so.1

Elf file type is DYN (Shared object file)
Entry point 0x0
There are 6 program headers, starting at offset 64

Program Headers:
  Type           Offset             VirtAddr           PhysAddr
                 FileSiz            MemSiz              Flags  Align
  LOAD           0x0000000000000000 0x0000000000000000 0x0000000000000000
                 0x0000000000013d1c 0x0000000000013d1c  R E    0x1000
  LOAD           0x0000000000013d98 0x0000000000014d98 0x0000000000014d98
                 0x0000000000000438 0x00000000000005c8  RW     0x1000
  DYNAMIC        0x0000000000013db8 0x0000000000014db8 0x0000000000014db8
                 0x0000000000000200 0x0000000000000200  RW     0x8

$ ./output/host/bin/aarch64-linux-readelf -l ./output/target/usr/lib/libstdc++.so.6.0.32

Elf file type is DYN (Shared object file)
Entry point 0x0
There are 7 program headers, starting at offset 64

Program Headers:
  Type           Offset             VirtAddr           PhysAddr
                 FileSiz            MemSiz              Flags  Align
  LOAD           0x0000000000000000 0x0000000000000000 0x0000000000000000
                 0x00000000001d3462 0x00000000001d3462  R E    0x1000
  LOAD           0x00000000001d3760 0x00000000001d4760 0x00000000001d4760
                 0x000000000000e528 0x0000000000012de8  RW     0x1000
  DYNAMIC        0x00000000001dcef0 0x00000000001ddef0 0x00000000001ddef0
                 0x0000000000000240 0x0000000000000240  RW     0x8
--------------------------->8----------------------------

A nice side effect is that we can get rid of the special handling of
"-matomic" as it's already part of ARCH_TOOLCHAIN_WRAPPER_OPTS.

[1] https://git.buildroot.net/buildroot/commit/?id=3cc2c6d19ab2e1bb4634f26f9318da9b07df5fff
[2] https://git.buildroot.net/buildroot/commit/?id=dcb74db89e74e512e36b32cea6f574a1a1ca84c4
[3] https://git.buildroot.net/buildroot/commit/?id=5e52c28397b79f8c4c99552217cbe95202166626

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Signed-off-by: Vladimir Isaev <VVIsaev@gmail.com>
Signed-off-by: Pavel Kozlov <kozlov@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 747dff5a366b6fa37788b0e8fc28781feb918f4f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/gcc.mk | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 834da24925..d5592b3974 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -95,23 +95,24 @@ HOST_GCC_COMMON_CONF_ENV = \
 HOST_GCC_COMMON_MAKE_OPTS = \
 	gcc_cv_prog_makeinfo_modern=no
 
-GCC_COMMON_TARGET_CFLAGS = $(TARGET_CFLAGS)
-GCC_COMMON_TARGET_CXXFLAGS = $(TARGET_CXXFLAGS)
+# Target binaries and libraries which are being built as a part of GCC
+# don't use Buildroot toolchain wrapper because, instead its very own "xgcc"
+# binary is used. And so we need to explicitly propagate ALL the flags
+# directly to "xgcc" and that is done via configure-time environment
+# variables, see below setup of HOST_GCC_COMMON_CONF_ENV.
+GCC_COMMON_TARGET_CFLAGS = $(TARGET_CFLAGS) $(ARCH_TOOLCHAIN_WRAPPER_OPTS)
+GCC_COMMON_TARGET_CXXFLAGS = $(TARGET_CXXFLAGS) $(ARCH_TOOLCHAIN_WRAPPER_OPTS)
+GCC_COMMON_TARGET_LDFLAGS = $(TARGET_LDFLAGS) $(ARCH_TOOLCHAIN_WRAPPER_OPTS)
 
 # used to fix ../../../../libsanitizer/libbacktrace/../../libbacktrace/elf.c:772:21: error: 'st.st_mode' may be used uninitialized in this function [-Werror=maybe-uninitialized]
 ifeq ($(BR2_ENABLE_DEBUG),y)
 GCC_COMMON_TARGET_CFLAGS += -Wno-error
 endif
 
-# Make sure libgcc & libstdc++ always get built with -matomic on ARC700
-ifeq ($(GCC_TARGET_CPU):$(BR2_ARC_ATOMIC_EXT),arc700:y)
-GCC_COMMON_TARGET_CFLAGS += -matomic
-GCC_COMMON_TARGET_CXXFLAGS += -matomic
-endif
-
 # Propagate options used for target software building to GCC target libs
 HOST_GCC_COMMON_CONF_ENV += CFLAGS_FOR_TARGET="$(GCC_COMMON_TARGET_CFLAGS)"
 HOST_GCC_COMMON_CONF_ENV += CXXFLAGS_FOR_TARGET="$(GCC_COMMON_TARGET_CXXFLAGS)"
+HOST_GCC_COMMON_CONF_ENV += LDFLAGS_FOR_TARGET="$(GCC_COMMON_TARGET_LDFLAGS)"
 HOST_GCC_COMMON_CONF_ENV += AR_FOR_TARGET=gcc-ar NM_FOR_TARGET=gcc-nm RANLIB_FOR_TARGET=gcc-ranlib
 
 # libitm needs sparc V9+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
