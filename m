Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB96CCA46C
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BA1881749;
	Fri, 16 Oct 2026 15:06:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AsPh6jhvpiNc; Fri, 16 Oct 2026 15:06:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 175B78176F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792163181;
	b=NkNdqyArh3FMxqe4NFz/zkVoP/Kq/cpySCO/lYZT1sC7F+o1aV6EYQ028QA1dbn6hdz/
	 mhdZMm+/mrdmb91J1eouF3PoNxuy4rewR30p8ByuRb/alHXIWhnWgbH0TDQCUGRftgDcy
	 Se+Dmc4d0+K2ciZqs0L8Y69EacnY6Zzj5N+XdhDsLyz0oxufG8DReRFehwQnGuUX5Ed9i
	 Iz76mmliqsW6fbivJWBHSuFf7Kmw3oxyiAqQsLiCqrTy9owtdR0IqfkjFJA0qcjBK8A0+
	 l3IuZbYeFBBFrUUifxQsBFDk5L8XWkutVEaeY+Pt03xAqOsThhMAco1EOBayKh+IGOQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792163181;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=NXeo4q4ME3Hsz6B1twAom5IlwLiuSCUuMPQuH9Okw74=;
	b=KC0bZv/TfiwKspCAxjPKWE//odxMZlItBYoN/YnxLYeFaA1SHjMN3ooVPTaS1qJRlR+M
	 jx4yiBHFbxLTAc/Hysx2cBNzFKBmJc4pBJrSrbsUs6q/Ul8Hb5+JIpy2XokRizzJiviAf
	 YoZpNz7SqWTTs8adD3pCRMC4YlOURiIPQgEzmuA5gpeWCYeV3/E9mSMay2GAyJS5dOOX+
	 b3B4Eo4rILMgQCyzUTJAxGBl5KK8J91VrkUvYqJ8AayrLXNrOtTZTBLa4wsrRSsYGgRxJ
	 kQem+9QDeMCfFFJLGfS662BsCs6lq4KBAi0EDJiKkQbJJJyoraQ0hpKGoxG8ljP08Dw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792163181;
	bh=NXeo4q4ME3Hsz6B1twAom5IlwLiuSCUuMPQuH9Okw74=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kLhPteARwnsxexk/3be5y7YRotMwDScOeMd38/V/oisofKxHSpzO633ckDxGng6mS
	 g6VpBtPhptDyjE5yJwoAnmb0aMeyZO2BYq6gGnN1MVAhFezJy3mxF4WrKiaS9NZYZA
	 9g0qXSwCzVyTUgBlY/dU2CSlT0dVjRZRui17OviRxnoVjM4bSX/M6LXDru20hu6E+t
	 u3TeF7HBYEoE6kaUPOCRNACOVRHTV+uDjx9KyFg7pHyYo5uTJ5jD3naYVzY73WrUWG
	 YpDawyeDtDs2c24ex0CJiYi/pKhoE7dVYALlDIq6mDZEd25mozrDu4auBnl2NrdPoO
	 ibWQg5vTFzf9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 175B78176F;
	Fri, 16 Oct 2026 15:06:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 94420255
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:06:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7749F40C62
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:06:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qq1KDzacmhQd for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:06:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2C76C40C6C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792163176;
 b=JxDPeLrRUQtZlDkl6WZF3qhwA2rnUt6TBqN1Rpr5p8JbnfoyhrLkpnKfitoovCMCqO/W
 IsrBLTte/bWRkQxeaPQa3lNzfK0vLKu93c5UUwiKNngz3eEOOeCAU6BOG+GjzrmrKja0T
 CUK8CXto9zDbdPFRHT7kNFwlRfNe02gRoUN2vwNqCZdgFLxgGOGWhbjlI0J6D/gQTv14i
 G7rJH9VrHr/bmAqkSWNWFjg9T3XmUz2Y0J7v+N2omxyaHANYg+aqjjsY9SgRXXmaWFPpQ
 zNvjO51E8s5U8mypA3Dkye/sphMSiS0ekpvY6Vm9A1n6yxEA/BBuhbZz0HxYaXBFo5w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792163176;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=+fWzvGeGfVT7AxNTWaCTwD+kcu6eDrZPNQNWRwvLDFg=;
 b=UImC3YzPxyCIo+rZ1Uoe2VWDkKGZBqXk04254WjpppaWGM7JjL5lLwR1TmXYbchXIT52
 Wr+9kqiyi2TcOgjkM3TvRQ0ldLS2dH1JmgKuXVMANws/Lcv+wY1YP52ZLy3Rjgh171aji
 XmnJMDCwDFRlIdSPjDT9meWFioNW+UCgjqp06OEqw37Z80i4HgOPCx4/bk28zyrlpWo9y
 Bvd3KTVPYrrnTW/AYVRhQHD5aW4kpsJIW55HJCPsDsMsUsauJPwiqXD/gec10jqaHAzT/
 4pCdKf+5x6ilr8NbRWT5voGQsRNXDNZ9pwSegnBdrswbZJaB2CLxB1lMCK7XNknQgug==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=MREYQn5g; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2C76C40C6C
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:06:15 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-48b001cd92bso1020196f8f.2
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:06:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792163174; x=1792767974;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=+fWzvGeGfVT7AxNTWaCTwD+kcu6eDrZPNQNWRwvLDFg=;
 b=NCgQroM/Ny+eWSap4ieBqGndLwYHLSQWpbXf6K1kwx72PAEI0FYWu+js46g+UMobOj
 3ymIwcy6AkfnwjUaWMZcpzxxzGoRxOZR8EPNa0uXBK+qK0wk3sE4e1LNgaHo+eIEHFZw
 ZiqLO+X0XZc4I03xQx2w4aeGIsFINfURML92KxD/c+7CikHy4jtJjryc5Z1gluri9kUe
 SrKlQkMFrpcSaPT9iEtPkrHNZq1tdO6oOflxL+6xcKlbCLpS2n8UIRYSMn1l9FS7uatV
 uFy1GZTx39r+zQSq6CG6iOUDTxXaZybb2apRi49Zeelhny0qhcxmfn4cqDIgzwUBEiIb
 SEjQ==
X-Gm-Message-State: AFq9FYIMjXNak4er0qlOtmZJH0f+UH/3X/iKWLefeUt8AHnbAM3jIFjO
 AK5eEcUspV8Y2CQa5m6N7KDp0q9BHIeha6JVdfEtGvR2QAayU/rpwBQXPw5swOnDmLf8oJQDenr
 fONdPcX8=
X-Gm-Gg: AYBFou1zjy2mX83RyucHtNF1GO4Qu0u8Xp8RE1BpcypmOJnwYG2u6YrUbr4dQVkd83V
 IoA//gkuG27du102CGX5CsYLJ0cq3A5uOMjQogFu3k96FqkgKTLEMdJJUQ0cXUtwfaWEjd+GrVC
 +dicbVbTSE0nIacamXP15p+xJeCH+lqR5weY6klp8+NtdZFwdW/Qc+ClP5+fGCTDFomzjXQxR+I
 HLvzkJYjIAM4SxP4WJX/4dT2+VMbQfCJMEOGdZFG11uMfgk62ZvMKvZljOwF/pi31Y5G+i9vyfq
 m5fIqAWAWaMw5VOwOcM6Vd1NX25RNOoMmcrsaUOx3gl+7834W0ZPQcbIWwpxKm+LC+PirjGJ81p
 KL5+CXTzUxGX0lkQhy0O6QiI4Qk5hPpY6O9vmJ6KMQ/4TRSD9yhDEuWIlu1hqqR1rB2DVqtjHxf
 KJQZFUKRpULBNQo4e10oxf3zVm2ErRT84fGKHNN7+eF0iZT+E6pF1nXVBLNMnMQxZ3ruMvMWti/
 eFU3Mkoou/WzJkJSkFlVqeFt48Q32n1wJf3eIASJg==
X-Received: by 2002:a05:6000:4310:b0:48a:f1fb:e165 with SMTP id
 ffacd0b85a97d-48dbaae39e0mr44161146f8f.21.1792163173760; 
 Fri, 16 Oct 2026 08:06:13 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd5128f1sm5657247f8f.59.2026.10.16.08.06.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:06:13 -0700 (PDT)
To: buildroot@buildroot.org,
	Titouan Christophe <titouan.christophe@mind.be>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:06:10 +0200
Message-ID: <20261016150612.76398-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261010201508.963412-2-titouan.christophe@mind.be>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/3] linux: always select host-uboot-tools
 for mips
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Since Buildroot commit 40e266ccb9 [1], host-uboot-tools was always selected
> for the latest Linux kernel. This change is intended for autobuilders, and
> was introduced in Buildroot while the latest kernel was 6.12.
> 
> However, further investigation seem to indicate that itb images were
> generated for mips for a much longer time. Linux commit eed0eabd12 [2]
> seem to enable that image format, and was released in Linux 4.9.
> 
> This version being EOL for quite some time, we can therefore assume
> any "not so old" Linux for mips will need host-uboot-tools to finalize
> this image, and therefore we should select it when building Linux.
> 
> [1] linux: select host-uboot-tools with FIT on mips
>     https://gitlab.com/buildroot.org/buildroot/-/commit/40e266ccb9
> [2] MIPS: generic: Introduce generic DT-based board support
>     https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=eed0eabd12ef061821cbfa20d903476e07645320
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  linux/Config.in | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/linux/Config.in b/linux/Config.in
> index 99efb56b49..3521fe5cd5 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -4,6 +4,9 @@ config BR2_LINUX_KERNEL
>  	bool "Linux Kernel"
>  	select BR2_PACKAGE_HOST_KMOD # Unconditional, even if modules not enabled
>  	select BR2_PACKAGE_HOST_IMAGEMAGICK if BR2_LINUX_KERNEL_CUSTOM_LOGO_PATH != ""
> +	# mips always generates an ITB image
> +	select BR2_PACKAGE_HOST_UBOOT_TOOLS if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
> +	select BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
>  	help
>  	  Enable this option if you want to build a Linux kernel for
>  	  your embedded device
> @@ -32,9 +35,6 @@ choice
>  config BR2_LINUX_KERNEL_LATEST_VERSION
>  	bool "Latest version (7.2)"
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_2 if BR2_KERNEL_HEADERS_AS_KERNEL
> -	# mips always generates an ITB image
> -	select BR2_PACKAGE_HOST_UBOOT_TOOLS if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
> -	select BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
>  
>  config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
>  	bool "Latest CIP SLTS version (5.10.254-cip72)"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
