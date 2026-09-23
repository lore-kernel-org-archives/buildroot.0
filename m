Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A491CC98321
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:58:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C6DA41040;
	Thu, 24 Sep 2026 18:58:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G_-uPiJZKJyZ; Thu, 24 Sep 2026 18:58:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 1502E4104B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276330;
	b=FKYYea2QZjFodfNBR9jIR2RipfwfXgEE2kOJ0xcKQ8+FJ+SrioWPCzoG26ZASoQku8eN
	 lxQw3+IIzEwrziSBf6XwLX4ghOCTDUQz+YQHYUrG6duGZZGTohnUJhnNUf0VCNMSdnJNI
	 xYAGlVprIibpkeqlbpXrRGR53RQ00fQx8NGWhb4nWkyx+xU5Xqa2OQgB62o3EySXvTUuu
	 Q4Rm5dSpu8S6DN8YhEEPOrIzlxwOVg9ZvZ4g2m5fvIaYNbSdVJ0kqweOUnWY2QVe+Zl5f
	 geJaehjGg5Nylz55Ev8XS6b39gxJjIJeUCnLu9XwHeiaC6AbidU/WLpdm56IHuzRjUw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276330;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=LNRocIji1BfOSm9kjkJvMNOIemVUcPnfV0nD5DQKI6I=;
	b=F12aHfuMLBr79kTGSoP/kcKyLNd+Fxmdwt3WVC5DEPnYqooxYG3sB9ulmWPZ5jhKBSr+
	 wvVgOgvloGqO//enMOGeFUsxUBTRkEKrUnCbTACZhquI7BPP4iyG8wvVnhIlyz21HBm09
	 MatRCrxBpZFBdFs7dK5HgRkVkzofaTQggfgr28ygkglij3qsUwvR3aiWsmIQ58FDhpqZO
	 +5IQTzRwr4cRuHCbCMIaDxY/j7LJIFe2EC59uK9+OGbAWmHCrvCz/40wQIgsvmfEAY6qy
	 61qW1F4i9+9iuEk826Zouz8ZYzyRTDOiarXfezmp6pJSBmKsVSzuloUVv/kVE8aoG1g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276330;
	bh=LNRocIji1BfOSm9kjkJvMNOIemVUcPnfV0nD5DQKI6I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OTQNX/jbQp9mPcyDKZjjVz9PTgisl3bkSm25c0oE+QE3PngHyj221t+KEkQGQVyW2
	 fVMA6xgzDopK4PrqGOH7RpqPqEIiB+8rCgaoC+VCd97TIhyCF631GkEsUzF+rXXjM2
	 i40Few4hx98C0nA+QKm8HgLOllwUTYTQJsgABPAn1k70kNj5eItI4J1WVlRbzgf8Ty
	 4CRscfUHg0OEma4KNVX5MTT5gJWHYBeqq4uXyKzaHzCM1hijAipYaZLOwYchYK/nIs
	 Y+ioIyvioTrBlwuWSBY6CHFbZUcrkV2IZGQmU25k14tc/lsevzUSuA+U5wmkCmIOR4
	 DvV0r3kM7p15g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1502E4104B;
	Thu, 24 Sep 2026 18:58:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3039A392
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 165C181225
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4K6zvFgCFOv4 for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 38C8981218
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276211;
 b=hMU/JCFgh2tK7YXmVrKr9BP98QhAI2nbk2wlPahjpAe7dGxHdDz4mcDpmTT5IVjsMDfh
 7Cvh8Bi0vdGPPUiFfMHPLwLgGRu3u2SBT4OyK8a3BzE2OD4n3EQXalCdIsPWwFDz1dTBB
 l+w7/fElwBI2LXmEE3INMaWtT8VPX3avFwm3IsLXJcXPThvT6NvvEttSp8+fQTN6Ihp0W
 K/j+Mw+LSDPu6zKWzdgR1bKPDKcapUxxeicrvaQjOeOb7gXxQClJdOADerXdviVuO56dn
 HwCDIMLFOa+sjUcUIIP8GC0LZ5bN2XOzYzHGKGNvtFMnXoiWr2TvyeZoClZ3CxyfEbg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276211;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=AMIME1mMe6X4///lqSwSolT16A7l5e/KISbSkF3sDXc=;
 b=Cwu8OZjUeYQkAruhJWO6F0sdMN+nd5vigSBq1UQdqWNb6f91WcZ5hiDU+agoGeRJhN6e
 nsi2ASMRRB2wA1Zk1ioLiJ9+TA8CUSWC1qN09qPigm0QZ38VjTlwgTHQhWXLRGBQ0rscr
 uVx2n57YK73c0t8LDfqIWIDFocXrRuLLdl1DGnTku61IQGJjEQvp4Cqs1+ek+SynYmmGz
 bnGQHX6DW2jCK9jNtXMZlRRc3xx1GoMmf4R9LohUKZisenbj70gvRw2fBjSoy+ujsj34O
 bakAcFn64GrKOpQ+mEUHQiHYUmnhdKYxERwSDRTrma4AFKbu7pk8WAO4zgkdxbuclNQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 38C8981218
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D07C598323; Thu, 24 Sep 2026 18:55:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 17:54:38 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: bd7d7eecda6ee1137d9fd6aa370b713ee809e628
X-Git-Newrev: 01f4bae85b56bb02c2779fd2acfbae8e17d1ec07
X-Patchwork-Hint: ignore
Message-Id: <20260924185540.D07C598323@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/glslsandbox:
 harmonize BR2_PACKAGE_BUSYBOX_SHOW_OTHERS select
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
Content-Type: multipart/mixed; boundary="===============0936746153299825062=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0936746153299825062==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/01f4bae85b56bb02c2779fd2acfbae8e17d1ec07
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

BR2_PACKAGE_GLSLSANDBOX_PLAYER_SCRIPTS needs the full blown version of
bash and coreutils, so it selects BR2_PACKAGE_BUSYBOX_SHOW_OTHERS, but
it does so only if BR2_PACKAGE_BUSYBOX=y. Which kind of makes sense,
but is not aligned with the vast majority of other places where
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is selected, where
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is selected unconditionally. Harmonize
this with other packages.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 22540e0d41382a8085af110462e2aea6508da4d5)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/glslsandbox-player/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/glslsandbox-player/Config.in b/package/glslsandbox-player/Config.in
index d2e146d827..04ca85f381 100644
--- a/package/glslsandbox-player/Config.in
+++ b/package/glslsandbox-player/Config.in
@@ -35,7 +35,7 @@ config BR2_PACKAGE_GLSLSANDBOX_PLAYER_SCRIPTS
 	depends on BR2_USE_MMU # bash, python3
 	depends on BR2_USE_WCHAR # python3
 	select BR2_PACKAGE_BASH # runtime
-	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS if BR2_PACKAGE_BUSYBOX # bash
+	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
 	select BR2_PACKAGE_COREUTILS # runtime (timeout)
 	select BR2_PACKAGE_LIBCURL_CURL # runtime
 	select BR2_PACKAGE_IMAGEMAGICK # runtime

--===============0936746153299825062==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0936746153299825062==--
