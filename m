Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4129EF99D1
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:38:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7362942096;
	Fri, 13 Feb 2026 19:38:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kkklqsVibQRe; Fri, 13 Feb 2026 19:38:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DD4542092
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011512;
	bh=0KvOtwRWhc76YO/S/rTDpvA65n1wGr3py47ws7Nbu2o=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XWRThEwicyxeHK7W6f2hEIHNphuJdrR0ZDloYnBEdbmebL4QqGfQILqldDpqLrV6f
	 WPYbUoqEfQ/pVCGGrJyt9k2XB0SolUoLwlt8tWXzTXiAkZ5XMiza4ay6UM5XSLAcaC
	 7WXHsA5F+SwjhkaiSl7SEJkFeW0XuXT3eZydW/bFIse7pwSeKEHq654H2Q0pvjyHQF
	 VFKvvP4e2wVJJmczHanZuXw2R1JCqEk5j8Lr+WdWvGJYAku5V2jFtblxim+q2pPoDv
	 5PbigcrXY2xQqZ97SLx/wRzYck3LHArzoYc2MYvGxF8wvQOrCZt05rM538NR8HdmRT
	 4cGgxwN8lQz5A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DD4542092;
	Fri, 13 Feb 2026 19:38:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 048CC283
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B0D828460E
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zRmB1l774I6P for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 990118470E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 990118470E
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 990118470E
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:37 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-4362d4050c1so1367086f8f.2
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:37:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011456; x=1771616256;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Sl4SlwJyIvR7XnSPEOVS8ciVBfQw/1fIAnqGiS5qxdc=;
 b=Xq2/HBVfQO/0i+q/K+yfAjMOh+9QJ+gtOExlFe5XWAMZITo34bPpsd0EbKNGx7bkiy
 bbLhySVpKIJDTn4j0cSBu0tRkNBmVsCYTT5Hy53LiONH5owTuSLaLpKyPUcuNjTk28yl
 VBsObQeO0vFWAw+YhpFklv1Ap7CmIsKEyJwhjwHbl5apqjymUAoo46esCnTOY/FiHUvf
 hd50RCjg0u4b/bISPIEQqHfPmo8xIsxkbKaDGPah5KhdSvdrsMPie43TaLQ07JpYTACo
 haEFUd/6TqK1EmRwbObvdlv/A4vXcsFAOZJc5TL0+RKMUoZpzMw0je/1OllrRCP+hu/2
 rueA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJ9/mK7OCYbtQ3hN+5NZj4mJGVrkf6ruX+iRVtAGOrhiz/w2jl1XOsBze/E7bbOW471S0yg84H9pI=@buildroot.org
X-Gm-Message-State: AOJu0YxP0W/R+bNqcrDGBSNcEUCAC2woDj6Q5r+0OHnHJTm+XIa2EcQE
 AaGMzhofncPli1UojrkAqWcOlCn2kd24jUcuIHI8RPjgBXbrUXbI0OTnhJoAFzFvAfta7I9h1+1
 QESGZ
X-Gm-Gg: AZuq6aKGUNNl3LpSVBBIaUtuuvL1rVO3U6Z22G0XDyH+SrcypqJYbP5IBvcnkRu/r3i
 ZIVSupu/EJpB5AsszfV2Gyf0aVhdYxIvtIgxwlFHerxdrev5lq8b6S/g0vWtsYbyLQFAFv8a/lR
 ts3Wm5DWfNvlnYb1KSCLIiHTQUm51qsfDN8nT9iciiIaIGjsq39ODiB0h5oDfclccfDX4J8JeD2
 O4bW1aXzvMK8PjPUDf5gUhhshLEeTjH6BIieaiwjBWDBMpAefX+MeSmA6MDIop1sOftqbeeyk24
 akQXarAYXGXJDnhz1fRLR1nZfpGHQVXJFx87CsFglvO9sa7FsARembv1o8I94ETHeCUV1jqoN4U
 5RQTOeBrJHT9R3DJAe1qCGM4eOHfFUMqrXh0v3UV4cv97y84HaurHz2mSgAXxOHO5Gh4TQhQLNS
 T4JtVwaVZMZ93jfoI=
X-Received: by 2002:a05:6000:2083:b0:436:3155:86da with SMTP id
 ffacd0b85a97d-437978e17c6mr6339105f8f.27.1771011455608; 
 Fri, 13 Feb 2026 11:37:35 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-437969fd36dsm7886491f8f.0.2026.02.13.11.37.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:37:35 -0800 (PST)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:37:34 +0100
Message-ID: <20260213193734.40025-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260104172232.3437646-2-giulio.benetti@benettiengineering.com>
References: <20260104172232.3437646-2-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011456; x=1771616256; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Sl4SlwJyIvR7XnSPEOVS8ciVBfQw/1fIAnqGiS5qxdc=;
 b=eUog0wkrew0Oj6U2wvVpkuJMGi1IsOGCly6ZaOcueokB9FRLE3h6FZdf1PoRdvmQQg
 NpJ3i6gKXgAZ9trVwSXnlYWcok1S3QWiBD4rIiHWlnQJWlK89YNdlp/ausu2nri/J8yn
 71rHIXlYGJo36FX+xlCpcpv6/vM9wqkijp+tl/npWWFWdJbkbBg5F1jEG4cwT0SPDOR0
 DDiw1NsfvGI0obo8rRCALF2p4kkB2+yf42lChf1e0EtT+xsyRRcGTZl5zY4EuZRjJsvN
 gyDvM8QsMK87Mrg2sHnKUnM/4qpw7CIX5Asf3SJjwumbR+pVutGge/P4xSBWaFXuuDRH
 Uv2A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=eUog0wkr
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: add Giulio Benetti to package
 bind
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
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  DEVELOPERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index d2b3b34f61..75190bd5c0 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1302,6 +1302,7 @@ F:	configs/mangopi_mq1rdw2_defconfig
>  F:	configs/olimex_a*
>  F:	configs/rockpro64_defconfig
>  F:	package/at/
> +F:	package/bind/
>  F:	package/binutils/
>  F:	package/cryptsetup/
>  F:	package/dash/
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
