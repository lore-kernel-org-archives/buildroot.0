Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4051AD2502E
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:47:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1814840E28;
	Tue, 13 Jan 2026 19:47:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lb6b9eRfPEis; Tue, 13 Jan 2026 19:47:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40C6B40E29
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333659;
	bh=B7o6pHSH/iasOhv6t5rpAkh/wwkP+UGs7L+19dYu+qQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DLhhxeu9pvsNhbndiUbVQ3kZd5pR8n7DttnvrZ6fwK2jSjJBfux48r6yI87z9OBHr
	 aTxdCED5pzspIqfnCZnViJ4+B7/Mh297xJ5WEy9uwGR7fHUmC6E5leA0ePeAAu9AHd
	 k1R6stlPqoCbzgGUs9aj0Od2E8VM0FLwnuiJfRjsvihzt+Xwz0K9s+mArRkvDn5lAS
	 HD02LTv2OondoTK/lFDb+KiAzA+QjJXDcuH3abFOnPbXokjaik3ZZvdcK2K1KOymet
	 oXXhSfwQnh+QcF/lZSJ5pvsvS4dSJ0/9jXmLF7nJHkxkOczgVPzFHTCIXW+HeSubYO
	 NAkjBjOYeZpWQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40C6B40E29;
	Tue, 13 Jan 2026 19:47:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 59D5E231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:47:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F71F40376
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:47:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DYXKWxTVDn8H for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:47:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0C4F640373
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C4F640373
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0C4F640373
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:47:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3AFAEB97A885; Tue, 13 Jan 2026 20:47:32 +0100 (CET)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Tue, 13 Jan 2026 20:47:30 +0100
Message-ID: <20260113194730.100007-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260103224330.2933161-3-thomas.petazzoni@bootlin.com>
References: <20260103224330.2933161-3-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768333652; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=/rBoXZi6f62/1BESXz0vbhndQD92O6nXZfpwiZLt4zo=;
 b=XmlNFjK6PHN9iQqBa3yhsGHI/tvGAgEWd6YJXGvtSyPsu4pdtd1JUY7k8CNaRX9xZJFo2e
 KqLp61yJvkGmCEFbV/g870KEHiSBoNJXcA3cc30hF18+YDDPzYEjQ/nrvNRbjzs5U93ZcV
 v5dVcGiabrMvp2nDl+d4XmMaIVZLMbyI2A/uvYSbC79UAue4z6elJPJbnxV3qrWQ/JGn/0
 bJnOLTwc7au24IBoIEmSDeFsRDlXcAG16eVgBFpjBEkaJqVEXyTD+4w1UHJpJhY5qnsnDc
 SBw9tGGLm96sFsHZcSvkBC6wj4Rk3J2cx+Kshzhv15sEkhw34dw2E+uw/w4BWA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=XmlNFjK6
Subject: Re: [Buildroot] [PATCH 03/11] package/opencv4-contrib: add missing
 gcc >= 8 dependencies
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
> OpenCV 4 options, but forgot to propagate those to opencv4-contrib.
> 
> Fixes:
> 
> WARNING: unmet direct dependencies detected for BR2_PACKAGE_OPENCV4_LIB_OBJDETECT
>   Depends on [n]: BR2_PACKAGE_OPENCV4 [=y] && !BR2_TOOLCHAIN_USES_UCLIBC [=n] && BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS [=y] && BR2_TOOLCHAIN_GCC_AT_LEAST_8 [=n]
>   Selected by [y]:
>   - BR2_PACKAGE_OPENCV4_CONTRIB_LIB_FACE [=y] && BR2_PACKAGE_OPENCV4_CONTRIB [=y] && BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS [=y] && !BR2_TOOLCHAIN_USES_UCLIBC [=n]
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/opencv4-contrib/Config.in | 36 ++++++++++++++++++++-----------
>  1 file changed, 23 insertions(+), 13 deletions(-)
> 
> diff --git a/package/opencv4-contrib/Config.in b/package/opencv4-contrib/Config.in
> index ad61c3fbe8..529687dd96 100644
> --- a/package/opencv4-contrib/Config.in
> +++ b/package/opencv4-contrib/Config.in
> @@ -76,28 +76,32 @@ config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DNN_OBJDETECT
>  	bool "dnn_objdetect"
>  	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # opencv4 dnn
>  	depends on !BR2_TOOLCHAIN_USES_UCLIBC # opencv4 dnn
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # opencv4 dnn
>  	select BR2_PACKAGE_OPENCV4_LIB_DNN
>  	help
>  	  Object Detection using CNNs -- Implements compact CNN Model
>  	  for object detection. Trained using Caffe but uses
>  	  opencv_dnn module.
>  
> -comment "dnn_objdetect needs a glibc or musl toolchain"
> +comment "dnn_objdetect needs a glibc or musl toolchain w/ gcc >= 8"
>  	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
> -	depends on BR2_TOOLCHAIN_USES_UCLIBC
> +	depends on BR2_TOOLCHAIN_USES_UCLIBC || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
>  
>  config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DNN_SUPERRES
>  	bool "dnn_superres"
>  	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # opencv4 dnn
>  	depends on !BR2_TOOLCHAIN_USES_UCLIBC # opencv4 dnn
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # opencv4 dnn
>  	select BR2_PACKAGE_OPENCV4_LIB_DNN
>  	help
>  	  Superresolution using CNNs -- Contains four trained
>  	  convolutional neural networks to upscale images.
>  
> -comment "dnn_superres needs a glibc or musl toolchain"
> +comment "dnn_superres needs a glibc or musl toolchain w/ gcc >= 8"
>  	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
> -	depends on BR2_TOOLCHAIN_USES_UCLIBC
> +	depends on BR2_TOOLCHAIN_USES_UCLIBC || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
>  
>  config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DNNS_EASILY_FOOLED
>  	bool "dnns_easily_fooled"
> @@ -109,27 +113,31 @@ config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_DPM
>  	bool "dpm"
>  	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # opencv4 objdetect
>  	depends on !BR2_TOOLCHAIN_USES_UCLIBC # opencv4 objdetect
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # opencv4 objdetect
>  	select BR2_PACKAGE_OPENCV4_LIB_OBJDETECT
>  	help
>  	  Deformable Part Model -- Felzenszwalb's Cascade with
>  	  deformable parts object recognition code.
>  
> -comment "dpm needs a glibc or musl toolchain"
> -	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # opencv4 objdetect
> -	depends on BR2_TOOLCHAIN_USES_UCLIBC # opencv4 objdetect
> +comment "dpm needs a glibc or musl toolchain w/ gcc >= 8"
> +	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
> +	depends on BR2_TOOLCHAIN_USES_UCLIBC || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
>  
>  config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_FACE
>  	bool "face"
>  	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # opencv4 objdetect
>  	depends on !BR2_TOOLCHAIN_USES_UCLIBC # opencv4 objdetect
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # opencv4 objdetect
>  	select BR2_PACKAGE_OPENCV4_LIB_OBJDETECT
>  	help
>  	  Face Recognition -- Face recognition techniques: Eigen, Fisher
>  	  and Local Binary Pattern Histograms LBPH methods.
>  
> -comment "face needs a glibc or musl toolchain"
> -	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # opencv4 objdetect
> -	depends on BR2_TOOLCHAIN_USES_UCLIBC # opencv4 objdetect
> +comment "face needs a glibc or musl toolchain w/ gcc >= 8"
> +	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
> +	depends on BR2_TOOLCHAIN_USES_UCLIBC || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
>  
>  config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_FREETYPE
>  	bool "freetype"
> @@ -347,15 +355,17 @@ config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_XOBJDETECT
>  	bool "xobjdetect"
>  	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # opencv4 objdetect
>  	depends on !BR2_TOOLCHAIN_USES_UCLIBC # opencv4 objdetect
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # opencv4 objdetect
>  	select BR2_PACKAGE_OPENCV4_LIB_OBJDETECT
>  	help
>  	  Boosted 2D Object Detection -- Uses a Waldboost cascade and
>  	  local binary patterns computed as integral features for 2D
>  	  object detection.
>  
> -comment "xobjdetect needs a glibc or musl toolchain"
> -	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # opencv4 objdetect
> -	depends on BR2_TOOLCHAIN_USES_UCLIBC # opencv4 objdetect
> +comment "xobjdetect needs a glibc or musl toolchain w/ gcc >= 8"
> +	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
> +	depends on BR2_TOOLCHAIN_USES_UCLIBC || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
>  
>  config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_XPHOTO
>  	bool "xphoto"
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
