Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C3A7CA5FA1
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 21:43:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED9B460625;
	Mon, 28 Sep 2026 21:43:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6FK6odhi3H6K; Mon, 28 Sep 2026 21:43:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 0A1C6605F0
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790631817;
	b=aXcE5q1pUaiG1WPemXgqBkR5uqol5MGfyUwszkd+RrQxEru3JF3H4+4UFOq+fg7mz5Ob
	 HuBwerM1K2fFkUlM1+BMxyLl08xiGmDUJLHNtMg7o0/COnYCzHTYf7URizCbcO+zT1ZAg
	 /ucKo9XWzJkvDu9eyEguNEU+ra1wJQxJlNnpYSm4pI4A7QHRDAHm5JbwbEcsyGdkyN6E1
	 UqunNmX/B8dQTN7FKxm6Ht4QGFa3q74rtehk0PwRA2Fd2FFPjOcenM3zcQTSP0oPJrH/C
	 GdPJqkAXGkfPEU9WX6Y/+I5aqx/mZc3Kw+ehLerPOSiAxHganQvuWhbagSo0xYd5wdw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790631817;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ED7ZrLxCk+wLUIhncVP1bskJCiChi7geEjVdgEufYLg=;
	b=ZhnG+5nI9rJW6qoYduXI/CEKlZhJqlchsTNFJL5Y8uvsKr5hiXD+ctxp/dK5ow7UlIWO
	 AMQ8MTwfdxaILRX1DkkHVYdiIhVKTMhRRt+AjTmYX9rDhqSkyaPNzeDzlzeGzOAnCWs0J
	 ICaF51Vij2+bn5VKYH5XXFuptLdNN30/4br55p+IMItkKWdVlbyVjNAEmgg9aUcZuQiGV
	 xICH/BhHmnHQ52QWsmIBxUI61OmqwlrRg9MC43JMsb/aq4TvOjKNtzM1mUF62zoTko0QR
	 dQQ5sDbxLDLlikq1Ttt/tAIJq1AM5m6HjJLBr6hfnQ4uM4HLmsNzf/VbxiAchi4Va6A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790631817;
	bh=ED7ZrLxCk+wLUIhncVP1bskJCiChi7geEjVdgEufYLg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OqVaHFAsACG7x8RZtu2+jqaHB4I6j5XihNqdph3jdoRQLCFjz76eQeitHCq3ky1Jl
	 KsLCFaTXOB3WUlH+DKndKeejax2zDQ+Gs3g8kxts6nit/0P+F+gl2hgl82KcGm6NAT
	 kHTj4IcSr5740YdyEfQRnEyl7zxeKRiWqX3kektZrPWspRr8+f70TGEQNDLILNuZE+
	 ZGZHAsnAAp9LiE6gaLHuD86QQdEAkmXp3puZknzkjAOzUPzMRnkm5a9aKqDHPfWWTi
	 jfhVXD9cfBn3tYZN61vrSbPohSjanbNW1On2/JzNjMjihwaBH7B0Ct4DKedAgdETWR
	 OtOt/dAhwYz8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A1C6605F0;
	Mon, 28 Sep 2026 21:43:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 10C8272
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:43:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EAF7860638
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:43:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qsHHv20cf5l3 for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 21:43:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 48B96605F0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790631815;
 b=o060fbsNDPoccESX2WmbHEDLN+xftR+ur6Vtn2J+nLBCC3Ow4m8KSO61ViIhZGGmDP98
 dTBYCpIpwMQzm8famsilFiWWTR2Z+Zb8/8qcaHyc3dYeXrlTd98N0QUI4H6BoJP/FFtOc
 VpTx5Vfjju7v1idff0b+7qLN6Jp3wJtDT9S1utam1UDm81PpNjiOhNy3ZAijwYnVKx3NP
 03cdHRqCxafyzFo1qFk6LGVfWolrwEqs7JPu2yNSgPgm64dsp+rmvSPDES7YXmtRyVk8l
 2bRN1+C7qRBdJZ3bC6NU+C0ugCY1waV/KQYdGfZBTu2E43kHSQrUPtAwTSHXCCrXf2g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790631815;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=HKclYO5TzihyOgLTwoZ/cNQLQC938gYYgiwmEkNHsxw=;
 b=CBuCEAt199GMkLqvBI3pFf5qMI1DOpLeLFTyzte7N092E9gNM3OKZ0P3VC5Ni7NfoKLn
 Q/r8PF8yhKn3bFzytCLmLEA1gGQHmeRh7S8b4uIxVRmPk4vvX14cA2jiS6uX0Em6ypxxm
 3dRS8UYB4BhOE2+EoacWgshAvKao88QC7uLgv9bZ82tWGA9fyLEtKjW3XV5aAYUZ5u5bJ
 cHjy3C6J4f8J+6Jkru1IQnS/oVIvrnT468tEEKEAeN/M0HN5pIryRn50smkujrXoFlZr7
 9E6Nt93TH+WTwMZXilkqFXh7nTyKfeYtTobf7gLqu4ISXok8g85lfP/UIvbEkoF5y4g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48B96605F0
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:43:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BB13298423; Mon, 28 Sep 2026 21:42:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 28 Sep 2026 23:43:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 66c166564252f4e41adac083aedc3031b9b23d0c
X-Git-Newrev: 54ccee7e6763801a48451cac52e9cb93ebee3b7c
X-Patchwork-Hint: ignore
Message-Id: <20260928214222.BB13298423@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libabseil-cpp: fix build on x86
 32-bit with AES
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/54ccee7e6763801a48451cac52e9cb93ebee3b7c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Since the bump to version 20260817.0, the AES-based hash for long
strings is used whenever __SSE4_2__ and __AES__ are defined. It relies
on _mm_cvtsi128_si64() and _mm_extract_epi64(), which are only
available on x86_64, so the build fails on 32-bit x86 for CPUs that
support SSE4.2 and AES:

  hash.cc:115:32: error: '_mm_cvtsi128_si64' was not declared in this scope

Add a patch from a pending upstream pull request restricting this code
path to x86_64.

Fixes:
https://autobuild.buildroot.org/results/48198506ef76c6ebad0a802cb1fdd5270494eae1

Assisted-by: Claude:claude-opus-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0002-Fix-32-bit-x86-build-of-hash.cc.patch     | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/package/libabseil-cpp/0002-Fix-32-bit-x86-build-of-hash.cc.patch b/package/libabseil-cpp/0002-Fix-32-bit-x86-build-of-hash.cc.patch
new file mode 100644
index 0000000000..1a289fe115
--- /dev/null
+++ b/package/libabseil-cpp/0002-Fix-32-bit-x86-build-of-hash.cc.patch
@@ -0,0 +1,33 @@
+From 66cd3bf8a9c19f03c5b0bf58031ab8176fb5608a Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Thu, 24 Sep 2026 14:59:26 +0000
+Subject: [PATCH] Fix 32-bit x86 build of hash.cc
+
+The x86 AES SIMD path in absl/hash/internal/hash.cc uses the 64-bit-only
+_mm_cvtsi128_si64 and _mm_extract_epi64 intrinsics but is gated only on
+__SSE4_2__ && __AES__, so 32-bit x86 builds fail to compile.
+
+Require __x86_64__/_M_X64 for that path, matching the existing guard in
+absl/crc/internal/crc32_x86_arm_combined_simd.h.
+
+Fixes: https://github.com/abseil/abseil-cpp/issues/2176
+Upstream: https://github.com/abseil/abseil-cpp/pull/2177
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ absl/hash/internal/hash.cc | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/absl/hash/internal/hash.cc b/absl/hash/internal/hash.cc
+index 43cb561..ef85625 100644
+--- a/absl/hash/internal/hash.cc
++++ b/absl/hash/internal/hash.cc
+@@ -28,7 +28,8 @@
+ 
+ #ifdef ABSL_AES_INTERNAL_HAVE_X86_SIMD
+ #error ABSL_AES_INTERNAL_HAVE_X86_SIMD cannot be directly set
+-#elif defined(__SSE4_2__) && defined(__AES__)
++#elif defined(__SSE4_2__) && defined(__AES__) && \
++    (defined(__x86_64__) || defined(_M_X64))
+ #define ABSL_AES_INTERNAL_HAVE_X86_SIMD
+ #endif
+ 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
