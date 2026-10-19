Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E34FCCF2E5
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 14:15:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FB6B80DF6;
	Mon, 19 Oct 2026 14:15:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FEA_kbD6R5n9; Mon, 19 Oct 2026 14:15:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org AA58680DB4
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792419347;
	b=Hx+Y2JqXMkk4gcrDkI8vYPKIcbwMmr12akaLEk7SW6GKCkTSLsqis6YIuK1P1wBSK31g
	 v505vzmc8Zdedvb3C2s5CfPeSHwPjVh0YEkAZN6s7xWYSeRcabfFSrmCljYFaO3Hc6rKE
	 PWiauA1rytVwyyYxc2pd0CADC5HdZobfS1zDNwbUKoKYVMsGa9P5QkWifEySaPIKtNWjD
	 7EAKRg2tj9iA1Tokljza6wGZdDgH1WzPaBzGji1RSDLxk25TSCXywFQAp+K6dCtrCLxAq
	 mdLYzLy4b1P8Gb2kCXXwbe6JcawdGnmSulngjnuKIyxIoP8PJeUKX4ryghUWeLPPY3g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792419347;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=voB5HDNK2kjwiBq4RCTurArYrWIwijNjzwh/hKyRga4=;
	b=cQg2WyxJTAlP/tnhY/R4d7bp7fWOGuFWodWim+VwmttdCKEqdzrd03JK5M3zGnKJtcAb
	 p8K7gFdRSePOqK9BGgxHDgFEqLtsixgN9AwaFKTRZpd5vf6/xCghFSsMFvxsvzgxGQLN8
	 aNmuZ4080xvDGrJI3Wi5xIJ9nWz3SAUBHxu92adBZ9zu6gmXcTx2xlX14TpAxBD1tD7xU
	 FbGFpigfSWOkLx07mnMGpmUHHlzis6NJxZk5Tzpz7N95NgdM8JOSyWum/6W7ASi57kH6n
	 fXbs2XF+j0Yu+10o13XtExN/lnzngTg4FBlImW15VK8xpB+d1NjSYIdQZ17gFHv9wYg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792419347;
	bh=voB5HDNK2kjwiBq4RCTurArYrWIwijNjzwh/hKyRga4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rlxNczDU3j/jnnQTlx4manbT73ZXtVHF3yZjkeRKqpyPQdbi9vJXesCgHSAAIYjeu
	 58HxY5W3F3NN6MutJrrk9UE1XLzTQxpUsw3RW/j16/yUnew9lqTbrUxMM3nU5TqAc6
	 B3xOTJd/LfRYNmTJ9E99V2VFnPyBbwzu8CXTHSqRA/wMQHyItCqF4QNEsDRL7uYdCY
	 SGAqn+yBXIfe6gJU6Waq7XmrtXMPWIcxR1081YxeYcPLNgSwtOati/UjMa6/FpQYAP
	 nIGYm1Nqy/Eaup4AAR6PjRtqJenOyy4fQmtz3Ht7zn02ngUevGEqTrmuN0jxjA/fin
	 ZLxTgvJ7gT/9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA58680DB4;
	Mon, 19 Oct 2026 14:15:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F1D4263
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 14:15:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34D9B80DB4
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 14:15:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ASkkwSbhqifu for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 14:15:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3DEC580D02
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792419345;
 b=f/rTBcuiRhVypfSGELftE34yTuf1CQTlsn8/ruKbWS7vPzy3qna4x8a84o9VTfpRYfup
 ZVHrgLIuDC+TLNxgmeKFJgnyyss9moOt7W/Q/wqq+Y8pWKkjmlx9GKJys9/bRTyD2B6U7
 nd8/UoQ7xPEmgNG+NUR6KgNLPbOs1rqSqTbX1U4OL3TXD1ex0hz9Xa3zdRZSCUJDcjurS
 rEiNws0Y1JmrgEteme+bmdgm7JrXmBPzWTvhG/9Xnar9Ab+IFGIlQBIx/QQZJesMigUDi
 T/xYRi6Ziz0EUGxYuQykG7NE9h9m2m3hsND6RRP7yA7MpkmZ4lQpIv+RL9n6cKzZkuQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792419345;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=CgDeYg9730myBEHAuiVhzRNnC/IxkU9OyA875Nby/Zc=;
 b=WLaWco/PpDriaKEh3ib2Ex+9eJ++qCZOEZYVGBjzo9M1vHIJ8c37WSCkIfAJRp2VJiDG
 PXt9HrCnSCI0LPCgPMnoi6k2usF0WH7a2HuD4noiFO7qMV6r4X3fpGSN/1Rakz1leEVxg
 y7/RBOOG1Y/L0Wywsd6TJapB6jC7tHUFdR373JnEqa0ROn0aKdf05M4XDe76BAQF7SACn
 XQBdDKsV26wMumXfmD9eKMBAdVdizWBqH8bAuUZrjdQhKr+5VeJM86QD7uU62kPz+XUM9
 B9zlLIoyRv2rViULhUKGdXKNG702h/d8J2xshfq8xmSiiOoyg4Jm/VnfXM4/F0lfpEw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3DEC580D02
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 14:15:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9D71098717; Mon, 19 Oct 2026 14:14:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 16:12:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e5bc4741589b86c0acace607982fb6c82b52c32f
X-Git-Newrev: 145bbce3eac839e55183db7f09b07e5af2ecaf12
X-Patchwork-Hint: ignore
Message-Id: <20261019141422.9D71098717@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sysprof: fix build on 32-bit x86
 with AVX2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/145bbce3eac839e55183db7f09b07e5af2ecaf12
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The bundled CRoaring code enables its x64 specific code paths as soon
as __AVX2__ (or __POPCNT__ and __SSE4_2__) is defined, which also
happens on 32-bit x86 targets such as i686 with BR2_x86_haswell. This
results in calls to 64-bit only intrinsics:

  roaring.h:260:18: error: implicit declaration of function '_mm_popcnt_u64'; did you mean '_mm_popcnt_u32'? [-Wimplicit-function-declaration]

Backport the upstream patch that defines DISABLE_X64 when building
for 32-bit x86, so that the portable implementation is used instead.

This issue has been present since commit 0d57555407 ("package/sysprof:
update to version 46.0"), which switched to the new sysprof code base
bundling CRoaring in contrib/eggbitset. It therefore affects 2024.08
and later.

Fixes:
https://autobuild.buildroot.org/results/f00d523aa13923c9eb73ae4e1b1f04f297512351

Fixes: 0d57555407 ("package/sysprof: update to version 46.0")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...tset-disable-x64-code-paths-on-32-bit-x86.patch | 53 ++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/package/sysprof/0001-contrib-eggbitset-disable-x64-code-paths-on-32-bit-x86.patch b/package/sysprof/0001-contrib-eggbitset-disable-x64-code-paths-on-32-bit-x86.patch
new file mode 100644
index 0000000000..2b2c6cb6cb
--- /dev/null
+++ b/package/sysprof/0001-contrib-eggbitset-disable-x64-code-paths-on-32-bit-x86.patch
@@ -0,0 +1,53 @@
+From 22c10f0dbd3c357e96f83f430ebe05d24a25c536 Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Sat, 17 Oct 2026 22:47:15 +0200
+Subject: [PATCH] contrib/eggbitset: disable x64 code paths on 32-bit x86
+
+roaring.h enables USEAVX (and thus IS_X64) whenever __AVX2__ is defined,
+and USESSE4 whenever __POPCNT__ and __SSE4_2__ are defined.  This also
+happens on 32-bit x86 targets such as i686 built with -march=haswell,
+where 64-bit only intrinsics like _mm_popcnt_u64() and
+_mm256_extract_epi64() are not available, so the build fails with:
+
+  roaring.h:260:18: error: implicit declaration of function
+    '_mm_popcnt_u64'; did you mean '_mm_popcnt_u32'?
+    [-Wimplicit-function-declaration]
+  roaring.h:1011:23: error: implicit declaration of function
+    '_mm256_extract_epi64'; did you mean '_mm256_extract_epi8'?
+    [-Wimplicit-function-declaration]
+
+Define DISABLE_X64 from the build system when building for 32-bit x86 so
+that the portable implementation is used instead. This keeps the bundled
+CRoaring sources unmodified, making future updates a plain copy.
+DISABLE_X64 is only set for x86, as it also guards the NEON detection
+used on ARM.
+
+Upstream: https://gitlab.gnome.org/GNOME/sysprof/-/commit/22c10f0dbd3c357e96f83f430ebe05d24a25c536
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ contrib/eggbitset/meson.build | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/contrib/eggbitset/meson.build b/contrib/eggbitset/meson.build
+index 82cd8a40..f2f81685 100644
+--- a/contrib/eggbitset/meson.build
++++ b/contrib/eggbitset/meson.build
+@@ -6,9 +6,18 @@ libeggbitset_deps = [
+   gio_dep,
+ ]
+ 
++libeggbitset_c_args = []
++
++# roaring.h enables its x64 code paths based on __AVX2__/__SSE4_2__ alone,
++# but they rely on intrinsics only available on 64-bit x86.
++if host_machine.cpu_family() == 'x86'
++  libeggbitset_c_args += ['-DDISABLE_X64']
++endif
++
+ libeggbitset_static = static_library('eggbitset', libeggbitset_sources,
+   gnu_symbol_visibility: 'hidden',
+            dependencies: libeggbitset_deps,
++                 c_args: libeggbitset_c_args,
+ )
+ 
+ libeggbitset_static_dep = declare_dependency(
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
