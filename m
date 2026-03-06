Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B2AAFCC066
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:53:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0CE5742147;
	Fri,  6 Mar 2026 19:53:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6HMRdumTMcq0; Fri,  6 Mar 2026 19:53:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2EB84213C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826811;
	bh=VJgG8ZrfZTQwYlRCMOCpddSc/DZNCJK0AZjXs0lmOzY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oL1fZ1cIn8DDIhN6Aj0FEMU4mwmW+SVeA5tQBmpcTJcqTx2pnFlXdrMmzCZ94UNBF
	 yHItGrzyonv5Q6brt2zv/uAuKeYwYBttb59HHbOtQdhOLb3aqJ/XH76d5so1Wl2P3H
	 ERMWRgd5VnQQOz9U92oFKZNi+Vhz3pWPEtEAjSd0+3sCVsIBhpRC6ouSAbuKKlPkFZ
	 FH2rNscBuoUyA8BfNlRtwyt8T9K8R580CmaX4XlxD79ATlL5p9froxiwcKxqflCAQr
	 fY1E333onoAWA+Ifjy+5wEG7ldJiA98X+27nqTNSikdI2JKbHIy5FeIeifY5LsTCwc
	 E/eBTIK/qcRaw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2EB84213C;
	Fri,  6 Mar 2026 19:53:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 40446169
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3211A614A8
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oUxHZIGayVkl for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:53:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EBCCF613FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBCCF613FF
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EBCCF613FF
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:21 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-439c5b40f60so2988817f8f.0
 for <buildroot@buildroot.org>; Fri, 06 Mar 2026 11:53:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772826800; x=1773431600;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4+NQoDhlZc8iqD6GAoIx3agujoJB6Cnnvih6UafAr3E=;
 b=iHb9BeAaKT+xcKTyIdZBaX8tzksyLiYHmlrER9Ezjzmv+T+31Jp3QBOCPjfDv+2XkE
 oCh91WGDV91bh0TYJBkBBFfIq3HPchzhPDDwf1UGApQ14x3TyiwJ6LnDqNH5P/XI4m0E
 zltvo7aenx+4P2U8JmCjnFYuypBbVLLi5LE3GNXuDDLeDpmOqu6KQigqIUOVLjoScbIU
 yCmmZJEh9BGDT5TWFj5ekis8FtiWR54J7lCNVOkhtTksktgMWfyW1wPU9T0LLYu5BSJy
 AAk+1JXFFVpthgRAtYGICxLsqL9Az1gCLxm4ETrd4T1yu6Tepa8Jms6jSK0Lp67lV72H
 M3nA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+gFi9fCUttq36rpXbe0RYmwgghUUW9+X6K4WYykerdmhS/PiloL5fO82c2gIy2tLfza9/aP+c+/s=@buildroot.org
X-Gm-Message-State: AOJu0Yy/DeRqqQaBV3blq5TmeIH+0mxfqStcBMJeIC3tTINi4ruY8FrV
 SvdN2mLtcjpr2EDLwZPcPm4G4SGJ1NT4asUkp60fFfb9RPMcrHFExrxDDbEpN0QyRTw=
X-Gm-Gg: ATEYQzzRzGYvp43a0yehipdav6mr/OP5y6yIda/E0LbfSE2c8JtfATvEQmpbx8KZcQd
 i+/ejgtsTPX+h3KCHbbphLOCnlO1TwgXQk1r/vqCozFq3hiWsOjVFfsJi7rJyvMP4nYINzoMz2p
 tPKcpboWnKyz5Zxk5yrRuwF69JScvKmAwBsV5T+Os9ghjuV8DPjhm0P8rqOzAbyTGUmiqKnRuCk
 Xh3Timq5Q6298JSQYrolW/GZzAF+hbxLzZ2GO4gOucmHtXEuqfMQHSddkT0rfk78iLLpnjOAqNo
 L5ZhxwffkQp1n0YHwgo14+sWFFGCmGpVfp6O6mmgXfymklTH/6hWMl//U3C4pAfidKE0sFlwNSt
 nWifI97MoLvAC85Ooce6CRXU61yWZTgJl4IW2NbxeZQ+gJUhGrTh51mcefLrbqRqmo1aYXKaHgo
 jd6cq2zPiEi5sks4A=
X-Received: by 2002:a05:6000:2884:b0:439:c661:3245 with SMTP id
 ffacd0b85a97d-439da669bd9mr5665164f8f.34.1772826799797; 
 Fri, 06 Mar 2026 11:53:19 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dae45786sm7010718f8f.32.2026.03.06.11.53.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 11:53:19 -0800 (PST)
To: Adrian Perez de Castro <aperez@igalia.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  6 Mar 2026 20:53:19 +0100
Message-ID: <20260306195319.8185-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260302083333.2907389-1-aperez@igalia.com>
References: <20260302083333.2907389-1-aperez@igalia.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772826800; x=1773431600; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4+NQoDhlZc8iqD6GAoIx3agujoJB6Cnnvih6UafAr3E=;
 b=GjyjGRzXD8aH3YKUHpTGUllzj59G6z2FDQRNnZZhbwUUl4MZs/2WQ3VN9cSvni5TXb
 BKCWRDbhNpsTN15nX0QcnBKaRgjK8hr7ayfR/knN2PUIlPV551GaOq1HOKZjVtsehELH
 raT82UNjvFwMcjmOnzE8J0Zn4L8DInINoTMgoe0GwI+jZE6IdDUYPeWi77POkyU3A+0d
 5GjviEzUbFVfzt97p9u+VFVD8YPSDcWxLqih3utBDQbTcXvKrBH7mAaEVGlPmRgDzx1s
 obR8Dmpej1ttBbk9xeQ1Mt5EgnF0vlaJA+JmGd/zHoj5N/YtxETLWA3jdNWJofKPQ8Zn
 zfCw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=GjyjGRzX
Subject: Re: [Buildroot] [PATCH] package/webkitgtk: bump to version 2.50.5
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
> Fixes a number of crashes. Release notes:
> 
>   https://webkitgtk.org/2026/02/09/webkitgtk2.50.5-released.html
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/webkitgtk/webkitgtk.hash | 6 +++---
>  package/webkitgtk/webkitgtk.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
> index 3c2f7aedbd..77bdc5485b 100644
> --- a/package/webkitgtk/webkitgtk.hash
> +++ b/package/webkitgtk/webkitgtk.hash
> @@ -1,6 +1,6 @@
> -# From https://www.webkitgtk.org/releases/webkitgtk-2.50.4.tar.xz.sums
> -sha1  719c304539cecca945846700cefebc7339eb5924  webkitgtk-2.50.4.tar.xz
> -sha256  d3bfa473845acfab72635bada5e0d134fda6792c5b95c5c5cd141b46125bd8e4  webkitgtk-2.50.4.tar.xz
> +# From https://webkitgtk.org/releases/webkitgtk-2.50.5.tar.xz.sums
> +sha1  e93f7efa9fbc7304cc159c35d8e76d7febab2515  webkitgtk-2.50.5.tar.xz
> +sha256  8737631bac3e9c7ad3e5208f9370e076c09d9c45b39980021ce54edadcc6f94f  webkitgtk-2.50.5.tar.xz
>  
>  # Hashes for license files:
>  sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
> diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
> index 161807bc5a..26c70ae6c8 100644
> --- a/package/webkitgtk/webkitgtk.mk
> +++ b/package/webkitgtk/webkitgtk.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -WEBKITGTK_VERSION = 2.50.4
> +WEBKITGTK_VERSION = 2.50.5
>  WEBKITGTK_SITE = https://www.webkitgtk.org/releases
>  WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
>  WEBKITGTK_INSTALL_STAGING = YES
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
