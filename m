Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0366D2F35C
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:47:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DA34843CF;
	Tue, 13 Jan 2026 19:47:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 190Y7EkuAved; Tue, 13 Jan 2026 19:47:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3CEBC843B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333658;
	bh=mfPpZfghTO7Wh63I4I88o9q3PPYbygPMAKLfTml506o=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kvGYe7tN2PMZqMo1G4YIPl/3wUtEqu5r/74Ilxi1/lV13aFHl/U1zY/Mq3TNOe96d
	 Q4pkaXFSyl74di6byP1g5stthCwMnc5iN6bl0pxs5r8FEBov6d0OnIeKgX6Yt1AA/i
	 BxBT66NRCvILx3qn/bjg6nOPlmUUjPUxSVsFbLnehmHrFd2fQwOfZ+4eVddZlmJ0L8
	 7zRfLVLwakQR/V/7DGXjEkS208CLMH9ZqauuSeCuwYvMDGwndBhlNQiiJSCSVTtxZy
	 hQG6S4PxgSlkR4WfSg1jXcwnUMNr4RV8osVGPqba0rQ851yruI8+eD7rRFuld+Rt8E
	 YbUJ6xURgWiAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CEBC843B6;
	Tue, 13 Jan 2026 19:47:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 13FD21C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:47:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EDE4340376
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:47:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WxnbFJuDSb3q for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:47:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E4CBC40373
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4CBC40373
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E4CBC40373
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:47:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 37E06B97A863; Tue, 13 Jan 2026 20:47:30 +0100 (CET)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Tue, 13 Jan 2026 20:47:28 +0100
Message-ID: <20260113194728.99961-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260103224330.2933161-4-thomas.petazzoni@bootlin.com>
References: <20260103224330.2933161-4-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768333650; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=iQ6xpx3IEcwC85Ec8Llox0pss2AjM1YMkeyEfIUX3qg=;
 b=auQ2HXOMuydev6x07Q6h/SYoX6bJAw8sScXaLD2pDpO5SJ4XbtcUySrhni7uNWD7s9GvI2
 ZGDPFVwqOSE7wVPs6nd5f3Ij9VB7pbstq63gxCv8unUKuFtNIsNDApgGwlUpokVgQS1R1S
 MVVg4Ea6mJ2L3Yg4rSO//u+Ov3m9yj0d6tjjnKBhTQ2RXB+PGRYIf5qZGHfht/Pfba9wf1
 TmDgv03wWRz8JK5kwNlPjsya/SI/EUpb97ieq6NxQdE0C/OcMUi5as+5D4iycrnTYzysKu
 /1X3Kve4HQh0+HcI5HOOtwwJBNqBGSv8NX1hDQrv/+bcqwf8p5xsaBWGRp5+xw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=auQ2HXOM
Subject: Re: [Buildroot] [PATCH 04/11] package/opencv4: add missing
 Config.in comments on gcc >= 8
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Commit
> 75ab6cf93a3ba505897ae99b5ff4bffda55d3c7b ("package/{python-}protobuf:
> bump to version 28.1") added a whole bunch of gcc >= 8 dependencies to
> opencv4 options, but forgot to create or update appropriate Config.in
> comments for several options:
> 
> BR2_PACKAGE_OPENCV4_LIB_OBJDETECT
> BR2_PACKAGE_OPENCV4_LIB_STITCHING
> BR2_PACKAGE_OPENCV4_WITH_PROTOBUF
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/opencv4/Config.in | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/package/opencv4/Config.in b/package/opencv4/Config.in
> index a7f5592122..47c1cf3f4a 100644
> --- a/package/opencv4/Config.in
> +++ b/package/opencv4/Config.in
> @@ -157,9 +157,10 @@ config BR2_PACKAGE_OPENCV4_LIB_OBJDETECT
>  	  Include opencv_objdetect (object detection) module into the
>  	  OpenCV build.
>  
> -comment "objdetect needs a glibc or musl toolchain"
> +comment "objdetect needs a glibc or musl toolchain w/ gcc 8"
>  	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
> -	depends on BR2_TOOLCHAIN_USES_UCLIBC
> +	depends on BR2_TOOLCHAIN_USES_UCLIBC || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
>  
>  config BR2_PACKAGE_OPENCV4_LIB_PHOTO
>  	bool "photo"
> @@ -207,9 +208,10 @@ config BR2_PACKAGE_OPENCV4_LIB_STITCHING
>  	  Include opencv_stitching (images stitching) module into the
>  	  OpenCV build.
>  
> -comment "stitching needs a glibc or musl toolchain"
> +comment "stitching needs a glibc or musl toolchain w/ gcc >= 8"
>  	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
> -	depends on BR2_TOOLCHAIN_USES_UCLIBC
> +	depends on BR2_TOOLCHAIN_USES_UCLIBC || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
>  
>  config BR2_PACKAGE_OPENCV4_LIB_SUPERRES
>  	bool "superres"
> @@ -332,6 +334,10 @@ config BR2_PACKAGE_OPENCV4_WITH_PROTOBUF
>  	help
>  	  Use shared protobuf from the target system.
>  
> +comment "protobuf support needs a toolchain w/ gcc >= 8"
> +	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
> +	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8
> +
>  config BR2_PACKAGE_OPENCV4_WITH_TBB
>  	bool "tbb support"
>  	depends on !BR2_TOOLCHAIN_USES_UCLIBC # tbb
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
