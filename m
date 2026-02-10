Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE993EB271F
	for <buildroot@archiver.kernel.org>; Tue, 10 Feb 2026 22:54:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 826D560E03;
	Tue, 10 Feb 2026 22:54:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vrDXDwEDlIZI; Tue, 10 Feb 2026 22:54:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EDE560A98
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770764055;
	bh=Sw63yO2Cn7DMTZ6osakcdO2PveY9qYY8aKQeeYfGeYE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CyUIacWGrqyAmRscunR53C1NdfprGv9eS0f4iTGnzqYZuuYuGVVMmOVrQCa623Imh
	 AagR0pIY1Nzs8YQVGmCRRyKSA4QLNOpg9gjNFM+KvCykxVP3Bk38/AK0jRxaDMmgbB
	 8t6AAWx1PDzVrw73yQisXsEntizPcsXDS/1vckrTYRwZph+9LeBtrNy6oQsQ5xTzu1
	 8Uj0SubxXpGh52laP1VDEHjjzsq/Ck7YosrjrdOl4CJ5bb7WvtQ+7p7q2j2OmULYzU
	 RGHmYsajL+EucamQfUFpwoZtPZc8F0pPF2+9j/v2gEafKCMJ43aPOa2PSUGd6PQ6s3
	 GDbmUWfp3j6Bg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EDE560A98;
	Tue, 10 Feb 2026 22:54:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 055D4F2
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 22:54:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA7E440C59
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 22:54:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IMoBwrRwW_s0 for <buildroot@buildroot.org>;
 Tue, 10 Feb 2026 22:54:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D383B40C42
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D383B40C42
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D383B40C42
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 22:54:12 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 5200EC8F1EC;
 Tue, 10 Feb 2026 22:54:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BB9C9606BD;
 Tue, 10 Feb 2026 22:54:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C51C710B90957; Tue, 10 Feb 2026 23:54:09 +0100 (CET)
Date: Tue, 10 Feb 2026 23:54:09 +0100
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org, alexis.lothore@bootlin.com
Message-ID: <aYu2lh_Ef3zYGnzM@windsurf>
References: <aYRiIxIb0-E_Pd6s@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aYRiIxIb0-E_Pd6s@waldemar-brodkorb.de>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770764050; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=c6mby3yIMP0fuRj1ofkZDnhhr/iZkrw9OkMO1TCdMSU=;
 b=KTYymniRMOXKEvfpYIK55JT5EHye84ofo5R8B3QtLi1jvgPQurRjqmmPgsPPBsgKDok+7I
 h+7+yzB5rWy3kh/TQM+99ZNT/igtXUV3iM8XzZLEHzGzcNlGUShu2BP60MUC80Yxfj5x5w
 JMfzRfSpVadp+ivOd9AfHNrzv9FvaACpseMGqXk6R4u0FTkSJNeGvf9+lL2Dsy8fo6KZTY
 2ujO85qzhhkH1EoC6lhfahIVMNE8b52AAXSF7AzEg/7F9k6mlV4jeTjnoV0Mfx/ZW5umpS
 rAZjjsYuhkhYfwhIQCcEA0B7DiOH+l42MyjDI7elOceC7lEqRrHAwAD0AIr5yg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=KTYymniR
Subject: Re: [Buildroot] [PATCH v4] package/libxmlsec1: new package
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

Hello,

On Thu, Feb 05, 2026 at 10:25:55AM +0100, Waldemar Brodkorb wrote:
> Introduce the libxmlsec1 library package. libxmlsec implements XML
> security standards.
> 
> The library has only a few mandatory dependencies (libxml2 and a crypto
> library). It needs one of the following cryptographic libraries:
> OpenSSL, NSS, or Gcrypt/GNUTLS. Default to openssl for now to keep the
> package simple.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Sorry Waldemar, I'm seeing your patch now after having applied the one
from Alexis. Could you send any updates as patches on top of master?

> diff --git a/package/libxmlsec1/Config.in b/package/libxmlsec1/Config.in
> new file mode 100644
> index 0000000000..ce3384e7b7
> --- /dev/null
> +++ b/package/libxmlsec1/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_LIBXMLSEC1
> +	bool "libxmlsec1"
> +	select BR2_PACKAGE_LIBXML2
> +	select BR2_PACKAGE_OPENSSL

I see you did not select libxslt here, while Alexis did so in his
patch. So I assume libxslt is not mandatory?

> +ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> +LIBXMLSEC1_CONF_ENV += LIBS=-latomic
> +endif

Alexis patch did not have this. I assume it fixes issue on SPARC ?

> +$(eval $(autotools-package))

Your patch did not have the host variant, which Alexis needed.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
