Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47322EF99D2
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:39:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09E4181096;
	Fri, 13 Feb 2026 19:39:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hFYd3H0Esmrz; Fri, 13 Feb 2026 19:39:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01965810B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011564;
	bh=p4YOWc4GOEqFR1heGsha/KwOi/+P/Jd31QQyCM4DX1M=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jG9dlCK50cm90iC5fpXmScSjScxJpEk8xETrQgMZM+ZJZvK4XDFMNNuunRsnqGRQQ
	 HtdhS4r3wmAK1+5NoU+w3pc/VnKWwCdfA6Tua2qymrkXSoN9FDtHfYPnSPKZbKyLB9
	 GFKFLFlntK5WFrJEweUj0gsbYz8cYW2aU5EmseBq0BoRvnuaiKvpcraLg7f8s5nMr4
	 kuv/GxmMk1YKAIkKn1AQvXXFIOiaoXJfmuloOdtbmImUpySrrt7tPLxfpE33n709+L
	 3+Bt4+Pw3vCSx265wg/FmKPgx9K9OjaVpDY3IlY6ucpnadkE/z8Ot+OXjFc9Ex8oLw
	 PtIB2uJkyO4aA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01965810B4;
	Fri, 13 Feb 2026 19:39:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 42F9369
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2392984773
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l5wnNd_Zg2BH for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:38:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8BC208476D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BC208476D
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8BC208476D
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:05 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-48374014a77so8920575e9.3
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:38:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011483; x=1771616283;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=G35jbb3+7gTd/VFNv8tlsjn2l1lMHHYCVTyUsdAkb5o=;
 b=XwlH0d+KrhLfZ/5HaZLOqAc0JKKwF4AF+EWMTDR8oeOWy7HkE2p11K+Cnvxz3ze2Ze
 ViPeRBuos1LyePgZb7z3HGxbnYepx2azVqYmCgnXVjb52XpMTs81jBCRzh5G8p0xWAIy
 XQsdy4Muo7l0jI3Cg6pTmhQZmCnG83o5Mdb3CVkaqk5hDAl9zX7dX3x6JROPWmz8hcI9
 PDB+rLvxEkZodNC+xsMN8oopkj3ijuQsuUm/5GwFmCQCcgXb532X4Qn8xbfohzv8YCdZ
 drwLxQU2cSd88hCloM2mcFv/0nzpK1DBDsksL/U46d/05MbTG2qIZB+BQwKy9Tm06fIj
 qqzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5Vl6hgPE2J3T0SjD/RZNDrBKRTh/Rxgev1y8O6bcICip787iA6119LtfJqyvTkZrbY4AxXBD0Vls=@buildroot.org
X-Gm-Message-State: AOJu0Yzg0EOvJrDRsn+ftzD6jyQq+Lx7pXtFvGymp0+aGiUiprDMcMfB
 SArpl2WNnEzjV/h0BnToaddHexJsTuFlNeYICWwFo083ejJIbRy4ECzakTzTN3QoIqQ=
X-Gm-Gg: AZuq6aL3g5P3neaNE+0HEhSzKFuAshLeZTo3uxkbm0bp1V+m6PCNV/jquhWuu/iUMa7
 Q2CWXucAidQ9EUJ+tnR0Al55xQRsWStlOWs1Anug1qrTvkcckgY0dnGRqrWKu3DMU9ZIEwQlSPQ
 3dfH7dbxfHnTXJkUvfr4I1H71jFnXv9DnSz+0NIb2ugDhsGDTStr/kCw7PbyWpm+VuJ2LXTfSeN
 N36s2N8r8iQDRc/KLOJPVk3i9KLiLrB5Fl/gEKUB+O6aE41H7W/DtiPbKAoWdlZT6UXizPpHabZ
 PFIKAqO2MD6yf151lVhbB8/jGW+eRBUD3bV0L+4TRV6YZcLAENUDeBOPbxRhSONyfWksX3un1ui
 3s/Ue3ER/e3g6DPEUln88S1E6V3jNHT6+dl2THdMkHuInzolchHZF3LmrQcm8+0ws98WYpUav4q
 h2/Z/eOup9mDVRpv0=
X-Received: by 2002:a05:600c:314f:b0:483:6fe1:c057 with SMTP id
 5b1f17b1804b1-48373a3f3bcmr42801555e9.21.1771011483546; 
 Fri, 13 Feb 2026 11:38:03 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48371a36443sm22831665e9.21.2026.02.13.11.38.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:38:03 -0800 (PST)
To: Franciszek Stachura <fbstachura@gmail.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:38:02 +0100
Message-ID: <20260213193802.41532-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202142750.937246-2-fbstachura@gmail.com>
References: <20260202142750.937246-2-fbstachura@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011483; x=1771616283; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G35jbb3+7gTd/VFNv8tlsjn2l1lMHHYCVTyUsdAkb5o=;
 b=h6TsbZBiv69mTE2j+9VFt4WyevfFR24KyuZNylKlKitd5Boy+xp1iRDCN+Tll4HzgK
 aLBTQDdS6fP8gnBF1qNdATn0ZmlPz8WboB2lpV/a+rsW8I2mi6G9i4RACBuFCe83/aSW
 Hvo3azzWJ44jl0SwJvCgaumGRwbghyD/n3yuaO2BwE4bPlj1TvRI+255bgrtDM2dRdP7
 kjwjibpoq3gFodV1eg7PSi8NLdFNsq7zHCSLWa09i7uvk6SX1q+AUv4Z5OtVZ0n+dB3l
 fwmZsRGUeghLrnawsvXPb1/ZCPbuX3hhRqYHuV3iSTAzynAdgPhYSOdT/nOd4SJaA0EA
 qUyg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=h6TsbZBi
Subject: Re: [Buildroot] [PATCH 1/1] docs/manual: replace bulix paste with
 sr.ht
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
> http://code.bulix.org/ is no longer responding.
> Fix paste list formatting.
> 
> Signed-off-by: Franciszek Stachura <fbstachura@gmail.com>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  docs/manual/contribute.adoc | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/manual/contribute.adoc b/docs/manual/contribute.adoc
> index c17f1619b4..f22164991f 100644
> --- a/docs/manual/contribute.adoc
> +++ b/docs/manual/contribute.adoc
> @@ -559,8 +559,9 @@ If some of these details are too large, do not hesitate to use a
>  pastebin service. Note that not all available pastebin services will
>  preserve Unix-style line terminators when downloading raw pastes.
>  Following pastebin services are known to work correctly:
> +
>  - https://gist.github.com/
> -- http://code.bulix.org/
> +- https://paste.sr.ht/
>  
>  === Using the runtime tests framework
>  
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
