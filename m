Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F029C4332F
	for <buildroot@archiver.kernel.org>; Wed, 23 Nov 2022 07:28:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD4658128F;
	Wed, 23 Nov 2022 07:28:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD4658128F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 62s4SxMaHCwF; Wed, 23 Nov 2022 07:28:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D61888128A;
	Wed, 23 Nov 2022 07:28:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D61888128A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2247E1BF3FD
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 07:28:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A4D54052D
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 07:28:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A4D54052D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6F8Pc6j3pz0x for <buildroot@lists.busybox.net>;
 Wed, 23 Nov 2022 07:28:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2552400DB
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E2552400DB
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 07:28:41 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id s12so23668643edd.5
 for <buildroot@buildroot.org>; Tue, 22 Nov 2022 23:28:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gGP+orore/16brNCjYWemCBhKYWbll8DguAvWKcdi30=;
 b=uugG1bH/PFOZV5xcgcnBGyNnPR5BHCmLjHI8T5RmxvgoH4NzGjGqwW2KGnJeW19qI5
 AxTNw9NSwkS5x7Q3d7RXicE+OuBt93U13ivkyVywojRFCtAvCMV/FOOkn+byYwYXyoe0
 Aa1rDpglYHqatgW1hFiLwL0mfnJDSxBrDkQWCd9t75Mi8Z0RzsGogGD9XYjhYdH9+sS/
 2J5M18po59Wg6cwYwmAR4oC6h5ZIKsBmgnBPllPIhXr0GAmkim43J7MWH6nNedZWjS5V
 MsSEJF6zVbuk1PVcZ9rwwHQYhjqJ6vMwy+uAeZOiTWQuMgcogtCHS+zFR29pbbTYcLBx
 9vRg==
X-Gm-Message-State: ANoB5pnFYXh2D/hQ0CA2K5+2HQqZIVo5yRhQekC06WH2W86ZQ7+UCWra
 Ip1VrHiJS8ReOT0LoiRJSR89U7145Bh3QO5Wup4QmZuGyZ6YNg==
X-Google-Smtp-Source: AA0mqf6rnKQr+lpGgPOMOJIPsW9EJlr4TKJcRjZJQW2TYvWQcKWVa1cVXnqYQfMzkPkbL8GmEK0f4Ifvvo8h0VgaKwU=
X-Received: by 2002:a05:6402:2217:b0:468:fd95:eb4 with SMTP id
 cq23-20020a056402221700b00468fd950eb4mr13673724edb.230.1669188520136; Tue, 22
 Nov 2022 23:28:40 -0800 (PST)
MIME-Version: 1.0
References: <20221111133254.1163936-1-dario.binacchi@amarulasolutions.com>
 <20221122232757.4dbe60ee@windsurf>
In-Reply-To: <20221122232757.4dbe60ee@windsurf>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 23 Nov 2022 08:28:29 +0100
Message-ID: <CABGWkvrdTsFrGRCNm83OdxEQp+EZAjTp7wVJhzSznL-gA+UCOQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gGP+orore/16brNCjYWemCBhKYWbll8DguAvWKcdi30=;
 b=jnLKbDGZJygACMWFBiddANPpwpj7a/3Yd8vaD26b0h5kgvUei5rHZdSl6WwEejMozc
 tXtsj/pwQ01ugKYWo2WtivWdJVWxdt3U5YZuvAvcKpNoP/bvcBqPx3jz4uzv2EPP7jy3
 njT3a3x9N5EE0leP7k44EnkMwa+mUlEpp8BOM=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=jnLKbDGZ
Subject: Re: [Buildroot] [PATCH 1/1] package/sscep: new package
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

On Tue, Nov 22, 2022 at 11:27 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Dario,
>
> On Fri, 11 Nov 2022 14:32:54 +0100
> Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:
>
> > SSCEP is a client-only implementation of the SCEP (Cisco System's Simple
> > Certificate Enrollment Protocol).
> >
> > The goal of SCEP is to support the secure issuance of certificates to
> > network devices in a scalable manner, using existing technology whenever
> > possible. The protocol supports the following operations:
> >
> > * CA and RA public key distribution
> > * Certificate enrollment
> > * Certificate and CRL query
> >
> > Certificate and CRL access can be achieved by using the LDAP protocol,
> > or by using the query messages defined in SCEP.
> >
> > CC: Angelo Compagnucci <angelo@amarulasolutions.com>
> > Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>
> Thanks for your contribution. I applied to master, but after fixing a
> number of things. See below.
>
>
> > diff --git a/package/sscep/Config.in b/package/sscep/Config.in
> > new file mode 100644
> > index 000000000000..d4847f1b8a75
> > --- /dev/null
> > +++ b/package/sscep/Config.in
> > @@ -0,0 +1,9 @@
> > +config BR2_PACKAGE_SSCEP
> > +     bool "sscep"
> > +     depends on BR2_PACKAGE_OPENSSL
>
> This should have been a "select", not a "depends on".
>
> > diff --git a/package/sscep/sscep.mk b/package/sscep/sscep.mk
> > new file mode 100644
> > index 000000000000..f59f4bd03bbc
> > --- /dev/null
> > +++ b/package/sscep/sscep.mk
> > @@ -0,0 +1,14 @@
> > +################################################################################
> > +#
> > +# sscep
> > +#
> > +################################################################################
> > +
> > +SSCEP_VERSION = v0.10.0
> > +SSCEP_SITE = $(call github,certnanny,sscep,$(SSCEP_VERSION))
>
> This should have been:
>
> +SSCEP_VERSION = 0.10.0
> +SSCEP_SITE = $(call github,certnanny,sscep,v$(SSCEP_VERSION))
>
> I.e the "v" prefix should not be in the VERSION variable.
>
> > +SSCEP_LICENSE = BSD
>
> BSD is not a valid SPDX license code and is not specific enough. I've
> changed this to:
>
> +SSCEP_LICENSE = BSD-2-Clause, OpenSSL, OpenOSP
>
>
> > +SSCEP_LICENSE_FILES = COPYING
> > +SSCEP_AUTORECONF = YES
> > +SSCEP_DEPENDENCIES += openssl
>
> += is not needed, a simple = is sufficient. But more importantly, the
> host-pkgconf dependency was missing, causing the package to fail
> building.
>
> I've addressed all those small issues when committing.

Thanks for your fixings and explanations.

Best regards,

Dario

>
> Thanks again!
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com



-- 

Dario Binacchi

Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
