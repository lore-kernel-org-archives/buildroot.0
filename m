Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C52D0D152
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:51:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5667823A7;
	Wed,  7 Jan 2026 17:51:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ULLD2Y8y4DEP; Wed,  7 Jan 2026 17:51:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF6D0823AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808285;
	bh=0jZPPod8nXNMsOLHp4w0No97KpP5z/ljCXzqrpq9eU8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZGO8hha42TuiJrpZe+POdLphTz2Fes/QNiDr3uEcmHEYcO+u0/d3D8e9tSFmUSnIQ
	 7X3XZ30BWbDjgl82X+QWArrysPHL3mXf0uFKGmAB/nKq4EO27Lq8ARHUNPwLtRRFoI
	 nCdDwwbDvGSj6UlNbLU/vRgDyNtWjQuKVWlgdJGt0HG8Gz/dNgXhxGJxldWrRNzsRz
	 TXaarsf1JkutXnUvhnN7wvprcLZFsYwsoIsFRorg/aIe3vXqRa0xQSOgKxtdkkXvMS
	 qKBKsxgIhJV1sRBoWdIyUJyKp5xjnuVjMcw6SPJXQrgoOC2qZRB1g+5x2j+u2hBnrl
	 iDUgi6E2zanfw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF6D0823AA;
	Wed,  7 Jan 2026 17:51:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C72F9ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 399FB60661
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YXZHAPltLUvz for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:51:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 22C6960653
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22C6960653
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 22C6960653
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 471A0B97A704; Wed,  7 Jan 2026 18:51:20 +0100 (CET)
To: Thomas Perale <thomas.perale@mind.be>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:51:19 +0100
Message-ID: <20260107175119.227758-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251228185637.58072-6-thomas.perale@mind.be>
References: <20251228185637.58072-6-thomas.perale@mind.be>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808280; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=40rrt2wbjVZ6+KVTQgIlSzH2xS/GOqdsUM8T1cIMK2A=;
 b=XLHkSabDCjc0OgpGfEW94eqSRLKIRWFskEepirx4B+JHJFIOjNK+Q4UjzE5DYafFw4q1Vt
 S4dX/i7S8DGYzCgM2ZIMzinQF/hGMKLAhVd/YJIE9TNK/GrFhsDbw2ajitzo8hep5X1Q1c
 /iIxEPLZzvdjgmuiYSppsC5Ajy4rmTS30baxP3OQu1hjuiw6qM0XG2puWDMGNt3XtBUvKY
 qEu5js7vsZfCTA9kCdasveRVuJnSLUUuNjgAMrPZKaS2cw7Pzr/+k5oO2ChOxgadsyJan0
 4pjdmI7lpulkTRzPCU/DxBv6WNVMAIIHZgNFMiHVxBI3b32oKkWCO/2NzaT+ug==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=XLHkSabD
Subject: Re: [Buildroot] [PATCH 06/10] package/graphicsmagick: add CVE
 trailer in patch
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Since Buildroot commit [1] the patches that fixes a security
> vulnerability needs to reference the fixed vulnerability.
> 
> This patch adds the relevant information to the patch header.
> 
> [1] 1167d0ff3d docs/manual: mention CVE trailer
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  ...0001-ReadJXLImage-Apply-image-dimension-resource-limits.patch | 1 +
>  ...0002-ReadJXLImage-pixel_format-num_channels-needs-to-be.patch | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/package/graphicsmagick/0001-ReadJXLImage-Apply-image-dimension-resource-limits.patch b/package/graphicsmagick/0001-ReadJXLImage-Apply-image-dimension-resource-limits.patch
> index 275738a71a..56122e466e 100644
> --- a/package/graphicsmagick/0001-ReadJXLImage-Apply-image-dimension-resource-limits.patch
> +++ b/package/graphicsmagick/0001-ReadJXLImage-Apply-image-dimension-resource-limits.patch
> @@ -6,6 +6,7 @@
>  # Parent  db3ff8d00c28c38895e1600a28706ce251dac570
>  ReadJXLImage(): Apply image dimension resource limits. Addresses oss-fuzz Issue 69728
>  
> +CVE: CVE-2025-27795
>  Upstream: https://foss.heptapod.net/graphicsmagick/graphicsmagick/-/commit/9bbae7314e3c3b19b830591010ed90bb136b9c42
>  Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
>  [Peter: drop ChangeLog/version changes]
> diff --git a/package/graphicsmagick/0002-ReadJXLImage-pixel_format-num_channels-needs-to-be.patch b/package/graphicsmagick/0002-ReadJXLImage-pixel_format-num_channels-needs-to-be.patch
> index d1cc795b4c..004594523c 100644
> --- a/package/graphicsmagick/0002-ReadJXLImage-pixel_format-num_channels-needs-to-be.patch
> +++ b/package/graphicsmagick/0002-ReadJXLImage-pixel_format-num_channels-needs-to-be.patch
> @@ -6,6 +6,7 @@
>  # Parent  036a1376a2a6dc9504c5148249cbd8feaef72de6
>  ReadJXLImage(): pixel_format.num_channels needs to be 2 for grayscale matte.
>  
> +CVE: CVE-2025-32460
>  Upstream: https://foss.heptapod.net/graphicsmagick/graphicsmagick/-/commit/8e56520435df50f618a03f2721a39a70a515f1cb
>  Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
>  [Peter: drop ChangeLog/version changes]
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
