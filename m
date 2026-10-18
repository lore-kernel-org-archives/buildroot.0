Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 732D0CCF2C4
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 20:56:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D73C80F84;
	Sun, 18 Oct 2026 20:56:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WH4HIxZ2VJHi; Sun, 18 Oct 2026 20:56:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5E58B80F58
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792357013;
	b=ODh9fQRQG9u4jQhrUq0NYUKVdJOp0mK45Vy8QpLSZPqcMQv537qeMori0WTXclcvvfaT
	 8vXW85VcAlvqmCqTytea1nMlxdzeIkyTgGUQrKt0U9/xgx8qoHUQlBLTPzYe3/ZZhkbfo
	 OQceW0GHKJg7BMgbeyw6TFM70CcjlprHa09x2UO8XpvISWy5phmIIXRsxXnPgg1ioscbr
	 d2ryzFHsb3pkLv3PrVM4WKF8qPZX1GyRIdDLPdj5wbJGm1Oh1Jprbh7q4gP+g1ekHPlxU
	 MEuH9vkWYtodHEKA90OTPmPVrK9/BOt2qU3APu0MjmfuvXC5F6uq8iidgksLSBN5Org==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792357013;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=Ze8rMPpAe/agWIWqaye/zHtjH6ax3lGTx/QUxPWv7+Q=;
	b=td/OBd9gXKwJ7UdRdHOpwi+EDA2HxBk4d5R88Xu5TIwwT/nu0s3wZe4M/AEEPDE3S0dx
	 h9hu28vntKs/iRab90m6TmNjOYADciai9+gXUw/SGyq28OdgPsQHCLHYPkCW1Lsjb4ZRq
	 YrRWQmpGZGVyeXg8NKn3tRa90Ly/REWr3V8F0oTdUjmsrrQ53/hn7d/aRzm+qlT3FtU7Q
	 DIzE9ZzXFGJILjpvplmrHX5vTnyzgSIcufFYOqEZiYg1Nu7MwNheZznM8CyxtnBW1w9g2
	 G7BZarBxIr0RX0d6/wAwerLiVA4S5u/AZ/rz8pi3Isaw2vtAyiXIOZR0wt4C9Auv+1Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792357013;
	bh=Ze8rMPpAe/agWIWqaye/zHtjH6ax3lGTx/QUxPWv7+Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HnMjevlMsvMV89nI0iapatGL9/ic0n0QgqLpnLzi9dXWP0hO9vuN8aAwKKUCOVxrO
	 yyn0YIHI2s1tFRAdxoQW7hA4Z5++1EPTsldqsohu1EaDIPmyqHy4flCMAV8y7dAinb
	 BXeP2udxUJTeAXiHbOQD9miWbv1aE9gKETV5KTk3Js1IVfxiwcbs2tfwzWeABrDZL3
	 6enHpmsx7cMhdhJj2W6T8av6Mvrdd1BNsFaYs/DRPtNIVIl/H6HZEcqbdf0A/xZjtH
	 VV+xB8gidthj+boWmSyleVto3/5lo4Felt5IG811LHszx/3dkQRaAsKwquyvycXKbA
	 wJxsefaYdki4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E58B80F58;
	Sun, 18 Oct 2026 20:56:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E5F72A8
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E811B403EE
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:56:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cxZcNAmYIujY for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 20:56:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 51953403EB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792357011;
 b=FGlW7cOFInPGToyfNGgQBzbrAYVNQaMG2ICJrtU6cB9QE3UnKj3AczyX6jSIfET34Lf2
 jx6Mle+ZNsySaVhfwgIlblvpHmBWq0RAMLK24ftweDyN4DIcX+XNK9stMui8M3Cs+q8vQ
 QWE/ixDBmFHvBT0nGC4bIuLdTzG4DFqyC8FSpd8p/AXcXKxouSgrUNzOazsojfej0wPD9
 irUqYrJjGSpM7rSaoTC40hRrNDSmzcdv2avg3jvFe7iVtI7c1yM3KlcIZNBH5MpaYbJen
 hasZ140VRUvRNuNW/o32aGrtfb5EPMIDllMkYusg3Txe3qsGMjWqQwJchS7dIRqA95A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792357011;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=p6O27geOBqLKJhVMX+kjLVhqO9yUBwtLzs1OgrJgtv8=;
 b=Vrh7XCHjJf4mFuVnIylt/c9DvimlP4DpfttK8jYhW+T9GBTEMPYo0bTgfxWCgInmWNue
 yugk8DRangOMTEFEQ1RoFT8VHvAba3owcvnW+SMSD5g88c1VMGYiLpioGTgVeadpDH6j8
 Nd7hkyF6sci/NIOyeqRLe4MbFQofQ2TwxK4sA8hDmM+pPm+tz8VF0+GBR0/yPcQEtgkZE
 Qp0LxrGv/xX0N50sDugoJY1f4V5Jm6su+jZRnonCEU/B9l+7Zsy6Pyzg3r8kl9N//E6Mn
 UtNfQ/711yQfddNBWtGI7e6/vUvDO7sP/Y8/XqJcdP1u1DcY2pGa0ulQKGO0Bp2Ttxw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 51953403EB
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:56:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0CEA195B2E; Sun, 18 Oct 2026 20:55:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 Oct 2026 22:56:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a77b6ef16792803505552e01c8210b0f91583f2c
X-Git-Newrev: 4cf4feecc05d0d64b3654832741ae9afddf42c76
X-Patchwork-Hint: ignore
Message-Id: <20261018205529.0CEA195B2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bpftool: allow building on MIPS
 architecture
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
Content-Type: multipart/mixed; boundary="===============7445297895368042815=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7445297895368042815==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4cf4feecc05d0d64b3654832741ae9afddf42c76
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

libbpf supports MIPS since commit c86cb27 ("bpf, mips: Fix build errors
about __NR_bpf undeclared", 2021-11-25). Unblock the build by a setting
BR2_PACKAGE_BPFTOOL_ARCH_SUPPORTS=y if a BR2_mips* entry is set.

Built and tested on BR2_mips_64r6.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bpftool/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bpftool/Config.in b/package/bpftool/Config.in
index 9500baf11e..55b31c6174 100644
--- a/package/bpftool/Config.in
+++ b/package/bpftool/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_BPFTOOL_ARCH_SUPPORTS
 	default y if BR2_riscv
 	default y if BR2_sparc || BR2_sparc64
 	default y if BR2_s390x
+	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 
 config BR2_PACKAGE_BPFTOOL
 	bool "bpftool"

--===============7445297895368042815==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7445297895368042815==--
