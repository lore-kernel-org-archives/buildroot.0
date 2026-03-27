Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 381E710ED64F
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 10:02:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FF52416C1;
	Fri, 27 Mar 2026 10:02:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2BSPLjv90Yy8; Fri, 27 Mar 2026 10:02:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11B7E41714
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774605777;
	bh=Ct3gx+rI2A8nWo6IThwyvB3zFCxyefHJBHh5Bc0eRuE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WUA83G5QDLwsdQOxh0PP4afrp0HS/LeBM94OMuUvuZqLEHQqjLeWuNAoHPjGz7G2Q
	 +DIb0fnMp0tjgYdq9GuhB+lTfgnwk6uOFH3+AjWM1IiDUmJzDq6SU1VqsxWOxdEz/B
	 ljZR9Yvof+V6iWXpD5ZVHcp+TnavDMl2NWlZWhPo4qfy3ojb2gvDV9BPQfdnCYEpof
	 V9ws8DaqbhJGFqygM5b4eMbTiqXvFYvZEL5Gq1r2oNB8zNLCJr3pvPstEVEk2KDyxI
	 1gcaWdbetvlzBvt91WB3IQMxiaYN3l6zMaP0ygfW6MDAf0DEZdA4/hO07MDmJer7z5
	 DTgyDYODsv+Vg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11B7E41714;
	Fri, 27 Mar 2026 10:02:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 984981D3
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:02:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A02583D5E
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:02:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RH1BWO9gHyYN for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 10:02:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7135483D62
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7135483D62
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7135483D62
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:02:52 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-486fb14227cso23671655e9.3
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 03:02:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774605770; x=1775210570;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Rt7lABnOvNMHlRkdkQbS/1v1DXJ8JbNmQknouXHnvNg=;
 b=OZhe1ppYCOnOO4Qys1UyzQhAwrMzNc/3zBqwbesWYQNcgG5Lwa8LBaHMMi/6jnkt0p
 UjvPR/w82eyO4YHzqE+1Cxi/U2XvXuoz1osMYM03u+GhZQRp4myZtFj7vWqsbp3x6sc0
 /io+xTPqGAg476In2nU8uu2l17/7NTRpvToYFk2wIN6cJfsukuxu3BU3wWEwYUDLTSqz
 +uu4UoHz/H+K3b49CYDcsZfBllJOCITspeUMGuqgPatzGos6u0ONFICP/ACFG+a+RFv7
 4nU7lpWuCyfrbLMg5s5hS8oy6GHQNerchCWb/94AF0JtdyCmd9SagxbD4H90ZDuqebKJ
 e86A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8+xIor+F6ssFj4cZlU3Shkc17QWDJSTNCyAlRjSoI+OTzUO+bEiR6kIZgqqbtXd9mGNBuRFpX1Ho=@buildroot.org
X-Gm-Message-State: AOJu0YzlMZSRMRZXUPbmQt5gCEvOq8VcreaPXcpkYIGLNqhQMg11dfAc
 7AYDUFfijsjfEdju0KMCHWVOkP8FKyDXA7FePuOuhWNCtANP37NglNmoH0BcXomNa3KPjYtG/D+
 D4tlqCk4=
X-Gm-Gg: ATEYQzyooLQsYksw8jVNZpQIIymX05zqbk595q8zJFoPy9cpfsBzQt17ahK5m4KBauZ
 8jQVBzv9vcRGkomcUMqCtPZG7GLKQBztxrfVaJ+jNy+H0EkRH1Tbg+ccIRWwQY6fCYq4rieaDu0
 FwJqRNBw4NyljXErM2JGCyNa77oyQDWH4IZQlmUY3pI2avtfm7vniwZS8vx5trf56StBuu6yHTE
 6+51kE5eUq603nQfOTg4MrSe4tvo4H+/xwwhROQlQihKl/dVXQp77AkWAgV5OVMdi1B5Kx5ZUS8
 AX0ypH4oWHzFuTzqnaLNHvFWLUschT74qzF8etCYq0iQcLgmO2zUvYlKleggC7HGXuHnYttm6+z
 TnCyh7uybLlKcjArcxy/ieJ8iaEeCxVYHj8iw1Mi2BkKdsa/NOQCss1TXnYCHUrjutHrePLm0V8
 IKNPavLEY/2T2sEcD/977stg4cUC4=
X-Received: by 2002:a05:600c:45c4:b0:486:fe45:483 with SMTP id
 5b1f17b1804b1-48727efbed2mr31005015e9.22.1774605770269; 
 Fri, 27 Mar 2026 03:02:50 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-487270af027sm20220845e9.3.2026.03.27.03.02.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 03:02:49 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 27 Mar 2026 11:02:48 +0100
Message-ID: <20260327100248.46541-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260318204928.3438683-1-bernd@kuhls.net>
References: <20260318204928.3438683-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1774605770; x=1775210570; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rt7lABnOvNMHlRkdkQbS/1v1DXJ8JbNmQknouXHnvNg=;
 b=CBQ18Ae8plMKk2+v/kEXSVGticL0mYetTKmtc11gSS02id/8gkOMZOkboUN7Mc03U5
 uM9Bs4x/2xOKAlkRXJos7QBueoQOv3ndTicDlxyPJdhoA/wq2YBcJqZAKNOnWpvasIxT
 FgdLxYICIQPV1hXyo6PoqgUm7nMsGK7Edrq3FFkBaq+bWjpHVK6bJG84+VoclB+c/GdZ
 R87CD2owoQHxcD5gyHPInrB1ZxQVQD1SFCtYsrOFqZ5xjE9pSN6l22eH1SVvYe/Vp9lL
 xpsEBBaD24r2IfN0QGKwp6Gw9hwn8oLNS/bOmxqTO7UgH37KGEw+YKX1EPttbv8PiQXo
 Dr0g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=CBQ18Ae8
Subject: Re: [Buildroot] [PATCH 1/1] package/expat: security bump version to
 2.7.5
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
> https://github.com/libexpat/libexpat/blob/R_2_7_5/expat/Changes
> 
> Fixes CVE-2026-32776, CVE-2026-32777 & CVE-2026-32778.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.02.x & 2025.02.x. Thanks

> ---
>  package/expat/expat.hash | 4 ++--
>  package/expat/expat.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/expat/expat.hash b/package/expat/expat.hash
> index 7536e7cb1d..37a9c2ab9f 100644
> --- a/package/expat/expat.hash
> +++ b/package/expat/expat.hash
> @@ -1,4 +1,4 @@
> -# From https://github.com/libexpat/libexpat/releases/tag/R_2_7_4
> -sha256  9e9cabb457c1e09de91db2706d8365645792638eb3be1f94dbb2149301086ac0  expat-2.7.4.tar.xz
> +# From https://github.com/libexpat/libexpat/releases/tag/R_2_7_5
> +sha256  1032dfef4ff17f70464827daa28369b20f6584d108bc36f17ab1676e1edd2f91  expat-2.7.5.tar.xz
>  # Locally calculated
>  sha256  31b15de82aa19a845156169a17a5488bf597e561b2c318d159ed583139b25e87  COPYING
> diff --git a/package/expat/expat.mk b/package/expat/expat.mk
> index 215c34e9cf..68af751233 100644
> --- a/package/expat/expat.mk
> +++ b/package/expat/expat.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -EXPAT_VERSION = 2.7.4
> +EXPAT_VERSION = 2.7.5
>  EXPAT_SITE = https://github.com/libexpat/libexpat/releases/download/R_$(subst .,_,$(EXPAT_VERSION))
>  EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
>  EXPAT_INSTALL_STAGING = YES
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
