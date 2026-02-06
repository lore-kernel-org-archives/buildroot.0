Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B290EB28E2
	for <buildroot@archiver.kernel.org>; Fri,  6 Feb 2026 08:11:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 365006114C;
	Fri,  6 Feb 2026 08:11:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XEdgPhWH9u2t; Fri,  6 Feb 2026 08:11:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32FCD61150
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770365494;
	bh=+zBL0vRmEE9449/aQrJ7NElmAKaxuwzpTbXBlU06z8g=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JYZvmfE9haLKenYRJ2wYWDr/mIosxflqJVHm31wkxMN8S2PyQ5gKlWCVLXsvpt9Zz
	 l2p2nGctClzcqGlQHbgYQXO8sXY/azhHczhrMpadoRjp4MS1g/ZDu+VTx5MqXbUqh4
	 aqoFloLZJXplqbl/Unvf96+xZZzH+WRO3Twv5ft5weonswxOk12UnEsYz9asYBYc/K
	 vkbBVQXQv6JQaaMtnWVOQdV9B8F+On1bsUHA5qKJ3Ia8enhfb8xDnxsHajK8lSTfJk
	 s2AU6WUyNbkxmxZ4M2/wT7/8hU1S1RRR3jDt5RgdSU7tex6SN15atawwYW3E6kEgmZ
	 e9Kttj3Jw8j1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32FCD61150;
	Fri,  6 Feb 2026 08:11:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F253173
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:11:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE4B161142
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:11:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BT49g171s1RZ for <buildroot@buildroot.org>;
 Fri,  6 Feb 2026 08:11:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BE6C261148
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE6C261148
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BE6C261148
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:11:28 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4806d23e9f1so20489635e9.2
 for <buildroot@buildroot.org>; Fri, 06 Feb 2026 00:11:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770365486; x=1770970286;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0lxV5ka92v//rOU/zjJd9Z8bJqNy4U8huoWFukEupO4=;
 b=rVek/xsgxfBHMSID4wigh9AF8FuUkII3S5SGeHVktZ9LJzXlheLLa/0ObX/BIKrBkC
 ZCsvKkGrJHEq8tRm/4Rhs22veVvJieMdDEF1ve/0YRe3qHbkRLGjc3lvpz575bebnCmO
 9T5laTa3meZJwD7bbxMKz+mSFp3ED6vUXgrJv20BH/qyCEO5mS7WYEbO2UI6cRL9DP5t
 iBBocwVN/X4ZteWigxyewqemEq4w7P4l7gAtGqoUH6YDInno1DOxXe50yJtomas+e5Z2
 zjrs8p9wWo2RpMHHNTsaKGIjdrV7acLgegw1u+KtWRvGRx82PEV4QqmSZbXsM3l6wHjm
 UNLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgBsmBWOe0PlQ5OJ62wdZKFmP156X3tcJMPo4SIJthxjgxJlr+sUynLGxCMAR6GyT6BBoboXdC+WM=@buildroot.org
X-Gm-Message-State: AOJu0YwIE/HnxgVbPyItZ09vFkA5fNp83kWq1b3Qi2ZZGWXSB0TJV2nF
 7Q5fwmjOp7jzjJDizO+1kUB231lpLq2AnFwHQ+SCYqptgVB60h/NI9qxfHZ7cOHEyZU=
X-Gm-Gg: AZuq6aJLHwbg1ymFdrZPpo0o8QnIk+LSmxC/UJL+cvgjoReHP6FeAZ5StpryByTEpjk
 N+vExjUfBQ9786z25rHj/trp6mxWfAc6wtIDf/hZSf9z6lbsNKjYYz5e1jIjk1WhN3BfUM+npxw
 FRrxmEDVUPvTyNqm3pQeFR/l3iZsmXNtzKsW4rV/AzMsohOZYdpKaDtWkgR+/jFfztHmmFprMLP
 nbxCV3fWf6za1K+sAEJFRiPNyrXLYH+V6YDr0sY1DTbztaz8ia2SLLAYI39zWoC95rUMntv1NAL
 Oabuev+lKWBcWtLUomGTNA0GaH+xySuZ6PaiY8CrEgTRDG9kuUAvYr8nYtZ2t6IIFihOpKtr2Gm
 QeEohXW9bXmw3RfpfUgB89oUDdnVkiUOV72Zp9XcMkrkGX5QRRObBotFqN6VLrp++ehy15om1yx
 hwCkQ=
X-Received: by 2002:a05:600c:8b26:b0:480:6fbc:695f with SMTP id
 5b1f17b1804b1-4832022bba4mr26553015e9.32.1770365486480; 
 Fri, 06 Feb 2026 00:11:26 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483203e126dsm28024235e9.2.2026.02.06.00.11.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Feb 2026 00:11:26 -0800 (PST)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  6 Feb 2026 09:11:25 +0100
Message-ID: <20260206081125.31482-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260118224947.3879017-2-bernd@kuhls.net>
References: <20260118224947.3879017-2-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770365486; x=1770970286; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0lxV5ka92v//rOU/zjJd9Z8bJqNy4U8huoWFukEupO4=;
 b=aqbSUBfbWnJKfGJNlMI/RH7GDZN+DoBOsVD8t/puS8E5GYr6Cm64JLWaB9vuMRs4FW
 JrRdUikWhGjVZtqXTqLICIvDDR47l3yOgMM9jru3pOQyxUXwzu0qM6+K5vu5ZVwskAFz
 FxsCPAWP6SF6q/G/UwKnxEdC+JBt+rDcMpMk7FgnXPtovNvb4hr6IQgvztb+md23Fta4
 LclJuU7FitFiP1A+1VWOBtGh5i4eVgJhXciV9IZn9HLOQfy1rcqC+QXsxCukpyJKMhFi
 tMiB0XFqT34P/qzb+H7Qhn3i89/P94GAPi4+WGOI4F/a0htFht19zvulsImkR77LJ1qO
 PxBg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=aqbSUBfb
Subject: Re: [Buildroot] [PATCH 1/6] package/php: bump version to 8.4.17
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
> Release notes: https://news-web.php.net/php.announce/480
> 
> Changelog: https://www.php.net/ChangeLog-8.php#PHP_8_4
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.11.x. Thanks

> ---
>  package/php/php.hash | 2 +-
>  package/php/php.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/php/php.hash b/package/php/php.hash
> index 4a9d2e4bb4..23ca842b72 100644
> --- a/package/php/php.hash
> +++ b/package/php/php.hash
> @@ -1,5 +1,5 @@
>  # From https://www.php.net/downloads.php?source=Y
> -sha256  f66f8f48db34e9e29f7bfd6901178e9cf4a1b163e6e497716dfcb8f88bcfae30  php-8.4.16.tar.xz
> +sha256  28b234e347286158cae921d61283eb1169d89bc9d2e5f5976567260ff38b0bfa  php-8.4.17.tar.xz
>  
>  # License file
>  sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
> diff --git a/package/php/php.mk b/package/php/php.mk
> index 7524187649..aa6050c1a7 100644
> --- a/package/php/php.mk
> +++ b/package/php/php.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -PHP_VERSION = 8.4.16
> +PHP_VERSION = 8.4.17
>  PHP_SITE = https://www.php.net/distributions
>  PHP_SOURCE = php-$(PHP_VERSION).tar.xz
>  PHP_INSTALL_STAGING = YES
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
