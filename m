Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A682C88E77
	for <buildroot@archiver.kernel.org>; Tue, 15 Sep 2026 17:31:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E123E80E3D;
	Tue, 15 Sep 2026 17:31:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7tn9UDsUc9vX; Tue, 15 Sep 2026 17:31:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 2BD6080E2C
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789493503;
	b=cAuNo6xyuyNxr9kXL10uGYrFGYc+id1KLtEKbcRKxf8Nt3+k69kMm15IWiSCI6hpket8
	 Y3qnivTRGmZWc8UEwEM6Vg/aorkQuz6cWwCojDJj5GTk3kqNtOet9yAzTjU8ZJikuDdFR
	 r9ZpTJuN0mYo/vsp2nwXpENR/xrajd3aVqtc7yjPri1armswk2BePKvX0/p7Kc62cr9sp
	 RZsy383oW4YR4UO4Z4dXSb08kbmZ6qEaoaDRPtW7ESTdPhmPhra+mfWYy3nKxWuFQi6Bo
	 dIrn1Q/UdiWbwYTANTL836t/zaBNMuzUALqiXfiByCDoeQ/YOGtyG8fvO46I16QPbBg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789493503;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=WksZLlytWacN3TgiP7XkXnlZoehbDhv6Zw4GyAxzJCE=;
	b=k1LsjoDsDwygVrX037N5C2pnXLHIYtDcPZx7u16M9S+2uheTQb3fO8Uwhv2D4avIi76U
	 yeA0vDxVb2+lWLauDrDtQbjMvu476RrH3QdQOCcYTXpKMp9LFnMt+fQXJX1T3/2RoHgn5
	 nHmAS+3MTsVI7eCqGX2uiH3N6bFB3ywlKPeBc0ekoEYVXLFnD9zoySibUH4R/pwEWBURs
	 wTjfsCyhj29KgobK9nEDDVRyhlHjuigsHAHfWhzJt7BGoiLXfKBQet5d5uY6zHE0yp8Zc
	 tILzOQgbKdJ765/1PsZuQvN7bnB5UooqQdRhaVBK0Kkh0Cjhl98/KvcTSKGh887QbFg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789493503;
	bh=WksZLlytWacN3TgiP7XkXnlZoehbDhv6Zw4GyAxzJCE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=E1E48bfZFmO91MBrnfz1gH9HGq+FDN37Z3YdAnfYT+w9RMQNwzH5nJ03gz7wE558J
	 FxrEtyxi3cnmqOZfoth0QLz8M8+dgb+NuB1rzmndCwIQ2y5dWgAd2T/E+FfvLh2HUV
	 O1nck1fum0O4Kk4dITfR6Ar3sGbkI9EN4MeOQscWKKxRcpih7GIW8GkeVVXBXnQx6I
	 7nuwmESnJlx0GF4Ru0CzDdNJXEDm3Dv5PMpnOudYI2Txm884k0EklaHimQG+IpabRS
	 DkhxY6UsXQfbUdiw0FJ1KQ+p8sj6Rv2DdIzM0+3sBVGL5zym1l6sWAWyzEJ1+jld5d
	 yQMEPqQ329LSA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BD6080E2C;
	Tue, 15 Sep 2026 17:31:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9898423F
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:31:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 89E2880E31
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:31:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7mgPAtpTtP9B for <buildroot@buildroot.org>;
 Tue, 15 Sep 2026 17:31:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E060180986
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789493500;
 b=hbAa2WZn3TTakPCWE3CuGxtb8SF7X4h4/3Eda74C3xENSMUN2nuoTrhEALiuwLjh+Vj0
 XcGp/rDBBxprR0m+tNlCtaol2Xhw+J/Kelx8PUZO4Th4ETRHJEJt3wpOss5/rt+eXHGlL
 JsSKI8YkjcjbOWYS1dBe2Zus+s8Vxd7tSeiZqw+a3sH46rMUIC3ZZbT8kpAf++ohTcxKf
 xnm2PDmNGYB//bT5MIAAXpDCr2t6ltvZ5lWZKq5X6MI2BKtwifwe/UBLjtp51RCycl3we
 hOWPcKc0uKj7SzUGKfcYJAdcpcQXlwY5BdP+3HFVeCrnUhMmFgj6vy8+xeUvHI/ebvg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789493500;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=LB7ULNBBcKk5Rk82UL+ZJmajfsBSIeS5wRpVFZ6xuEA=;
 b=ClwF5gFlB7Hj0WT9GwQreX3k7cOEI6dmmQvHn5nIRptcgo5Y+x5NFFZZO60Q1xmE//Ft
 L26u1mEabeeqhfnJR/jolEdRlm4EMAhKt9/urGsA07mJ1uM0snXakWAMBDP5ynVGfMz9x
 EL1LQ1VPW3E5fEfX+TFgXKl4k43KXBwZisCI2b6EQTfEMX2FESjxCY+CfuYZpMKj6WCYt
 wVFPltnzrJtN/y/otcwz590ma4r5sk6tbKgFqP9udjli7L1g/fv53jo+Mc01/EJPowRkZ
 /3LeL9EF3C7bCnaTtNPSywofQcfG6KxsM79CYoIJXoRmMdB2/aLT7LRbACerVRxFMqA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E060180986
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:31:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EB8668F7C5; Tue, 15 Sep 2026 17:30:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 15 Sep 2026 19:29:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b56072c12692172edbae9ca62c395c6e94d21c0f
X-Git-Newrev: 3472fd59af13245a68f9ea2cdbbeb52fdd6abad4
X-Patchwork-Hint: ignore
Message-Id: <20260915173034.EB8668F7C5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ndctl: fix Config.in comment
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3472fd59af13245a68f9ea2cdbbeb52fdd6abad4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The Config.in comment has the correct dependency on
!BR2_TOOLCHAIN_HAS_THREADS, but that was not reflected in the comment
text itself.

Fixes: 039c1ae13ec12f7cebddf86f37080d0a1fee28e6 ("package/ndctl: new package")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ndctl/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ndctl/Config.in b/package/ndctl/Config.in
index 9d3972bd2f..708871d693 100644
--- a/package/ndctl/Config.in
+++ b/package/ndctl/Config.in
@@ -19,7 +19,7 @@ config BR2_PACKAGE_NDCTL
 
 	  https://github.com/pmem/ndctl
 
-comment "ndctl needs udev /dev management, a toolchain headers >= 5.10"
+comment "ndctl needs udev /dev management, a toolchain w/ threads, headers >= 5.10"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_PACKAGE_HAS_UDEV \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
