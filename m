Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BBC0C4320A
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 16:31:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 365EB61154
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 16:31:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 365EB61154
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED504402BA;
	Thu, 19 Aug 2021 16:31:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HzRKtNusUT-E; Thu, 19 Aug 2021 16:31:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 596BB402C2;
	Thu, 19 Aug 2021 16:31:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D0AC51BF82D
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 16:30:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C088180D96
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 16:30:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HeY4T0DYWSgI for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 16:30:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AD81980DAD
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 16:30:55 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 c19-20020a9d6153000000b0051829acbfc7so9417210otk.9
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 09:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NayjwuECWbLnYy07D4nrUteqPLIaB6k9QE5QS0wdA70=;
 b=D2HnCPdZWtQm6JRtLhr4x+B/xIurGuQyeG9PdTM7d78RvYBYgXqkDHwlPf7Cumy/rZ
 jFap2X1WzbA7/k/dCYoY9CRkddnG78b4PEV6WKP33UpjPLZIk5r3rDUgfs7l+B9IvrwA
 SKZkrHc58xzldbUjPhpooYfpoM10ewrtEuwCxSYmgo2W6HOv+EYx5uNDXg09A9qd6Nye
 mZKFzgEwzYiaYnqHKOvTxG8zhR6aGuy170rrdWbP6yV+cqOWSITVkWg1Ob5PlUlxn3+v
 nz84Im+pN/2LH5KKIV8uoTX3T3b3zi7Vd8VWc1MwwHtzKd4zMoAcRsByPtERmAWogRbA
 u9uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NayjwuECWbLnYy07D4nrUteqPLIaB6k9QE5QS0wdA70=;
 b=LAz+PzD5OuU6Eg6ZSJca4q7oWHVEmxJi9a9brjcnVjd8ICiLy3ejW2EmW6WmATVQQI
 BHgdOpUq8p+QRMBlLwEvChZOHtnF/qO+Q5eKBSlgMFwHh1vzBoF86PIUT/7h+ksbOWtu
 d4IgfMPcKViechom6Em7K8nKvB0CYSdgHAcMDDWIVgBPzunxrUZmIX/Cw+1NdVAsBAUP
 0lObRiHH5LZ5j9y3p7jC8onNvS4bwd6Fvku+WbrCATbz9LVTL4PWKhrFG0/l67BQSkiG
 o6k8tXvjwo/BYHZHsHWH7HXPIuMsSbfMmK6Tb1vsuX76fpBr7JJt3UDIGjCuFErvxeXM
 NcIA==
X-Gm-Message-State: AOAM533j/bxhRSvKGcm6VI8DWmw6NWAdyRCZoC28xJf/VeVSbFSIz+1S
 G9xFcaFlP0xUdHjJCk/hf11X2nVJ0Tn2frl5iqo=
X-Google-Smtp-Source: ABdhPJyPaT0mcjX/oWziIANTozy9ibj7vdPnYs4m0FWFFyqFWUFIZvTLAcjSlNRlqGDD9WoC00OspjAX+xoxXHFxVwk=
X-Received: by 2002:a05:6830:22e9:: with SMTP id
 t9mr12320159otc.10.1629390654706; 
 Thu, 19 Aug 2021 09:30:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210818202212.684857-1-thomas.petazzoni@bootlin.com>
 <CAFSsvmrYDiStTEn=fEBrUX2+ZZoro6KxMx1zS2FLxsaLzuTtfw@mail.gmail.com>
 <20210818235437.78a7826a@windsurf>
 <CAFSsvmqmKHD0k4fOWAV+Zdj+m=jSvafFYtw1vMsOj1Jf5rRMSA@mail.gmail.com>
 <20210819181926.771fe4f1@windsurf>
In-Reply-To: <20210819181926.771fe4f1@windsurf>
From: Adam Duskett <aduskett@gmail.com>
Date: Thu, 19 Aug 2021 09:30:43 -0700
Message-ID: <CAFSsvmrFUXB4ogAUObhutx_vQFOEkVQL6ashiG2vpHNrzzNSGQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH] package/sentry-cli: remove package
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Ugh, out of tree still fails. Yeah, I'm bad at this whole
troubleshooting thing :(

Sorry for wasting your time! Remove this terrible package!

Adam

On Thu, Aug 19, 2021 at 9:19 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Thu, 19 Aug 2021 09:08:49 -0700
> Adam Duskett <aduskett@gmail.com> wrote:
>
> > Interestingly enough, my testing method was flawed. While I did spin
> > up a debian 9
> > docker container and the exact git hash that failed, I made the
> > mistake of running
> > `make host-sentry-cli` and not `make`
> >
> > When calling host-sentry-cli directly, there isn't a failure, but when
> > running just `make`
> > the failure does appear. I am not sure how to pass include paths to
> > cargo, but it seems
> > like the only failure now is the missing zlib.h library if the package
> > is bumped to 1.68, as
> > the git repository error is indeed resolved.
>
> Including for an out-of-tree build, where the build directory is
> outside of any Git repository ?
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
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
