Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48534C9830E
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:58:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DF2A40FEC;
	Thu, 24 Sep 2026 18:58:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KOdl8JXQxPiP; Thu, 24 Sep 2026 18:58:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 101BF41000
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276324;
	b=mTW7cI7oi77iQRjC9ECVOWrcg2lyZcV4HPWH7BF4chB1zULZ9nHwwj218Zws2z/t3B6L
	 a6sRW+3mtSB3fXhY7fKgUC4/HxU27A2NZOzlnUUqhqHBvwoR79uby1cEbwQgIDE8OTvN1
	 F+NbZb8x1C93u45eBnXtRXtn5uoUw2iPLIf2lB1yZr75WQNmFuzxcF0mFnkgD0bnRcP8e
	 FajujlpUHZDt6sKhRkcEwpe3Q4l1hA2lKFIGj3A4TdJSgqZgOA5zI8ypRHXkE9XRYMeX6
	 eCKllsCbsRedzjEv382d74EUBOylMyKTEPwocfgj3rUU/z3Hqh871h7o6R0BIOBfkrw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276324;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=jixf/gk5MnGMM0Va2OUh17mtw61+7FNhaG6jU77og6I=;
	b=AWGeBptCeRYGFuPp3P52P0X9RU/X6oFDS7GiFz2/jycwQC3HRkHQ2cm6imaMZw1kBYEm
	 cR7WfYBR/ulbEEmm2sDC+rrTN8IYfYi4kpuSpC+i9Ya8AEu9Nf61XQCmPm/6/BeyrvAwu
	 Ad3aOICI94N/MMHPzS+rNnx3F/bX3ZMNMiOHWDKfeQP0O2D5dxdu/n3znhKy8JttAMwOg
	 6vMiDp9u0wx0GqZUR+Sxd5Wy79PdgTb/RVOzZSiNa5ZCN9YFhB9HgpUoh+4Iw1JQnVfEl
	 LZvCA1yIA4uAj3obGsmZyrgNKyKEClwcZX4rLFw8SXR+mM1FZcx7Bo+W+tJnAXGTL+A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276324;
	bh=jixf/gk5MnGMM0Va2OUh17mtw61+7FNhaG6jU77og6I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XH1bTi9g7V4lZJBffIiTrRCNuA+CAzfRhaX/g6lh9QKnpvPcN6nbTn61Fve9KCNlN
	 IkQj7Inz5aOyYRE3vdxha9/mVgy1IWO/CjmVP9Idg2DSmHM6cO65Z2Bl3atZX+gon2
	 mdlBRYp5CabWn0Xv4YOJRXFZYXY9vrN0JlbqayvvdugNftPymxLn069HFikcNKrH1S
	 MnIKq5lVGJ/RrFDFk/EwzmVVa22PYim13thLvPDM6mt3k1iXuYwSmqBhREkiW7V2vK
	 aWreyb/Q8V4aiSWaiuZ2sU/uFtlYqwjK13R3EBW7atBujGR2ABrwwo1G/+RLdJvd0r
	 me1xxIspK1EBA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 101BF41000;
	Thu, 24 Sep 2026 18:58:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D37CB392
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B89F38122D
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7zS68V5VK0IY for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E961981231
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276211;
 b=mCSObcneehIoNVJO+GrLY43ZQGi2fWsDmjyiRnDx6HujberOL/q+GugQQDdFpa7if/BP
 ZRWosyh7mgzBR3g167pZ9adTnSpKHs4TmI2gmyRbM/uccid/P1G9XoGBs9ERR5dUpPZiX
 iWe4gyXwOCD9BURIXFYy9bjXxjwv0Epacdo0olNtYQAxsHtfQDLfLI9VKWmQVkmBBHg91
 n7A6OzAVXcUExXHQxR57jdK7tfTzd5NzLoTGZol7rKU3at/kOEL1hThmJET7EQm1BBpAp
 N3upccSkmbyLiS9wQGK0ZbCiEiEFPjyeIQgjN5pAo3yKF8o7D3p1ii25psjeB7UzL+A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276211;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=KnsCpcdJBYEhA77npd6oWb+q/zIZlONye5W3O02HN0M=;
 b=p4sKfTM+2bDj3+gVDDl9M8M114IgpJZ1ZevageuUeH52+1oieLbF6UXKDuDWOHKmQzpe
 W6I+qRkhu3K5rD95AUf+xCC44a6ZcNTpWJts904r8vehH4tF/bhaHH7GOuw0rt2kkjPg/
 5hkdF/p9WmuUGIZer1xRp6NxJVVNg1bVBKBoYxUb1TJJmxU3HLYOnwN8LFz1A/1IxHQpr
 aLnY09ZaZO2R9EmbNwL2t8bS//sPsF7Z15rpEw8UuX3yYWyb6llK0WIuKadNFHx9y4+7i
 FBwOPcaWKVveJSPvdlY1SegrxE8nxbdFPUmc9Djuc6umy0bnVawuAYkCvb5GoCSIYjQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E961981231
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8D02A9832E; Thu, 24 Sep 2026 18:55:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 17:51:39 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 8b24e3a6e93c06a9ba376461b75ba7701a8da6f5
X-Git-Newrev: 2378e81e770a2ad07f0654c6e16a6b63e66d96a3
X-Patchwork-Hint: ignore
Message-Id: <20260924185540.8D02A9832E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/strongswan: fix
 BR2_PACKAGE_STRONGSWAN_BOTAN dependencies
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
Content-Type: multipart/mixed; boundary="===============5031165176146530478=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5031165176146530478==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2378e81e770a2ad07f0654c6e16a6b63e66d96a3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

BR2_PACKAGE_STRONGSWAN_BOTAN selects BR2_PACKAGE_BOTAN, but since
commit 10a70b1af67cf79986c2e401f7a54aa850ea82d6, botan needs gcc 11,
which was not propagated to strongswan's botan option. This commit
fixes this issue.

Fixes: 10a70b1af67cf79986c2e401f7a54aa850ea82d6 ("package/botan: needs gcc >= 11")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit b56072c12692172edbae9ca62c395c6e94d21c0f)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/strongswan/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
index 10efcc1616..6847ca4f62 100644
--- a/package/strongswan/Config.in
+++ b/package/strongswan/Config.in
@@ -35,12 +35,12 @@ config BR2_PACKAGE_STRONGSWAN_BOTAN
 	bool "botan"
 	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # botan
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_11 # botan
 	select BR2_PACKAGE_BOTAN
 
-comment "botan backend needs a toolchain w/ C++, gcc >= 10"
+comment "botan backend needs a toolchain w/ C++, gcc >= 11"
 	depends on !BR2_INSTALL_LIBSTDCPP \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_10
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
 
 config BR2_PACKAGE_STRONGSWAN_OPENSSL

--===============5031165176146530478==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5031165176146530478==--
