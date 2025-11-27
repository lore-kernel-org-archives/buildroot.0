Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F16D111A8
	for <buildroot@archiver.kernel.org>; Thu, 27 Nov 2025 20:03:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00B6461024;
	Thu, 27 Nov 2025 20:03:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dNvgseIn9Ad5; Thu, 27 Nov 2025 20:03:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B1AEE60D97
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1AEE60D97;
	Thu, 27 Nov 2025 20:03:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E9782A9
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:03:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 80B7A8440B
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:03:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oPtbz3iOPdoI for <buildroot@buildroot.org>;
 Thu, 27 Nov 2025 20:03:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 76E6884401
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76E6884401
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 76E6884401
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:03:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id F0797B979CE7; Thu, 27 Nov 2025 21:03:14 +0100 (CET)
Message-ID: <403d65d4-16c4-4776-bdc1-e47fa38aa258@rnout.be>
Date: Thu, 27 Nov 2025 21:03:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcus Hoffmann <bubu@bubu1.eu>, Oli Vogt <oli.vogt.pub01@gmail.com>
References: <20251119183903.629518-1-peter@korsgaard.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20251119183903.629518-1-peter@korsgaard.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1764273795; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=KpZpVUnTeJVpHlGsUYIO6qW64she4jLlf7W4FurNNxs=;
 b=ICgforx2acPvpq0N27v3HphQbCbTL21QiFHczcCc6Lcc6sFACgzA5QpgV2l3pdRfKt0d4i
 aYUfSMhghcdmFz/NFkQkEGaepFkiKmRoathG2Q68zPCCqAv0I6MqDyn1LZyjHmQMBn88fi
 c1bdXNfjhtxGD+ty5xeBRRPHnoKtZJFaLqsdanWOuiGu+5iYbzHaWiMF8XSyvsMIMj1VXb
 70qrs+Sp3FUmOHymYMygf8gAJw3PZNMPG646Ybbd0D5IVcEi4oUQocYVweiBOUBcfxg1J4
 OBUqigVNsmz0hecGPcRWueYpGIuYWZWfRya+kDGehC2rpUVP4yqk2ivH1B7mvA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=ICgforx2
Subject: Re: [Buildroot] [PATCH] package/python-django: security bump to
 version 5.2.8
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 19/11/2025 19:39, Peter Korsgaard wrote:
> Fixed the following security issues:
> 
> CVE-2025-64458: Potential denial-of-service vulnerability in
> HttpResponseRedirect and HttpResponsePermanentRedirect on Windows
> 
> CVE-2025-64459: Potential SQL injection via _connector keyword argument
> 
> https://docs.djangoproject.com/en/5.2/releases/5.2.8/
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

  Applied to 2025.02.x and 2025.08.x, thanks.

  Regards,
  Arnout

> ---
>   package/python-django/python-django.hash | 4 ++--
>   package/python-django/python-django.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
> index 1ec80dc1c2..448e98613b 100644
> --- a/package/python-django/python-django.hash
> +++ b/package/python-django/python-django.hash
> @@ -1,6 +1,6 @@
>   # md5, sha256 from https://pypi.org/pypi/django/json
> -md5  699a77ac347ca3484939762483dc4b08  django-5.2.7.tar.gz
> -sha256  e0f6f12e2551b1716a95a63a1366ca91bbcd7be059862c1b18f989b1da356cdd  django-5.2.7.tar.gz
> +md5  0268c52cb99bb764490fdd90502def32  django-5.2.8.tar.gz
> +sha256  23254866a5bb9a2cfa6004e8b809ec6246eba4b58a7589bc2772f1bcc8456c7f  django-5.2.8.tar.gz
>   # Locally computed sha256 checksums
>   sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
>   sha256  dcac1c86cb7ab491702bdb4c41be680fafde51536748cc8aaee3840eec53ed17  django/contrib/gis/measure.py
> diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
> index 139a15b13a..920fd8a577 100644
> --- a/package/python-django/python-django.mk
> +++ b/package/python-django/python-django.mk
> @@ -4,10 +4,10 @@
>   #
>   ################################################################################
>   
> -PYTHON_DJANGO_VERSION = 5.2.7
> +PYTHON_DJANGO_VERSION = 5.2.8
>   PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
>   # The official Django site has an unpractical URL
> -PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/b1/96/bd84e2bb997994de8bcda47ae4560991084e86536541d7214393880f01a8
> +PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/05/a2/933dbbb3dd9990494960f6e64aca2af4c0745b63b7113f59a822df92329e
>   PYTHON_DJANGO_LICENSE = BSD-3-Clause, MIT (jquery, utils/archive.py), BSD-2-Clause (inlines.js)
>   PYTHON_DJANGO_LICENSE_FILES = LICENSE \
>   	django/contrib/gis/measure.py \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
