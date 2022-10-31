Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FF66FA373D
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 02:54:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0978560ACD;
	Mon, 31 Oct 2022 02:54:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0978560ACD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oHHWPVpcw9ko; Mon, 31 Oct 2022 02:54:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F03E60625;
	Mon, 31 Oct 2022 02:54:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F03E60625
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B13101BF345
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 02:54:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 99BD38125F
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 02:54:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99BD38125F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hoDJ1yIpMME7 for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 02:54:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0AD48125D
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C0AD48125D
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 02:54:35 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id f23so9598508plr.6
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 19:54:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7NzAELgrBUP6xUhTNjTQbc16V+XaaExKZYKCtWIN+dM=;
 b=6If0sd51bxMM5WOsrQPeo1JyqY3m7CNlHcrJQ+DkdNM0+cot38RD8/YpL/zCDW1wIp
 Gbd8g6F2isOy7TuJVYY2unEwPEQ6hBsNeMWvQMPUcKC+W3rsQ4OzZoI+YJ5CX0Qt1asr
 oD26XShWcmGfdgiR/UTUHeLc91NqyEJkNqbmcil3dZC0vIm2XD2OG4m/4VEKpzd0XV+g
 KskMamLYNlgSyeZHWMI77e3hIxP+EadgOG1mZANCM97Ma7dqN+VjOZZjt9o6MSkKf6KE
 /Pa3db/iQeCmST/4wW/QDbpVkm+xD4S8R7NemoHlMlcnRhOy18+yFBMCexavc1V5aGzi
 1fWg==
X-Gm-Message-State: ACrzQf0TX+1bIrg8wZNX6YF6drSAAos5Ctlk4O/qQQ8+OGkEL/HKak33
 OeH/Fjm/w+aImnZm28HjBRc5gr0PBOZGImFhgSN+2gBjr/dtjw==
X-Google-Smtp-Source: AMsMyM6cPkca6vYS2vZzuxCQo3iad+fMmOlww90nZIrFZrWp1v4qk5YTUcnsEwHp1+C5Y2xaXHyntu/aFgWGLpYiAgA=
X-Received: by 2002:a17:90a:304b:b0:213:d60f:7fc6 with SMTP id
 q11-20020a17090a304b00b00213d60f7fc6mr4739051pjl.92.1667184875150; Sun, 30
 Oct 2022 19:54:35 -0700 (PDT)
MIME-Version: 1.0
References: <20221015005813.4055238-1-james.hilliard1@gmail.com>
 <20221030212920.3dd30baa@windsurf>
In-Reply-To: <20221030212920.3dd30baa@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 30 Oct 2022 22:54:23 -0400
Message-ID: <CADvTj4q-SxRdTGUj9+N2VC5ddODSkYQvqJm2E5OzcXVS0+NqMA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7NzAELgrBUP6xUhTNjTQbc16V+XaaExKZYKCtWIN+dM=;
 b=m8PPEjykkFh0JDdoBytwChlY+uJGADvxo8Cl+rly6sjiwUFrPzOJfmajcidG6tsQ19
 GRzTXQcJSNHRbB3G5La9cV7RA9179W/GslCUHDOSzN7ZKzczXltQDscbFW00HgkgycZC
 sYHksoXCilXmOPBePVlw93C1aizhQ39JeWTkGb5mt7zSCDEtJqdZ7g8xSx0U88Em+20p
 oR16fzaBntnqDDi+W9xJ5BMsNxcPfLDK8T6rglTAxHN1XVpk8uf3t02RvUAuiYMj1cQL
 Sx7utSkZ0ZPA58h2FmRG2M/rEfbhJ+vLpqUiNSY3aiSYN+hMtgSFCs4izNIWAiZwDIcp
 y9dw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=m8PPEjyk
Subject: Re: [Buildroot] [PATCH 1/1] package/bearssl: disable parallel build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Oct 30, 2022 at 4:29 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello James,
>
> On Fri, 14 Oct 2022 18:58:13 -0600
> James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > The bearssl package is not compatible with parallel builds.
> >
> > Fixes:
> >  - http://autobuild.buildroot.net/results/5e1/5e1b72db206b2d17fa5ce378a70fdc2f3f5bf773
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  package/bearssl/bearssl.mk | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Based on the feedback which said that fixing bearssl was preferred over
> using $(MAKE1), I have marked this patch as Changes Requested. Could
> you see at fixing the bearssl build system, submit the fix upstream,
> and provide the fix for Buildroot?

I contacted the maintainer as described here https://bearssl.org/contrib.html
with the suggested change, so far I haven't received a response back.

>
> Thanks a lot!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
