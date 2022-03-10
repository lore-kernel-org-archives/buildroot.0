Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A4F8C433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 22:20:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3388B40BB1;
	Thu, 10 Mar 2022 22:20:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C4_r0U14lRNr; Thu, 10 Mar 2022 22:20:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6EA2E40BAD;
	Thu, 10 Mar 2022 22:20:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 127021BF34D
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 22:20:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0187761281
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 22:20:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zsFw1d7Ahx3R for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 22:20:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8266F60BBC
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 22:20:34 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 r187-20020a1c2bc4000000b003810e6b192aso4306783wmr.1
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 14:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q9Fg7AznRki8JbWlFqoJ/mqj/2CbP073IbsiEEI4avU=;
 b=RyQPGe9S5ehQ9UJ7BVrevDTgbJZCm3hRj3F/QR+zZTxGu2ecWPTTfSpf4kbAtmZaAM
 4ZD7YJePqk8u8KKUk0bKCLc59YZhJ2Dd78LWpgfeT4E2HS1Xh5X/5Ee6Geyz9oF975ve
 T+DMRxjPEHT3GBkr+ngUjnWmVKgb8QOdt/rXmmc4X/Ujc3ZolX9gSBnG0KO81u+v+aSG
 DKl5d04si4JnM+50fTICikiYtnk4UzTXRG5oA9K2tlcxu5wRAomCmm0hq6AKqMj9/HxV
 UTU2kE/s473dhf7dRGhKFTUxFh0qDEQsc0j7vj9H4CzxPYefYySVaeRqha091bbbkYgZ
 jXAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q9Fg7AznRki8JbWlFqoJ/mqj/2CbP073IbsiEEI4avU=;
 b=5DRU+UlW67jjZO7xJGSyTJZmNUHnpZhOlmYwxnPAqNaUKrEMheylZA6am5OsVzLxos
 txo1T+wjbPokJCi5EsYGp/WnfMJ2zDC2/sss1qhLgp2cpo12QgXxCM+9cO5RTVjJzjI5
 /4cbHkJV3tnKU3/xBOBMsJDH/kLJXRwr9wg9iAGSE5NPRG1T+1nh3Rt1X7bbnIv4XJXA
 yEPvLWjUW1rpUrk3C1em2H0MeKVp7RlSh/zrGD3hu3PZNP0tpyn7VlHPm32YkZLazk9n
 BqTMu04zRepxRx9nJzcNKo2lpuVBGxxebWUrkIhGuBfZJqr9QOl/2rAwoUjDUESWOIaM
 ckIA==
X-Gm-Message-State: AOAM532aI/K4sPQ0qAeBACUlLQe1LiDyv+FZHwUMGqxvdT8fyqyt4ou0
 kxFhGVijnXMOMnN51+4TD9gcUUn3wCI=
X-Google-Smtp-Source: ABdhPJwX+abT1CUl0+gxOLD9LLI354fTq3j0TCGK/AVEh31v9dUAkcanna6KnOivXtSFvEw+3aLkRw==
X-Received: by 2002:a1c:6a08:0:b0:388:73a2:1548 with SMTP id
 f8-20020a1c6a08000000b0038873a21548mr5326928wmc.163.1646950832300; 
 Thu, 10 Mar 2022 14:20:32 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 o6-20020a5d6846000000b001f044a8e214sm5027143wrw.107.2022.03.10.14.20.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 14:20:31 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 10 Mar 2022 23:19:08 +0100
Message-Id: <20220310221908.30588-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,
 1/1] package/kvm-unit-tests: bump to version 2022-03-08
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Cyril Bur <cyrilbur@gmail.com>, Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Switch site:
  https://git.kernel.org/pub/scm/virt/kvm/kvm-unit-tests.git/commit/?id=f271e1b630a1b8b5f4eae2331654fc1e70abfd66
- Update first patch
- Drop second patch (binutils < 2.23 is not supported by buildroot
  anymore)
- Drop third and fourth patches (already in version)
- This bump will fix the following build failure with powerpc and gcc 11
  thanks to
  https://gitlab.com/kvm-unit-tests/kvm-unit-tests/-/commit/0c111b370ad3c5a89e11caee79bc93a66fd004f2

/tmp/ccSlivNE.s:348: Error: `lswx' invalid when little-endian

Fixes:
 - http://autobuild.buildroot.org/results/746e87892ac545e8fb97c17d4bfd7bd7bbc9d8be

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Huth):
 - Drop second patch

 ...emove-Werror-to-avoid-build-failures.patch |  17 +--
 ...vm-unit-tests-test-for-rdseed-rdrand.patch | 110 ------------------
 ...3-Makefile-fix-stack-protector-tests.patch |  36 ------
 ...issue-with-the-linker-from-Fedora-32.patch |  61 ----------
 package/kvm-unit-tests/kvm-unit-tests.hash    |   2 +-
 package/kvm-unit-tests/kvm-unit-tests.mk      |   6 +-
 6 files changed, 14 insertions(+), 218 deletions(-)
 delete mode 100644 package/kvm-unit-tests/0002-kvm-unit-tests-test-for-rdseed-rdrand.patch
 delete mode 100644 package/kvm-unit-tests/0003-Makefile-fix-stack-protector-tests.patch
 delete mode 100644 package/kvm-unit-tests/0004-Fix-powerpc-issue-with-the-linker-from-Fedora-32.patch

diff --git a/package/kvm-unit-tests/0001-Makefile-remove-Werror-to-avoid-build-failures.patch b/package/kvm-unit-tests/0001-Makefile-remove-Werror-to-avoid-build-failures.patch
index cbfa3a87e6..d07b9b6912 100644
--- a/package/kvm-unit-tests/0001-Makefile-remove-Werror-to-avoid-build-failures.patch
+++ b/package/kvm-unit-tests/0001-Makefile-remove-Werror-to-avoid-build-failures.patch
@@ -6,6 +6,8 @@ Subject: [PATCH] Makefile: remove -Werror to avoid build failures
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 [Matthew: Refactoring of Thomas Petazzoni's original.]
 Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
+[Fabrice: updated for 2022-03-08]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  Makefile | 1 -
  1 file changed, 1 deletion(-)
@@ -14,14 +16,15 @@ diff --git a/Makefile b/Makefile
 index 7231334..d9ad42b 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -53,7 +53,6 @@ cc-option = $(shell if $(CC) $(1) -S -o /dev/null -xc /dev/null \
- COMMON_CFLAGS += -g $(autodepend-flags)
- COMMON_CFLAGS += -Wall -Wwrite-strings -Wclobbered -Wempty-body -Wuninitialized
- COMMON_CFLAGS += -Wignored-qualifiers -Wunused-but-set-parameter
--COMMON_CFLAGS += -Werror
+@@ -53,7 +53,7 @@ cc-option = $(shell if $(CC) $(1) -S -o /dev/null -xc /dev/null \
+ 
+ COMMON_CFLAGS += -g $(autodepend-flags) -fno-strict-aliasing -fno-common
+ COMMON_CFLAGS += -Wall -Wwrite-strings -Wempty-body -Wuninitialized
+-COMMON_CFLAGS += -Wignored-qualifiers -Werror -Wno-missing-braces
++COMMON_CFLAGS += -Wignored-qualifiers -Wno-missing-braces
+
  frame-pointer-flag=-f$(if $(KEEP_FRAME_POINTER),no-,)omit-frame-pointer
  fomit_frame_pointer := $(call cc-option, $(frame-pointer-flag), "")
- fnostack_protector := $(call cc-option, -fno-stack-protector, "")
--- 
+- 
 2.14.2
 
diff --git a/package/kvm-unit-tests/0002-kvm-unit-tests-test-for-rdseed-rdrand.patch b/package/kvm-unit-tests/0002-kvm-unit-tests-test-for-rdseed-rdrand.patch
deleted file mode 100644
index 1a1a90ce99..0000000000
--- a/package/kvm-unit-tests/0002-kvm-unit-tests-test-for-rdseed-rdrand.patch
+++ /dev/null
@@ -1,110 +0,0 @@
-From 8d9a62a5fa89001266352a929c5d40b28c0dda85 Mon Sep 17 00:00:00 2001
-From: Matt Weber <matthew.weber@rockwellcollins.com>
-Date: Fri, 12 Jan 2018 19:07:27 -0600
-Subject: [PATCH] kvm-unit-tests: test for rdseed/rdrand
-
-The build fails when the host binutils isn't at least 2.23
-(2.22.x introduced RDSEED).
-
-Fixes:
-http://autobuild.buildroot.net/results/c39/c3987a3cbd2960b0ff50f872636bdfd8d1a9c820/
-
-Upstream:
-https://marc.info/?l=kvm&m=151580743523259&w=2
-
-Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
----
- Makefile        |  2 +-
- configure       | 18 ++++++++++++++++++
- x86/vmx_tests.c |  6 ++++++
- 3 files changed, 25 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index d9ad42b..799e9b5 100644
---- a/Makefile
-+++ b/Makefile
-@@ -50,7 +50,7 @@ include $(SRCDIR)/$(TEST_DIR)/Makefile
- cc-option = $(shell if $(CC) $(1) -S -o /dev/null -xc /dev/null \
-               > /dev/null 2>&1; then echo "$(1)"; else echo "$(2)"; fi ;)
- 
--COMMON_CFLAGS += -g $(autodepend-flags)
-+COMMON_CFLAGS += -g $(autodepend-flags) $(EXTRA_CFLAGS)
- COMMON_CFLAGS += -Wall -Wwrite-strings -Wclobbered -Wempty-body -Wuninitialized
- COMMON_CFLAGS += -Wignored-qualifiers -Wunused-but-set-parameter
- frame-pointer-flag=-f$(if $(KEEP_FRAME_POINTER),no-,)omit-frame-pointer
-diff --git a/configure b/configure
-index dd9d361..21c0219 100755
---- a/configure
-+++ b/configure
-@@ -171,6 +171,23 @@ mkdir -p lib
- ln -sf "$asm" lib/asm
- 
- 
-+cat > rd_test.c <<EOF
-+#include <stdint.h>
-+int main() {
-+   uint16_t seed=0;
-+   unsigned char ok;
-+   asm volatile ("rdseed %0; setc %1"
-+                 : "=r" (seed), "=qm" (ok));
-+   return ok;
-+}
-+EOF
-+if $cross_prefix$cc -o /dev/null rd_test.c &> /dev/null; then
-+  echo "Checking for rdseed/rdrand... Yes."
-+else
-+  echo "Checking for rdseed/rdrand... No."
-+  extra_cflags="-DNO_RDSEEDRAND"
-+fi
-+
- # create the config
- cat <<EOF > config.mak
- SRCDIR=$srcdir
-@@ -181,6 +198,7 @@ ARCH_NAME=$arch_name
- PROCESSOR=$processor
- CC=$cross_prefix$cc
- CXX=$cross_prefix$cxx
-+EXTRA_CFLAGS=$extra_cflags
- LD=$cross_prefix$ld
- OBJCOPY=$cross_prefix$objcopy
- OBJDUMP=$cross_prefix$objdump
-diff --git a/x86/vmx_tests.c b/x86/vmx_tests.c
-index 4a3e94b..2cbe3eb 100644
---- a/x86/vmx_tests.c
-+++ b/x86/vmx_tests.c
-@@ -770,8 +770,10 @@ asm(
- 	"insn_sldt: sldt %ax;ret\n\t"
- 	"insn_lldt: xor %eax, %eax; lldt %ax;ret\n\t"
- 	"insn_str: str %ax;ret\n\t"
-+#ifndef NO_RDSEEDRAND
- 	"insn_rdrand: rdrand %rax;ret\n\t"
- 	"insn_rdseed: rdseed %rax;ret\n\t"
-+#endif
- );
- extern void insn_hlt();
- extern void insn_invlpg();
-@@ -796,8 +798,10 @@ extern void insn_lldt();
- extern void insn_str();
- extern void insn_cpuid();
- extern void insn_invd();
-+#ifndef NO_RDSEEDRAND
- extern void insn_rdrand();
- extern void insn_rdseed();
-+#endif
- 
- u32 cur_insn;
- u64 cr3;
-@@ -853,8 +857,10 @@ static struct insn_table insn_table[] = {
- 	{"DESC_TABLE (LLDT)", CPU_DESC_TABLE, insn_lldt, INSN_CPU1, 47, 0, 0, 0},
- 	{"DESC_TABLE (STR)", CPU_DESC_TABLE, insn_str, INSN_CPU1, 47, 0, 0, 0},
- 	/* LTR causes a #GP if done with a busy selector, so it is not tested.  */
-+#ifndef NO_RDSEEDRAND
- 	{"RDRAND", CPU_RDRAND, insn_rdrand, INSN_CPU1, VMX_RDRAND, 0, 0, 0},
- 	{"RDSEED", CPU_RDSEED, insn_rdseed, INSN_CPU1, VMX_RDSEED, 0, 0, 0},
-+#endif
- 	// Instructions always trap
- 	{"CPUID", 0, insn_cpuid, INSN_ALWAYS_TRAP, 10, 0, 0, 0},
- 	{"INVD", 0, insn_invd, INSN_ALWAYS_TRAP, 13, 0, 0, 0},
--- 
-1.9.1
-
diff --git a/package/kvm-unit-tests/0003-Makefile-fix-stack-protector-tests.patch b/package/kvm-unit-tests/0003-Makefile-fix-stack-protector-tests.patch
deleted file mode 100644
index be819f27c6..0000000000
--- a/package/kvm-unit-tests/0003-Makefile-fix-stack-protector-tests.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 9bf9155804652c0b3a94af9723c79b6de430187b Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 24 Feb 2020 00:04:06 +0100
-Subject: [PATCH] Makefile: fix stack-protector tests
-
-Rename fnostack_protector into fno_stack_protector and
-fnostack_protector_all into fnostack_protector_all otherwise build will
-fail if -fstack-protector is passed by the toolchain
-
-Fixes:
- - http://autobuild.buildroot.org/results/ad689b08173548af21dd1fb0e827fd561de6dfef
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: sent to kvm@vger.kernel.org]
----
- Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 767b6c6..754ed65 100644
---- a/Makefile
-+++ b/Makefile
-@@ -55,8 +55,8 @@ COMMON_CFLAGS += -Wignored-qualifiers -Werror
- 
- frame-pointer-flag=-f$(if $(KEEP_FRAME_POINTER),no-,)omit-frame-pointer
- fomit_frame_pointer := $(call cc-option, $(frame-pointer-flag), "")
--fnostack_protector := $(call cc-option, -fno-stack-protector, "")
--fnostack_protector_all := $(call cc-option, -fno-stack-protector-all, "")
-+fno_stack_protector := $(call cc-option, -fno-stack-protector, "")
-+fno_stack_protector_all := $(call cc-option, -fno-stack-protector-all, "")
- wno_frame_address := $(call cc-option, -Wno-frame-address, "")
- fno_pic := $(call cc-option, -fno-pic, "")
- no_pie := $(call cc-option, -no-pie, "")
--- 
-2.25.0
-
diff --git a/package/kvm-unit-tests/0004-Fix-powerpc-issue-with-the-linker-from-Fedora-32.patch b/package/kvm-unit-tests/0004-Fix-powerpc-issue-with-the-linker-from-Fedora-32.patch
deleted file mode 100644
index 1768c668b7..0000000000
--- a/package/kvm-unit-tests/0004-Fix-powerpc-issue-with-the-linker-from-Fedora-32.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 5126732d73aa75a0bc84f898042bfe35640624b8 Mon Sep 17 00:00:00 2001
-From: Thomas Huth <thuth@redhat.com>
-Date: Wed, 13 May 2020 13:14:46 +0200
-Subject: [PATCH] Fix powerpc issue with the linker from Fedora 32
-
-The linker from Fedora 32 complains:
-
-powerpc64-linux-gnu-ld: powerpc/selftest.elf: error: PHDR segment not
- covered by LOAD segment
-
-Let's introduce some fake PHDRs to the linker script to get this
-working again.
-
-Message-Id: <20200514192626.9950-7-thuth@redhat.com>
-Signed-off-by: Thomas Huth <thuth@redhat.com>
-Signed-off-by: Matthew Weber <matthew.weber@collins.com>
----
- powerpc/flat.lds | 19 ++++++++++++++++---
- 1 file changed, 16 insertions(+), 3 deletions(-)
-
-diff --git a/powerpc/flat.lds b/powerpc/flat.lds
-index 53221e8..5eed368 100644
---- a/powerpc/flat.lds
-+++ b/powerpc/flat.lds
-@@ -1,7 +1,17 @@
- 
-+PHDRS
-+{
-+    text PT_LOAD FLAGS(5);
-+    data PT_LOAD FLAGS(6);
-+}
-+
- SECTIONS
- {
--    .text : { *(.init) *(.text) *(.text.*) }
-+    .text : {
-+        *(.init)
-+        *(.text)
-+        *(.text.*)
-+    } :text
-     . = ALIGN(64K);
-     etext = .;
-     .opd : { *(.opd) }
-@@ -19,9 +29,12 @@ SECTIONS
-     .data : {
-         *(.data)
-         *(.data.rel*)
--    }
-+    } :data
-     . = ALIGN(16);
--    .rodata : { *(.rodata) *(.rodata.*) }
-+    .rodata : {
-+        *(.rodata)
-+        *(.rodata.*)
-+    } :data
-     . = ALIGN(16);
-     .bss : { *(.bss) }
-     . = ALIGN(256);
--- 
-2.17.1
-
diff --git a/package/kvm-unit-tests/kvm-unit-tests.hash b/package/kvm-unit-tests/kvm-unit-tests.hash
index ad500d04f2..42c3b4a241 100644
--- a/package/kvm-unit-tests/kvm-unit-tests.hash
+++ b/package/kvm-unit-tests/kvm-unit-tests.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e476443cd76c8f540734e075b419638b2f200ae002986d6fc14076d410f3751e  kvm-unit-tests-kvm-unit-tests-20171020-br1.tar.gz
+sha256  c2edf2b188033a5d634150ecc797c797a85e5af8e3ef4ac3e583f60b2ee7bcf3  kvm-unit-tests-v2022-03-08.tar.bz2
 sha256  d9bbb60891710d248f01c8bdac50ef7ad39188de512610437872e83112b38a1b  COPYRIGHT
diff --git a/package/kvm-unit-tests/kvm-unit-tests.mk b/package/kvm-unit-tests/kvm-unit-tests.mk
index a972602fb9..d610442e03 100644
--- a/package/kvm-unit-tests/kvm-unit-tests.mk
+++ b/package/kvm-unit-tests/kvm-unit-tests.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-KVM_UNIT_TESTS_VERSION = kvm-unit-tests-20171020
-KVM_UNIT_TESTS_SITE = https://git.kernel.org/pub/scm/virt/kvm/kvm-unit-tests.git
-KVM_UNIT_TESTS_SITE_METHOD = git
+KVM_UNIT_TESTS_VERSION = 2022-03-08
+KVM_UNIT_TESTS_SOURCE = kvm-unit-tests-v$(KVM_UNIT_TESTS_VERSION).tar.bz2
+KVM_UNIT_TESTS_SITE = https://gitlab.com/kvm-unit-tests/kvm-unit-tests/-/archive/v$(KVM_UNIT_TESTS_VERSION)
 KVM_UNIT_TESTS_LICENSE = LGPL-2.0
 KVM_UNIT_TESTS_LICENSE_FILES = COPYRIGHT
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
