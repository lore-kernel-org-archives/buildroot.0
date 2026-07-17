Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 740B7C44515
	for <buildroot@archiver.kernel.org>; Fri, 17 Jul 2026 15:47:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44A958116C;
	Fri, 17 Jul 2026 15:47:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lf7fgai2JX8a; Fri, 17 Jul 2026 15:47:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3508C8122A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784303269;
	bh=RIgWVL4AJq/C0zwdoDTyeUdR54kUmkqoVqGy09+xsdU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HOMShRBunCfRmfvxlPU2h0hHKUDs9eGY0nnpur17zsdvTBsy+1erExf+C1Lj3kITm
	 Buf7JaBsMncrFFc4OuXNKl7k+G7MJwcWO9LT/DEIF0fTj12bYE2mTh1ePRuhIJrPNT
	 HkNrvoaS9vVJZGXYxqSLwF1L53RKQQrpK9iSHLARehu7rUg3Gd68WXeCG4I+1YX7Qs
	 Y9+Szjrwr7KPZ/o8WMW9t+kkTMrmgFWklff34st8xi534iZGbRASPvlr7q05ZTTYr7
	 WvJ4uTjRovLppbuAz8uyG/crV0eSEnPd0pzKtu1/daXKoZHAz3PHFk/K2lkQ3mdYmJ
	 20MWxnlnuHV3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3508C8122A;
	Fri, 17 Jul 2026 15:47:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 782A81F6
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:47:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 68D3B40B88
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:47:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tYNC465uBAP8 for <buildroot@buildroot.org>;
 Fri, 17 Jul 2026 15:47:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3455540B76
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3455540B76
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3455540B76
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:47:43 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-476a130c138so4440696f8f.0
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 08:47:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784303261; x=1784908061;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=6MARHhTO7LTTAlMoeP1kmOM3ZzduXGvojDCP1WXx+Y0=;
 b=h2e1h6DX9lI+zapsteRMgcN5t9tcYnl0oTXyRZ/jsrCmAsps6V0ZNO2JlBy/6MveYZ
 s0hNckNzm7iBQNobCImeqH8hva5Gj+RoUsEPIbLbvvS1grZu9S/A192v/6wd7civ90FI
 DpVIzebI+AzT8EwJUHZGyNNz6cQmGgM2d2XFtpJTXl7SsBj+qmKvSNjaE1JJrW4CZPcJ
 7+uCd0aZvW0uRlBSF3u0ZhlFL02DysfCK7bKNQhHYIsjrTSaoQ7SrBuv/atnbKq1ERj6
 OF802NrWmu3jAPF8A/MSMJ5ZgliE/QP96qydcJAwym07HntCin4QyFdPWeNrob2w+vtv
 BAsg==
X-Forwarded-Encrypted: i=1;
 AHgh+RrqDxRG6fy8eeVtPbs8yy2x1fDi2RW9zonop62B8Z6E6S564PWjxGRZrb5RsLef0hlpVmo+jbnp1uI=@buildroot.org
X-Gm-Message-State: AOJu0YzSNnxsT/bfKDtRg5qf3lmCMkrJJ171nxgzJiLNtugV6B9OQFSl
 GgkL8t3B3P/F7JrWfCHuOX0I/DOAtJPDMyy/Ov3pcYxm3551sCPndMXfgIqySMUPsIc=
X-Gm-Gg: AfdE7cklkA76+5puPp339vK5nnJhaIUNPGgSSrvXlnmyJMsIyc8H8WpGHMPC0u7zPFN
 uyNYbRhWV40jjjdF5gqdq+GMzAtX3Za9GwjspeZVac34POY3obR1JX5VxsUXHSFFkI2/OzaO9Fg
 mtIFAJ/FVO6fNevbIyjgVYMnYTAg7V7RdQWc/BUT4QroyZ9EEONnx6Dc3rJ1FKvGeIGupnKCPdU
 Ah+BIyU/0pK2/8sR1rWYMJSifQVKp0bL0jJcGoHrN3G9nAN7pcPalapeBzHedhiSXOIQi5bm24/
 +NVJz6wngQivTHiKMdZ0IvI43CKJ3oHbXuKLGRmdORDA2O+1f0og1av9VkomMIIsIoL5LI2+tEn
 V6dOKbscLgvRD0UrqdBtnSkz9ZJPvtzDNiD5/53G1Vx1nZ9ZU0+0jwOpHmqKi0pNV439cSck=
X-Received: by 2002:a05:6000:46cf:b0:475:f100:35ff with SMTP id
 ffacd0b85a97d-47f62331b70mr2405793f8f.60.1784303261146; 
 Fri, 17 Jul 2026 08:47:41 -0700 (PDT)
Received: from arch ([212.233.37.141]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63edcf8dsm5283845f8f.27.2026.07.17.08.47.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2026 08:47:40 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 17 Jul 2026 17:47:40 +0200
Message-ID: <20260717154740.192379-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260712113058.1579954-4-bernd@kuhls.net>
References: <20260712113058.1579954-4-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1784303261; x=1784908061; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=6MARHhTO7LTTAlMoeP1kmOM3ZzduXGvojDCP1WXx+Y0=;
 b=eCfTLrgr/ipdjw2/4oHinCIChaD11LMxRyBm0B22yWlNKQKl4tmzMoB80ZWfSxVUNM
 limAG7IzWwKULvujaSykQ3IE5TXgKr0u7dc1WVbMMB93Z9D0lReB79PUGrEBZfA3zyOA
 Uv/X9W910y06iKoMpNh0TjMeLJcGDajAwbBzE+pelHvj3R/32RBO+nOYQAGaodrzxe/y
 T8XkYIkDX+BgVY76/vXaNuFp2vK36ooFvYBGK1U3UBTxcoLANAzIDV5IfXeo185XYbML
 v/Zdex65gw+brR1mLyVrdq6Ztg9Si03AMLyHoeOk36tCPEc7+46kJ+lldVlFUvz01eT3
 59pg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=eCfTLrgr
Subject: Re: [Buildroot] [PATCH 4/4] package/x11r7/xlib_libXfont2: security
 bump version to 2.0.8
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
> https://lists.x.org/archives/xorg-announce/2026-July/003715.html
> https://lists.x.org/archives/xorg-announce/2026-July/003714.html
> 
> Fixes
> - CVE-2026-56001: BitmapScaleBitmaps Integer Overflow Heap Buffer Overflow
> - CVE-2026-56002: PCF Font Parsing Heap Buffer Overflow
> - CVE-2026-56003: computeProps Property Buffer Heap Buffer Overflow
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/ac5c6561894d41b86a43af13c4a5af16612c9195
> https://gitlab.com/bkuhls/buildroot/-/commits/9c78a853c88fa85f7a31404b4ab324370cf049f6
> 
>  package/x11r7/xlib_libXfont2/xlib_libXfont2.hash | 6 +++---
>  package/x11r7/xlib_libXfont2/xlib_libXfont2.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/x11r7/xlib_libXfont2/xlib_libXfont2.hash b/package/x11r7/xlib_libXfont2/xlib_libXfont2.hash
> index 4f50b2dbd2..86e972a0e8 100644
> --- a/package/x11r7/xlib_libXfont2/xlib_libXfont2.hash
> +++ b/package/x11r7/xlib_libXfont2/xlib_libXfont2.hash
> @@ -1,5 +1,5 @@
> -# From https://lists.x.org/archives/xorg-announce/2024-August/003523.html
> -sha256  8b7b82fdeba48769b69433e8e3fbb984a5f6bf368b0d5f47abeec49de3e58efb  libXfont2-2.0.7.tar.xz
> -sha512  f703127df5d5b1093c9b73e019153ed7799523573d52e61d344209f0acfd4df42e11be12bdd1880479c47c2b70de581a4f2ef74e199e9b1ac438f426593d56b0  libXfont2-2.0.7.tar.xz
> +# From https://lists.x.org/archives/xorg-announce/2026-July/003715.html
> +sha256  f556c0e1093a4e6911cc90bc4b106d201902ee187fd74af206ff162f7e6a24d5  libXfont2-2.0.8.tar.xz
> +sha512  e14cc3fa03d7baa4554ee5754ab33f69ac1da3d509c686a5f705fde8cd07772be564d68cc18d9fd0beb5ed7b2f864fcd7f6bf4983f5c0db08a9c747d0e001531  libXfont2-2.0.8.tar.xz
>  # Locally calculated
>  sha256  3b1047f0d45584973866a40e3eedc74aea4c6ac636960d650ae05af603e6d1a8  COPYING
> diff --git a/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk b/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
> index c95f6c6395..a881a4c55b 100644
> --- a/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
> +++ b/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -XLIB_LIBXFONT2_VERSION = 2.0.7
> +XLIB_LIBXFONT2_VERSION = 2.0.8
>  XLIB_LIBXFONT2_SOURCE = libXfont2-$(XLIB_LIBXFONT2_VERSION).tar.xz
>  XLIB_LIBXFONT2_SITE = https://xorg.freedesktop.org/archive/individual/lib
>  XLIB_LIBXFONT2_LICENSE = MIT
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
