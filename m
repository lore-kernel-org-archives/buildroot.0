Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E89D9CCD1A5
	for <buildroot@archiver.kernel.org>; Tue, 21 Oct 2025 10:16:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 950FB40447;
	Tue, 21 Oct 2025 10:16:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XCceJ1s_uTxv; Tue, 21 Oct 2025 10:16:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD5FB40459
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD5FB40459;
	Tue, 21 Oct 2025 10:16:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 43E0D43F
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 10:16:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 29FAB40168
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 10:16:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yrEG5vRPChD6 for <buildroot@buildroot.org>;
 Tue, 21 Oct 2025 10:16:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1AF5D40667
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1AF5D40667
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1AF5D40667
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 10:16:25 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 87CC9C0B88C;
 Tue, 21 Oct 2025 10:16:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 23A6560680;
 Tue, 21 Oct 2025 10:16:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2DD20102F23F8; 
 Tue, 21 Oct 2025 12:16:10 +0200 (CEST)
Date: Tue, 21 Oct 2025 12:16:09 +0200
To: Marcus Hoffmann <buildroot@bubu1.eu>
Message-ID: <20251021121609.2a9d08be@windsurf>
In-Reply-To: <20251021093500.744569-1-buildroot@bubu1.eu>
References: <20251021093500.744569-1-buildroot@bubu1.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1761041782; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=UmCIL09mcw39+yOGWw+0dKZShpxob3qAxr15O/ZnZmQ=;
 b=iM2cdPZ8QJoPVe7mudtUFiwyTTuj4Zmlp6sFK4jbfYBgFYMfkkmzs1cgJl2X73y+eIePed
 WH4Py58C3bSwTOwKPWSfRh2uR8T02N5FqhbF5SCPg/4vmtlj+fBLC8swL9iuraQ0ZoNDBt
 RQrCEivrYi5XOf1QHcABOdzGcF0duQNYLAjCdgzJSBECnx7E9Xl9kSit/RGokCYRS3yx4f
 ZnjKhR/CudXboI1ZEO+aRuUPEHoT5pkDF6qwNw02tz0PlvNoydeTi0exEULieAHoVVQv53
 VVoFIfvcALx3FWdtqqxGMC4/ZX/usNhsNNub9V6HFXmsdjoMN+j5sCLzpdQ05w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=iM2cdPZ8
Subject: Re: [Buildroot] [PATCH v2] package/python-diskcache: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Marcus Hoffmann <bubu@bubu1.eu>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Marcus,

On Tue, 21 Oct 2025 11:35:00 +0200
Marcus Hoffmann <buildroot@bubu1.eu> wrote:

> The package imports itself in setup.py to get the package-name and
> version number. This doesn't work during the buildroot build, so we
> replace this by the hardcoded package-name and the version number stored
> in buildroot.
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Sounds good overall. One question below.


> diff --git a/package/python-diskcache/python-diskcache.mk b/package/python-diskcache/python-diskcache.mk
> new file mode 100644
> index 0000000000..327d076779
> --- /dev/null
> +++ b/package/python-diskcache/python-diskcache.mk
> @@ -0,0 +1,20 @@
> +################################################################################
> +#
> +# python-diskcache
> +#
> +################################################################################
> +
> +PYTHON_DISKCACHE_VERSION = 5.6.3
> +PYTHON_DISKCACHE_SOURCE = diskcache-$(PYTHON_DISKCACHE_VERSION).tar.gz
> +PYTHON_DISKCACHE_SITE = https://files.pythonhosted.org/packages/3f/21/1c1ffc1a039ddcc459db43cc108658f32c57d271d7289a2794e401d0fdb6
> +PYTHON_DISKCACHE_SETUP_TYPE = setuptools
> +PYTHON_DISKCACHE_LICENSE = Apache-2.0

License is OK, checked here.

> +PYTHON_DISKCACHE_LICENSE_FILES = LICENSE
> +
> +define PYTHON_DISKCACHE_REMOVE_SELF_IMPORT
> +	sed -i -e '/import diskcache/d' -e 's/diskcache.__title__/"diskcache"/' -e 's/diskcache.__version__/"$(PYTHON_DISKCACHE_VERSION)"/' $(@D)/setup.py
> +endef

This could use some splitting:

	sed -i -e '/import diskcache/d' \
		-e 's/diskcache.__title__/"diskcache"/' \
		-e 's/diskcache.__version__/"$(PYTHON_DISKCACHE_VERSION)"/' \
		$(@D)/setup.py

but perhaps more importantly, has this been reported upstream? How can
this even work? You need the thing installed... before you install it?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
