Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E95CC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:14:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 027E361488;
	Fri, 16 Oct 2026 13:14:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h9ZAT30ICJ1t; Fri, 16 Oct 2026 13:14:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 24F7661482
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156460;
	b=hT0mn+TxzZwZ+j/s9/v+kVmFusER4uHUHoKnCx3LPDHlhUt8Ikzc4aM5/ZONDgswwjsz
	 0ujrEOpUYVUc25/NS92OyAMqcTl1wqNI6T3McIvnfl/DREx6TfPCuV+8iAlo3oDhRmKwZ
	 Id079fZi1RQS3lCZijGmy+rsnd6ysVih8DMykrJvJZnzSTCOG1AkGYkgVvu3BFOArmBog
	 WeojDp26uJxy4Ab1yJUFqI7U9TxM1pgjCXr+ECc8f+hHYQ6Qp/khneuKUtehGUWshlTca
	 oDSmZ732hHyycQhS2GSL0N6vaM+KJZi3OYC5HC6yMd2vMUJVpso4vceFVvAEUcoUN3w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156460;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=4As78ppNz9FRfjOyndChES7nmvF98x0rCYY1fdOsS4I=;
	b=r/khl+FwMAU2Qr9Txj2vCpBHycWhEhuLKdWOmwJ3cYlG7HUMPiR5WUthH79FVF04wcTm
	 Vom+syQRQn+fPHuRmUH05CRwdm1axkWsjocXzvOi+TuhOfR8pWnQzV/utGtkbfx+3C1Aw
	 YpUDXbXRd281CGhUidpcxuRmXKzCa0Ws2ZaLRUPbpNqirV5EAyNzDsxAPkh9PSTJb/sYN
	 S9oAPWB/vbT5lK+x6Me0ogkX2SC/nwY6AvlJAb2aCUCA50ajEgjReg5DPr8hQgpFqVJYx
	 +CSlRVgR2ILK69vfgdTP/V1kThWdV4ETzaI9s8N/6KsBubBRRL/4QQ3Kc27D3s+Vbbw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156460;
	bh=4As78ppNz9FRfjOyndChES7nmvF98x0rCYY1fdOsS4I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XqX51Q7KrwLiCqbRPHDEq1tXkT9XCP4bHlU/ewqSQdgXudD0JM8ibGj2KAyL8Hj8c
	 s7FyetxepEQsftY0z/UELUd1j0bAjf02XYFvjx0t2Q/e/OxZG0wyLcq/FhQnHuUdcD
	 F6epXqOUqdKELXmiBpDuJptsC8oRvQ+UzhorLfS9v3Zmno+o34D7Ro8aG+bjmhkcNh
	 rGhRYQqS5drhDM/z2Mnb9rubSJ7nwAzTelzmGBn0LG8C7hMURjrj8Sh16sdEEJ2enV
	 HK1nh1fvFhfrvpRCD9c59lhGJfco8+XIf0wyqxYhOaa3wqb7V51xZUy6Xab/wMA7vK
	 dfkmDlVFh1EyA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24F7661482;
	Fri, 16 Oct 2026 13:14:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 69D42769
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4EA2B60F25
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tSGa5MlHudXY for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:10:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E120660F69
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156194;
 b=sgn8awd5zQY06+eji8uP6cRsobV7iVvHXpK8iqb8d4XmI+wc6vSLIiyaGSGdeiU8vT+5
 txPmAu/9Nb7i1rpeRfuQCV7GAZtGyRxYlpT0UiM8qBpLtmNVTucYKbnk6dgOW74h0Y8jF
 cRkVMGTZfrB62RQHJ0UkeqXkaSZSl1dwa83PT3s31pQtSBoKz65fs0FwO8DOo+d6+DI1R
 2WIbT14bTwS4NMqz/5Rr8/6MKfgaahJpmBIGae/EWr5pO3kPM9ksq9/ykqwwJYc2dRFYg
 nLbvmVlSfCAqeYBtzt1ykJ8VZU+gjQKZ+4pFMNLdCzfXHtwq+bJTuHYBIb6J7Cmn4Cg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156194;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=M4u8t7g38DRGa8VclFqWz0ewJdPjpa5hu74ZmCnRAUQ=;
 b=dipIs3qiorN5QxdwUlSPC+fjI7Vo1CbnbuyrMU+9pej/q2z/q3T4ccxCss3zUqnMzrs1
 LqTiDu/PHOhjeTmIILenU1GQ+eXv0a7Vz9TxPCq6kxJyvvovTWU3Ep8SWVz4Eh+e/h1Tu
 OsJ3VX/ew53/0F7h/ciLBqHvAS1QyFPeeIgdPrL3qC+rwTGklSSXAOyUTwmbIInlOhbmE
 Al4hsJmpF0fHi+Ew61PHM+ZDB7uDlKL414aBa+ZAy3dXLuqhWYZAUPzFqpPXcLQuuz1TB
 pARBFOFU9hpVkcCIIrX/OrxrCJe5dU3bODl2kmReewwKN9eF4L8hqxFC8cPrwznqEyA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E120660F69
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D15AF8F057; Fri, 16 Oct 2026 13:08:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 15:54:50 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 8b5a8f2cc62d6505b7b2fbef3ec009a790c82754
X-Git-Newrev: ba4416157a63db5d85479d363741e975265cca61
X-Patchwork-Hint: ignore
Message-Id: <20261016130833.D15AF8F057@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/webkitgtk: also
 disable internal ccache in the build step
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4693426141771903719=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4693426141771903719==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ba4416157a63db5d85479d363741e975265cca61
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

WK_USE_CCACHE=NO is only passed to the configure step
(WEBKITGTK_CONF_ENV). During the build step, ninja can run cmake again
(e.g. when a cmake input such as toolchainfile.cmake changed), and that
run does not have WK_USE_CCACHE set. WebKit's WebKitCCache.cmake then
sets ccache as compiler launcher again.

That outer ccache runs without the CCACHE_BASEDIR that the toolchain
wrapper sets for its own ccache call, so the cache keys and manifests
contain absolute paths, and the entries only match in the same checkout
directory.

Pass WK_USE_CCACHE=NO to the build step too.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
Acked-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 9f0aacb6346083db480478c59711507263455aed)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/webkitgtk/webkitgtk.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index ee9e707cb5..192a340d0a 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -22,6 +22,7 @@ WEBKITGTK_CMAKE_BACKEND = ninja
 # Buildroot adds support for ccache through its
 # toolchain-wrapper, so tell webkitgtk not to mess with it.
 WEBKITGTK_CONF_ENV = WK_USE_CCACHE=NO
+WEBKITGTK_BUILD_ENV = WK_USE_CCACHE=NO
 
 WEBKITGTK_CONF_OPTS = \
 	-DENABLE_API_TESTS=OFF \

--===============4693426141771903719==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4693426141771903719==--
