Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B97CDEB64DD
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 00:47:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 572B2410BA;
	Tue, 25 Jul 2023 00:47:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 572B2410BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3agWOmufFaPC; Tue, 25 Jul 2023 00:47:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A20E410D2;
	Tue, 25 Jul 2023 00:47:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A20E410D2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D83E31BF97D
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 00:47:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE64C4015F
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 00:47:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE64C4015F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3iv_p8CtP0eW for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 00:47:42 +0000 (UTC)
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B4BED400E5
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 00:47:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4BED400E5
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-99b76201110so97886966b.1
 for <buildroot@buildroot.org>; Mon, 24 Jul 2023 17:47:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690246061; x=1690850861;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+N3+FXTOzMkQVGTbG3CE9BjsNm6+odHO8JYbi0U9E1U=;
 b=NmjlpLxMrNegfiRM8ReVIFF7RP53oTkeXtDTlB6ONqyKtgu/OXoWVtsfIC19FMTfxn
 xnP+2fsNYysAmbjPkkM1UcjqLCRlps4WX3rm202W8/73b2790ilKXgaIH3q6skW+++n+
 NVTKUrAld8H38bV/PONKdD16Nz3kf3xQqQr/NzKZrsj3KlF2MJ2mPELcjboxc5gwMi+L
 AyOTuAX83zstUh7veIK5tgXIkQObKzaEC/YxGvdAcGnbNplfAA+Ti4M5h3sIAYZuVfQ/
 2n5GopUK3ruOENqb0hBwFYvJbtWcmSmLlxCPN6LbL14scNsY4ZyTX/SVpsFReYUY3+vF
 dTCA==
X-Gm-Message-State: ABy/qLZA0Wia0+qsCY4W6+qZ/0hh/OXnO5AeP9uQuYK+DFPEOu7lmA2b
 raWjOP+Cw3dHWkDOb7M2ZL5Hl234O4v4/3Ric4xp4g==
X-Google-Smtp-Source: APBJJlGDlfE0FQrsaJzl+s7b585jrRbccc+XOuuDKINPJER+++VjN++c4JIVXOEDOZnWx6byJADexdFRvk80Psy/cII=
X-Received: by 2002:a05:6402:2695:b0:521:66b4:13b4 with SMTP id
 w21-20020a056402269500b0052166b413b4mr9652096edd.0.1690246060759; Mon, 24 Jul
 2023 17:47:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230706170904.1063565-1-vfazio@gmail.com>
 <20230706170904.1063565-3-vfazio@gmail.com>
 <CAGt4E5vsBmVfqSFudFLRn7SEogXFUFd=LE1jrcdJsntOZp3AZg@mail.gmail.com>
 <CAGt4E5vfbnf-TYH5Y6HxW3hrG37fgHYdfLZ5yobne+Edpk2uUg@mail.gmail.com>
In-Reply-To: <CAGt4E5vfbnf-TYH5Y6HxW3hrG37fgHYdfLZ5yobne+Edpk2uUg@mail.gmail.com>
Date: Mon, 24 Jul 2023 17:47:29 -0700
Message-ID: <CAGt4E5vEYD4Kd5bbbNBxUF1TvD212ae35vV7ybFzvA4Sco=CWg@mail.gmail.com>
To: Vincent Fazio <vfazio@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1690246061; x=1690850861;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+N3+FXTOzMkQVGTbG3CE9BjsNm6+odHO8JYbi0U9E1U=;
 b=NXHoHj1Ll5h2Iumz1XLZnfT6I+qwM7kKPs9aez1s9394SLtAO2/t89EqYt0CScBGMx
 m3cTSESFN0K4DAfuY3yn3fS5ALptJuNl8+YKDquZlzAZGWSThyo+zUXpbQFx/Y5T15qR
 XII4f5EOdbB1WgcGWuiN28qDgSCF2c+5MR+Z8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com
 header.a=rsa-sha256 header.s=google header.b=NXHoHj1L
Subject: Re: [Buildroot] [PATCH 3/3] toolchain/toolchain-external: always
 call checks with dependencies
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

> > >>> host-skeleton  Executing pre-build script board/brcmstb/pre-build.sh
> > >>> toolchain-external-custom  Configuring
> > /bin/bash: line 1:
> > /opt/toolchains/stbgcc-8.3-1.0/bin/aarch64-linux-gfortran: No such
> > file or directory
> > OpenMP support is not selected but is available in external toolchain
> > make[1]: *** [package/pkg-generic.mk:283:
> > /storage/Extra/buildroot/output/arm64/build/toolchain-external-custom/.stamp_configured]
> > Error 1
> > make: *** [Makefile:27: _all] Error 2
>
[...]
>
> Still, the gfortran error message ("No such file or directory") should
> probably not appear. Let me see if I can whip up a patch for that.

Patch sent.

https://lists.buildroot.org/pipermail/buildroot/2023-July/671113.html

Regards,
-Markus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
