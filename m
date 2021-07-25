Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5245C4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 21:45:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D52C60F37
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 21:45:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6D52C60F37
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3FEAB4028F;
	Sun, 25 Jul 2021 21:45:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vi04wLcQ1Ul8; Sun, 25 Jul 2021 21:45:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A508340278;
	Sun, 25 Jul 2021 21:45:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 464691BF312
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 21:45:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 42D8A60758
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 21:45:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WkzgwCClQqls for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 21:45:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9D0D1605B3
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 21:45:18 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id gn26so7299827ejc.3
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 14:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=t91dPt8fk8kBmpmdj4L3iOi4FEEyU42xTcaNPznLGik=;
 b=a9bXQJs2u0sSnkrIxM9QLycqV4oPc7s9NwL2TRmCQBAi0PPP9jRMMkuaymiJy/HWIS
 gHMbdJQuFNeSUjFAP51YyrvIylGPAuqAsmqj9TPTIjsSCemM/Knio52b6i5JiTEHe1XM
 iz4YZVBNc87WzbEG3PGsUg6Y/N5AP8ERE4LTeXS9Dlm9WH3LE5OfWyvWiUC3H76WCvWU
 j5XlQ7az5GA0+g8oGG0oTi499Paoc3Vv4TCBVes7E3NGVRSTtZ7CoV3F//EJXTfZTzQZ
 L2F4cSjH5bc9DwdluL5kFzjE4s97dqOBWnsxKEIeQbouBoOKgEVANZXD9gVPVolMByXi
 El7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=t91dPt8fk8kBmpmdj4L3iOi4FEEyU42xTcaNPznLGik=;
 b=eyQuCWUoL2NpIof2c7W4NW58IErFMosoB0M0Gtyp0wKVNH+MSXGQztkvjYkVD+533y
 7S3PTfRhYFhIUVCzQB9OlKd7+E0yTcj3SZiAGh9lP28u2TWuK07uXz+pyKp4hfVEyVgx
 soi1YzBqhtVXak1qrJISjMbbKgIMELNptZjOjnxbvLpKEmftjXQcGOYZqRQlxLaC4JUM
 e+Ue1deKPTPuqneXxVaex92HVK92p8hTKvK4nuZV9/hEB6WTC1F0oOWMdm6KHjj4wk2b
 R+GE65wnFZOwQM2JHJRYu4yQFtf+3DsA5zCk3+JHj22j/5iEs8EgXvn/SHM60Ol9TCAU
 w9+A==
X-Gm-Message-State: AOAM531DL2WbVRzX1a9cct56zVkPNRPU8DXHmboldzYYeQfoSEiHq2Tf
 ooinmirsveV6kx8seQchs4k=
X-Google-Smtp-Source: ABdhPJxFvOWch4uhq3+RJXawVFNOsM32xIzeSnQi2PcY/1/9Ak0u3kIHzxv4aL5kfU0L7WwqN9xAWA==
X-Received: by 2002:a17:906:40d7:: with SMTP id
 a23mr922353ejk.24.1627249516810; 
 Sun, 25 Jul 2021 14:45:16 -0700 (PDT)
Received: from pevik (gw.ms-free.net. [95.85.240.250])
 by smtp.gmail.com with ESMTPSA id hq9sm13302569ejc.0.2021.07.25.14.45.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 14:45:16 -0700 (PDT)
Date: Sun, 25 Jul 2021 23:45:14 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <YP3bauBN+MKEb18i@pevik>
References: <20210725213422.1622027-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210725213422.1622027-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH v2 1/1] package/libtirpc: add missing
 !BR2_STATIC_LIBS dependency
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi James,

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes v1 -> v2:
>   - add comment requiring dynamic libraries
> ---
>  package/libtirpc/Config.in | 6 ++++++
>  1 file changed, 6 insertions(+)

> diff --git a/package/libtirpc/Config.in b/package/libtirpc/Config.in
> index 1899edefbf..31f1636ef5 100644
> --- a/package/libtirpc/Config.in
> +++ b/package/libtirpc/Config.in
> @@ -10,6 +10,7 @@ config BR2_PACKAGE_LIBTIRPC
>  config BR2_PACKAGE_LIBTIRPC_GSS
>  	bool "gss"
>  	depends on BR2_USE_MMU # libkrb5
> +	depends on !BR2_STATIC_LIBS # libkrb5
>  	depends on BR2_PACKAGE_LIBTIRPC
>  	select BR2_PACKAGE_LIBKRB5
>  	help
> @@ -17,3 +18,8 @@ config BR2_PACKAGE_LIBTIRPC_GSS

>  comment "libtirpc needs a toolchain w/ threads"
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS
> +
> +comment "libtirpc gss support needs a toolchain w/ dynamic library"
> +	depends on BR2_USE_MMU
> +	depends on BR2_STATIC_LIBS
> +	depends on BR2_PACKAGE_LIBTIRPC
Shouldn't the last item depend on BR2_PACKAGE_LIBTIRPC_GSS?
I'd also name it "libtirpc GSS support ..." (capitalize GSS)

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
