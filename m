Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21AF0C982D0
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 10:24:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C94F380E7F;
	Sun, 20 Sep 2026 10:24:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dz11LsscQsYN; Sun, 20 Sep 2026 10:24:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A954080EB2
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789899884;
	b=Fgbm+HG7PnS3nshDQh0o6oa5750BKGC59XPG92I4q2cCBLatAvc6ZSyn+Oy1EHSphtsJ
	 hzRb6IU0z9FXLz07gvZl2RphwrWwa0CIylBSna8gbdhGY3QVsTu0kUEL3RheoFCxRpWE8
	 noP10iYFjLdV6ykW2FgM/7dkq9kbp7nPDBvFrKFhoss2co24F2OdNsvpLxRSTkKUzvYy9
	 Sn0cZmeCN8eOmQ8e36u1UsFno3AQogiM8PTdLE9URlZIR2LKQBxIymZU4oktIrAFZwSOB
	 qV5mNgH1QVg1t5MXRalMtUy2r26d569UYgzYI/mtPsFkF/7w2ImZoOByIhBSg1pkhqw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789899884;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=2ABcDIAJKqomCMqIqZ/7M7ySjSjwp3/2kwkVx+/3g0M=;
	b=cslQDn4OJLId1d6cbvftQBiisrPglAYCOI03DzcAWEuJbLe/4Qg2jAzfTuuUSwUZD/s3
	 SfFyiAud+zJA7u1IHlqlcy+nimqVnAvqMp1p8LUVcgCbaKPnxchvB/cYNhI4khnkmbU8d
	 EsLKlOzA0inXaOOSKNiqp1/6oRTiqpfMS+R3OWZyoJW1OzZ5Cc/L72LOr1ZRp4sAu2p5X
	 sRvGN4BTen9GR51PqS39aKL/1AWtpopytBXAGpnKLeMA4xlLLduyiNvX7AeoTilBcTDkP
	 zEaIkVm23ptwFgDlmatMesOf27AjTqGMoZTp17k5VkDPMWHO5dhB2C5p0n/mQgEAfNQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789899884;
	bh=2ABcDIAJKqomCMqIqZ/7M7ySjSjwp3/2kwkVx+/3g0M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=U6baOnAdkGTs1kNa6EsnI9Gj3MKRKlr2q27gfT5+8KttAX2VMz17z63O8PgMdW8cl
	 Zt9QTalxc4NnPlRhwALFlpQkXoMtDM6wq6DZpYDTTU02tXoHtW7bjrMBd5ehn5rX5L
	 QM8/qHQZlYyNHKBORwcnwt/S/HRDamwFpxS6SjEuv8OiQraP7S+Od4kd6GXSIOLZ4h
	 jAS9FSlIB/tpLm5QWTRFKz1KjNQOWCHbaOpie5MUcxSFG8Udi9SRM+OFmg4iWjuWEZ
	 eyeMeXBy6RaLaLNRjnJEGu6J2bdFs7Y2bfffz3+VfMwpnhawYE9eD+PdsYKn9bGeNF
	 SkybklivFEJtA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A954080EB2;
	Sun, 20 Sep 2026 10:24:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E4F8C24D
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 10:24:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C9EB280E7F
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 10:24:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b9W92SE1eTAj for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 10:24:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 834DB80E73
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789899881;
 b=P+dSM0kI8rdTnAUkkONhxQ2dwek0pk4jemTLs3g49LkLAAu5K6zH+/7MuhWn/Fcpp8tx
 Pf/6S+JyxeQracQddYfbnFlfijvtOvaxkqLWzOY7ytoX558aFvqHkliAOKmbHq3n5lFu+
 hQJvSi2rDzqYZBUfowgMhghc61ldreh8Nhi78l//9OSZJPavfrihzgAdPNrOblE9GMFZO
 ZxtK4SRbsDF/KPbJNbEU0orTzmUgk9+g9HbCsfYpX3MGxbfJDN8vj1pfQEV0DGQY37f6n
 PR1nnXeI94PPQ9PSwQ2LJ88ZJUp+qp35QL6Gy0YwBqK5aH0qXMa44XuO6mb7Pyuf8Pg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789899881;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=LDmmZXpPbPgaTMO11558vxPVAMg1+ZLfPY5nJ2VOX0Q=;
 b=l1cE7zTxvmHQ5+Hjed+n5nPZJmqWGejZpO78mA+mNvfOCUcwMEoexb8096PRYp5/dCwn
 PjC1JiqMmb44IHFnagrucg2s1o84BHLkcV6qZUloH5uA7ebgWZ/SM55rVmLjynmWJSN7H
 MoRrp04hh1WtHZkvfb9AYCKA9X4nSI+WRlYPcko9Ce14q/7tMJKESHDIdwWvZlRUVQx96
 b3Hcfc2DGRVT7GAipfP3U8F/uH41W//QKe/ENgPDVbpxDtJZDyZenkjkmxFaIa5Sk0pIr
 /N/1JAYeEdpfVAMddzwO96MXVX+Ea8QRL5RX5kSWCXTZb+uWUBBWkd/I92R0YyhG1vw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 834DB80E73
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 10:24:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3E3058DAC6; Sun, 20 Sep 2026 10:23:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 12:23:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 06322989a250877ee0f148b6189c1b2bc259d1ba
X-Git-Newrev: f8bf8d928cc8d8f667d14926416f1d2afbba5a91
X-Patchwork-Hint: ignore
Message-Id: <20260920102333.3E3058DAC6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bcc: bump version to 0.37.0
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
Content-Type: multipart/mixed; boundary="===============8281286422207895961=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8281286422207895961==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f8bf8d928cc8d8f667d14926416f1d2afbba5a91
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog:
https://github.com/iovisor/bcc/blob/v0.37.0/debian/changelog

This commit removes the package patch which is included in this
new version. It also adds another upstream patch to fix the build
with the upcoming LLVM 23.

Cc: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/bcc/0001-Fix-build-with-LLVM-22.patch      | 64 ----------------------
 ...-cc-Fix-MCContext-constructor-for-LLVM-23.patch | 38 +++++++++++++
 package/bcc/bcc.hash                               |  2 +-
 package/bcc/bcc.mk                                 |  2 +-
 4 files changed, 40 insertions(+), 66 deletions(-)

diff --git a/package/bcc/0001-Fix-build-with-LLVM-22.patch b/package/bcc/0001-Fix-build-with-LLVM-22.patch
deleted file mode 100644
index c9491ef5c1..0000000000
--- a/package/bcc/0001-Fix-build-with-LLVM-22.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 4c7be1ec6ab74e973f8d18a9011fa349c3d9dd58 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Holger=20Hoffst=C3=A4tte?= <holger@applied-asynchrony.com>
-Date: Mon, 2 Mar 2026 10:03:15 +0100
-Subject: [PATCH] Fix build with LLVM-22
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-LLVM-22 changed the signatures of various createDiagnostics() calls [1].
-Introduce a new version macro guard and adapt the code to the changed API.
-
-Fixes #5483
-
-[1] https://github.com/llvm/llvm-project/commit/30633f30894129919050f24fdd1f8f6bc46beae0
-
-Signed-off-by: Holger Hoffstätte <holger@applied-asynchrony.com>
-
-Upstream: https://github.com/iovisor/bcc/commit/4c7be1ec6ab74e973f8d18a9011fa349c3d9dd58
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/cc/frontends/clang/loader.cc | 15 ++++++++++++---
- 1 file changed, 12 insertions(+), 3 deletions(-)
-
-diff --git a/src/cc/frontends/clang/loader.cc b/src/cc/frontends/clang/loader.cc
-index 6f8387aaf017..1f706344724d 100644
---- a/src/cc/frontends/clang/loader.cc
-+++ b/src/cc/frontends/clang/loader.cc
-@@ -464,7 +464,10 @@ int ClangLoader::do_compile(
-   }
-   invocation0.getFrontendOpts().DisableFree = false;
- 
--#if LLVM_VERSION_MAJOR >= 20
-+#if LLVM_VERSION_MAJOR >= 22
-+  compiler0.setVirtualFileSystem(llvm::vfs::getRealFileSystem());
-+  compiler0.createDiagnostics(new IgnoringDiagConsumer());
-+#elif LLVM_VERSION_MAJOR >= 20
-   compiler0.createDiagnostics(*llvm::vfs::getRealFileSystem(), new IgnoringDiagConsumer());
- #else
-   compiler0.createDiagnostics(new IgnoringDiagConsumer());
-@@ -487,7 +490,10 @@ int ClangLoader::do_compile(
-   add_main_input(invocation1, main_path, &*out_buf);
-   invocation1.getFrontendOpts().DisableFree = false;
- 
--#if LLVM_VERSION_MAJOR >= 20
-+#if LLVM_VERSION_MAJOR >= 22
-+  compiler1.setVirtualFileSystem(llvm::vfs::getRealFileSystem());
-+  compiler1.createDiagnostics();
-+#elif LLVM_VERSION_MAJOR >= 20
-   compiler1.createDiagnostics(*llvm::vfs::getRealFileSystem());
- #else
-   compiler1.createDiagnostics();
-@@ -517,7 +523,10 @@ int ClangLoader::do_compile(
-   invocation2.getCodeGenOpts().setInlining(CodeGenOptions::NormalInlining);
-   // suppress warnings in the 2nd pass, but bail out on errors (our fault)
-   invocation2.getDiagnosticOpts().IgnoreWarnings = true;
--#if LLVM_VERSION_MAJOR >= 20
-+#if LLVM_VERSION_MAJOR >= 22
-+  compiler2.setVirtualFileSystem(llvm::vfs::getRealFileSystem());
-+  compiler2.createDiagnostics();
-+#elif LLVM_VERSION_MAJOR >= 20
-   compiler2.createDiagnostics(*llvm::vfs::getRealFileSystem());
- #else
-   compiler2.createDiagnostics();
diff --git a/package/bcc/0001-src-cc-Fix-MCContext-constructor-for-LLVM-23.patch b/package/bcc/0001-src-cc-Fix-MCContext-constructor-for-LLVM-23.patch
new file mode 100644
index 0000000000..bdf9e25faa
--- /dev/null
+++ b/package/bcc/0001-src-cc-Fix-MCContext-constructor-for-LLVM-23.patch
@@ -0,0 +1,38 @@
+From e5418ece42eb5bb322d220a2ff94f545d72a6f8a Mon Sep 17 00:00:00 2001
+From: Viktor Malik <viktor.malik@gmail.com>
+Date: Thu, 13 Aug 2026 08:22:00 +0200
+Subject: [PATCH] src/cc: Fix MCContext constructor for LLVM 23
+
+Two LLVM 23 patches [1,2] changed the MCContext constructor to take
+MCAsmInfo, MCRegisterInfo, and MCSubtargetInfo by a reference rather
+than by a pointer. Reflect the change in call of the constructor.
+
+[1] https://github.com/llvm/llvm-project/commit/13e98d834101efd1794cdd026377c508293ee21b
+[2] https://github.com/llvm/llvm-project/commit/d50631faad3003e73589528c83d3bbbad7ba72f1
+
+Upstream: https://github.com/iovisor/bcc/commit/dad0db93fd0f443b2a4f43bc2f23c621c9202516
+Signed-off-by: Viktor Malik <viktor.malik@gmail.com>
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+---
+ src/cc/bcc_debug.cc | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/cc/bcc_debug.cc b/src/cc/bcc_debug.cc
+index 2e53c44d..0812c4ab 100644
+--- a/src/cc/bcc_debug.cc
++++ b/src/cc/bcc_debug.cc
+@@ -148,7 +148,11 @@ void SourceDebugger::dump() {
+       T->createMCSubtargetInfo(TripleArg, "", ""));
+   MCObjectFileInfo MOFI;
+ #if LLVM_VERSION_MAJOR >= 13
++#if LLVM_VERSION_MAJOR >= 23
++  MCContext Ctx(TheTriple, *MAI, *MRI, *STI, nullptr);
++#else
+   MCContext Ctx(TheTriple, MAI.get(), MRI.get(), STI.get(), nullptr);
++#endif
+   Ctx.setObjectFileInfo(&MOFI);
+   MOFI.initMCObjectFileInfo(Ctx, false, false);
+ #else
+-- 
+2.55.0
+
diff --git a/package/bcc/bcc.hash b/package/bcc/bcc.hash
index 02ec50f450..7521ff31d5 100644
--- a/package/bcc/bcc.hash
+++ b/package/bcc/bcc.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  ea8562246801c52a9c21c47076dae9ff1d3719bb86b96d7a6222b3724461f52c  bcc-v0.36.1-git4.tar.gz
+sha256  fa4302ee54d8638ca08fa7f2d1dfe7f39d4bd1bd02ccd2b298b0148369f3a680  bcc-v0.37.0-git4.tar.gz
 sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE.txt
diff --git a/package/bcc/bcc.mk b/package/bcc/bcc.mk
index c3c9eabbbe..5379886e87 100644
--- a/package/bcc/bcc.mk
+++ b/package/bcc/bcc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BCC_VERSION = v0.36.1
+BCC_VERSION = v0.37.0
 BCC_SITE = https://github.com/iovisor/bcc
 BCC_SITE_METHOD = git
 BCC_GIT_SUBMODULES = YES

--===============8281286422207895961==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8281286422207895961==--
