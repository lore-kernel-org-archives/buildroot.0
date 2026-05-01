Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B2ECCFA13
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 15:32:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6145740F91;
	Fri,  1 May 2026 15:32:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lIg0oH2ZzYVo; Fri,  1 May 2026 15:32:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 490C54266B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777649531;
	bh=DRBwceNvj50vCmW6Nko3BZMlawXbHeVKvhVFJ74ucMU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=UmRulp2fVBQjmxEWXjbAWlD5fi98+2TvjvCq00MTYT2i73iji2SH6rEWr6ke791v5
	 p15XUb9k0IVScX9jZCHE6cch4EA26xrQO6PD2MIUVhqg84BZWiwP2Z5DykFO6TLPDk
	 wABE6/1FfkNNIxCCHk6SdgWN84WLmcoJp/FPihxMcduTR3ahaoUFKvUE2VBQ+i8owe
	 RrzmHQ4QCp4B2pLBccrCQh/bLka4pkGxwGRddg3SyzTU9pkBh2C8zE6D9gls7ubMh8
	 fPW7LN9ese23I8FPHpausf2Vet0aV1Vlbm+zTcLnuzycJEThYXZfuBxAcOph+TLy/p
	 g6OX7ZuZI8bdg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 490C54266B;
	Fri,  1 May 2026 15:32:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8FF1D127
 for <buildroot@buildroot.org>; Fri,  1 May 2026 15:32:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 75D656F761
 for <buildroot@buildroot.org>; Fri,  1 May 2026 15:32:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xQwqet-q0gNa for <buildroot@buildroot.org>;
 Fri,  1 May 2026 15:32:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4797F61BBC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4797F61BBC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4797F61BBC
 for <buildroot@buildroot.org>; Fri,  1 May 2026 15:32:08 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BD63BA4C0255;
 Fri,  1 May 2026 17:28:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42324)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIpmc-00000000172-0gXm;
 Fri, 01 May 2026 15:28:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 17:27:54 +0200
Message-ID: <20260501152758.2610763-19-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501152758.2610763-1-bernd@kuhls.net>
References: <20260501152758.2610763-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777649283;
 bh=PD+YkTC32JltZWK5NFNEokWbD3iCckKWRmwzmPyOlhI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=JYwYXux5HYJppdQhfllv0AcatZekOczuzPWQzLp8wefVvOMV9rtRBinHsWjWSCMX0
 jLZErEDSJabc+fBr5D4hmI1l8gCeQ79HYSZd9gAidLbBF5BEhFv00TfXLuv8CWui9X
 o02zcn8ybiESZ2KOK/jgnpy9R34gno75be+BWoeRiW6r7eTUv0oloa7WFMK1oWm+Nx
 NstmCmDdMDMe4kWKA7YW0Y1FiGZ7SsQqenT8AotdNyRCJt2eQdwR/DIIqQpdSr/w4h
 VMpTqJlM86v1KBfMW/KKZJmc+cHLCT44qdJsqwQSGINK9MuZ9RTgse+DVpsXBJWGZ0
 5vPc01uKJ3Gow==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=JYwYXux5
Subject: [Buildroot] [PATCH v4 18/21] package/gcc: add version 16.1.0
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Tudor Holton <buildroot@tudorholton.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Added libatomic to HOST_GCC_INITIAL_EXCLUDES to fix linking error with
libc:

output/host/lib/gcc/x86_64-buildroot-linux-gnu/16.0.1/../../../../x86_64-buildroot-linux-gnu/bin/ld:
 cannot find -latomic_asneeded: No such file or directory

caused by upstream commit
https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=e63cf4b130b86dd7dde1bf499d3d40faca10ea2e
which added libatomic/ to $bootstrap_target_libs.

For details see https://gcc.gnu.org/bugzilla/show_bug.cgi?id=81358

Copied patches 0001 & 0003 from package/gcc/15.2.0/
Patch 0002 was applied upstream:
https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=7894c00982c570d684fe5b82d8fb3aafc34d6986

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .checkpackageignore                           |  1 +
 ...le-split-stack-for-non-thread-builds.patch | 26 +++++++++
 ...-config-microblaze-fix-ira-for-GCC15.patch | 56 +++++++++++++++++++
 package/gcc/Config.in.host                    |  9 +++
 package/gcc/gcc-initial/gcc-initial.mk        |  2 +-
 package/gcc/gcc.hash                          |  2 +
 6 files changed, 95 insertions(+), 1 deletion(-)
 create mode 100644 package/gcc/16.1.0/0001-disable-split-stack-for-non-thread-builds.patch
 create mode 100644 package/gcc/16.1.0/0002-gcc-config-microblaze-fix-ira-for-GCC15.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 6147aae299..f53d4c931d 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -358,6 +358,7 @@ package/fxload/0001-fix-static-build.patch lib_patch.Upstream
 package/gcc/13.4.0/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
 package/gcc/14.3.0/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
 package/gcc/15.2.0/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
+package/gcc/16.1.0/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
 package/gcc/8.4.0/0001-xtensa-fix-PR-target-91880.patch lib_patch.Upstream
 package/gcc/8.4.0/0002-Revert-re-PR-target-92095-internal-error-with-O1-mcp.patch lib_patch.Upstream
 package/gcc/8.4.0/0003-libsanitizer-Remove-cyclades-from-libsanitizer.patch lib_patch.Upstream
diff --git a/package/gcc/16.1.0/0001-disable-split-stack-for-non-thread-builds.patch b/package/gcc/16.1.0/0001-disable-split-stack-for-non-thread-builds.patch
new file mode 100644
index 0000000000..c3b600cfb8
--- /dev/null
+++ b/package/gcc/16.1.0/0001-disable-split-stack-for-non-thread-builds.patch
@@ -0,0 +1,26 @@
+From 7d5f59e035341430e20f47420535d0e987516e55 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Mon, 25 Jul 2022 00:29:55 +0200
+Subject: [PATCH] disable split-stack for non-thread builds
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+[Romain: convert to git format]
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ libgcc/config/t-stack | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/libgcc/config/t-stack b/libgcc/config/t-stack
+index cc0366b4cd8..f3f97e86d60 100644
+--- a/libgcc/config/t-stack
++++ b/libgcc/config/t-stack
+@@ -1,4 +1,6 @@
+ # Makefile fragment to provide generic support for -fsplit-stack.
+ # This should be used in config.host for any host which supports
+ # -fsplit-stack.
++ifeq ($(enable_threads),yes)
+ LIB2ADD_ST += $(srcdir)/generic-morestack.c $(srcdir)/generic-morestack-thread.c
++endif
+-- 
+2.50.1
+
diff --git a/package/gcc/16.1.0/0002-gcc-config-microblaze-fix-ira-for-GCC15.patch b/package/gcc/16.1.0/0002-gcc-config-microblaze-fix-ira-for-GCC15.patch
new file mode 100644
index 0000000000..663aab7218
--- /dev/null
+++ b/package/gcc/16.1.0/0002-gcc-config-microblaze-fix-ira-for-GCC15.patch
@@ -0,0 +1,56 @@
+From d2fdbd8c4abe67eea86877dfb3b3b9d8508c165f Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Wed, 6 Aug 2025 22:32:30 +0200
+Subject: [PATCH] gcc/config/microblaze: fix ira for GCC15
+
+Add new hooks for callee-save on microblaze defined by [1] and
+return 1 to restore the old behavior prior to the commit [3].
+
+Tested with qemu_microblazeel_mmu_defconfig and used to generate
+Microblaze toolchains for the Bootlin toolchains 2025.08-1 [4][5].
+
+Upstream: suggested in the bug report: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=121432#c10
+
+[1] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=b191e8bdecf881d11c1544c441e38f4c18392a15
+[2] https://gcc.gnu.org/git/?p=gcc.git;a=blob;f=gcc/config/i386/i386.cc;h=3128973ba79cccfc6761f451dcb716b9558cc4da;hb=d3ff498c478acefce35de04402f99171b4f64a1a#l20606
+[3] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=3b9b8d6cfdf59337f4b7ce10ce92a98044b2657b
+[4] https://lore.kernel.org/buildroot/87sehzndtp.fsf@dell.be.48ers.dk/T/#mce7decd0b3f6a41008d5de577538a8525c91b374
+[5] https://toolchains.bootlin.com/
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ gcc/config/microblaze/microblaze.cc | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/gcc/config/microblaze/microblaze.cc b/gcc/config/microblaze/microblaze.cc
+index 78b9428ef3b..84ea7e8d55a 100644
+--- a/gcc/config/microblaze/microblaze.cc
++++ b/gcc/config/microblaze/microblaze.cc
+@@ -3228,6 +3228,14 @@ microblaze_secondary_reload (bool in_p ATTRIBUTE_UNUSED, rtx x ATTRIBUTE_UNUSED,
+   return NO_REGS;
+ }
+ 
++/* Implement TARGET_CALLEE_SAVE_COST.  */
++static int
++microblaze_callee_save_cost (spill_cost_type, unsigned int hard_regno, machine_mode,
++		       unsigned int, int mem_cost, const HARD_REG_SET &, bool)
++{
++  return 1;
++}
++
+ static void
+ microblaze_globalize_label (FILE * stream, const char *name)
+ {
+@@ -4066,6 +4074,9 @@ microblaze_starting_frame_offset (void)
+ #undef TARGET_SECONDARY_RELOAD
+ #define TARGET_SECONDARY_RELOAD		microblaze_secondary_reload
+ 
++#undef TARGET_CALLEE_SAVE_COST
++#define TARGET_CALLEE_SAVE_COST microblaze_callee_save_cost
++
+ #undef  TARGET_ASM_OUTPUT_MI_THUNK
+ #define TARGET_ASM_OUTPUT_MI_THUNK      microblaze_asm_output_mi_thunk
+ 
+-- 
+2.50.1
+
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 21581487df..b9dd37471f 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -46,6 +46,14 @@ config BR2_GCC_VERSION_15_X
 	depends on !BR2_POWERPC_CPU_HAS_SPE
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 
+config BR2_GCC_VERSION_16_X
+	bool "gcc 16.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
+	# powerpc spe support has been deprecated since gcc 8.x.
+	# https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
+	depends on !BR2_POWERPC_CPU_HAS_SPE
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+
 endchoice
 
 config BR2_GCC_SUPPORTS_DLANG
@@ -71,6 +79,7 @@ config BR2_GCC_VERSION
 	default "13.4.0"    if BR2_GCC_VERSION_13_X
 	default "14.3.0"    if BR2_GCC_VERSION_14_X
 	default "15.2.0"    if BR2_GCC_VERSION_15_X
+	default "16.1.0"    if BR2_GCC_VERSION_16_X
 	default "arc-2024.12-release" if BR2_GCC_VERSION_ARC
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
index 1f8b76a942..18d5cef0f8 100644
--- a/package/gcc/gcc-initial/gcc-initial.mk
+++ b/package/gcc/gcc-initial/gcc-initial.mk
@@ -17,7 +17,7 @@ HOST_GCC_INITIAL_DL_SUBDIR = gcc
 
 HOST_GCC_INITIAL_DEPENDENCIES = $(HOST_GCC_COMMON_DEPENDENCIES)
 
-HOST_GCC_INITIAL_EXCLUDES = $(HOST_GCC_EXCLUDES)
+HOST_GCC_INITIAL_EXCLUDES = $(HOST_GCC_EXCLUDES) libatomic
 
 ifneq ($(ARCH_XTENSA_OVERLAY_FILE),)
 HOST_GCC_INITIAL_POST_EXTRACT_HOOKS += HOST_GCC_XTENSA_OVERLAY_EXTRACT
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index deb7c40fa3..da6aa6e879 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -6,6 +6,8 @@ sha512  9b4b83ecf51ef355b868608b8d257b2fa435c06d2719cb86657a7c2c2a0828ff4ce04e9b
 sha512  cb4e3259640721bbd275c723fe4df53d12f9b1673afb3db274c22c6aa457865dccf2d6ea20b4fd4c591f6152e6d4b87516c402015900f06ce9d43af66d3b7a93  gcc-14.3.0.tar.xz
 # From https://gcc.gnu.org/pub/gcc/releases/gcc-15.2.0/sha512.sum
 sha512  89047a2e07bd9da265b507b516ed3635adb17491c7f4f67cf090f0bd5b3fc7f2ee6e4cc4008beef7ca884b6b71dffe2bb652b21f01a702e17b468cca2d10b2de  gcc-15.2.0.tar.xz
+# From https://gcc.gnu.org/pub/gcc/releases/gcc-16.1.0/sha512.sum
+sha512  b3454958891ab47e1e5b6cb9396c0ad3b04f32fe2a7bf1153a143f21013fdb6b295ca94c98964698a688e4c1d7555ffd8ffbc20187507cce6b1c32cbcc09897a  gcc-16.1.0.tar.xz
 
 # Locally calculated (fetched from Github)
 sha512  7f08ae335d9112be65e92c3744c095d8fa265994b8282274948f99fe37409531e627e6dadfb77b138a82fa09d012c56d8c075b482a5a5186814a57f9db63c29e  gcc-arc-2024.12-release.tar.gz
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
