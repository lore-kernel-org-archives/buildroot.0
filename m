Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DACF0CC6B0E
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 08:29:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C747B80B33;
	Tue, 13 Oct 2026 08:29:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JQbBPorqQfG4; Tue, 13 Oct 2026 08:29:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0489980987
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791880197;
	b=kJx2EIxTasykPuO6ORlqWpsUhfLhnG7tlpCVBBmkd+TBG4Vn5Zxb0ap/ZB0YrO+diGFe
	 YdbiI9EhwLSVV4xRO7YK9XYr1bl6ZIaY3Pf5VpPnThXz7baGTjhW1Eh+DoZ4Lj+o16XyB
	 IgVP0zSinUzB7DiCoqhygMJFXgowPjtQDqCOw2/l53B6IVSMC4AfuRiiw6MzPDq2G/V2E
	 WHTZy6NOpckt3cvmvBxhtcTTmxiAlTCat2sCybV4lcpB2BfJfnptuYrKTjYeWFJ8o1g0g
	 qilzavIsUHVxEnTWrq6cdYCnRsg8ngezw/EUWeMJTZndyf/zJ7LfowNNiwFV7oIPivw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791880197;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=OxBF9BaRdx8AXru0F7eVGWR+HdDhxEZ9dAAFLRKFGIk=;
	b=azet/JrlMqF54XyrOOniqiSNuBwvBC62TJmzFqCpp118YRcE8v7cgWr00pHPFdtsgYJU
	 /jSWURncaKYqLV70VP5mIy/ND55w8v6aRV0yd2jJezGdITVFCQ3+7irlrIfeE9W7LBtVz
	 qZ1tAYuTIk3QS8F0WEK0YBqMJSvyRmJPxVs/9iFprcfUyYYaWVQmfBNkNiHPk3aXb5mtx
	 NYeNTo+/LgH+sir3WUMZKfwo30xHEs77Dirc5uuj9MbZoj5Mv7mQHOktXGEq+t0tNiOPM
	 WNn1Dg7XzQ69bZ05rlRs73tou+yxzayJTsAqyaH1dmqvaYCRyS9k7fYB1w5t5xydRKA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791880197;
	bh=OxBF9BaRdx8AXru0F7eVGWR+HdDhxEZ9dAAFLRKFGIk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oeEKe7Xtxy40/n7LvFTEhwXT2ua+kIE9o73PFcdC9XcyjnT+jDBHNhjktGFwR9eCY
	 jUFkukOf1cEQwgqMvRFVQVJ3rPAZvcyeOjLplMXr0KG7E+xXWkW+m2yeLIfsIJdBdu
	 VVWDqqfgNqFJ4qvWTI+FTuu6/WRblNtQUqBoTGty80Y+ciqbgbvSuw7kqp1m8Tk0y2
	 IvNUYS+QqdWZif/0nnRN/NBrO6d42GNRS/HSujiAZLEojTxAqhmCaI44nLJwCqAZLh
	 Xl4wIzM0kYDGWXvhjlDBt4ZpY/UdYP+3HcVuWhHWEZPBhB0XZ65rSyV+RKdEIG0G8y
	 2y4ARhaZ6+QHw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0489980987;
	Tue, 13 Oct 2026 08:29:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EF0A5788
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:29:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE6DE40656
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:29:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p76aILnnw6NA for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 08:29:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 336B4404C8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791880195;
 b=Ymrgrk7qahmYMrgSGF96fzkLgMxWqypJNvYwr7wbUIH5bLIYxFs03VvKAL8LYPCyk8g7
 r92+PBnBJadWuOncrLHBPHEHSPnu1JKp/HQcsA3QguIfmHE6pgqs1XULggLIhmP5wWHU4
 luVx03nPaZOLPMgCzN3gN9z9kw0f6RpevvcFbPum2B13Nc1iu8ujMfDCpk23XiBEdTRnT
 l3a7Y3h+jwWZ3VsT5SwpHwqFlxAgqCuy74v4PzVDLyiqAT4MhMGqylLJ/QSmpiB+DzibJ
 LpysoWHh4AT1lnnFHcO0kGpIM/zzn+fMLxvPSTOgpMK2CiRDPCuH1f5ATceuSE4b9rA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791880195;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=tLSdtd07OUdM3pK/wLKiRoE8juKj9CFPlJaRfoJBkgo=;
 b=Tsv9pWNwKZ9NlsykUZRWmUDctw28nMYUVact0fLoonyLDfbnTYEiSs/tot5fjuQDfTRq
 qidyEhvNYKyM/Kqgz+9QArc0Z+f1GhTHrnjHEHkglAhuCZk15Ytm0eREC0ghShvga/Zdx
 fZLQYj84FZ48sbPOJUIcv612Wc9wjlUSJ4hEmTbqSfmyvlVh1UeggMeSOZ4tBVqIURGu+
 607Hr5nY05uj9R4/tDnfCKnphns08FmokW8n065KwsBPeHpxIpqfksqtR4DIgzlfXbYHr
 KnpsWV0WoiEFBD3TxrhQhVrRIxnqqGNfTZhPib2EeFLZn39/3mJ5rDS56+fwRF0kWFQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 336B4404C8
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:29:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A58A79549F; Tue, 13 Oct 2026 08:28:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 10:29:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0adedbe86909621381bd758cae000ea41665bb05
X-Git-Newrev: 2a1b2030c73a4576097b3179d2d8664d1fda4291
X-Patchwork-Hint: ignore
Message-Id: <20261013082835.A58A79549F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/sipeed_licheepi_4a_defconfig:
 glibc needs gcc >= 15
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2a1b2030c73a4576097b3179d2d8664d1fda4291
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The sipeed_licheepi_4a defconfig doesn't build since the glibc version
bump to 2.43 [1]. Glibc increased the minimal gcc version for riscv
w/ ISA RVV in commit [2].

Select gcc 15 in this defconfig to be able to build a glibc based
toolchain.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/14728914049 (sipeed_licheepi_4a_defconfig)

[1] 227378b5930b681c79a13476ae60a98753a98a03
[2] https://sourceware.org/git/?p=glibc.git;a=commit;h=47975914fb106b83c42bc0baf6435a0944a23d30

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/sipeed_licheepi_4a_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/sipeed_licheepi_4a_defconfig b/configs/sipeed_licheepi_4a_defconfig
index c7867ed05d..602cd50e0b 100644
--- a/configs/sipeed_licheepi_4a_defconfig
+++ b/configs/sipeed_licheepi_4a_defconfig
@@ -2,6 +2,7 @@ BR2_riscv=y
 BR2_RISCV_ISA_RVC=y
 BR2_RISCV_ISA_RVV=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_GCC_VERSION_15_X=y
 BR2_GLOBAL_PATCH_DIR="board/sipeed/licheepi_4a/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_HOSTNAME="licheepi4a"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
