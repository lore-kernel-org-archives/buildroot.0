Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B4B3D0D178
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 22:36:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F5B18116D;
	Wed,  7 Jan 2026 22:36:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A5P2hoUPTWAB; Wed,  7 Jan 2026 22:36:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A38B8116F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767825401;
	bh=rogonoEy/6Lm15E29JFWM4wRY3I1f2IszkztfWDcRdk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mT02GVHlk4L4aZY7Y/pivXkPu16L0SOF+HEYMxYQ4pmQJ+/OoTgRnFkfZIxtzW3/N
	 +hK5grfDkSlOkoDoxjoBbPKxb3KCtbDlngoCC17S9pt98y50P4FeoyizU3AYBl7WHh
	 hKIRQ0kuHtzDc42C9gFK/eV6wA680jKu6dG5sAsS2u0NJDodcMJTzH6Qel2VXpUqJm
	 2W/+69UFtZcTOwLG/c8nIcvwkRFSlSaT+OFkj+tFk4qehlv8xJqODkxwqWnmxE5K26
	 NFqbs//8EIyJ6aY/hep05jsAKKco2lePwJvLdEg3i4bZ0sn0lnZtETKS9/78m5PlbW
	 BGgy8CKTFJNxg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A38B8116F;
	Wed,  7 Jan 2026 22:36:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 350969ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 22:36:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B3A64029F
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 22:36:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PLU7RPFEEec5 for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 22:36:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1D89B4023C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D89B4023C
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1D89B4023C
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 22:36:38 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 6C5514E41FD6;
 Wed,  7 Jan 2026 22:36:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3141F606F8;
 Wed,  7 Jan 2026 22:36:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 442DC103C8307; Wed,  7 Jan 2026 23:36:35 +0100 (CET)
Date: Wed, 7 Jan 2026 23:36:33 +0100
To: Vincent Jardin via buildroot <buildroot@buildroot.org>
Cc: Vincent Jardin <vjardin@free.fr>
Message-ID: <20260107233633.2870caea@windsurf>
In-Reply-To: <20260107175339.2469977-2-vjardin@free.fr>
References: <20260107175339.2469977-1-vjardin@free.fr>
 <20260107175339.2469977-2-vjardin@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767825395; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=FQpkms+oIA9uufq+mtEeQNf476g2FGBxyZh5UrOB6uU=;
 b=U8+Ingo+5rM/bAvK1zHKSJ2Jb5Yhrrwmk+b94HhRoNDhlsu7TnBvct4Uiyaat+NkvxUubG
 PsFcmmv2oPlV0AFP84IL48c6JX5lSVEA4WZbm+igj/Z5Au3Vt8pQq8M+UQfuf15UqV63nr
 uTAZZ7P2p/5mLXKLiO3CTrRoKkjdZMO2bWhYNaX1Z5/wSqpEdmGerGW5er3Oao2bJQYgtr
 fEgQ0atoWTvSf5YZfHisXSqgNAwG4y9BQ9hIAbsl7HIaP76snbTjndHMWSPBJbftszEUkB
 uTH0R6n8SBMLvpXZ4s++jG1y7lBQmlcQ5oD2Zi8Iaz8xQW8vyspODbQu5j2jhg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=U8+Ingo+
Subject: Re: [Buildroot] [PATCH v1 1/1] package/dot1ag-utils: new package
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

Hello Vincent,

Thanks for this patch. For series of just 1 patch, you don't need to
send a cover letter. It's OK to have one of course, but it's not
necessary.

On Wed,  7 Jan 2026 18:53:39 +0100
Vincent Jardin via buildroot <buildroot@buildroot.org> wrote:

> diff --git a/package/dot1ag-utils/0001-fix-strncpy-truncation-warnings.patch b/package/dot1ag-utils/0001-fix-strncpy-truncation-warnings.patch
> new file mode 100644
> index 0000000000..b987a45aa3
> --- /dev/null
> +++ b/package/dot1ag-utils/0001-fix-strncpy-truncation-warnings.patch
> @@ -0,0 +1,59 @@
> +From: Vincent Jardin <vjardin@free.fr>
> +Date: Tue, 7 Jan 2026 11:00:00 +0100
> +Subject: [PATCH] dot1ag_eth: fix strncpy truncation warnings with modern GCC
> +
> +Modern GCC with -Werror fails when strncpy size equals the destination
> +buffer size, as it may not null-terminate the string:
> +
> +  error: '__builtin_strncpy' specified bound 16 equals destination size
> +         [-Werror=stringop-truncation]
> +
> +Fix by using sizeof(dest) - 1 to leave room for the null terminator.
> +The structures are already zeroed with memset() before strncpy, so the
> +last byte remains '\0'.
> +
> +Signed-off-by: Vincent Jardin <vjardin@free.fr>

Needs an Upstream: tag that provides details on the upstream status of
this patch.

> --- /dev/null
> +++ b/package/dot1ag-utils/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_DOT1AG_UTILS
> +	bool "dot1ag-utils (IEEE 802.1ag tools)"

Should be just:

	bool "dot1g-utils"

> +	select BR2_PACKAGE_LIBPCAP

If you select a package, you need to replicate its dependencies, in
this case:

	depends on BR2_USE_MMU

> diff --git a/package/dot1ag-utils/dot1ag-utils.mk b/package/dot1ag-utils/dot1ag-utils.mk
> new file mode 100644
> index 0000000000..1cde7299a0
> --- /dev/null
> +++ b/package/dot1ag-utils/dot1ag-utils.mk
> @@ -0,0 +1,17 @@
> +################################################################################
> +#
> +# dot1ag-utils
> +#
> +################################################################################
> +
> +DOT1AG_UTILS_VERSION = 4886d70ba83166bd1333eb04df8198a8ddfc5680
> +DOT1AG_UTILS_SITE = $(call github,Bumblebee-Networks,dot1ag-utils,$(DOT1AG_UTILS_VERSION))
> +
> +DOT1AG_UTILS_LICENSE       = BSD-2-Clause

                       ^^^^^^ just one space before/after the = sign

> +DOT1AG_UTILS_LICENSE_FILES = LICENSE
> +
> +DOT1AG_UTILS_DEPENDENCIES = libpcap
> +
> +DOT1AG_UTILS_AUTORECONF = YES

You can probably drop the empty new lines between all those variable
definitions.

> +
> +$(eval $(autotools-package))

The rest looks good to me.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
