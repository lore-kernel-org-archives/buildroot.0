Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9A62E95A8D
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 13:05:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AEDF760BB5;
	Tue, 30 Dec 2025 13:05:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z7Ihq6mvgrVG; Tue, 30 Dec 2025 13:04:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8760060B7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767099899;
	bh=KlkoPwc4pM6c7FGGlMsmgYNmXSoHfRkqog+q4+iZzBA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dxDp3NAiG3kXF1EUC1UtTY2SQ8ruYtCe7AqapI8ZulQT0RS6zl0zOtbF+fkIRJNxM
	 dGLLwHirxYj4otXRv8hFA3KaDw7Ce3ZIPuG/lLKvB4pOEDqrwBkqsQJ3voU6Ef/OrV
	 pz/UIlQNMPuR+Zme+XgC1E/tRg+9XPq8x5S24R4/mEWahKSqey6duH0JAMjkyViFMx
	 bnorbXveUEzy8AqKCXgtlL+U00d8WwC4NdZHSGHsmTQQ4h8WjqYUnfRpfpHightR/m
	 ZH5DA6Tr/rrL9QQEtsNt6+CBxQvZN6qUelb8oopUj4HTLrT0PxDJyAL02XTHlbMBbL
	 XCZKLV5gbN8Cg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8760060B7D;
	Tue, 30 Dec 2025 13:04:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E787AD8
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:04:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE15F40796
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:04:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2p47vce2M-8Y for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 13:04:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F06544077B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F06544077B
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F06544077B
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:04:56 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 381181A2533;
 Tue, 30 Dec 2025 13:04:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0E0216072C;
 Tue, 30 Dec 2025 13:04:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B967B113B0643; Tue, 30 Dec 2025 14:04:53 +0100 (CET)
Date: Tue, 30 Dec 2025 14:03:27 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Julien Olivain <ju.o@free.fr>, Mauro Condarelli
 <mc5686@mclink.it>
Message-ID: <20251230140327.3c5d6f66@windsurf>
In-Reply-To: <20251228234350.2887246-2-james.hilliard1@gmail.com>
References: <20251228234350.2887246-1-james.hilliard1@gmail.com>
 <20251228234350.2887246-2-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767099894; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=wmgmhygZXXzM2cTfkM/yd8uai1wYc/l960ApAl/YnDQ=;
 b=dfigHmWPqZcu42MZ4pfTzQCarEXOgHy/x/aAAcOtZWq/CO8SGN9C35ZuSAvGiuofCqb/Xm
 9+R6M/5GJa6FJOtDctRTYfy+E2njyPssc4ZFwY01ZTvVYTpkGs+Mp5FUN7ySfhLV1apJcK
 G4aEm8GTpQhNdwganA1w+HU0OpLUePAYwg0+J/KgUdQX7Xa4VVTsVN5u1YLDodk1vn5OI3
 ss5ziAdWGz6RSXcZBC/CU9w4WRUvZOx6C2RliDPChMI9geDc6Qmuue11uHIyU7VROvNWeE
 2D3KC69eeHvFHwL5ET6rUu5hDohEbORWqELJ4TcuUQ5WY72f6Dr0CqM99rdxNQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=dfigHmWP
Subject: Re: [Buildroot] [PATCH 2/2] package/python-autobahn: bump to
 version 25.12.2
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James,

On Sun, 28 Dec 2025 16:43:50 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> diff --git a/package/python-autobahn/Config.in b/package/python-autobahn/Config.in
> index 527416a3cd..ada62e1e3b 100644
> --- a/package/python-autobahn/Config.in
> +++ b/package/python-autobahn/Config.in
> @@ -1,38 +1,42 @@
>  config BR2_PACKAGE_PYTHON_AUTOBAHN
>  	bool "python-autobahn"
> +	depends on BR2_INSTALL_LIBSTDCPP # python-ujson
>  	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography
> +	select BR2_PACKAGE_PYTHON_CBOR2 # runtime
>  	select BR2_PACKAGE_PYTHON_CFFI # runtime
>  	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
>  	select BR2_PACKAGE_PYTHON_HYPERLINK # runtime
> +	select BR2_PACKAGE_PYTHON_MSGPACK # runtime
>  	select BR2_PACKAGE_PYTHON_TXAIO # runtime
> +	select BR2_PACKAGE_PYTHON_UBJSON # runtime
> +	select BR2_PACKAGE_PYTHON_UJSON # runtime
>  	help
>  	  WebSocket client and server library, WAMP real-time
>  	  framework.
>  
>  	  https://pypi.python.org/pypi/autobahn
>  
> -if BR2_PACKAGE_PYTHON_AUTOBAHN
> +comment "python-autobahn needs a toolchain w/ C++"
> +	depends on !BR2_INSTALL_LIBSTDCPP

This lacked:

	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS

and also, you shouldn't put the comment between the main option and the
sub-options, as it breaks the indentation of the sub-options in
menuconfig. The comment should be *after* the sub-options.

Applied with this issue fixed.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
