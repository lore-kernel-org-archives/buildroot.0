Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F78CA9EC1
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 15:19:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B13D8112C;
	Sat, 10 Oct 2026 15:19:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b9d63kGI9wuV; Sat, 10 Oct 2026 15:19:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5D87B81155
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791645539;
	b=nss78A4MG4ymLUwpP0QhOEt45weNZxXt5uJfb4nu7UUFPFPNdBGZIgg07qbiHOWLftIG
	 nvT7z9Pa6tNRGoR9ZCxRagzIIQxgWZ8FM2B1dPD/sH/Sa2dmGc4uS5hJTRSHp5dJVnPuV
	 Dndf6LbNz+ZpisY0yFgTLGGSnKFx/S15HZMP4ur3ibUB6SgPrqZs/NOoI0HRk66HKvuIb
	 A4zpCD2Y6SJex1VphxQytpUBl2UB1069ZukiHDYj8suBZQRZ/H+MJmp0rJa/0LW+OTHWm
	 9bTn70hVVv9CLsxzHVW7mVkW9dPkeNn04Ee2Amk0T2DF+wxhuh4tIEoxLsuAzYSJPug==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791645539;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=CHvmrhk8ZZAIGNFIUohEAl20Ag2XEdfAO2q56a+CJyg=;
	b=lDa3jn+tkOsU2v0PNN69Ud6XotpH7LzSeloyvNTD3dzwj1Iqh97XItMHvWgnLPyADaDP
	 kJCQzWkDnvoYlxjDwLSvHD7H4rNuXDowbIkk16/3vGZ0rh9TM46zW7Ru5FDktVUrEaY7O
	 FDCtDjlrzGFHDn/v7+n56xVX0OPl0BVikSZQR45XZ6DEMTrdGoLfMGu3CdGY/J3MYSLCA
	 oAS42F9YrWx+CX5eZm/lr0hWVRhmrXgCVS7VR5nDcuxbxG4QWm3x5AjML3vDpA6Ugq/nT
	 8wioG3gq8ontC75FNaTVkjt0Vie21cUaHnBJWjpqOqmAqsKRfI1AtV633lXtV3ChjiQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791645539;
	bh=CHvmrhk8ZZAIGNFIUohEAl20Ag2XEdfAO2q56a+CJyg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Fi0gX/zcZEsexJ5zspfF4XF0PGmXnHXZJrIJiTse1ZqQjLep2Zxg0x4dIeEcjc5rJ
	 9JXPh1g9B0YRWpr39BuLoBr16XJjZPDL4MHLObKH5qNEXUKW/pph1RHCDk+fVTrGgH
	 vrEJttuNlCYobkt1KofMSC2qTOaiVammeXbQ9kgjgHMe4Ud0dEnaAexZQaIPtMsK1v
	 H03O/HugigIL0VItHaLmoreC36I2hTvxnJfmXgoxyjlYIVSd1/S4vH5DYIfUgWvd6A
	 VUXxqKk0Vz8zFp9Vx03/Iz6N1N26s3chhqafV9EHg+bGHmbwJPK+YYcU4a0ql1SKqO
	 6m56rdsaY192Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D87B81155;
	Sat, 10 Oct 2026 15:18:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C530A317
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:18:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A7A4E4094B
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:18:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t_R2mSz2P2zT for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 15:18:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0BF69408AF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791645533;
 b=JdQhDKFxBIodVD6Tm67wcxQraKPs84JqonC8ABlSkBkWyBkrbvlQ3cJJD6MfXk0xLcVg
 g5wnQmhgfLbSGwYbAwIo3X+2dNSZhspkJyk0yUUe8umMgAUUbUsrswIJ5SzemPdtNIzi5
 GVqJMSxnXt//iWRQ+w/4E7pT3u14Ma/IuVHCfG35tAGi2qD6h4b1w4LrQRGGItRSBz8rv
 v1Tqn22UVyj6mg2jbwOSCT/EZfcO7bum/VY23mLouzJTcePBQk3Ut1QZKWyVWGnRMf0Jp
 19JqslkZBy4zh9uYwjDbts0SEtmCh+tigLgefKT5abegBcyXI7jKFl/qSBH+Dlum9+g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791645533;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=HCXM0XxNyUtZ6d0hDA/dy2+ZbDZWYEdn8+BNg6euZVg=;
 b=RrCDYXrxxC8lyPv/buWPEsgvQDNMtpRPLsyRqWiEUFrV+vPjYGBD56ceSgesmdApfrh3
 B4AXRkjmTWFEnnleqyeT1EVFpgFuFQOPB6H98EFdo59YSEjZpJsNgCkDTKJ56W7KtPLFc
 pel7KdOpWzFI6YsSSO2Xxlr3aiF2qGWlfgmyl7C02s5ejJgscwoEqTphr9GiXKW3yfoXu
 7e8B+ABMxVRRvUYJt2TBQDFT/NCyZuVCGRkgxOQi+JiiwTwRXijYcX7hTJMccqUHRvyvx
 Px7LNFPf0sfwt9PqWN/IytvuzKp/5z4XXjbtxD2S70Qu7f0tZT/Ju/fKvrrAIT3mVBg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0BF69408AF
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:18:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A219992237; Sat, 10 Oct 2026 15:17:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 17:17:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 32d08d194509a454c80fdffa7657c9564fdddec7
X-Git-Newrev: 444d769c0a575916767f54238c4e01dbd56eeb7d
X-Patchwork-Hint: ignore
Message-Id: <20261010151734.A219992237@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/htop: add CPE
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/444d769c0a575916767f54238c4e01dbd56eeb7d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The resulting CPE ID is:

cpe:2.3:a:htop:htop:3.5.1:-:*:*:*:*:*:*

The vendor and product are valid, see e.g.
https://nvd.nist.gov/vuln/detail/CVE-2008-5076

Signed-off-by: Sebastien Guillaume <sebastien.guillaume@vendeeconcept.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/htop/htop.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/htop/htop.mk b/package/htop/htop.mk
index f42d7bee36..313518d8b5 100644
--- a/package/htop/htop.mk
+++ b/package/htop/htop.mk
@@ -12,6 +12,7 @@ HTOP_DEPENDENCIES = ncurses
 HTOP_CONF_ENV = HTOP_NCURSES_CONFIG_SCRIPT=$(STAGING_DIR)/usr/bin/$(NCURSES_CONFIG_SCRIPTS)
 HTOP_LICENSE = GPL-2.0+
 HTOP_LICENSE_FILES = COPYING
+HTOP_CPE_ID_VENDOR = htop
 
 # ac_cv_prog_cc_c99 is required for BR2_USE_WCHAR=n because the C99 test
 # provided by autoconf relies on wchar_t.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
