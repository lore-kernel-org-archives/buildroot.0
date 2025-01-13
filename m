Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 895FAC02183
	for <buildroot@archiver.kernel.org>; Mon, 13 Jan 2025 14:34:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E84D80DFB;
	Mon, 13 Jan 2025 14:34:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dmWNTCSdG32l; Mon, 13 Jan 2025 14:34:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FE2780E9C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FE2780E9C;
	Mon, 13 Jan 2025 14:34:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 47FC295D
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 14:34:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 27E91608AC
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 14:34:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u-M2oabZzCCu for <buildroot@buildroot.org>;
 Mon, 13 Jan 2025 14:34:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DD3F5607E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD3F5607E0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DD3F5607E0
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 14:34:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D14211BF205;
 Mon, 13 Jan 2025 14:34:12 +0000 (UTC)
Date: Mon, 13 Jan 2025 15:34:12 +0100
To: Akhilesh Nema <nemaakhilesh@gmail.com>
Cc: buildroot@buildroot.org, Guillaume William Brs
 <guillaume.bressaix@gmail.com>
Message-ID: <20250113153412.51ff0e04@windsurf>
In-Reply-To: <20250112223142.770914-1-nemaakhilesh@gmail.com>
References: <20250112223142.770914-1-nemaakhilesh@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1736778853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LMoCnYZpd0OSRm5HuB1dM82dll6eLTfDjSU1nArHid4=;
 b=IhMgGQPXNckM43qOQcNrWDU/7prHCCJ1J6kGQ0c9EA5zGaQAjvjyr/fNMog+evvhptrBMq
 UEwgAmgK3CTwyqgCOh07rTt5ifUxzeDSNERhziYdBR/pv9DKTpnRIKaxw5rctmEDoZO5HW
 Xr7DTB1wZKCJ/+MgJWJpEqc4MDgu+bMIjypHSrx34JqEsiWV/nJ4o3a2F9v1Nk+IWZd6UF
 K3SQTd3uSnBnYeNUebAZRyxvKI+ey6kxAPkHyPF2rR6YQKn7KabYXRVMii+DVefxsyQSke
 2yEjC0FgvIJ6UnXAoaGCNTD8Wk7pSZBTayD3bUVpdpMy2jd0FAErU9e/Fezfig==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IhMgGQPX
Subject: Re: [Buildroot] [PATCH 1/1] package/libxcrypt: bump version to
 4.4.37
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

On Sun, 12 Jan 2025 14:31:42 -0800
Akhilesh Nema <nemaakhilesh@gmail.com> wrote:

> diff --git a/package/libxcrypt/Config.in b/package/libxcrypt/Config.in
> index 38c75b5e63..508e1a43cd 100644
> --- a/package/libxcrypt/Config.in
> +++ b/package/libxcrypt/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_LIBXCRYPT
>  	bool "libxcrypt"
>  	depends on BR2_TOOLCHAIN_USES_GLIBC
> +	select BR2_PACKAGE_HOST_PKGCONF

We really don't enforce selecting this option, so I'd rather see it not
done, than done inconsistently between packages.

> +LIBXCRYPT_DEPENDENCIES = host-pkgconf
> +HOST_LIBXCRYPT_DEPENDENCIES = host-pkgconf

I'm actually surprised by the dependency on host-pkgconf. host-pkgconf
is normally used to detect dependencies, but libxcrypt has no
dependencies other than the toolchain. So why is it needed now?
Explanations in your commit log would be very useful.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
