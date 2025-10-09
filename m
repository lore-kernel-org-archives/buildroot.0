Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15885CCD184
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 14:57:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E22478119F;
	Thu,  9 Oct 2025 14:57:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xp1j576_wZ59; Thu,  9 Oct 2025 14:57:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 722F9811A1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 722F9811A1;
	Thu,  9 Oct 2025 14:57:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E24821B
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:57:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E11341004
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:57:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WuA83t8a0-_W for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 14:57:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 145B440F28
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 145B440F28
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 145B440F28
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:57:40 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3f1aff41e7eso856532f8f.0
 for <buildroot@buildroot.org>; Thu, 09 Oct 2025 07:57:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760021858; x=1760626658;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZApKMbNEj7YUuRuZ9T3o31U6AB3MzMMYFroC0kqSm6M=;
 b=WSImGvk5BJ4rvPsU5HYZdpBgfp67eygZnBwLAfXnOWsqfw9H+5sCQ8p7vkyN+aode1
 JoRSqajRsUrFyNXhUIcanxN18xap1B9FXpfBD8M8umLGVjw5pQZmHoVIcIUTkw2thlIO
 lBfCvMhlIpiofP/P1Q3rDY/2fs9j++4oeLJTiSajiezgKUiJrr6RSmK80S0Gu/xmnjvM
 wBkrWjItVx2jhBNJxUGTU5Tn+DcluamiI7dPfu4OszOMHk3QcA1L8P/Q4A2rxwEEHRRy
 QrwiaaJHV/hgly+88vY2uQiNWtfKF5SV6sXtwSxQJRZfyJ+66tjiIwy+xNt5R12a2sOv
 nZoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXES/MJKEPhJK98gCkTuFn95CR655hElszLXd2CohpI+qVbUNl3kMiYieKlnZFvlW/NzHTRMREkpWg=@buildroot.org
X-Gm-Message-State: AOJu0YzBn1wgivy0/GI3YJmvG8FvWVO7wderF6iYImMNJy4IOZKIx7+j
 MgyWS33c72dOiADp1yzdM2gdJqL58JVLl3+HCJONXZIb/VIqQ5JPg5vXxy3TpxY2+eQ=
X-Gm-Gg: ASbGncvsQPgC1Mp2VTqChMVPNWkC1e1deXeqFYkL0RIKyrCj88UZUeYyiQrXNsS5mXg
 JWXuFyjKWqbKgFWHKSe0krF/xNt1+GuD1AtaRkmEQKaeDHkp2XeM4SvrY+9N5yPdVuzE1pqiywD
 P+e821rNs0mrpScvu6JOJPb6ReADmxkCt0bQsh1TSOorG9fuSAe6n9knEpjniERKDxSvGUun53+
 vDCl8S7mP2VL41wIzhkKLp1pT+WoFQsRItmoP9uvGqmoPnDthLwDO11dMRJ7ffrt7HQ/Hj6A5E8
 gpcmaqfxoEr6QJy8YLnR11gOHeJiNXGOTcSp4aQShk7vDFh26TmUchtU5SQ0+9/3qMQ5G5lqz4v
 iJFuhiAdqcMF1fTD+x9dRyd6LaXGFc4yZpXySXs4Qutem9NnQ08A=
X-Google-Smtp-Source: AGHT+IGrQdPwK5ObkwFll2KUP1BN1y9hboisOMBjYExWOjP5g/22bBPaG1/yNmdGeq0VfBQKTrSkPA==
X-Received: by 2002:a05:6000:4285:b0:3ee:13b1:d70e with SMTP id
 ffacd0b85a97d-4266e7e142dmr4899957f8f.40.1760021858168; 
 Thu, 09 Oct 2025 07:57:38 -0700 (PDT)
Received: from arch ([79.132.232.153]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8e97fbsm34913541f8f.34.2025.10.09.07.57.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 07:57:37 -0700 (PDT)
To: Robert Marko <robimarko@gmail.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  9 Oct 2025 16:57:37 +0200
Message-ID: <20251009145737.484540-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001122655.994103-1-robimarko@gmail.com>
References: <20251001122655.994103-1-robimarko@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1760021858; x=1760626658; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZApKMbNEj7YUuRuZ9T3o31U6AB3MzMMYFroC0kqSm6M=;
 b=RHKQzOwI/bpFo2kjDyVbIIMwJkDZENzlY4c9wxgCHSlHww3Bt2u9ttGdwt+7g5vwkt
 1cWrKHjfYwRS9YJFKWB1DZ8dRzSzNW3YRPxQIhKpBEPBScdpZT4af4dzDA3Kzf1MuRGo
 i22qYC4BePySRwDBQz14o5dA6Zbt3hfnHb+RUehjeKBnDEwZM06nB2JN6F/6O6RS8TTD
 SagSr5uZzYabtjL8jbEpg9g1FR54sza/XZC38CKO2U3TJAQKVMsWJk5AfKpGYw9ExhAY
 /MJHboe/XGjp3W7X/ZeFywtXT+7qUs8kTq+h+a9DFzM3dvuZMpNDmyiB8mOEXMGJGF9c
 JV2Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=RHKQzOwI
Subject: Re: [Buildroot] [PATCH 1/1] package/mdio-tools: enable
 CONFIG_MDIO_BUS
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
> CONFIG_MDIO_BUS was previously a hidden symbol that was selected by
> CONFIG_MDIO_DEVICE, however since kernel 6.16 this changed.
> 
> CONFIG_MDIO_DEVICE was dropped and now CONFIG_MDIO_BUS is visible and must
> be directly selected[1].
> 
> So, enable CONFIG_MDIO_BUS directly as otherwise building mdio-tools can
> fail with:
> ERROR: modpost: "mdio_find_bus" [mdio-netlink.ko] undefined!
> ERROR: modpost: "__mdiobus_write" [mdio-netlink.ko] undefined!
> ERROR: modpost: "__mdiobus_read" [mdio-netlink.ko] undefined!
> ERROR: modpost: "__mdiobus_c45_read" [mdio-netlink.ko] undefined!
> ERROR: modpost: "__mdiobus_c45_write" [mdio-netlink.ko] undefined!
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=v6.16.9&id=31be641d74267d98317ef5a2b90e6200511cabb3
> Fixes: https://autobuild.buildroot.org/results/8595997794a2f603fcef95b559f60f83abfe4d83/
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>

Applied to 2025.08.x. Thanks

> ---
>  package/mdio-tools/mdio-tools.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/mdio-tools/mdio-tools.mk b/package/mdio-tools/mdio-tools.mk
> index b42ea41c79..e61f847e13 100644
> --- a/package/mdio-tools/mdio-tools.mk
> +++ b/package/mdio-tools/mdio-tools.mk
> @@ -16,6 +16,7 @@ define MDIO_TOOLS_LINUX_CONFIG_FIXUPS
>  	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
>  	$(call KCONFIG_ENABLE_OPT,CONFIG_NETDEVICES)
>  	$(call KCONFIG_ENABLE_OPT,CONFIG_MDIO_DEVICE)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_MDIO_BUS)
>  endef
>  
>  $(eval $(kernel-module))
> -- 
> 2.51.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
