Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5773DD3B9A1
	for <buildroot@archiver.kernel.org>; Tue,  9 Dec 2025 22:04:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F340861292;
	Tue,  9 Dec 2025 22:04:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i6dOQGJ3Dh4e; Tue,  9 Dec 2025 22:04:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1693461374
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765317875;
	bh=3xKHAQ6BUTzre1UHKvwM20tAZZV9lI4mG7vWj6cX+uI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IMesuXcGREzKSo+PEgzBsxC1lpFic1cha/659+fp/HBrdmIinhjsvbA16QQAkJKsV
	 ex3bzpM848ZYnnr3hnIJgln3m8Ndvt+V/tPiY1Hfzta1bZECdNhOFdeaqag+kBwlji
	 OWuXtK70LOyQbs8xIROUIRf3ILTmOeO3tW+efdXifDbu3rnhDSUONgoI0EuYPuNPmf
	 +kr9/RA0yaywZrQyGlKe6lhx7ZQ+H/BMs3SbgkGjoiovkK63fDrJQ5BSk+zIf2Y0P0
	 S2czia3d4JZ1F/WNZiYqqw3exGYirqPWFu0F3edNkQQ5SO1CRiM2kpej6D4gM4aBw4
	 zVDbiJxBbv4sQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1693461374;
	Tue,  9 Dec 2025 22:04:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6589D237
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 22:04:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5745361374
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 22:04:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EgWSdP1UYP3o for <buildroot@buildroot.org>;
 Tue,  9 Dec 2025 22:04:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 742E361292
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 742E361292
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 742E361292
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 22:04:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 543392003B4;
 Tue,  9 Dec 2025 23:04:28 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 09 Dec 2025 23:04:28 +0100
MIME-Version: 1.0
Date: Tue, 09 Dec 2025 23:04:28 +0100
To: Florian Larysch <fl@n621.de>
Cc: buildroot@buildroot.org, Christian Stewart <christian@aperture.us>
In-Reply-To: <20251208201137.13839-1-fl@n621.de>
References: <20251208201137.13839-1-fl@n621.de>
User-Agent: Webmail Free/1.6.11
Message-ID: <b2eb04686447d441dac6e15776842d52@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1765317870;
 bh=PIkhWWtLvvtyZI2EzO1EaCjxTsde7NWXUfaKUuKD3Qs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XcQPetlcS3HIaXOhWzcHkrTVhhBR+loM4aV9JESfLtM5CyJy2cL38YvZOu040FLK8
 N3bbHwof+DjUBFePVx4UEt35RvXIduGI7WC5vthnccukLwr8YAM24A8Gs1T+8AVNcv
 UL5fPf2xVI+jCDUqsRs9u58DhuPSoyW0lrITTs5JGK+BasZ+095Ykx9BXJcFdra/zT
 O62LITDIsJBh3FyjsXa98g+MJuEbjWgnhNClQ/DDxsjm73FGi2YZ1sXw0hXBfZbAUV
 DLEkpSWOBLV1FoZaBCdE4PT0V7Tt019dgsxV1oZLmsxhb33G+ug09Q5VwuHsDkXCfW
 +c+GzRgv/LSkw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XcQPetlc
Subject: Re: [Buildroot] [PATCH v3 1/1] package/sigsum-go: new package
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Florian,

On 08/12/2025 21:11, Florian Larysch wrote:
> Add the reference command line tools for interacting with Sigsum
> signature transparency logs.
> 
> Signed-off-by: Florian Larysch <fl@n621.de>

I applied this patch to branch next, with a minor change in Config.in. 
See:
https://gitlab.com/buildroot.org/buildroot/-/commit/c621515d839b94f2013286683aaf6329e855b08b

[...]
> diff --git a/package/sigsum-go/Config.in b/package/sigsum-go/Config.in
> new file mode 100644
> index 0000000000..f96f18b30a
> --- /dev/null
> +++ b/package/sigsum-go/Config.in
> @@ -0,0 +1,28 @@
> +config BR2_PACKAGE_SIGSUM_GO
> +	bool "sigsum-go"
> +	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
> +	select BR2_PACKAGE_HOST_GO
> +	help
> +	  Command-line utilities for interacting with Sigsum logs.
> +
> +	  https://git.glasklar.is/sigsum/core/sigsum-go/
> +
> +if BR2_PACKAGE_SIGSUM_GO
> +
> +config BR2_PACKAGE_SIGSUM_GO_KEY
> +	bool "sigsum-key"
> +
> +config BR2_PACKAGE_SIGSUM_GO_POLICY
> +	bool "sigsum-policy"
> +
> +config BR2_PACKAGE_SIGSUM_GO_SUBMIT
> +	bool "sigsum-submit"
> +
> +config BR2_PACKAGE_SIGSUM_GO_TOKEN
> +	bool "sigsum-token"
> +
> +config BR2_PACKAGE_SIGSUM_GO_VERIFY
> +	bool "sigsum-verify"
> +	default y

Doing a "default y" still allow the user to deselect the option.
If all the options are deselected, the package build is failing
with the error:

package sigsum.org/sigsum-go: build constraints exclude all Go files in 
/buildroot/output/build/sigsum-go-v0.13.1

So I changed it to select  BR2_PACKAGE_SIGSUM_GO_VERIFY is all
other options are deselected.

> +
> +endif

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
