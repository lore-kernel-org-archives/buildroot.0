Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5347AC44500
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 14:33:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A91882890;
	Fri,  3 Jul 2026 14:33:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mPTlf-R1ddOr; Fri,  3 Jul 2026 14:33:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51A8F82B49
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783089210;
	bh=MbLVFz6ejLxAfVfa8vug8xfEupewuMMYWD2WVg3uO0U=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VKRu2dyIsotL9rSDFncoJhVjjZxpFnqO6d99tFfQulzYqz+aJjIXy1yPzs8tppNA0
	 3It7k2uEAwzPOIirqilR5smdiCPBFycmnn5Cd3ocxj40FuLp8hV9IreFxfLOS7+02Y
	 YarOVNAthnOrm6SQGqDqbn5TytdEbMQ0nfwAKNF0QhT1Vb8qePkbs1ZSa/07CidVGp
	 fCYisDrmt3Hss7JHlqYfHO36oNuS4DwgyEN87S2goHsZrvbwyGDkojmPfuqei3NjsI
	 s3d9wSAIPZDkJNYQtr0UMkLyto2Lm+R+Rbq2bFRioEuYlBFF7U9x6mM++Mp8XbqRu6
	 tqcT2StjsXoqw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51A8F82B49;
	Fri,  3 Jul 2026 14:33:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CF698363
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:33:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CCD43610B6
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:33:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R6MAMS3PQA_F for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 14:33:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C02AB60E5D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C02AB60E5D
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C02AB60E5D
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:33:27 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-493c19bad03so5856255e9.2
 for <buildroot@buildroot.org>; Fri, 03 Jul 2026 07:33:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783089205; x=1783694005;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=33vZnekMY1yH7YGO4FVBD/GXPRqpx4g3fsUw7qBCBDE=;
 b=RDwz6kOx1bC/Fpg5JcptYHBFL1bNho/KR1KA5n8SfY9yI3wTbdK0Lr3VkS/1H3CI0V
 bqUuN3tzHPinWg3Ivy3KSZpBk5qfFB7+IxMs2jywc/IQU37WYXMN0+FKG9XFynOamIBd
 XLbH1qAvnp57Z3omi5iH+jgzBfj7w8pPMuQk9wcZ/IEf9+W2DTlvXhwP5tXR9jFdDnkp
 S1gW9HriA2Q2B6aFD9lijvSeXH6zuuGHrv6PBZRGNv48TN8CaGpFRVs/yIfiNvb1pYmh
 AdFZIgDb+25No61yY9QZHXbpm+1akTClyE8JnHfWvHKatw+Lcalveso7VrlQlW98Uusl
 kAOQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+YW+m+FrPSCZ3DCqPHFHOcL5SKtBteYPZoxB9/79d3oIlC1jTeYYYYx52I9fXV5cgmPYdJ1t20Y/Q=@buildroot.org
X-Gm-Message-State: AOJu0Yzi4kqjr4s9GgQ3yE4hD9Gdm0ucRmB4UTOvoaD1Rq7j+hG2RlhK
 t2QiI1qrzmXUuXI48EpIhSh5e/CfEesWNntLR3732lpbcFD3xSziM/KS9lJuTOCmZAg=
X-Gm-Gg: AfdE7cmvu5TXTLDDnbTq5LXrRMV1rr5Gc/YNUReFT/c/nih7rPn3/uFPud/AfWKjEdi
 pzODHHgDyXPll8BPQtqeWvyPCj69YA4ge6FRoYU3gCBugpnA7bDvlkYBWWwtaHrl3rea2ra6/Fl
 gCD61gpgy3JoyRo6xPcYRW2y5Ts9+MjaY55V/EjoAQldKbF/NvYE27SoeZhjbfEJjqh6ut3CVx2
 wi8iopwPZ8mfOKAcxLNdCoPOQ+cefRorXdrVjNNy7WurpUa6pF84VgUlRem1RXlCDt1DDtVxw0B
 xToaG3JGoYyBnFkZKJd3Ea1bsGbfaJuLyg01yfEYIeJFvPk20YEIBmuSOPQ+0gTntmzy/AUEDif
 DU8l4g7Cmx/vzOMLYPVGSn5W/T+FknmC7tUWmhB3Q/T64zSQCBiWSC7sq0pa6cOwmiUZ63K5tVR
 9KZlQY
X-Received: by 2002:a05:600c:1f87:b0:492:3d05:5639 with SMTP id
 5b1f17b1804b1-493d0f53f9fmr682495e9.36.1783089205654; 
 Fri, 03 Jul 2026 07:33:25 -0700 (PDT)
Received: from arch ([77.109.126.77]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-477db8a450bsm20088091f8f.10.2026.07.03.07.33.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2026 07:33:25 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  3 Jul 2026 16:33:24 +0200
Message-ID: <20260703143324.275832-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260621075519.924777-1-bernd@kuhls.net>
References: <20260621075519.924777-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1783089205; x=1783694005; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=33vZnekMY1yH7YGO4FVBD/GXPRqpx4g3fsUw7qBCBDE=;
 b=fCmy74tbrHDqGft5pJE/bxQo6EJjfOwnLwV57Dhhn1aoBGBjVwZHKIwjxb67wSxtct
 Vneu/8dh5Aa1FQ13H4bGo+po1wqJAK3wIWN90F8GybSAaT80slrJvE1AD7Efm5xFf3ch
 nZSRH48G3o/Ajhy6pa2jh2/KIaNRbZlOpFTT5WHrlKzt/IEz6aEjpTsT4+VYYEI2DFvI
 lB7jN8n/mIcafzyxCzx3TaeRiSUom848EvtVlnXsjja6yQdkREHRc/0axLkm6Ef3N9hz
 Kz4x3pQ3179OwueOFO8plI8AjGKfpin4tcxuhwr83ePR2RyRUJ6jf6uD0WKVs/ykt/bg
 pasQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=fCmy74tb
Subject: Re: [Buildroot] [PATCH 1/1] package/util-linux: lsfd needs headers
 >= 4.15
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
> Buildroot commit 31af509b4f4fe52f67bd9109b8732a55b8f9cd2d bumped the
> package to 2.41.1 which includes upstream commit
> https://github.com/util-linux/util-linux/commit/036d72749ca274294051b43fd66727061a772b9c
> adding a dependency to BPF_OBJ_NAME_LEN for lsfd.
> 
> BPF_OBJ_NAME_LEN was added to the kernel headers in version 4.15:
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=cb4d2b3f03d8eed90be3a194e5b54b734ec4bbe9
> 
> so we need to raise the header version dependency for lsfd.
> 
> The build error was found by the Gitlab pipelines for the defconfig
> bootlin-aarch64-glibc-old.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.05.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/bba1881a5eaf4a127a6580872c665fd095724b03
> 
>  package/util-linux/Config.in | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
> index c63cec2a9c..3df149b3de 100644
> --- a/package/util-linux/Config.in
> +++ b/package/util-linux/Config.in
> @@ -233,15 +233,15 @@ config BR2_PACKAGE_UTIL_LINUX_LOSETUP
>  config BR2_PACKAGE_UTIL_LINUX_LSFD
>  	bool "lsfd"
>  	depends on BR2_USE_MMU # libsmartcols
> -	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_19
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15
>  	depends on !BR2_TOOLCHAIN_USES_UCLIBC # process_vm_readv
>  	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS
>  	help
>  	  List file descriptors (modern replacement for lsof)
>  
> -comment "lsfd needs a musl or glibc toolchain w/ headers >= 3.19"
> +comment "lsfd needs a musl or glibc toolchain w/ headers >= 4.15"
>  	depends on BR2_USE_MMU
> -	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_19 \
> +	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15 \
>  		|| BR2_TOOLCHAIN_USES_UCLIBC
>  
>  config BR2_PACKAGE_UTIL_LINUX_LSLOGINS
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
