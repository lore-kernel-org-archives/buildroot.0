Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 320CAC79F8B
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 18:50:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7AFC74086E;
	Sat,  5 Sep 2026 18:50:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TqEI0O-z9ELW; Sat,  5 Sep 2026 18:50:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 215EB40675
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788634242;
	b=CHlAwW7IfeLNOxOgNuR04WLP0KWffD2Zf1W/ASZMiaHgiO1V3g3x3v9R/Wv2EXwPzJ9P
	 BNMx3d7OreuahJb6Ur3hZgrHCT2UOJ8mTDbG/yoY4z9RaZwKBRQM9FCX7WjWv2Z2jd77/
	 HmWI8koNYDOaawNa8Z8o18zvBPzVPxOLaDsBPlw3Wu8e3nXfF6PVS34B14OtIdzgJq2Pt
	 mADY5XFTQvgtl+MHySTvZblbjotmf5yfbipAPW6exQ6e+rVtz25a4h0mnAr+EBwG8NdK3
	 arr2LXS/Stywt2DZ9UpCLPmc2TDUGJN5JwiZWJjNzEQeOp8kg76nGRaM227uM/CfMlw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788634242;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ij7eeHADLEhiFZKdGA74g91XoNf2pu+XbaSgWYREkwE=;
	b=r1dEQxbbqnRlql6ZaIiwdQNqjYlv2w2SldOr73LzQhxaUZoZhOfZA9WAvGwALS7bAvMA
	 utmfExgpyvWm1pxkolYsCKzJcPrM2YGPlChYLxpQbyxf4aOo5oVPWX2zOK3W0g4UEfFB9
	 B+YybLKDdWBOZE7iI4p+yHvCEzrAQv7+65FSHJi5ydBlsIKgma6DEUrQNBuIgIb6kWcQF
	 Hn79FJIn1IYDrxTUF1uxKgMm7EDl7OCxGQIaBMBpq0fslZu97qOHojGEutLojK3vuPFMx
	 ppNfSK/v74hGTCtuNUR9q+ASyqFTKDJtWsCDZciViHlk/C1yEfMhkMAhYeqGW4xKpYw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788634242;
	bh=ij7eeHADLEhiFZKdGA74g91XoNf2pu+XbaSgWYREkwE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TYZfpzJuuVeMTk0ImxFdKbew7zhORRQiz1irs3YROLqLyQsYK7qPTbjBxDLGL0jn7
	 pPAA5/w/Nx3Xo0EDWKnZvK17kh97zptab76YhDdq6pWFZ4dEnB8lFgKkMPQo/5Vlt7
	 XahITYu4EjWEtbsUMdNRkhQn0HFG/WWwTr9TwjQMRNgVEijYAfB119H/c7RVJmHGTA
	 skANS77vHpvJ9HtWcvYhAYmIqdzqLo6FNJKPDKyp/SPzDMynvgBlZsW/j8Zz3mAWrQ
	 jQseF0Numv35+YGGNWVVZqtr5XYlZ4IoZoUVS2uKcqGM6g+G2/P5Ng4pDE3GCedZD9
	 0A7C3LP5OazFA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 215EB40675;
	Sat,  5 Sep 2026 18:50:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A979B49D
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 18:50:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8FA2D605F3
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 18:50:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j1XSXRuUc3Ej for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 18:50:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B2395605EC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788634238;
 b=N1OKBZHZa8NEsTdQqpv80KhIn6jY9uL021SnnhnDoYR6SYnSIZ+ifxdEicu8DuWRP9bL
 NAZtkshrbOjF5mRwLuwpi9AKspRw6bVarGvTWSfnivMwU2BOJ14YCyKMj6YffJLe1qoyC
 mBa9wGPXAvNE0/qM92VmHkD2AU+V+clzPFuO64Mfrtj/5j36TBw17FF/x9LE3KdOGFQd0
 NEXn5SFjDtU5sVVM5ZUDlfO6rHEZJszXBMliu1Ia6g0m1uKzhKJQP0xxFIXbjEG+qA9kf
 O+bweZe2gnaDtXIYPnOvhtXGo/m8kZ3Nr8PW1ujasgcerycTJ0/PLPjNgFlE0/qVo9g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788634238;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=cv5JzbWukAgaITzSmoa3jjrqtNCvQ7uL7MtvlQFeA+k=;
 b=Frn0wLx9jlXGI4bGzDlqDiYeTRmtL1Tcum71N2LbuWqzI1lzhepkEkF3YyG+W2BzuCzm
 9tqH8NcIFLGzuawy3Re/s6U/3EUcXqPyndx2lHTiJM/30rvWtpFZjmorXs/VX2th9hOda
 vUmhm2vQNU4rTU894YYTGnBSTBJMbX8Qccqk21lS9oSqtBhxSub94iXWKCXRh19JlW2yr
 I8/4pl/2qYxYZPCVBmlOBXoHGmIn2LC92fRydZEe3deU/2eNuI7aewzZ7/aN9FF4sQUhs
 ToGG4lVHAWK1S8PlB9rzQJXM3mDraI0PGgoNWvzwQZ1MVfcz8UMyPZDjEhqy6TsK7ww==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B2395605EC
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 18:50:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7E90595280; Sat,  5 Sep 2026 18:49:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Sep 2026 20:50:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9556895e784fa87c0cb0b9da2b6f86aa270431a6
X-Git-Newrev: 3469c6793ce6db8f813b3c203d3fc5eeb398e107
X-Patchwork-Hint: ignore
Message-Id: <20260905184937.7E90595280@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/gen-bootlin-toolchains:
 add missing BR2_USE_MMU dependencies
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3469c6793ce6db8f813b3c203d3fc5eeb398e107
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The Bootlin uClibc toolchains for m68k-68xxx, riscv32-ilp32d, and
xtensa-lx60 require an MMU. However, their generated Kconfig entries
lack a BR2_USE_MMU dependency, allowing them to be selected for noMMU
configurations. External toolchain validation then fails with:

  MMU support available in C library, please enable BR2_USE_MMU

Add the missing BR2_USE_MMU dependencies for these architectures to
prevent them from being selected for noMMU targets.

Signed-off-by: Fengwei Tan <tfx2001@outlook.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/gen-bootlin-toolchains | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/support/scripts/gen-bootlin-toolchains b/support/scripts/gen-bootlin-toolchains
index 75fa2c7e0f..4579949d18 100755
--- a/support/scripts/gen-bootlin-toolchains
+++ b/support/scripts/gen-bootlin-toolchains
@@ -68,7 +68,7 @@ arches = {
         'prefix': 'arm',
     },
     'm68k-68xxx': {
-        'conditions': ['BR2_m68k_m68k'],
+        'conditions': ['BR2_m68k_m68k', 'BR2_USE_MMU'],
         'test_options': ['BR2_m68k', 'BR2_m68k_68040'],
         'prefix': 'm68k',
     },
@@ -156,7 +156,7 @@ arches = {
         'prefix': 'powerpc64le',
     },
     'riscv32-ilp32d': {
-        'conditions': ['BR2_riscv', 'BR2_riscv_g', 'BR2_RISCV_32', 'BR2_RISCV_ABI_ILP32D'],
+        'conditions': ['BR2_riscv', 'BR2_riscv_g', 'BR2_RISCV_32', 'BR2_RISCV_ABI_ILP32D', 'BR2_USE_MMU'],
         'prefix': 'riscv32',
     },
     'riscv64-lp64d': {
@@ -269,7 +269,7 @@ arches = {
         'prefix': 'i686',
     },
     'xtensa-lx60': {
-        'conditions': ['BR2_xtensa', 'BR2_XTENSA_CUSTOM', 'BR2_XTENSA_LITTLE_ENDIAN'],
+        'conditions': ['BR2_xtensa', 'BR2_XTENSA_CUSTOM', 'BR2_XTENSA_LITTLE_ENDIAN', 'BR2_USE_MMU'],
         'prefix': 'xtensa',
     },
 }
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
