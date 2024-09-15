Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24BDAC35FE8
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 08:12:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCBAD80898;
	Sun, 15 Sep 2024 08:12:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pWjkQGx4rZmQ; Sun, 15 Sep 2024 08:12:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDCAF80ABA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDCAF80ABA;
	Sun, 15 Sep 2024 08:12:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5DB301BF47D
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 08:12:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 336614065A
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 08:12:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e-y76EbyNp_m for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 08:12:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EDC4140577
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDC4140577
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EDC4140577
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 08:12:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E8BA41C0003;
 Sun, 15 Sep 2024 08:12:16 +0000 (UTC)
Date: Sun, 15 Sep 2024 10:12:15 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240915101215.044073fa@windsurf>
In-Reply-To: <20240915071447.1540596-2-james.hilliard1@gmail.com>
References: <20240915071447.1540596-1-james.hilliard1@gmail.com>
 <20240915071447.1540596-2-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726387937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IylbUtCJ9uIm533YvnIwbnIBVrUeDQuaBtmEWPK7dxU=;
 b=gzapgIxtE8zzgKLl6Jy2WpU403mWgUsI32gMGrl1V77U7PRkFYRw3tFBDH8uksJpTEDI8N
 oFTqqATN+FDRHrpkVQuDCnCAmNtxk0/MhTP2mYVqFx0lh9kiNGg/IEE/oIXtzW9aQVZI88
 nHpa987AJanoHAK2HUwEcXiBJmN+E5TXz93iIGcoRsPSV5T5p9Fjxjz6DcXxm4QkobdXzO
 oh2ZuvnC7r+mPtLx/QwMg5cV3idvZLwEYGy+oJMDLA151w3l3J0090uYr4vwRhl4cLuCvn
 RTfnxeZeqzTYtJ3yETI42TWiZ0ouQ18iz2B7bmL1CMXCHXIu2zl0NRgdquHKlw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gzapgIxt
Subject: Re: [Buildroot] [PATCH 2/2] package/python-google-api-core: bump to
 version 2.19.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 15 Sep 2024 01:14:47 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> diff --git a/package/python-google-api-core/Config.in b/package/python-google-api-core/Config.in
> index 689923a2f4..21fe361e07 100644
> --- a/package/python-google-api-core/Config.in
> +++ b/package/python-google-api-core/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_PYTHON_GOOGLE_API_CORE
>  	bool "python-google-api-core"
>  	select BR2_PACKAGE_PYTHON_GOOGLE_AUTH # runtime
>  	select BR2_PACKAGE_PYTHON_GOOGLEAPIS_COMMON_PROTOS # runtime
> +	select BR2_PACKAGE_PYTHON_PROTO_PLUS # runtime

And now that BR2_PACKAGE_PYTHON_PROTO_PLUS has a depends on
BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS, it needs to be propagated here
as well, and also to the reverse dependencies, i.e
package/python-grpc-requests/Config.in. I fixed that.

Thanks,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
