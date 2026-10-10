Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA8E8CA9EC1
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 21:05:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B697810BB;
	Sat, 10 Oct 2026 21:05:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4xQ-7CNBmRLt; Sat, 10 Oct 2026 21:05:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7AA43810DC
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791666333;
	b=ig7KJHy53Pqu4TczX6AVStojttixMUjE4oba1kli6qjyJhJA4dVIOE4XFkeZB1MbA45w
	 xDCi7BJKZi9yFGYOyb38eEP0BzJhY3M6XELOLBo82eJ1fkcGqFr1SimhZVKtoZAoabSzW
	 mW6Wnms7Wd4SPa1tDCC3Q+gORUCRt/kG1PmF1Cw7GatgVpGgbbO3p2iua8P+scydDWIjo
	 txtJVk/YEUvjSySalXNTdZfOI1gN3DglntDqEQ8juMVnGKlkmQXmuikEw6BM5wY5mRkHu
	 N8qLxSWGtBZ7l/H28rvo3FFMO96ptLYgVS63sEd6aFp4HXQqhLNj+kZpA0+gnSDz2Og==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791666333;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=PDaQazTOi6G9bTiaMxvhRLZN3kP7vmIHXN/B7ukQY8Q=;
	b=fpbDbEN4hdhER+GfNnNeOLwXFoMs80IFBFHH1f1At/Bt4heg/hY7yJUP8Nz1cRavBlB6
	 rUGCuArZjPRCeVkjc0VjVMlTU5kdjX+s63Wa99H9QTm/5Msh08TvRTbaPYcIN3W9O+1+f
	 brXMB4fqszYhp0NlDusnOYWMXEE0K5rpla083MKpRAs/sA80d02RKoJLUGRhjmpqbzUhM
	 QUExjMJUlgPSrevRwO0alOhXmCKJj3vjBFGFufGSFEkJWmP4vMSEsJIMEigBSsv4z0M9+
	 oQJdzmJD2dVt/6ubZRTlyNM1JpoGs+NI8PptCH1QZkFwkET2eIBsoqs0iU0N8SS6pOg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791666333;
	bh=PDaQazTOi6G9bTiaMxvhRLZN3kP7vmIHXN/B7ukQY8Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NNx6bL6mMJDsSnX3AFS7Nrb8bnzqitvIlPhwvwszXv9NF1LlWVFmvEFBH6s+e69wh
	 u5qsnaVj8QI3HR/ntysl/lyyU6uENOtf4mCEa5m/3SgaUw0WSTrL5Tj9km5NYqsDhd
	 HKhKz5Pmp//qttUNm88XqmB4R/uFwWxlaHNc7BWA1VHZGTUI76HPmOZpHpkuyFFL/p
	 fEdhrno6Il1p5tZiAJHdRb5o8ykqj8jtrP/IL9jp3Tzk7mFN7YFHLqDA5ueF1koB0F
	 Euoyf6qoUY+1e7em4bQboMFPlYDBHTFMVF1Me9fuDN92vkEPAwgUyqRTb1QYap0voW
	 H6gffRHPkSOHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AA43810DC;
	Sat, 10 Oct 2026 21:05:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AC880105
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 21:05:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 92089810E0
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 21:05:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VWC4tXFuJiRP for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 21:05:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B6298810DC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791666330;
 b=FbioH3PRR8GdagBoE2QE/yXZmzn0wIlA9MO0XgB0QZ7muQ7wAutY/FjVYFmTc2kKTNhl
 6vz7ATkPkJa17WArgBEJl3pmatWGg/dWq88BlfNt7VlvcZbbIRIDMhQ3cqTTJGHKI0+1U
 y5toaDiIjchI8i1SG3yxGGba6E//898QVLDf1KL9W/OR6aImJyPpI2GQ9dBuvoBXuRnbg
 v8PtgEVqpBgvWMbES4q/OTkQOWBintJWNzrtTDDPLO8t8ffDGU+lFhivFrCG5Z/CL1kOd
 2pIRczDBznJSY6NP9J9zdhS6B5t+F0BWfvFPmPQw9p1FOyAD7dGr3oGUjECaFFsX46g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791666330;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ExI03mb2sTS+8ejTNHTwOifRhaa1G4djLkKwmxH9n5w=;
 b=D2HNYqFiAwsYETULPSaufk77fqw5UTGrjCxY+c465B5N/dBAxtZLb0Q148k065i3W9fL
 1DC5tBtkcQYFOzQkBDrgqGxLlyw1JmTveEWNvzXOwYvMzurTc7rkeTJ6FsM4Xw9WF0/m0
 cRAP2PV/xtOhUGUfNG6Nx2gCMIyeeQdEJ07Q8LHlM9uzOHHCHSI8Tr3hBQTX9ncsdTREG
 CJ4baFlZAD0HSqJMYslTlQY28p6wmgwL8GE8ckYE6N2F8LbTlsTfWON/7MllG6QrQMk74
 zmaHtutuV/eTEQRwTwrqzfAOTTqLAYfW9pPer8SKHqeETlaWCgO85+fR75J1HdITU5g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B6298810DC
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 21:05:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6150093570; Sat, 10 Oct 2026 21:04:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 23:05:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2e6f9749b17c220afd6f1dcbdebb037106a193ad
X-Git-Newrev: f7019acad226cf01c40f278dfebc32dd5e8dfd73
X-Patchwork-Hint: ignore
Message-Id: <20261010210412.6150093570@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/util-linux: adding cfdisk
 enablement comment
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f7019acad226cf01c40f278dfebc32dd5e8dfd73
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This commit introduces a menu comment to users to indicate whether the
`cfdisk` can be built, even when the basic set binaries option is
enabled.

For users wishing to support `fdisks` utilities (cfdisk, fdisk and
sfdisk) in Buildroot, these utilities are enabled through a
`BR2_PACKAGE_UTIL_LINUX_BINARIES` option. This option configures
`all-programs`, which will default enable `fdisks` (along with other
program options that do not have an explicit configuration). While a
user can enable "all programs", there is no guarantee that the
`cfdisk` utility will be built if neither ncurses or slang is
enabled. Even if an explicit Buildroot menu option is added for
`cfdisk` (where we can force select ncurses, if slang is not yet
enabled), there is no specific configuration option in util-linux to
toggle the enablement of `cfdisk`.

Signed-off-by: James Knight <james.d.knight@live.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/util-linux/Config.in | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 5d60d00e3a..9e7d7b7bfd 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -67,6 +67,13 @@ config BR2_PACKAGE_UTIL_LINUX_BINARIES
 	  The setarch utility also installs architecture-specific
 	  symlinks like linux32, linux64, uname26, i386 and x86_64.
 
+if BR2_PACKAGE_UTIL_LINUX_BINARIES
+
+comment "cfdisk needs either ncurses or slang"
+	depends on !BR2_PACKAGE_NCURSES && !BR2_PACKAGE_SLANG
+
+endif
+
 config BR2_PACKAGE_UTIL_LINUX_AGETTY
 	bool "agetty"
 	depends on BR2_USE_MMU # fork()
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
