Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1C0BC433FE
	for <buildroot@archiver.kernel.org>; Fri, 14 Oct 2022 19:55:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5172C60BD0;
	Fri, 14 Oct 2022 19:55:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5172C60BD0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hcxq2-CvefK6; Fri, 14 Oct 2022 19:55:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 066CB60BC6;
	Fri, 14 Oct 2022 19:54:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 066CB60BC6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2B2101BF352
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 19:54:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0680A81448
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 19:54:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0680A81448
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id paALg0QWsQPL for <buildroot@lists.busybox.net>;
 Fri, 14 Oct 2022 19:54:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0A4981445
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F0A4981445
 for <buildroot@buildroot.org>; Fri, 14 Oct 2022 19:54:55 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id 128so5223115pga.1
 for <buildroot@buildroot.org>; Fri, 14 Oct 2022 12:54:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2l7SbYkAzAMtCpjbQy/vhpWve0KLcpHvpwgXMgBgGrk=;
 b=L1+gTX0Th/VyL+SXtmgqeEU3vFob6SzwrfpSxSTdo0O9BigR9UPMhufN6rGKj+6r1o
 mMlPHvUsCJ/c0jCcG5v/XBVjnehHqQToB2/KZmf36u2g7dDTIJ8Lnbs9ayf9EBLmJ9xM
 U++h9ppI0o73X8x7e305JtlYAbRyeEIpXTRmil1E9muNxEGGtUfW+X8tVqRmkDXRvM8R
 E1He9epSYReIeGTu/fydORILtUcQeaPxrlmptNzxzc07+CVIFIkygVRm9sNubLPWirFw
 qvIDrTg75puZzFq5P60Ag5LXEubyIsvdmXxSJn6Hit4Lp8Hr5degQZmlokmonCbFJeKd
 SxRQ==
X-Gm-Message-State: ACrzQf1LCHSndxKfyv8JXPlgZdTGIt7dv/6+alSbzJDRPrWqdKczBSb3
 KgZ5rV6PxMzk0IW1zDvbM4wteE+usuWOj4cEuHvfOA==
X-Google-Smtp-Source: AMsMyM5Z6ZgZLG9yI8C+TEwUmGTH2OuvovNnBTCKysVQkQXDzEIXdmebCgwn5FzAHL1EHiNZNeu7QuG81sl/vmAm3Ok=
X-Received: by 2002:a05:6a00:3249:b0:565:fc2c:ad79 with SMTP id
 bn9-20020a056a00324900b00565fc2cad79mr6719299pfb.72.1665777295177; Fri, 14
 Oct 2022 12:54:55 -0700 (PDT)
MIME-Version: 1.0
References: <20221014172013.758628-1-mmayer@broadcom.com>
 <20221014191846.GC2503@scaer>
In-Reply-To: <20221014191846.GC2503@scaer>
Date: Fri, 14 Oct 2022 12:54:43 -0700
Message-ID: <CAGt4E5t3Vq54Lu_AgKOVmqizy696GAjmtdxz7CpEBbU-=8OZVw@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2l7SbYkAzAMtCpjbQy/vhpWve0KLcpHvpwgXMgBgGrk=;
 b=G7MENRIhjsjQzMb4ErRxxMhXVpPOHycuptArqeuPpwNKKUOSMW/SpMGlcwWmG04B+s
 YWTq3vU+UnhlpkKoZSgmf13pRFx7TYcLoYUVUd6hVcLKXM2LlFk8ygwl/uljylNqAb/q
 IGt2Zfw48fnjswqXYdaTqbUdsADPGvAWL+jbI=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com
 header.a=rsa-sha256 header.s=google header.b=G7MENRIh
Subject: Re: [Buildroot] [PATCH v2] mmc-utils: allow enabling of "dangerous
 commands"
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 14 Oct 2022 at 12:18, Yann E. MORIN <yann.morin.1998@free.fr> wrote:

> > @@ -8,3 +8,11 @@ config BR2_PACKAGE_MMC_UTILS
> >
> >  comment "mmc-utils needs a toolchain w/ headers >= 3.0"
> >       depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
> > +
> > +config BR2_PACKAGE_MMC_UTILS_ENABLE_DANGEROUS_COMMANDS
> > +     bool "Enable dangerous commands"
> > +     depends on BR2_PACKAGE_MMC_UTILS
> > +     help
> > +        Enable support for dangerous commands in mmc-utils. mmc-utils
> > +        considers turning on permanent write protection on a device a
> > +        "dangerous command" and doesn't offer it by default.
>
> Sub-options must immediately follow the main option, or the indentation
> is not correct.
>
> We also prefer if-endif blocks when introducing new sub-options, for
> consistency across the code base.

Gotcha.

> Applied to master with the above two changes, thanks.

Thanks for the fixup.

Regards,
-Markus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
