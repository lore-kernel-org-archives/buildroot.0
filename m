Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D78AFF436B8
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 15:25:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF2E781CA0;
	Fri, 17 Apr 2026 15:25:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gfnQq85mESzD; Fri, 17 Apr 2026 15:25:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD3EB81C26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776439538;
	bh=QnMkqVXzeILAlFfrnCmWnSwiB/ezVFcUoJocEGKSar0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CvOmdz8e+rD68nLpAndYNj2v11HJL82gXhQLcvND9gJEKjzQkfYI3JXsxI4t4CFSF
	 8ur9mczY08MJ2aSuKbG3bDCW+cE6EhPB1xJ++xaTund1CdfO9ISLm4v1dENbwpSArz
	 3wwYC3tVujjhXBDGIGBRSCj6xfNe61qb1jQSHJcoxQ7cgmSvzuJrGRYO2amwBbP8Rw
	 ig8+6VwSsiqWwkBJN2EfyP+Vs0FkWmkZ46ulbYbamRDUr7kwolrwftU8wKjUsDXxs+
	 MIAE8HTXXSmVit8leEXvebJsodLPgCljlmovjYVoM7T/BX5IA6tmeMRbATsgj+gp/J
	 Vo7K1LHV8X0AQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD3EB81C26;
	Fri, 17 Apr 2026 15:25:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AD0FB396
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:25:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F82A40DD8
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:25:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bTIg6-9FY1OK for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 15:25:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 92CB640DCD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92CB640DCD
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 92CB640DCD
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:25:32 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-488c2690057so8338745e9.0
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:25:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776439531; x=1777044331;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zdWkayu2bBzHy45pHy11rYWZnPdcceQfC1ZNTL3L1Dc=;
 b=TSVyuQSNuWSXT1hw4fcR7hK1V23VvQq8CMTpwWNZULUBSE4f0fFUPsZqEU7TIbpGaD
 8HwgKWmh8wKqjr/GjibljSMZtT0UCehuSTfSqTicX4lEMqzt+yjOvkXYeLQiVHPJwiKK
 UdkWxTO7h9sGDbVTVd8SpF8dBR0MnAfsllSLaq5nJuBRgqw85GfE03mqk0uXJg6+DKfn
 djfZhh+NLCyTfAjgSXs7o9De1rlKWNUy2rGcopC+hHyHg3a77YtyyfoJxYc/VsvMMu3t
 8uGDWtIsS7YxI4sP/9BHjyfqnpnWJrx84eRnUCtWYys1T0/NLPvQPLpYMVUqvfmiZfZX
 LrMw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+NYNYHnrMdFLeHA5UuRjk4DrQ68+LBRDRgoKr/naWBt8+HvhZxlpQQgEw/MgbcZJ5LCGnyXzw+XpA=@buildroot.org
X-Gm-Message-State: AOJu0YzxC9zssS0HOSA60CysyJZ9zfAYxCQGe4El3mYZiN5Gehdvo1j7
 TDWRCqNOFDX4Tj3lb2kgVNcUWvN8zEcAe50jfkQi8DgnFvoRZZ8Lfulbz8ROfYMQfDH+d0TdwS3
 yl+/b
X-Gm-Gg: AeBDiev1bk5LR5a7w95hgwYhfO6tfgzAGBK4PygH1e+AdhEnWZuL3wcwxtpm7ldS2Sn
 f4Du9uNgDn5anmFfil9K6XG5i/THJBLQxbwl+NG8MCd0GdVAmFE/+Jra7RsMPv0+36NUwZl6lSp
 6jyxGLW3FydgRhUXd5syxXxPSMp/eE9CDzkBBHuYB9V8ApfBNKiy/OifogixO75xkI4ccYqrvo6
 J/26ITWJi+Nn5tLY5MPyb5zX8nXORRx3tLdVjfrILgeYojXQgJ2GjwPf6tDR4C9zHQvQ5TohoW0
 30UdHx0XwnMgxLGLUO4EcVOtknccOaY+KV3etkSLILy6f3nTXsrDokYyQKEM5SRfWsxPPtu1MOL
 NAjPFF7OTWOM2a+Ypp20W+m3lJo70dEQf71wFObbRMI6NJd3AZ8fVkk1gRzLblhUQ4xIfB/sT3j
 /2o7tkI6v1lxSpPUtSuli4t8zAi5g=
X-Received: by 2002:a05:600c:154e:b0:488:aa3d:faca with SMTP id
 5b1f17b1804b1-488fb771a4emr37644975e9.18.1776439530565; 
 Fri, 17 Apr 2026 08:25:30 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fb78446csm29940255e9.4.2026.04.17.08.25.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 08:25:30 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 17 Apr 2026 17:25:29 +0200
Message-ID: <20260417152529.314235-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260408085506.1641767-1-bernd@kuhls.net>
References: <20260408085506.1641767-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1776439531; x=1777044331; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zdWkayu2bBzHy45pHy11rYWZnPdcceQfC1ZNTL3L1Dc=;
 b=PPVijgBtx8jkj1vBf7MDkx74maIEaFgJa/sdA/SH+FnD/fIQIn04VV7iu15XxI87l4
 CMEMD8AJ9ZDV9nzmwcZNI3mVe8vsYNwXlWwmZcYMDasvAq+r7Vbb8Lowc4Hvz2TlaidO
 KzG6iXhzdSC791NSx9c0X6i6JrGi6Whzy7rfwCF/DciC3XeI6tqRLbNAh88J4q+QxJ+b
 mEzprvVS50eWVCDAmAEvxWz3ZezgbHJSEchO7cnI+DSlndcMrT7C8JrAwpyTRrMms0lW
 lJmzqRCzbM0gntgp6NKUhTLAFaZczTxMkZQV+E/N0TIaUGKLFca3+XT96Z4oKm8eMmDD
 y9kQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=PPVijgBt
Subject: Re: [Buildroot] [PATCH 1/1] package/libde265: security bump version
 to 1.0.18
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
> https://github.com/strukturag/libde265/releases/tag/v1.0.18
> 
> https://github.com/strukturag/libde265/releases/tag/v1.0.17
> Fixes CVE-2026-33164 & CVE-2026-33165.
> 
> Used sha256 tarball hash provided by upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/libde265/libde265.hash | 3 ++-
>  package/libde265/libde265.mk   | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libde265/libde265.hash b/package/libde265/libde265.hash
> index efd48d13aa..d977af5521 100644
> --- a/package/libde265/libde265.hash
> +++ b/package/libde265/libde265.hash
> @@ -1,3 +1,4 @@
> +# From https://github.com/strukturag/libde265/releases/tag/v1.0.18
> +sha256  800478f3bf35f0621b14928ceb317579f3e8b23de4bd2aac29b6cb8be962bbd8  libde265-1.0.18.tar.gz
>  # Locally computed
> -sha256  b92beb6b53c346db9a8fae968d686ab706240099cdd5aff87777362d668b0de7  libde265-1.0.16.tar.gz
>  sha256  02cc1585a20677992e0ba578fa692635dc193735f2691dc81de924b51c4e8020  COPYING
> diff --git a/package/libde265/libde265.mk b/package/libde265/libde265.mk
> index 3d9b96134f..aab86ab3d7 100644
> --- a/package/libde265/libde265.mk
> +++ b/package/libde265/libde265.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBDE265_VERSION = 1.0.16
> +LIBDE265_VERSION = 1.0.18
>  LIBDE265_SITE = https://github.com/strukturag/libde265/releases/download/v$(LIBDE265_VERSION)
>  LIBDE265_LICENSE = LGPL-3.0+
>  LIBDE265_LICENSE_FILES = COPYING
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
