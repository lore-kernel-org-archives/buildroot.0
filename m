Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A129D6ACDD
	for <buildroot@archiver.kernel.org>; Thu, 18 Dec 2025 16:37:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1C6F410F2;
	Thu, 18 Dec 2025 16:37:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7MlGSx8mkIrV; Thu, 18 Dec 2025 16:37:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C10B410C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766075864;
	bh=tb/We2N4S6B93C8xVmZVxXEFtSFxhoBiRFPlpO7pyxE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XZj+n+XUQPN0vrUG7aP61ca2qoT19pcG4kAiauWgYCC26rnnC/h0Jh6tq38iag1fU
	 GlypNxnft9JATuFDLuo8iuYq04dwr9rD+3fX0SFS13coUaszgkHDU703XjMqvuRKq4
	 Du/O01oCSTq7WPMxwiuWfVXFBbiv30SaTBBLPiM3jOW2PV8uJ7KSjT2qOnqTdM+GHO
	 nK9v8MW+L8Bi3aQF21pwwkRby+UFQqnir8+oVRl4LAINu3s0KpXYW3QJOMDgtgeOxI
	 5m7QcAON//Z3EyHNPWKt3rznb8nQjl4Hy/U/nrxXypaI1/kuyQnByqAC4yB2t7Xv0h
	 nqtCM4brFFKkg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C10B410C5;
	Thu, 18 Dec 2025 16:37:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D4151361
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:37:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB369410A1
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:37:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nw0MKskZWev1 for <buildroot@buildroot.org>;
 Thu, 18 Dec 2025 16:37:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BCF4F410A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCF4F410A3
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BCF4F410A3
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:37:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6B0A2B97A297; Thu, 18 Dec 2025 17:37:39 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Thu, 18 Dec 2025 17:37:36 +0100
Message-ID: <20251218163736.379540-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251012202002.178080-6-bernd@kuhls.net>
References: <20251012202002.178080-6-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1766075859; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=nk8zj6WVFYwxcwZW2+laqACisJVKPn4cW5gSGcegUMQ=;
 b=dGdv+VJyAxuQzu0GaZng/fjCQnPvoJdrQAGeXdx0BwRVTiKVi+iR+TgkJsuUmmS/Ikcb8Y
 8aPK+b5j2LE0b2NxkEKm6ohR1AoPi18HGNYIijgzGMhjziw20xH3sDR/iEtetCFRJYwloI
 U4p5q9aATUAX20Vxi4MRoN7NsEJgVLrGJUVI2grQJcYkkM+3EVsGQ1H4bZ7UerwDFWXtl+
 z1bmRxmuuSTo3YMPG8j3k1MO63ATnaVsJUasxCOyMqBO2DdT0mGb/+i62aLFLHc7n2055Z
 64TqWhs0v2IBHaEweZsaDO0mTAtn9AwADXmJRJZZsNCljSaFysAGxa1274Ramw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=dGdv+VJy
Subject: Re: [Buildroot] [PATCH 06/23] package/python-fonttools: bump
 version to 4.60.1
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
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x. Thanks

> ---
>  package/python-fonttools/python-fonttools.hash | 4 ++--
>  package/python-fonttools/python-fonttools.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-fonttools/python-fonttools.hash b/package/python-fonttools/python-fonttools.hash
> index d30b100d51..49f1ca0235 100644
> --- a/package/python-fonttools/python-fonttools.hash
> +++ b/package/python-fonttools/python-fonttools.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/fonttools/json
> -md5  00d1463e65eaff5bcb73e36272ff05a3  fonttools-4.55.6.tar.gz
> -sha256  1beb4647a0df5ceaea48015656525eb8081af226fe96554089fd3b274d239ef0  fonttools-4.55.6.tar.gz
> +md5  b4b79d23865d50084d4c05defa186fc9  fonttools-4.60.1.tar.gz
> +sha256  ef00af0439ebfee806b25f24c8f92109157ff3fac5731dc7867957812e87b8d9  fonttools-4.60.1.tar.gz
>  # Locally computed sha256 checksums
>  sha256  6787208f83f659ccbc2223b2fde952ffa6f7e8aca62f1a8a2bf5bc51bb1b2383  LICENSE
> diff --git a/package/python-fonttools/python-fonttools.mk b/package/python-fonttools/python-fonttools.mk
> index 7a1c9fedf2..3094b1985c 100644
> --- a/package/python-fonttools/python-fonttools.mk
> +++ b/package/python-fonttools/python-fonttools.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_FONTTOOLS_VERSION = 4.55.6
> +PYTHON_FONTTOOLS_VERSION = 4.60.1
>  PYTHON_FONTTOOLS_SOURCE = fonttools-$(PYTHON_FONTTOOLS_VERSION).tar.gz
> -PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/49/2e/0b11e907b90665253dbad425479e874e38a9e81ced397a4e3312b9116935
> +PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/4b/42/97a13e47a1e51a5a7142475bbcf5107fe3a68fc34aef331c897d5fb98ad0
>  PYTHON_FONTTOOLS_SETUP_TYPE = setuptools
>  PYTHON_FONTTOOLS_LICENSE = MIT
>  PYTHON_FONTTOOLS_LICENSE_FILES = LICENSE
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
