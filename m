Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D46C25B75
	for <buildroot@archiver.kernel.org>; Mon, 20 May 2024 03:14:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E8FC400F2;
	Mon, 20 May 2024 03:14:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TzRqXdvhyFCC; Mon, 20 May 2024 03:14:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A182408B6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4A182408B6;
	Mon, 20 May 2024 03:14:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5A1D91BF34B
 for <buildroot@lists.busybox.net>; Mon, 20 May 2024 03:14:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 45C38402EA
 for <buildroot@lists.busybox.net>; Mon, 20 May 2024 03:14:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jIWFAxj37p7i for <buildroot@lists.busybox.net>;
 Mon, 20 May 2024 03:14:24 +0000 (UTC)
X-Greylist: delayed 445 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 20 May 2024 03:14:23 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 064DC402B2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 064DC402B2
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
Received: from mail.tkos.co.il (wiki.tkos.co.il [84.110.109.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 064DC402B2
 for <buildroot@buildroot.org>; Mon, 20 May 2024 03:14:23 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id 38E39440459;
 Mon, 20 May 2024 06:06:29 +0300 (IDT)
To: Jarkko Sakkinen <jarkko@kernel.org>
In-Reply-To: <20240519210235.8493-3-jarkko@kernel.org> (Jarkko Sakkinen's
 message of "Mon, 20 May 2024 00:02:34 +0300")
References: <20240519210235.8493-1-jarkko@kernel.org>
 <20240519210235.8493-3-jarkko@kernel.org>
User-Agent: mu4e 1.12.4; emacs 29.3
Date: Mon, 20 May 2024 06:06:49 +0300
Message-ID: <8734qdqj06.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1716174389;
 bh=0PfjYf6T+YdUWirJ8GXYjjCKHWM5gR/7W9Y+DWgwEIY=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=rTxA9ngcemF6G42zQqiWLxpp9kkObY5PxcVJSucuRNWUm84Pf37dI3igYLJWxIz30
 R94UboMwVTQUh1i9+4YtGb7POpAghaS3DfQ4XZKOK7cecNtsx7M4YIKYfrcm/OAkQA
 OMRcawPODX73BXOtKAsZ8EjWr+H87qPn7P6Wxx4SEyYQH4x55eMunwed+l4LUVM7cC
 8G03vHRQ2UMAr+Q3U5yRYPvBeTWt7oJh+QShV61r8ILbFFS1YDXopbcC+EAvNVHguK
 S04r6FV/e6OC2MeveBTad+kBq4bHe7j33lep7pzsKjFHpC2s+3IQmlwQEDEdGSWQet
 TEFSBrHcpQxCw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=rTxA9ngc
Subject: Re: [Buildroot] [PATCH v3 2/3] package/libtpms: add host package
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: Stefan Berger <stefanb@linux.ibm.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Jarkko,

[ Resend with the list on Cc; sorry for the dup ]

On Mon, May 20 2024, Jarkko Sakkinen wrote:
> diff --git a/package/libtpms/libtpms.mk b/package/libtpms/libtpms.mk
> new file mode 100644
> index 0000000000..b730cc95f7
> --- /dev/null
> +++ b/package/libtpms/libtpms.mk
> @@ -0,0 +1,21 @@
> +################################################################################
> +#
> +# libtpms
> +#
> +################################################################################
> +
> +LIBTPMS_VERSION = 0.9.6
> +LIBTPMS_SITE = $(call github,stefanberger,libtpms,v$(LIBTPMS_VERSION))
> +LIBTPMS_LICENSE = BSD-4-Clause
> +LIBTPMS_LICENSE_FILES = LICENSE
> +LIBTPMS_INSTALL_STAGING = YES
> +# Straight from the git repository:
> +LIBTPMS_AUTORECONF = YES

For a host package you want the HOST_ variant.

> +
> +LIBTPMS_DEPENDENCIES = libtool pkgconf openssl
> +LIBTPMS_CONF_OPTS = --with-openssl  -with-tpm2

Since this is a host only package, these two are unused I think.

> +
> +HOST_LIBTPMS_DEPENDENCIES = host-libtool host-pkgconf host-openssl

package/pkg-autotools.mk automatically adds host-libtool dependency for
the AUTORECONF case.

baruch

> +HOST_LIBTPMS_CONF_OPTS = --with-openssl  -with-tpm2
> +
> +$(eval $(host-autotools-package))

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
