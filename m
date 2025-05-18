Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6113CC3ABDD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 11:05:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DE52849C4;
	Mon, 19 May 2025 11:04:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7lvHXahYEuUM; Mon, 19 May 2025 11:04:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B4BD83CB5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B4BD83CB5;
	Mon, 19 May 2025 11:04:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 44953D4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:49:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 75A2B41E64
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7vpeiSDkLjq2 for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30F7F41214
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 30F7F41214
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2C1F883BC0; Mon, 19 May 2025 10:40:09 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 18 May 2025 12:14:56 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7acb00cc1ada4a59d7a755922fa78e264cea9254
X-Git-Newrev: 6cce6d79d3a899722c75a99b7bd12e6274aaccaf
X-Patchwork-Hint: ignore
Message-Id: <20250519104009.2C1F883BC0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/llvm-project: fix
 build with gcc 15
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1281030137450506194=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1281030137450506194==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=6cce6d79d3a899722c75a99b7bd12e6274aaccaf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Adapt gentoo gcc patches from https://bugs.gentoo.org/939498 to fix
build with gcc 15.

The llvm project no longer maintains the llvm 15 branch.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../compiler-rt/0001-include-cstdint.patch         | 31 +++++++++++++++++++
 ...001-ADT-Add-cstdint-to-SmallVector-101761.patch | 35 ++++++++++++++++++++++
 ...lude-cstdint-in-AMDGPUMCTargetDesc-101766.patch | 31 +++++++++++++++++++
 .../0003-Another-gcc-15-fix-from-Sam-James.patch   | 31 +++++++++++++++++++
 4 files changed, 128 insertions(+)

diff --git a/package/llvm-project/compiler-rt/0001-include-cstdint.patch b/package/llvm-project/compiler-rt/0001-include-cstdint.patch
new file mode 100644
index 0000000000..ce75b29f4e
--- /dev/null
+++ b/package/llvm-project/compiler-rt/0001-include-cstdint.patch
@@ -0,0 +1,31 @@
+From 735207ac16bb15d88116bf00283eb0135ed2585a Mon Sep 17 00:00:00 2001
+From: Paul Zander <negril.nx+gentoo@gmail.com>
+Date: Thu, 22 Aug 2024 11:40:13 +0200
+Subject: [PATCH] include cstdint
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Gentoo-Component: compiler-rt
+Signed-off-by: Paul Zander <negril.nx+gentoo@gmail.com>
+Signed-off-by: Michał Górny <mgorny@gentoo.org>
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+Upstream: https://bugs.gentoo.org/939498
+---
+ lib/orc/error.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/lib/orc/error.h b/lib/orc/error.h
+index 92ac5a884ac6..33a599f71149 100644
+--- a/lib/orc/error.h
++++ b/lib/orc/error.h
+@@ -14,6 +14,7 @@
+ #include "stl_extras.h"
+ 
+ #include <cassert>
++#include <cstdint>
+ #include <memory>
+ #include <string>
+ #include <type_traits>
+-- 
+2.46.0
diff --git a/package/llvm-project/llvm/0001-ADT-Add-cstdint-to-SmallVector-101761.patch b/package/llvm-project/llvm/0001-ADT-Add-cstdint-to-SmallVector-101761.patch
new file mode 100644
index 0000000000..eea83c27a8
--- /dev/null
+++ b/package/llvm-project/llvm/0001-ADT-Add-cstdint-to-SmallVector-101761.patch
@@ -0,0 +1,35 @@
+From 51d88407c1ae86c3b3c7b497d049f8980f2a3510 Mon Sep 17 00:00:00 2001
+From: Sam James <sam@gentoo.org>
+Date: Fri, 2 Aug 2024 23:07:21 +0100
+Subject: [PATCH] [ADT] Add `<cstdint>` to SmallVector (#101761)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+SmallVector uses `uint32_t`, `uint64_t` without including `<cstdint>`
+which fails to build w/ GCC 15 after a change in libstdc++ [0]
+
+[0] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=3a817a4a5a6d94da9127af3be9f84a74e3076ee2
+
+Gentoo-Component: llvm
+Signed-off-by: Michał Górny <mgorny@gentoo.org>
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+Upstream: https://bugs.gentoo.org/939498
+---
+ include/llvm/ADT/SmallVector.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/include/llvm/ADT/SmallVector.h b/include/llvm/ADT/SmallVector.h
+index e34702bdbb3c..1c0f3465b2a9 100644
+--- a/include/llvm/ADT/SmallVector.h
++++ b/include/llvm/ADT/SmallVector.h
+@@ -19,6 +19,7 @@
+ #include <algorithm>
+ #include <cassert>
+ #include <cstddef>
++#include <cstdint>
+ #include <cstdlib>
+ #include <cstring>
+ #include <functional>
+-- 
+2.46.0
diff --git a/package/llvm-project/llvm/0002-AMDGPU-Include-cstdint-in-AMDGPUMCTargetDesc-101766.patch b/package/llvm-project/llvm/0002-AMDGPU-Include-cstdint-in-AMDGPUMCTargetDesc-101766.patch
new file mode 100644
index 0000000000..73beab6c23
--- /dev/null
+++ b/package/llvm-project/llvm/0002-AMDGPU-Include-cstdint-in-AMDGPUMCTargetDesc-101766.patch
@@ -0,0 +1,31 @@
+From 000f92beb459096534a7bfaa8c5e99d77b7594c1 Mon Sep 17 00:00:00 2001
+From: Sam James <sam@gentoo.org>
+Date: Sat, 3 Aug 2024 06:36:43 +0100
+Subject: [PATCH] [AMDGPU] Include `<cstdint>` in AMDGPUMCTargetDesc
+ (#101766)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Gentoo-Component: llvm
+Signed-off-by: Michał Górny <mgorny@gentoo.org>
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+Upstream: https://bugs.gentoo.org/939498
+---
+ lib/Target/AMDGPU/MCTargetDesc/AMDGPUMCTargetDesc.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/lib/Target/AMDGPU/MCTargetDesc/AMDGPUMCTargetDesc.h b/lib/Target/AMDGPU/MCTargetDesc/AMDGPUMCTargetDesc.h
+index c2e2563c3989..53aac8934100 100644
+--- a/lib/Target/AMDGPU/MCTargetDesc/AMDGPUMCTargetDesc.h
++++ b/lib/Target/AMDGPU/MCTargetDesc/AMDGPUMCTargetDesc.h
+@@ -15,6 +15,7 @@
+ #ifndef LLVM_LIB_TARGET_AMDGPU_MCTARGETDESC_AMDGPUMCTARGETDESC_H
+ #define LLVM_LIB_TARGET_AMDGPU_MCTARGETDESC_AMDGPUMCTARGETDESC_H
+ 
++#include <cstdint>
+ #include <memory>
+ 
+ namespace llvm {
+-- 
+2.46.0
diff --git a/package/llvm-project/llvm/0003-Another-gcc-15-fix-from-Sam-James.patch b/package/llvm-project/llvm/0003-Another-gcc-15-fix-from-Sam-James.patch
new file mode 100644
index 0000000000..bc958bb056
--- /dev/null
+++ b/package/llvm-project/llvm/0003-Another-gcc-15-fix-from-Sam-James.patch
@@ -0,0 +1,31 @@
+From 67fc0069c285b37f09d408aae43c37b8afdf11f7 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Micha=C5=82=20G=C3=B3rny?= <mgorny@gentoo.org>
+Date: Sat, 3 Aug 2024 12:01:20 +0200
+Subject: [PATCH] Another gcc-15 fix from Sam James
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Bug: https://bugs.gentoo.org/937164
+Gentoo-Component: llvm
+Signed-off-by: Michał Górny <mgorny@gentoo.org>
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+Upstream: https://bugs.gentoo.org/939498
+---
+ lib/Target/X86/MCTargetDesc/X86MCTargetDesc.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/lib/Target/X86/MCTargetDesc/X86MCTargetDesc.h b/lib/Target/X86/MCTargetDesc/X86MCTargetDesc.h
+index d0530bd4d650..10b59462aebe 100644
+--- a/lib/Target/X86/MCTargetDesc/X86MCTargetDesc.h
++++ b/lib/Target/X86/MCTargetDesc/X86MCTargetDesc.h
+@@ -13,6 +13,7 @@
+ #ifndef LLVM_LIB_TARGET_X86_MCTARGETDESC_X86MCTARGETDESC_H
+ #define LLVM_LIB_TARGET_X86_MCTARGETDESC_X86MCTARGETDESC_H
+ 
++#include <cstdint>
+ #include <memory>
+ #include <string>
+ 
+-- 
+2.46.0

--===============1281030137450506194==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1281030137450506194==--
