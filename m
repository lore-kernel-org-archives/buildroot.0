Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4742EC531DF
	for <buildroot@archiver.kernel.org>; Sat, 17 Aug 2024 19:49:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01CB080B50;
	Sat, 17 Aug 2024 19:49:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YrRD9I4DwXz4; Sat, 17 Aug 2024 19:49:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECB6080B54
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECB6080B54;
	Sat, 17 Aug 2024 19:49:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 568D41BF4D7
 for <buildroot@lists.busybox.net>; Sat, 17 Aug 2024 19:49:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4321680B50
 for <buildroot@lists.busybox.net>; Sat, 17 Aug 2024 19:49:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id La39YdNlDMo9 for <buildroot@lists.busybox.net>;
 Sat, 17 Aug 2024 19:49:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com;
 envelope-from=markus.mayer@broadcom.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 418E780B1C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 418E780B1C
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 418E780B1C
 for <buildroot@buildroot.org>; Sat, 17 Aug 2024 19:49:52 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-2d3ed48c748so347783a91.3
 for <buildroot@buildroot.org>; Sat, 17 Aug 2024 12:49:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723924192; x=1724528992;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FntvPYMfc7rX1nuFFvznfuBAq3XLFQqCapprFzHQurM=;
 b=ujb8xuu8YLgmmf35WGGp7BX9VTHjf60nINLc7JJlEWQibGaPUWDYSTHdQAQ7qzmB6e
 a6SE+Aj17b22BkgmSKybZkULuh3tJniYdGwSGeoDW21OBbd0pw2d1+vaOAcwZ/RBe+xy
 /5TMrKs0IysmU5qrpNzJ7Pv+qBdU99rTKRJQR+ZANt2BA7alqEG8jwyfy9DyDpX8dDrt
 gd/llir6XLc7Qw7xDzLEWVxNbSjaYIGNz+WGGn9E3lwN277pECVEOLR3doYu3qWxAKrQ
 Jo2xiITuF2vJFEVJBEw/JhypPEmEIbW6MfL/UuIUC/VCexqEzUzusMAJcMDMO7oDW4nO
 i+KA==
X-Gm-Message-State: AOJu0YzElfdAesTtnapSnGpjthWxFhqvVyNOb708alHRK7nI3anU+7Z9
 i58ve5TvlpUa8nsHW1kiQrh1RnH/q9GKJpjtxF/YQbo8v0VPZF7wwKm5mawfYBmLMj8HBHJOjGq
 aQCqJSwHPqgQBHCCxDWmReGUKNArmQEsttm3LuHaI1NQKBeh0d8XP
X-Google-Smtp-Source: AGHT+IHXyeZpNjCNTfD/xc/a+TFWXPpBoT87+OpdLjeaQE8k5ZmkU3G6OREVBSmHXMhTh3uhQwHs6tpbunFTZ1Vgh0g=
X-Received: by 2002:a17:90a:fd01:b0:2d3:da94:171 with SMTP id
 98e67ed59e1d1-2d3e05610a9mr4254656a91.5.1723924191945; Sat, 17 Aug 2024
 12:49:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240817000027.654079-1-mmayer@broadcom.com>
 <20240817121031.55afa6c1@windsurf>
In-Reply-To: <20240817121031.55afa6c1@windsurf>
Date: Sat, 17 Aug 2024 12:49:40 -0700
Message-ID: <CAGt4E5vBfMfDgNyf6mbD2QHD=oeOkYx=Z1r494UaZ7_-ynv=YA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1723924192; x=1724528992; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FntvPYMfc7rX1nuFFvznfuBAq3XLFQqCapprFzHQurM=;
 b=LqQB9aLoADmCGQ1wiD7S2OViOSLgU2re3cm7XZvFvErNSa6S+iN6RjvUXUhjawkXUv
 hlf+AOjSO7ymRaAyjd5+9ZDHNqEX5cA98nqhpfax4R0shZSixem+0wWsVfVXrQW0Opq+
 9PwasvfmhjLC5b1Gfr9lRI2ZZ4efeC0t+f/jg=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=broadcom.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=LqQB9aLo
Subject: Re: [Buildroot] [PATCH] package/dropbear: provide config option to
 turn off SHA1 for RSA
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
From: Markus Mayer via buildroot <buildroot@buildroot.org>
Reply-To: Markus Mayer <mmayer@broadcom.com>
Cc: Markus Mayer via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 17 Aug 2024 at 03:10, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:

> > diff --git a/package/dropbear/Config.in b/package/dropbear/Config.in
> > index 207c1f561700..099f61535aa2 100644
> > --- a/package/dropbear/Config.in
> > +++ b/package/dropbear/Config.in
> > @@ -67,6 +67,12 @@ config BR2_PACKAGE_DROPBEAR_LEGACY_CRYPTO
> >           DSA public keys
> >           Diffie-Hellman Group1 key exchange
> >
> > +config BR2_PACKAGE_DROPBEAR_DISABLE_RSA_SHA1
> > +     bool "disable SHA1 hashing for RSA"
> > +     help
> > +       SHA1 is no longer considered secure. Users may want to disable
> > +       it. However, this may preclude older clients from connecting.
>
> Inverted logic options are always a bit annoying. Wouldn't it be better
> to do:
>
> config
>         bool "SHA1 hashing for RSA"
>         default y
>         help
>           SHA1 is no longer considered secure, so users may want to
>           disable it, but the lack of SHA1 support for RSA might
>           preclude older clients from connecting
>
>           This option defaults to enabled to preserve backward
>           compatibility.
>
> Peter, what do you think? Or should we break backward compatibility for
> the sake of security, and leave SHA1 support disabled by default?

I don't mind either way.

The reason I chose this approach was so that the default behaviour
doesn't require a Buildroot configuration setting to be enabled. Also,
because the Dropbear project is saying that SHA1 will be removed in
the future, this config option will likely go away again when that
happens. I thought it would be preferable to not introduce a config
setting that is "y" by default when the setting will be removed again
in the future. However, at the end of the day, I guess it doesn't
really matter all that much if old config files contain
    BR2_PACKAGE_DROPBEAR_RSA_SHA1=y
versus
    # BR2_PACKAGE_DROPBEAR_DISABLE_RSA_SHA1 is not set
when the option does get removed. Kconfig will strip it out either way.

So, I am okay either way. Just let me know which way you prefer.

Regards,
-Markus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
