Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B558BCCFA04
	for <buildroot@archiver.kernel.org>; Tue,  4 Nov 2025 18:29:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D847D61036;
	Tue,  4 Nov 2025 18:29:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CR20Zi85k5mR; Tue,  4 Nov 2025 18:29:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EFC276102E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFC276102E;
	Tue,  4 Nov 2025 18:29:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D636222
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 18:29:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4373D40DC6
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 18:29:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m0fh06VoEn8B for <buildroot@buildroot.org>;
 Tue,  4 Nov 2025 18:29:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A14C40DC8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A14C40DC8
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 18:29:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 74D1A83BBA; Tue,  4 Nov 2025 18:29:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 4 Nov 2025 19:28:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d6a7c0226333138721ae722b89e31a82cfb22ae0
X-Git-Newrev: 39e4953be78017cedc45c1003124db595c30b3f1
X-Patchwork-Hint: ignore
Message-Id: <20251104182909.74D1A83BBA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bcc: add upstream patch to fix
 build with llvm >= 21
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6446275426985858025=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6446275426985858025==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=39e4953be78017cedc45c1003124db595c30b3f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since Buildroot commit [1] "package/llvm-project: bump to version
21.1.4", bcc is failing at compilation time.

This commit adds an upstream patch to fix this issue.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/d6a7c0226333138721ae722b89e31a82cfb22ae0

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...001-Fix-a-build-failure-with-clang21-5369.patch | 53 ++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/package/bcc/0001-Fix-a-build-failure-with-clang21-5369.patch b/package/bcc/0001-Fix-a-build-failure-with-clang21-5369.patch
new file mode 100644
index 0000000000..0aeb6a6fea
--- /dev/null
+++ b/package/bcc/0001-Fix-a-build-failure-with-clang21-5369.patch
@@ -0,0 +1,53 @@
+From 051be0c987622683c75b335bda16b9b61fc67fa4 Mon Sep 17 00:00:00 2001
+From: yonghong-song <ys114321@gmail.com>
+Date: Mon, 14 Jul 2025 20:21:59 -0700
+Subject: [PATCH] Fix a build failure with clang21 (#5369)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The build error message:
+  src/cc/frontends/clang/loader.cc:400:73: error: no matching function for
+   call to ‘clang::TextDiagnosticPrinter::TextDiagnosticPrinter(
+     llvm::raw_fd_ostream&, clang::DiagnosticOptions*)’
+  400 |   auto diag_client = new TextDiagnosticPrinter(llvm::errs(), &*diag_opts);
+      |                                                                         ^
+The llvm commit
+  https://github.com/llvm/llvm-project/pull/139584
+caused the build failure.
+
+Adjust the code properly and the error is fixed.
+
+Upstream: https://github.com/iovisor/bcc/commit/8c5c96ad3beeed2fa827017f451a952306826974
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+---
+ src/cc/frontends/clang/loader.cc | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/src/cc/frontends/clang/loader.cc b/src/cc/frontends/clang/loader.cc
+index 07dc9d6a..6f8387aa 100644
+--- a/src/cc/frontends/clang/loader.cc
++++ b/src/cc/frontends/clang/loader.cc
+@@ -396,11 +396,19 @@ int ClangLoader::do_compile(
+                     flags_cstr_rem.end());
+ 
+   // set up the error reporting class
++#if LLVM_VERSION_MAJOR >= 21
++  DiagnosticOptions diag_opts;
++  auto diag_client = new TextDiagnosticPrinter(llvm::errs(), diag_opts);
++
++  IntrusiveRefCntPtr<DiagnosticIDs> DiagID(new DiagnosticIDs());
++  DiagnosticsEngine diags(DiagID, diag_opts, diag_client);
++#else
+   IntrusiveRefCntPtr<DiagnosticOptions> diag_opts(new DiagnosticOptions());
+   auto diag_client = new TextDiagnosticPrinter(llvm::errs(), &*diag_opts);
+ 
+   IntrusiveRefCntPtr<DiagnosticIDs> DiagID(new DiagnosticIDs());
+   DiagnosticsEngine diags(DiagID, &*diag_opts, diag_client);
++#endif
+ 
+   // set up the command line argument wrapper
+ 
+-- 
+2.51.1
+

--===============6446275426985858025==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6446275426985858025==--
