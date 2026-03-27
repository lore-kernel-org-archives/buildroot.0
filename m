Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FFAD10ED640
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 10:03:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37BF7612CB;
	Fri, 27 Mar 2026 10:03:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rhh2qZomsMbR; Fri, 27 Mar 2026 10:03:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CEBF6131E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774605787;
	bh=HCSP/x2MYNMbi8G+rQoVpk/xGnB9sX5mo0MlfRZy0/M=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jLcChAbHbtDl6Rklg7PMnqn2/B0ZZrM90QuaOmSWNamEqtI2iaZWK8f2tkX0XwfGF
	 YRlF4xNlbDAkgWZfv3Zlpvwvb24HPDkCaaLeigCL4PotkV2yrmVfMrtppAt0R92zg+
	 9XzFmGCvgU6M9wWGH+6dTu0mKYmAA2MZWykSRKk1E4rSPJUjVsQlAo5wVpHbWx3ePa
	 T3ic1z709aOtFNc3GOdNpBwC3R1dFhgABI0DeQChtb5mdr/Tl32Ywir4BI49D4RKYs
	 300FxY3qa5eV2GDOgk2a3EdTSszK96PAz99kpVLjgBO2IP0N+h930k+oV6DOstbgki
	 td3bpOkk39kmA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CEBF6131E;
	Fri, 27 Mar 2026 10:03:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F2A14249
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:03:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F013F612CB
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:03:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QIxbeq0wqxJ1 for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 10:03:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ECFA6612AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECFA6612AE
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ECFA6612AE
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:03:03 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-48557c8ad47so14193305e9.0
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 03:03:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774605781; x=1775210581;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=EBgRnYyCPoPhMMKKZlJWrbnpog1ILB/m8JwyCFlo8FA=;
 b=inid5Ennynhyq4+k47LnIaIKtcWVJGmqLYoCcKxDSpNWHw5gA3n8buJH7I7zstYiZ/
 FEf4Ha12QhbbzbjjGFVIFlXZoPVjKoC2nHV1RYQM4UNOMMRm3Zu0bg9T2KTMpJWVkmzE
 v/8KPTI/zlgGIPdzLfFOnGgsTu3ZvTSqf8BTrdiLRK8HAlqSaURl1kJ498CEubDSTTFy
 AtdHbck7Mng/OTbqQt2o3Sdc6eZ9rb7bQyHKvuhdB3RKB6ha7lvjrOKoglSXMb/JD0SP
 p0pZOiMyGY7cdFOyuJc6/MVRQs1vAvBCrOF/WnRx5GfgFzN2r28P89EKpLhjVZQepPb8
 NbTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXd0jzPnPbfBsiW1eGqTSQsvBCP219tY2cTCoYQyRrPaH4C7j/R91JNo/zm1i6Kpk7g+saUwPfCgBE=@buildroot.org
X-Gm-Message-State: AOJu0YyykrdoFxLr8Uq65RfNUX8Rh+C7M7sP4U8yhnbepfICq8amNBew
 ZTuzBDDqsIkJFSwlqpH+arKkzIyTpPf9RPYItyBnrmN64fhOkhL9kBasii43GppaICM=
X-Gm-Gg: ATEYQzxSFHPZXxnAgj4DAI1kHqRjy3CazaNYz0G4qFQla9KpAhANXAYR3sjbv0min8V
 J4Ir1Ezp54hL3hfBOfJGUUIcL+3TIRBPdR1xDbduJb8fyeYN+rOpcwcGo7PEB7/mjgrIwpctclz
 9/+NUtjvM31RR83uv0gPoJ7y6XkVyIgNbtH3L1gp98x/TGyEw/zIEyFhYrBkXT14bFMNl5zKsl2
 SW2KuIBOrPMnC0zoS28LU1qO+hYCXWh4trcL409dGUx9BH93ozJeWvRPvCRW28g7bFKRzQFX7wW
 DCYmgz5NTedC5M/tX1st+mHVgF8t9gve1+v52ZQ89YLOoscRPAyRUNCaQa6dN3MbujyjZAayoBL
 qSIO2rVNa16XeXUTxI2Oyxn345UbKjEaPR5qoWRrxdtlDtCk+jm8bdQvJ9Ujc+l7PtoCdzfZOwI
 RTnkjWtUg2bkG/KZME
X-Received: by 2002:a05:600c:1d0e:b0:485:a4de:f4f9 with SMTP id
 5b1f17b1804b1-48727ee54bcmr32216775e9.27.1774605781351; 
 Fri, 27 Mar 2026 03:03:01 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48722cb5845sm77732635e9.15.2026.03.27.03.03.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 03:03:00 -0700 (PDT)
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 27 Mar 2026 11:03:00 +0100
Message-ID: <20260327100300.46690-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260218063123.546067-1-james.hilliard1@gmail.com>
References: <20260218063123.546067-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1774605781; x=1775210581; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EBgRnYyCPoPhMMKKZlJWrbnpog1ILB/m8JwyCFlo8FA=;
 b=S/phAaCFljUBEl7pw1no2fNZYw380dWI6Cfo8JAv105qP9+v7xhiykyVEV1I5svePt
 OHVukhg3owCbPOe+oXFR4n0ii0xTBVHyL+M2wJ0ZOx2IyWhUIPUr/PE4y1MUpb0Q1rJQ
 EYzxPGiSFABI39ijiYyOrdzVyd/ffuxzywUU5nK4DTHA9ep06eOgZ6tDdPt9/8tz8Wkw
 PDRP2kJuWD8H5ZXeFkj5xUKBGDMgEFBr70viBDHMv2F486zfcStSZ6g67PV7gkUv6GCU
 jFOtc/XWgO1ZmviTe0w4I9FBgwJLqA66v4sSbMXZ7FUlN4PmRg8eMqcSsoNxImiKO2N2
 2ykA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=S/phAaCF
Subject: Re: [Buildroot] [PATCH 1/2] package/mesa3d: add
 EGL_WL_bind_wayland_display support
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
> This feature was made optional in mesa3d 25.2.0 as it is deprecated,
> however some packages still require it so lets add a new config
> option that those packages can select until they no longer require
> this feature.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to 2026.02.x. Thanks

> ---
>  package/mesa3d/Config.in | 6 ++++++
>  package/mesa3d/mesa3d.mk | 3 +++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index e1faea95d5..8a7811b6a5 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -50,6 +50,12 @@ comment "llvm support needs a toolchain not affected by GCC bug 64735"
>  	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
>  	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
>  
> +config BR2_PACKAGE_MESA3D_LEGACY_BIND_WAYLAND_DISPLAY
> +	bool "Legacy Wayland EGL_WL_bind_wayland_display support"
> +	depends on BR2_PACKAGE_WAYLAND
> +	help
> +	  Legacy Wayland EGL_WL_bind_wayland_display support.
> +
>  menuconfig BR2_PACKAGE_MESA3D_OPENCL
>  	bool "OpenCL support"
>  	depends on BR2_PACKAGE_MESA3D_LLVM
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index 42693ce928..9c0e5d7256 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -209,6 +209,9 @@ endif
>  ifeq ($(BR2_PACKAGE_WAYLAND),y)
>  MESA3D_DEPENDENCIES += wayland wayland-protocols
>  MESA3D_PLATFORMS += wayland
> +ifeq ($(BR2_PACKAGE_MESA3D_LEGACY_BIND_WAYLAND_DISPLAY),y)
> +MESA3D_CONF_OPTS += -Dlegacy-wayland=bind-wayland-display
> +endif
>  endif
>  
>  MESA3D_CONF_OPTS += \
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
