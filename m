Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F8D4CAC58E
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 20:11:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25991833C9;
	Thu, 11 Sep 2025 20:11:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FRy5SH39wFma; Thu, 11 Sep 2025 20:11:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F10784BFA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F10784BFA;
	Thu, 11 Sep 2025 20:11:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A95A234
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:11:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 737CB416C3
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:11:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xpzi91wcpffx for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 20:11:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6EE7B41960
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6EE7B41960
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6EE7B41960
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:11:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 73D78B978815; Thu, 11 Sep 2025 22:11:26 +0200 (CEST)
Message-ID: <e4ed8e36-47a1-45ed-9c5f-73af42687e7d@rnout.be>
Date: Thu, 11 Sep 2025 22:11:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Cc: Steve Kenton <skenton@ou.edu>
References: <20250910213241.1529448-1-thomas.petazzoni@bootlin.com>
 <20250910213241.1529448-15-thomas.petazzoni@bootlin.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250910213241.1529448-15-thomas.petazzoni@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1757621487; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=cyTZTbIADkboGpXW5n3x5g4KauYx7FPaseFeh9LVNNw=;
 b=PW260zkpt4+s2FRVuZUcpNq3CQbF/Z3hr+xRd/lnphWpQu3cYyRXmGZ/gTiK4mhD1kMPbH
 KYiO7PeqB792tnNKeQN90sOefyj1alwfNQ0VvLFAGJS5Vt8i5kf9xXnlTgRVnwwXF9lHDp
 RyzyamVyXkv2iLMZuwfx1K0rMGvVTwFTfJMqidWVBJgNZ4ImI6VlvZ0ZZNvTf2TkU+A2rC
 3hKny4eatqJwMVyxVbubMyFG+H7J8mAGrELoEWxIu5V8t9JZrEq5lVZJHSc+bd+80/tQQ1
 R43M9en64Bltj6/Xe4rP3NHTSCtuTSpbIInw9bSgid+GstA8CokIrVUhc6ryuw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=PW260zkp
Subject: Re: [Buildroot] [PATCH 14/23] package/mjpegtools: drop optional
 dependency on libgtk2
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



On 10/09/2025 23:32, Thomas Petazzoni via buildroot wrote:
> As we're about to remove libgtk2, let's drop the optional dependency
> of mjpegtools on libgtk2, and forcefully disable gtk support.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/mjpegtools/mjpegtools.mk | 8 +-------
>   1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/package/mjpegtools/mjpegtools.mk b/package/mjpegtools/mjpegtools.mk
> index 8d6c475518..871d1b8f36 100644
> --- a/package/mjpegtools/mjpegtools.mk
> +++ b/package/mjpegtools/mjpegtools.mk
> @@ -10,6 +10,7 @@ MJPEGTOOLS_DEPENDENCIES = host-pkgconf jpeg
>   MJPEGTOOLS_INSTALL_STAGING = YES
>   MJPEGTOOLS_LICENSE = GPL-2.0+
>   MJPEGTOOLS_LICENSE_FILES = COPYING
> +MJPEGTOOLS_CONF_OPTS = --without-gtk
>   
>   ifeq ($(BR2_PACKAGE_MJPEGTOOLS_SIMD_SUPPORT),y)
>   MJPEGTOOLS_CONF_OPTS += --enable-simd-accel
> @@ -53,11 +54,4 @@ else
>   MJPEGTOOLS_CONF_OPTS += --without-dga
>   endif
>   
> -ifeq ($(BR2_PACKAGE_LIBGTK2),y)
> -MJPEGTOOLS_CONF_OPTS += --with-gtk
> -MJPEGTOOLS_DEPENDENCIES += libgtk2
> -else
> -MJPEGTOOLS_CONF_OPTS += --without-gtk
> -endif
> -
>   $(eval $(autotools-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
