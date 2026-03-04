Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4FB0EFCE2A
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 18:04:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59E8440C02;
	Wed,  4 Mar 2026 18:04:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3KYcx28QXxTm; Wed,  4 Mar 2026 18:04:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F00E40BFD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772647487;
	bh=s7jO1mXZC11idJXZ977GoDhtRD4NHVTxWR0AL3rGIOU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=N8tLbWZXa8xzcx7bNSGRPCmTJxC5EG/GmPbtIJ951UzOnzROd8k2HN7qQ+AmarRN3
	 +a8hmTchg3RKFCKur5mgZZ5QN0PkaufUgJs2GleffO3WM3goZJzl1lDj9ikhdvLbuO
	 RUHF/D8r3iyCixOp2BTR+cHq8Wjr0RUL+7ijmpYdAT6YGyAohT6dwVN/C6X95OAxl3
	 +f5g6xd+KuQ1tgPBWS8rLdnSajGZg7Mo60Rh9u2Bx9hkg7/fcN0Rde692cAV7f+K3d
	 a/aMr7s7Y/D4GrYML8LO+pxu6MWvKFCR+tQzGr6tULxsc5f0k1R+pX5ab3Zl3Xf4te
	 w54ZTGR6rpHxg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F00E40BFD;
	Wed,  4 Mar 2026 18:04:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A91791EB
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 18:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E84982166
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 18:04:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GCRsvbNWmYka for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 18:04:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 89A868215B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89A868215B
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 89A868215B
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 18:04:44 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 52A734E42536
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 18:04:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2A3C65FF5C
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 18:04:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 67EBB103686F7; Wed,  4 Mar 2026 19:04:41 +0100 (CET)
Date: Wed, 4 Mar 2026 19:04:40 +0100
To: Alexis =?utf-8?Q?Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: buildroot@buildroot.org
Message-ID: <aahz7zuui_SfAImd@windsurf>
References: <20260304-openscap_nptl_threads-v1-0-9dff92cc37e0@bootlin.com>
 <20260304-openscap_nptl_threads-v1-1-9dff92cc37e0@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260304-openscap_nptl_threads-v1-1-9dff92cc37e0@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1772647481; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=N1XjCu11A66bf/YN/6sYpKCW+csDoMTqAyYpAZLGCA4=;
 b=Ear33HgPKUj13QTtkfjT6X8mWkBwIgoyiXsMLkIQfRy075X+g9KrvO5T0tiRcXkXMXsekI
 tWoRajocUpo117cBetpHMuze9hSFM/8/9iEYgjznvgpu8wuZlKESebmVoulKYIHWwATaOc
 jArMNnfGExmBZ29Slq1SXJxu1fnB1X+iqNiDhkZdT9/c2mSZAJgljvykRHW2eFzgv0vTIy
 UD9+NaFEdncbcIHsf2hpiM+NZNG0dq04Jxrvcg40ZK+vaoSYMKYlX8uI75WuQel3pBbqhL
 RGLmsiaxDKyBt3aXe99Fj4mYBsWGmp97g+cvit5VaDLicGfQqmV/mw+Wv4M1UA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Ear33HgP
Subject: Re: [Buildroot] [PATCH 1/2] package/openscap: fix dependencies doc
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Mar 04, 2026 at 09:22:39AM +0100, Alexis Lothor=E9 wrote:
> The comment displayed in menuconfig for openscap when we are lacking
> dependencies is currently broken: it should be an or of inverted
> expected values.
> =

> Update the comment for openscap when it is missing some dependency.
> =

> Signed-off-by: Alexis Lothor=E9 <alexis.lothore@bootlin.com>
> ---
>  package/openscap/Config.in | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> =

> diff --git a/package/openscap/Config.in b/package/openscap/Config.in
> index 317055c75327..b5f809315c91 100644
> --- a/package/openscap/Config.in
> +++ b/package/openscap/Config.in
> @@ -19,6 +19,5 @@ config BR2_PACKAGE_OPENSCAP
>  	  https://www.open-scap.org/
>  	  https://github.com/OpenSCAP/openscap
>  =

> -comment "openscap needs a toolchain w/ dynamic library"
> -	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
> -	depends on BR2_STATIC_LIBS
> +comment "openscap needs libgpg-error and a toolchain w/ dynamic library"
> +	depends on !BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS || BR2_STATIC_LIBS

Sorry, but the existing comment is correct. We want to show the
comment when we're on an architecture that we can support, but the
toolchain lacks some features.

So as far as I can see the existing code is correct, and your patch
changes it to be incorrect :-/

Thomas
-- =

Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
