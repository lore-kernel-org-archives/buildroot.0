Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA4E8C44500
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 14:33:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81F9080B33;
	Fri,  3 Jul 2026 14:33:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e4JW0bT1DjoA; Fri,  3 Jul 2026 14:33:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BDBA82B21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783089183;
	bh=sDhx1m/OQIsKjApp5ywh30nIgzG1GT6N8S82b2+kTg4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BijJbFBcz56hokKJy+aNF4tlOL9Oicng0+NXxHpptj14zxtQwVv1pQevMnaYzBXRn
	 qH+A6F8VZ7xHpJaPvM9iiCiuBVDWuZz4esA8N0DDYIQI4UrM/+8QQcwfK+KLjxH8i0
	 g+Wu/UWWVi0DXHw0986+kz3XbYHOwd+d4MTaTNSj8ijwZbZm1FLl/I2pXGcZYSyyGR
	 Yw4XfNFeT28F3c5CvBHBbH7/sOT60ZAuR0V4ylM5QnfW2wsg4CovtYEhkRRvxyy8jR
	 fvJlCrnnYrZB1lmVp0sGesGKe606ONGKW8nNf7Kwm85kxveXAFUsmfaPYJQkNTOLol
	 ZWBpcVsGhUrbQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BDBA82B21;
	Fri,  3 Jul 2026 14:33:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 428A3363
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:33:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 349086152B
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:33:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FhkmNi-hYwGp for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 14:33:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 74F65610D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74F65610D9
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 74F65610D9
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:32:59 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-476a130c138so638365f8f.0
 for <buildroot@buildroot.org>; Fri, 03 Jul 2026 07:32:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783089177; x=1783693977;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=j7u0MQgoW/tkdnXPfsb5d9m42sWoxfrwosBD8spY2C4=;
 b=Acr2Pvcjyl6yktPJ9nSrYkxi3+NJXfrfakA/q2FtsaLYB1o88Fpr150VPbFTidA6tc
 eZFzN0ngWIpLU55TzlErt8SOPBWPPeKBFyJCgdZ8JamUx1wSjObLtE1hQ2xrc2pKw5sf
 DiCBNKDDdaOsQfzCOwAFmD5s3nnmS4M5l4Kw7s4bgHOQxEpjeTlZdSoK8i9MNkbyi3Vz
 ADzRcda1iydN0CCBLrWrTQL7n93FeL6JEMTjXJ07ZHhAU7vSr5H/TOeyTZY23v3HatGH
 9lbKYx4VxzW5Y2eU3lztuuiItgbmUv0F6FihqNRncRpGStQQoGBcYkvnQG6T9+WPT015
 hP7Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ9BGVLe3ioZiBe8uKCysr11e6klXrJibGRw8kjJYkyfk2p14616S1aYrNV1NllV7XOD8E+rKV4i1UE=@buildroot.org
X-Gm-Message-State: AOJu0YzWhte1vJa1+hDv/U18MQF1UE+Gl3n+IwHWDes9lWPIJx4pfkn+
 xyHT1J7uQtLptOonkPWzca9PaW9jDFrIwfvvhH09EH3oI35Mo8GFh9QuPsX2bizmHVs=
X-Gm-Gg: AfdE7cn2oLtKp2AayZw1MqFgbGbFVgPcH4VgoAuEZFmBBDPnnyf17robFQvrf0mjdnk
 R8hj24mi5GVMJxQTKaEpdHud4Zb0qkV0Fq7fcGaG9DZ5pVTgpHvgvG9dlpD0Aa879dWQd7x37mc
 c9fGxks24ljFEyJs8lXYF7G3kGbHccBQPX7pa4AWgSwUaN/SZGwzBzZOeG2+lzr17A433o5HwWQ
 yzZ75hi1Td2+Eppb+LsCwCFHlzcOlIUY1Dln0J6TuNylDFzY7BDoDv+5jfPrp/bABchwIYQE0fE
 K6O92N1z66oLGrTPaSyHsE0komy26sgjI1ZKO9j44ENsoM/DZwvaG1IP8A897eoH6FPlBGLcSxI
 D6NI3lPOgYNQR+ZyXg/VuI5pqGEsDh2iXhBrYbHQmSqEk7a8/0n1yI50UR5Qp+nPzOart8dH7Fw
 EUpu7z
X-Received: by 2002:a05:600c:548f:b0:493:b6d5:72df with SMTP id
 5b1f17b1804b1-493d0f4dab7mr1093865e9.35.1783089177321; 
 Fri, 03 Jul 2026 07:32:57 -0700 (PDT)
Received: from arch ([77.109.126.77]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493bef17c82sm142631915e9.1.2026.07.03.07.32.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2026 07:32:56 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  3 Jul 2026 16:32:56 +0200
Message-ID: <20260703143256.275306-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260620184651.3823451-1-bernd@kuhls.net>
References: <20260620184651.3823451-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1783089177; x=1783693977; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=j7u0MQgoW/tkdnXPfsb5d9m42sWoxfrwosBD8spY2C4=;
 b=Wwz8ZIqHO2w9GgLWi2nlkISREoA/EKwa/fmcB3O0wFVFDWPaJLlklkkKIQO/w5roHu
 pL0oRRiVC+ZZkAo0wiplVd8pmzsBSmCeKeypOdxKPsm0pVR/Lh8zXUo7P++w/4xdVD26
 G0hv+BouVZVAExcKf8qpzstxppWMN/KO6qP5bpmTkeGKX6Z62+4Ss+NTQG/9hLU1BO7L
 sUemxJrhh6//8XtW/qazqiyqtzZ3JJ7/5ugBTg6uOK591rUC6Qbho1vKdH+iWichKz+U
 +fNNf6oO9m4GgqONL8jcJH4HqZhhiYLASZFAJk96SXtBUsIihR8iQVxobfqW9gJ7Xpch
 O/KA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Wwz8ZIqH
Subject: Re: [Buildroot] [PATCH 1/1] package/util-linux: allow musl build
 for login/runuser/su
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
> Buildroot commit f89ca996b6deb660b53c33196b8b309fac659bf9 fixed the
> build of linux-pam with musl in 2020 but did not remove the restric-
> tions in place for login/runuser/su which were added earlier with
> these commits:
> 
> login (2015): 25ecd24579f293ef4fcc6847094c4af39f4113af
> runuser (2017): 09860f354ae0824cfead384e994d3f119e22b851
> su (2017): c6488923fb785ac11f6ec78e53db5da22203b178
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
> Gitlab pipeline passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/75fbf2c4a4cb132b66c59560f0470ebc063416fc
> 
>  package/util-linux/Config.in | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
> index c63cec2a9c..df7435e71a 100644
> --- a/package/util-linux/Config.in
> +++ b/package/util-linux/Config.in
> @@ -210,17 +210,15 @@ config BR2_PACKAGE_UTIL_LINUX_LOGIN
>  	depends on BR2_ENABLE_LOCALE # linux-pam
>  	depends on BR2_USE_WCHAR # linux-pam
>  	depends on !BR2_STATIC_LIBS # linux-pam
> -	depends on !BR2_TOOLCHAIN_USES_MUSL # linux-pam
>  	depends on BR2_USE_MMU # fork(), linux-pam
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # linux-pam
>  	select BR2_PACKAGE_LINUX_PAM
>  	help
>  	  Begin a session on the system
>  
> -comment "login needs a uClibc or glibc toolchain w/ wchar, locale, dynamic library, gcc >= 4.9"
> +comment "login needs a toolchain w/ wchar, locale, dynamic library, gcc >= 4.9"
>  	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
>  		|| BR2_STATIC_LIBS \
> -		|| BR2_TOOLCHAIN_USES_MUSL \
>  		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
>  
>  config BR2_PACKAGE_UTIL_LINUX_LOSETUP
> @@ -366,7 +364,6 @@ config BR2_PACKAGE_UTIL_LINUX_RUNUSER
>  	bool "runuser"
>  	depends on (BR2_ENABLE_LOCALE && BR2_USE_WCHAR) # linux-pam
>  	depends on !BR2_STATIC_LIBS
> -	depends on !BR2_TOOLCHAIN_USES_MUSL # linux-pam
>  	depends on BR2_USE_MMU # fork(), linux-pam
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # linux-pam
>  	select BR2_PACKAGE_LINUX_PAM
> @@ -375,10 +372,9 @@ config BR2_PACKAGE_UTIL_LINUX_RUNUSER
>  	  to ask for a password, because it may be executed by the root
>  	  user only)
>  
> -comment "runuser needs a uClibc or glibc toolchain w/ wchar, locale, dynamic library, gcc >= 4.9"
> +comment "runuser needs a toolchain w/ wchar, locale, dynamic library, gcc >= 4.9"
>  	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
>  		|| BR2_STATIC_LIBS \
> -		|| BR2_TOOLCHAIN_USES_MUSL \
>  		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
>  
>  config BR2_PACKAGE_UTIL_LINUX_SCHEDUTILS
> @@ -411,17 +407,15 @@ config BR2_PACKAGE_UTIL_LINUX_SU
>  	bool "su"
>  	depends on (BR2_ENABLE_LOCALE && BR2_USE_WCHAR) # linux-pam
>  	depends on !BR2_STATIC_LIBS
> -	depends on !BR2_TOOLCHAIN_USES_MUSL # linux-pam
>  	depends on BR2_USE_MMU # fork(), linux-pam
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # linux-pam
>  	select BR2_PACKAGE_LINUX_PAM
>  	help
>  	  Run a command with substitute user and group ID
>  
> -comment "su needs a uClibc or glibc toolchain w/ wchar, locale, dynamic library, gcc >= 4.9"
> +comment "su needs a toolchain w/ wchar, locale, dynamic library, gcc >= 4.9"
>  	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
>  		|| BR2_STATIC_LIBS \
> -		|| BR2_TOOLCHAIN_USES_MUSL \
>  		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
>  
>  config BR2_PACKAGE_UTIL_LINUX_SULOGIN
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
