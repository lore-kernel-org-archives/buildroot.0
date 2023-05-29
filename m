Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96076C77B7A
	for <buildroot@archiver.kernel.org>; Mon, 29 May 2023 07:15:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 391AC41C35;
	Mon, 29 May 2023 07:15:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 391AC41C35
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kd0cdyeLXCFF; Mon, 29 May 2023 07:15:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 51C3D417C2;
	Mon, 29 May 2023 07:15:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51C3D417C2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4450C1BF30B
 for <buildroot@lists.busybox.net>; Mon, 29 May 2023 07:15:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B3D782FA9
 for <buildroot@lists.busybox.net>; Mon, 29 May 2023 07:15:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B3D782FA9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1IUosuoxRb7A for <buildroot@lists.busybox.net>;
 Mon, 29 May 2023 07:15:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 451E082BD6
 for <buildroot@buildroot.org>; Mon, 29 May 2023 07:15:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 451E082BD6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 33F7E86A2A; Mon, 29 May 2023 07:15:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 29 May 2023 08:58:01 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 0f229a4231ba4009fca0092fa0a77d84ea20c4b5
X-Git-Newrev: 8f0fa2899b4962ff3fe2f481d3f4f175da650737
X-Patchwork-Hint: ignore
Message-Id: <20230529071523.33F7E86A2A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/llvm: fix host
 compile with gcc-13
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
Content-Type: multipart/mixed; boundary="===============6493469884473469238=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6493469884473469238==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=8f0fa2899b4962ff3fe2f481d3f4f175da650737
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Add upstream patch to fix host compile error on openSUSE Tumbleweed
(gcc-13.0.1).

Fixes:

  .../build/host-llvm-11.1.0/include/llvm/Support/Signals.h:117:8: error: variable or field ‘CleanupOnSignal’ declared void
    117 |   void CleanupOnSignal(uintptr_t Context);
        |        ^~~~~~~~~~~~~~~
  .../build/host-llvm-11.1.0/include/llvm/Support/Signals.h:117:24: error: ‘uintptr_t’ was not declared in this scope
    117 |   void CleanupOnSignal(uintptr_t Context);
        |                        ^~~~~~~~~
  .../build/host-llvm-11.1.0/include/llvm/Support/Signals.h:18:1: note: ‘uintptr_t’ is defined in header ‘<cstdint>’; did you forget to ‘#include <cstdint>’?
     17 | #include <string>
    +++ |+#include <cstdint>
     18 |

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit f0795bd104248c5d5af71769e4b657dc9fd3ade8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...2-Add-missing-cstdint-header-to-Signals.h.patch | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/package/llvm/0002-Add-missing-cstdint-header-to-Signals.h.patch b/package/llvm/0002-Add-missing-cstdint-header-to-Signals.h.patch
new file mode 100644
index 0000000000..c798f585d6
--- /dev/null
+++ b/package/llvm/0002-Add-missing-cstdint-header-to-Signals.h.patch
@@ -0,0 +1,34 @@
+From c6c71ab47d658ab8f84e6a6066d476fd9632bbca Mon Sep 17 00:00:00 2001
+From: Sergei Trofimovich <slyich@gmail.com>
+Date: Mon, 23 May 2022 08:03:23 +0100
+Subject: [PATCH] Add missing <cstdint> header to Signals.h
+
+Without the change llvm build fails on this week's gcc-13 snapshot as:
+
+    [  0%] Building CXX object lib/Support/CMakeFiles/LLVMSupport.dir/Signals.cpp.o
+    In file included from llvm/lib/Support/Signals.cpp:14:
+    llvm/include/llvm/Support/Signals.h:119:8: error: variable or field 'CleanupOnSignal' declared void
+      119 |   void CleanupOnSignal(uintptr_t Context);
+          |        ^~~~~~~~~~~~~~~
+
+Upstream: https://github.com/llvm/llvm-project/commit/ff1681ddb303223973653f7f5f3f3435b48a1983.patch
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ include/llvm/Support/Signals.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/include/llvm/Support/Signals.h b/include/llvm/Support/Signals.h
+index e0a18e72..148216b8 100644
+--- a/include/llvm/Support/Signals.h
++++ b/include/llvm/Support/Signals.h
+@@ -14,6 +14,7 @@
+ #ifndef LLVM_SUPPORT_SIGNALS_H
+ #define LLVM_SUPPORT_SIGNALS_H
+ 
++#include <cstdint>
+ #include <string>
+ 
+ namespace llvm {
+-- 
+2.40.1
+

--===============6493469884473469238==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6493469884473469238==--
