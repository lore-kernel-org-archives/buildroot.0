Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3145ACA0EFF
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 19:22:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04D24617A6;
	Thu, 21 Aug 2025 19:22:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1C1H1wuQ-AIy; Thu, 21 Aug 2025 19:22:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E02B961B21
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E02B961B21;
	Thu, 21 Aug 2025 19:22:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AEB321C8
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:21:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A061640D21
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:21:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0XsISvuHbfIu for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 19:21:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B1B4140D1C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1B4140D1C
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B1B4140D1C
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:21:32 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-45a1b05a59fso10249935e9.1
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 12:21:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755804091; x=1756408891;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aptq84ka0S1FrlaKRv9nZEiNCkTRJyipCLiWn04XDT8=;
 b=TxlYR7tTd7j8XU9tWHrxv2XnKvJWNWHrJdwJ7RqCejKx66zWFutE1/2CdHw4zcqjhc
 vZB233Pbcxxf96k3xIFKA1k2dn3Ey2eZK0UwqzE6Kf3EG86SyjGTr2x9WkSHopOoBx6Y
 SLE6DQZjNJIqmsKU9Bay4LYov74M+gC5SLmy4QjLXVi92Allrx7LE9BjxHvb7D83G9Vw
 SVRtlrPE93caMt6bnU3/Z/MBKNiJAHZ7JP64b8NZQYxdmuGwyUeEtEbgLFoVFuLPKH5C
 po3OpOZow17MAv0nIRpao5ONmWLmSE5Mr+MLQNM4bU9j02H4GgBi+tLYOq+/y0bQdbbU
 h+cA==
X-Gm-Message-State: AOJu0Yw02ETc3ULSVlWksUHUELZkp/DN+lZMRlzfwe9nSp4+kFvVJwpw
 g44IxdLvB6CCEI1OqYh7l4hhAJ4G/9gJJHOY/C0wpEbAGrO++HuRUjXJBP6pfOg4+aw=
X-Gm-Gg: ASbGncsB/jOnBYLp1nkmrAOvD1+tHHxTe7GuZGGo18Ea7IhBOyKUzj2pBPA8C1RRPGr
 S/1ennQG4nMIriY/lgxqR/IdRxlyhxLqQhLhOF9T2Grsh6JXuMLs/Q6O7kY4WCxB383Zah+7tn5
 JR81gYfHYQwKVHhXH/hJDMWArwVMZHU1Jlofic5V3qN+VgxCoifU9LjQRF29NaWtR7YK1qHLacY
 aJtWU9znzrcrN4NtEJtQ3JqyO03zEQuLNXQKZWkGLAwhksv49zOrT2DU9Bg5ch8jB/QfI3Xwbjh
 ilsveeBgTcIDhOgn2zzlGjtXhORCgX9sx2WVyNfg7ks02sd0bxzDTk19TaYoqT8fBAmXp7fsOmg
 yCHm5WgTk8c4S8Q==
X-Google-Smtp-Source: AGHT+IFKGmSmNPzvSlOMwXvtCF57SHxXNG3nJLRI2azUXpplwUVFGjk5Xm7IwDuymV+u3XPhrxLj+Q==
X-Received: by 2002:a05:600c:4715:b0:456:13d8:d141 with SMTP id
 5b1f17b1804b1-45b517d2700mr1474365e9.27.1755804090679; 
 Thu, 21 Aug 2025 12:21:30 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b50ddfcecsm7843215e9.8.2025.08.21.12.21.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 12:21:30 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Thu, 21 Aug 2025 21:21:30 +0200
Message-ID: <20250821192130.24924-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250819133911.3965048-1-thomas.perale@mind.be>
References: <20250819133911.3965048-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755804091; x=1756408891; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aptq84ka0S1FrlaKRv9nZEiNCkTRJyipCLiWn04XDT8=;
 b=Z2ZpeLmSzNkUCbr4xOOZIJ1AV3L5APpjQX260PnZ23GmGVrFb+GqP+n5JIb1Yer9oJ
 P6nornIYpi4qn/vNyCJ+RREyKyS2fuRkHEDHHkc6YALtw7YTFpSJAYTvDfsuoZLXWSj3
 5AuOdlJ1Hp+zJDvDsSvkYlVYund32gOZmoC/1ps+vTRNjShfVsBC56WtRPztEaEl8hI0
 NxYfZmNcxEDE8ACfXNck5wkFR6kdEhbx6IYz03ra4Na8H6sU5oJAy5JBcWy72zZRTduR
 tAzH2/t/slYMp3WujCQUwqDpr7wgAGkRg2eRnJGTsRHfGtpxwTqsN0TFwvM/O3Cv9Dnd
 QL5Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Z2ZpeLmS
Subject: Re: [Buildroot] [PATCH] package/openjpeg: add patch to fix
 CVE-2025-54874
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Fixes the following vulnerability:
> 
> - CVE-2025-54874
> 
>     OpenJPEG is an open-source JPEG 2000 codec. In OpenJPEG 2.5.3 and
>     earlier, a call to opj_jp2_read_header may lead to OOB heap memory
>     write when the data stream p_stream is too short and p_image is not
>     initialized.
> 
> For more information, see:
>   - https://www.cve.org/CVERecord?id=CVE-2025-54874
>   - https://github.com/uclouvain/openjpeg/commit/f809b80c67717c152a5ad30bf06774f00da4fd2d
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  ...check-for-error-after-parsing-header.patch | 41 +++++++++++++++++++
>  package/openjpeg/openjpeg.mk                  |  3 ++
>  2 files changed, 44 insertions(+)
>  create mode 100644 package/openjpeg/0001-check-for-error-after-parsing-header.patch
> 
> diff --git a/package/openjpeg/0001-check-for-error-after-parsing-header.patch b/package/openjpeg/0001-check-for-error-after-parsing-header.patch
> new file mode 100644
> index 0000000000..9a02fbf3d4
> --- /dev/null
> +++ b/package/openjpeg/0001-check-for-error-after-parsing-header.patch
> @@ -0,0 +1,41 @@
> +From f809b80c67717c152a5ad30bf06774f00da4fd2d Mon Sep 17 00:00:00 2001
> +From: Sebastian Rasmussen <sebras@gmail.com>
> +Date: Thu, 16 Jan 2025 02:13:43 +0100
> +Subject: [PATCH] opj_jp2_read_header: Check for error after parsing header.
> +
> +Consider the case where the caller has not set the p_image
> +pointer to NULL before calling opj_read_header().
> +
> +If opj_j2k_read_header_procedure() fails while obtaining the rest
> +of the marker segment when calling opj_stream_read_data() because
> +the data stream is too short, then opj_j2k_read_header() will
> +never have the chance to initialize p_image, leaving it
> +uninitialized.
> +
> +opj_jp2_read_header() will check the p_image value whether
> +opj_j2k_read_header() suceeded or failed. This may be detected as
> +an error in valgrind or ASAN.
> +
> +The fix is to check whether opj_j2k_read_header() suceeded before
> +using the output argument p_image.
> +
> +Upstream: https://github.com/uclouvain/openjpeg/commit/f809b80c67717c152a5ad30bf06774f00da4fd2d
> +CVE: CVE-2025-54874
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + src/lib/openjp2/jp2.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/lib/openjp2/jp2.c b/src/lib/openjp2/jp2.c
> +index 4df055a54..da5063186 100644
> +--- a/src/lib/openjp2/jp2.c
> ++++ b/src/lib/openjp2/jp2.c
> +@@ -2873,7 +2873,7 @@ OPJ_BOOL opj_jp2_read_header(opj_stream_private_t *p_stream,
> +                               p_image,
> +                               p_manager);
> + 
> +-    if (p_image && *p_image) {
> ++    if (ret && p_image && *p_image) {
> +         /* Set Image Color Space */
> +         if (jp2->enumcs == 16) {
> +             (*p_image)->color_space = OPJ_CLRSPC_SRGB;
> diff --git a/package/openjpeg/openjpeg.mk b/package/openjpeg/openjpeg.mk
> index 275659cd3c..7b1352c222 100644
> --- a/package/openjpeg/openjpeg.mk
> +++ b/package/openjpeg/openjpeg.mk
> @@ -11,6 +11,9 @@ OPENJPEG_LICENSE_FILES = LICENSE
>  OPENJPEG_CPE_ID_VENDOR = uclouvain
>  OPENJPEG_INSTALL_STAGING = YES
>  
> +# 0001-check-for-error-after-parsing-header.patch
> +OPENJPEG_IGNORE_CVES += CVE-2025-54874
> +
>  OPENJPEG_DEPENDENCIES += $(if $(BR2_PACKAGE_ZLIB),zlib)
>  OPENJPEG_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBPNG),libpng)
>  OPENJPEG_DEPENDENCIES += $(if $(BR2_PACKAGE_TIFF),tiff)
> -- 
> 2.50.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
