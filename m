Return-Path: <SRS0=/NXK=NZ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8717FC433EF
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 23:09:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0824761058
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 23:09:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0824761058
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A18464264E;
	Fri,  3 Sep 2021 23:09:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eXA3elwuegfS; Fri,  3 Sep 2021 23:09:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF84E42656;
	Fri,  3 Sep 2021 23:09:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E2AE01BF340
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 23:09:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D22046073A
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 23:09:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dmScSDjmf0_3 for <buildroot@lists.busybox.net>;
 Fri,  3 Sep 2021 23:09:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8A14F6072F
 for <buildroot@buildroot.org>; Fri,  3 Sep 2021 23:09:47 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 q11-20020a9d4b0b000000b0051acbdb2869so916389otf.2
 for <buildroot@buildroot.org>; Fri, 03 Sep 2021 16:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HrA0PGCBMbkf30QLcGGWaFcUSZCJktk1w3caiu9/0AI=;
 b=oNWUG4Zq3L3xoiq88wxkmD1c/TB2049Fx/1tNuG2ixi8vkLYXeGCdjh8o+nCxQyEW7
 1vesnwtqg7/kNvaHLoVnSfj/zA006olZ6QBYX6ja7dpOFQktKUY//x5HlCrHiJBiLw7t
 N+u4gtpBymhQBtnoVPOYtgSQI7bw0SE+ufae6drMxF6LjjRvSXn5kWeweu8sOc6MyxFF
 mgKJgmqVuZRM9iT9SP8s3Rm/zBirrFTDwXGqCgDRgOpU59cwnJdk5l5MlnWZTRDOEFwh
 8fVs/ubqlCsk16jeiKRcx5dVGaF4DIicVg2NSemHgPpBW0yhD7MML9JcbsQSLt/Zo71Z
 e/oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HrA0PGCBMbkf30QLcGGWaFcUSZCJktk1w3caiu9/0AI=;
 b=p07IPJp+tVdNvsrQ68yBB4Y8RBynOpJTrTflIo0oTTx6UzVxRlnBAQdilaEE7Bzfv2
 v5RsHRqhRqOYyzDYDlBhmaeqc6uHdLehJOoaLU+nVMaP1XWc9YaU4zfZrf6i59h3PPeE
 KBQ111q7S88NQBzEy0douB++FL15JlVhkBh+4/2CLf7s3RmtZRpIO87PbtjmWUA6pah+
 3Oa8oZirOwGZWksxmJAyRKRIeHwaHWGn6aNzWjUfl47X2qqIyRbvOZN91O2gUJYS4+P7
 ER1R2b4c0CopFgaa1UpwTYosHL01YOx9T4ba7VYclsNiBdpY57zvWKgf5RDA+nu687kL
 dm6w==
X-Gm-Message-State: AOAM531ify2JGc7wwXkuX5CT7Kv2+GKVGan0NVgb+XEPicND9NQ3ybYt
 NZ1mAi5zx8NOneCtX14+XUb8SkX5QhvtaqoM9/o=
X-Google-Smtp-Source: ABdhPJx36csQljSQhaQOZUloqDnXIvrgg2XgkTeDQZA1NAq39ZGCUgLPN176zwjwx75tKtnbFA9NPVxCi8gVk2jjWWQ=
X-Received: by 2002:a9d:721b:: with SMTP id u27mr1254040otj.214.1630710586535; 
 Fri, 03 Sep 2021 16:09:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210903162027.1935040-1-aduskett@gmail.com>
 <20210904002757.6d999f04@windsurf>
In-Reply-To: <20210904002757.6d999f04@windsurf>
From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 3 Sep 2021 16:09:35 -0700
Message-ID: <CAFSsvmofDL5dO5xO-iiK2t=-MrChN3YDQj9BOOoHBJhRP8NZ9w@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH/master 0/7] Qemu and gobject-introspection
 fixes
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>, Anisse Astier <anisse@astier.eu>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Hey Thomas;

NodeJS14 ALSO requires a qemu wrapper to compile, so this work is
necessary to allows NodeJS14 to
not crash when compiling against a corei7 target.

Adam

On Fri, Sep 3, 2021 at 3:27 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Fri,  3 Sep 2021 09:20:20 -0700
> Adam Duskett <aduskett@gmail.com> wrote:
>
> > First of all, sorry this took so long!
> >
> > This series is an accumulation of several conversations between Thomas, Yann,
> > and myself. The basics are this:
> >
> > - GOI fails to build with the corei7 architecture because calling qemu results
> >   in qemu trying to use instructions that may not exist on the host processor.
> >   This causes a core dump.
> >
> > - OpenEmbedded gets around this issue by adding options to qemu on certain
> >   CPU and architecture combinations, Corei7 being one of those architectures.
> >
> > - As discussed with Thomas, a new string "BR2_PACKAGE_HOST_QEMU_USER_MODE_ARGS"
> >   in qemu/Config.in.host is added, which we then sed to g-ir-scanner.in.
> >
> > In addition, I was anonyed that there were so many shellcheck issues with the
> > various wrappers, and Yann was annoyed that the wrappers were calling to bash
> > when they didn't need to do so, so those are also fixed in this patch series.
> >
> > And last (but not least), Yann noticed a latent bug in g-ir-scanner-qemuwrapper.
> > If GIR_EXTRA_LIBS_PATH is empty, then the LD_LIBRARY_PATH is prepended with a
> > colon, so that is also fixed.
> >
> > This will lead the way to NodeJS 14 which is one step closer to removing
> > Python2!
>
> Thanks a lot for all this work! Could you remind me what's the
> relationship between this and NodeJS 14 ?
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
