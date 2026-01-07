Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46B5AD0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:50:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 166D940E01;
	Wed,  7 Jan 2026 17:50:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AQ_8CFdjhDov; Wed,  7 Jan 2026 17:50:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94DFE409E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808230;
	bh=nmeWaNqX5bK0JpVzfCoO1Zf6bbybpgvOzbQH0h5tvXg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sc09qfRIz9gV3qM/pMM68ySGDn64ukXyqX+rBea0WWWpppNXWgLYdpf9wTaPCHOhc
	 Q1XiHULRdNlbgKFdWFtRfix28/8h9X7k25JHhbHVDT4hQ1MWXAow6ew9WIt3D/LPQG
	 9Wxwi+HGzlzVBHn/Pr+qxsi+jmLtqlXS/LOQD6sf0CfPbrwBAbp+7uNwRntzfxnKi9
	 twSfCOhxxn5u7uk8oIDCKekWi6n+tNPZbBc8vWlNojPk8KdK2aeBQMQfE4cTey7q+R
	 4dJO4N9a2jK79Zh4q/NNwlgsSjeQplWFc84JnjLG/NXBwBO5C6EFbBsLuhVZwGvUc+
	 7LCQzaOcGW8Dg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94DFE409E8;
	Wed,  7 Jan 2026 17:50:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7708D9ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5DDC440DEC
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ESpxB7JSgg-q for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:50:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5C3BF40DD4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C3BF40DD4
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5C3BF40DD4
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 86CD6B97A192; Wed,  7 Jan 2026 18:50:25 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:50:24 +0100
Message-ID: <20260107175024.226357-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251221223441.185169-16-bernd@kuhls.net>
References: <20251221223441.185169-16-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808225; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=BGgP+ywfmgTL4/gemTBJ15m2ljmiONpvIKNJ95uQmxA=;
 b=majPW2ws/vrB+lPboX++5vd5qoUNY4u0tin0QU6rcdES2HYZ+0fqw1DdWch9G9fQ9Tod2k
 epvNx3dfXqIRltLScTmB8nHx2OoPLuNAMnAyCycgrrcLyOk/lFwxmiKhCGKzJJizK3qKUI
 2ycP0FaMCUcVy0tgfT8EUUDgJMd++eqREDwBuyamgr1LNdXFFNEPFI44Dx8HrLkCXi9THx
 vJ73Z12wWV8gKvYm58EVKSTI9zfnPxuT0Sg2Gwf+hKlQF9bC2oRfwM+jthoRspKuH8N0Hu
 DSgoiir40z7pZsZ1GEHyuSKrFnizKU5RSdkeVxgI+3yo3xDO4y++nsqMh1EwWQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=majPW2ws
Subject: Re: [Buildroot] [PATCH v2 16/23] package/python-pyasynchat: update
 tarball URL
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
> Updated package as computed by scanpypi.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/python-pyasynchat/python-pyasynchat.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/python-pyasynchat/python-pyasynchat.mk b/package/python-pyasynchat/python-pyasynchat.mk
> index 6fb460cee1..2c503ea71b 100644
> --- a/package/python-pyasynchat/python-pyasynchat.mk
> +++ b/package/python-pyasynchat/python-pyasynchat.mk
> @@ -6,7 +6,7 @@
>  
>  PYTHON_PYASYNCHAT_VERSION = 1.0.4
>  PYTHON_PYASYNCHAT_SOURCE = pyasynchat-$(PYTHON_PYASYNCHAT_VERSION).tar.gz
> -PYTHON_PYASYNCHAT_SITE = https://github.com/simonrob/pyasynchat/releases/download/v$(PYTHON_PYASYNCHAT_VERSION)
> +PYTHON_PYASYNCHAT_SITE = https://files.pythonhosted.org/packages/8a/fd/aacc6309abcc5a388c66915829cd8175daccac583828fde40a1eea5768e4
>  PYTHON_PYASYNCHAT_SETUP_TYPE = setuptools
>  PYTHON_PYASYNCHAT_LICENSE = PSF-2.0
>  PYTHON_PYASYNCHAT_LICENSE_FILES = LICENSE
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
