Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00092C7EE31
	for <buildroot@archiver.kernel.org>; Thu, 26 Jun 2025 19:54:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C6F2761269;
	Thu, 26 Jun 2025 19:54:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o0q3Ysc4TTJN; Thu, 26 Jun 2025 19:54:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C90C612A4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C90C612A4;
	Thu, 26 Jun 2025 19:54:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 80E9710A
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:54:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 72F3281BB4
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:54:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uXfnCNlAP3Cp for <buildroot@buildroot.org>;
 Thu, 26 Jun 2025 19:54:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 946E480DA1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 946E480DA1
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 946E480DA1
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:54:22 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4537fdec33bso9039845e9.1
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 12:54:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750967661; x=1751572461;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ilMmLJG908A9iB59ZYCn+LTKVffnVJEvOooiJ7thck4=;
 b=PwOvFHI2bZVgfc2cFoyfuy6HHyaVKvqxW1+VT6Z5IXPzpdsi0aqFTAhFBpf0SgayVE
 /8ZGmiwRNrwSiPWHLrJto/c/UfH+lb68VJlOCnZTYB4yxrfCjx3bgpdrIQ6Qk+21Gsr5
 MogSczTo+pFqxStQn+8DmauVN3UmKdS04a7mnaq/OGKEfTkIMu89SXtufFn8ZXNAPoeZ
 gPmd5LbXDMF7SKIva1hQbJHMsC/8o9hPIFxHwRv5CdCmvTJA6p4WP+ryLN0xeywIN/5A
 gp9DzPrkT/92u6kbh+4BNh2f41zAamyLGTuc1gy5GGGhCu3iCl59s4Yhx3OzOyF43FzE
 ADUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkI3/uV3At0eBuBAMXoJrLImb94tI4ykdww+HR3FQRsiz2wbN/5zHR0hUzbFsFfiMnwJ/VJ58Ixu4=@buildroot.org
X-Gm-Message-State: AOJu0YyiClVIcYbcm1ye5yHZ59yu6mKw1W5tiNJznMgnVMrD957WF9qy
 ZnsOoLYOKVhP/pYhJxfvUL7FYAwHRkVvnc3yrAIsizQXgK/zOeC9VO+j+b74Q4/4k7CR+qu8YJH
 /YfwG
X-Gm-Gg: ASbGnctXD9rZZ7QZXQ6Phu0+4JJEW0Blx+lVCqGGCHPEYqrMmRMvSa2n58CannmXf23
 wDtV4ZFccVI21dZ5835t2+EF7R2gLc/goT+8O+URhPOud7IO1kjo/6bv/HW4qZjsO2Ix+zsk0Ro
 NRmww2wLy6qEIioMRNNM/WwfE3orzsyfgMH1i2p+fTqPVfJXuFO4JBtdbUNE5MrCANQ+pKpR02w
 jzuk+zv2eyKqwMNtnH6kRrdgxJlqu42AwlAmkROKPKiNadShMJJQkxHbBlXK5BpKc1cLT77OMrw
 UgLwhoDaokng54hyAPpNyeu3fEU6ARKvjdY6V7GbyOCeiFttoWD+fr2hqVWGEN92IGaGKvBHzix
 MQsNyd6n2mfSZ7DkMbnMCFJq48DKinB7G
X-Google-Smtp-Source: AGHT+IEoDZsDZO4sU0Sx0KCKkz5jl0m4bBEXI+Gycuqc4tSU3jFBoez3DPFHXC9JmjjWPvnmuC0dxA==
X-Received: by 2002:a05:600c:a41:b0:43c:eeee:b713 with SMTP id
 5b1f17b1804b1-4538ee83b1amr5300805e9.20.1750967660592; 
 Thu, 26 Jun 2025 12:54:20 -0700 (PDT)
Received: from localhost.localdomain (94.105.118.175.dyn.edpnet.net.
 [94.105.118.175]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4538f2fec5fsm2160855e9.40.2025.06.26.12.54.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jun 2025 12:54:20 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 26 Jun 2025 21:54:11 +0200
Message-ID: <20250626195411.15639-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617203439.1053632-1-bernd@kuhls.net>
References: <20250617203439.1053632-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1750967661; x=1751572461; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ilMmLJG908A9iB59ZYCn+LTKVffnVJEvOooiJ7thck4=;
 b=SCR3vzmE6Q2YYEfFARQrQF1Jv5GbNnJqBHGnDK4vgoAL/lCSzr1k12papbU7Vxl1jA
 QVYKVq2jVAzMgvFBEXH6lNz87sSJua/IvTDcQJzKiQ7LtcOVM7sWwX114cUsFjd3JqTI
 NRzr65CXnhP9eG9flaB8DQRNiAQHLRzAeb14m7P/gZuTOjzDHz52wiRc/nsmDtqg2bcl
 /8+lpJFBfXGNgfKZ/ycTdJUaIC7SobYmDH//gWiIAn6Gu2Y0jGy323DQXm+zWq0kHGC0
 VP7jvU5kUIXxmtaQod1sJVoRIlSg6is02WabTQc8pwMj2SiFpwtsmCY44ySUDae7TsOg
 smgw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=SCR3vzmE
Subject: Re: [Buildroot] [PATCH 1/1] package/lpac: needs libqmi for optional
 support of libqrtr-glib
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
> Buildroot commit dad998a8070bc07838f78453fcb7906fefab22ba added this
> package but forgot to select libqmi for optional support of libqrtr-glib.
> 
> Fixes:
> https://autobuild.buildroot.net/results/95e/95e30d1031912efa200edb9c7b926a31f0abe32f/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.05.x. Thanks

> ---
>  package/lpac/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/lpac/Config.in b/package/lpac/Config.in
> index 6cfe11cc67..c754da96d9 100644
> --- a/package/lpac/Config.in
> +++ b/package/lpac/Config.in
> @@ -5,6 +5,7 @@ config BR2_PACKAGE_LPAC
>  	depends on !BR2_STATIC_LIBS # pcsc-lite
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pcsc-lite
>  	select BR2_PACKAGE_PCSC_LITE
> +	select BR2_PACKAGE_LIBQMI if BR2_PACKAGE_LIBQRTR_GLIB
>  	help
>  	  C-based eUICC LPA.
>  
> -- 
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
