Return-Path: <SRS0=sHoS=NS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URI_HEX
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53D33C4320A
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 16:46:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10E3460FD8
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 16:46:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 10E3460FD8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF03042770;
	Fri, 27 Aug 2021 16:46:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dXHZmh517noa; Fri, 27 Aug 2021 16:46:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3271242774;
	Fri, 27 Aug 2021 16:46:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 033571BF40D
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 16:46:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E6F2182F51
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 16:46:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pIxvheX9BrFV for <buildroot@lists.busybox.net>;
 Fri, 27 Aug 2021 16:46:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7121282F4A
 for <buildroot@buildroot.org>; Fri, 27 Aug 2021 16:46:31 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id j13so5405124edv.13
 for <buildroot@buildroot.org>; Fri, 27 Aug 2021 09:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LVmT8UTU3NXRg/DiFcBSd1dseCqifhnAx3u0GqbzXBI=;
 b=uDnPNxhdkbI7JOu5EiTkyoISfVq3br3BwXa67Cs9YhvrvRXppfQEBnS/pBgfb/Wf2z
 KNa3UR5zAyE/lkSbdzomvPOEP5zDhS+Bm9gMNEE8QAmxgU0ckQkdbqbAbnPlOG/pzB/J
 knHflzNF5AUta0xWYukVdfWV6unA38/DHR+VQHxiurH9uCkAuP5X/qowf25jgaj+x00u
 8mGdSZB8AAaHu+tjrOMNDpZNyogIwbof8eUTjuuZMbpS6bsDdoIRkQ2LJZnTpgxJXHbg
 07XgIw4hviekjVeI4LwRH5nMIwP2oc/k0MJf6L84nDk4U4UvmQ5qXROLfmXo8Om8E0EN
 6Qng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LVmT8UTU3NXRg/DiFcBSd1dseCqifhnAx3u0GqbzXBI=;
 b=OaoSypYR4zdfaodVPgG4ZHMqkpo9hUadE2kIDgPlXn3gonUvINmJFK/65V3+075o+u
 eyNWP7pyGpg03b8Bu9z0qSELi2SrVKZ5gBxz7TPJ5kA3CfulkRdGAWCFFX8CMZrbmx8I
 iSI2I8KAxffGmjP6rBxy+04E/1xpuCWSJdaYNCQAMNktMC+bNGnAWSTn2rVNjLftJgPb
 wbgRP76R0El2Dp8PpOstLAj4vc3DJYSoaEx1h39Qv2wzmWAq1hNlMZ8wclTFVUsBCxiN
 ijh5IkSsx8cv2Jz6+3d+QXxhXItw2EQ4pwT8oxxGXX5QMiV8rcXrivZhfXQHFD1XNtwO
 pBcA==
X-Gm-Message-State: AOAM531uNNdzi/qC4tEgOaeUjMsOeWxwX/jzZ6cRZdUoDv0HZAfW/xhr
 DwOr7DBK0Kwjw//lJIa5NbwYm1YzhoQEIipOvkxQW8CL1Ug=
X-Google-Smtp-Source: ABdhPJwA0b69Cq6gI8xnS5rnGQmfiJuxHC0ewFki8Tg8APz9dqYTeBFtY96jsBf0oqtsrBgeJBEnTfNTL2ORp3jj9tQ=
X-Received: by 2002:a05:6402:455:: with SMTP id
 p21mr10823836edw.309.1630082789717; 
 Fri, 27 Aug 2021 09:46:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210826131814.18240-1-buildroot@heine.tech>
 <23f41262-5c08-0c61-85b6-b4b592010732@mind.be>
In-Reply-To: <23f41262-5c08-0c61-85b6-b4b592010732@mind.be>
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 27 Aug 2021 18:45:55 +0200
Message-ID: <CA+TH9VmQgkJv-A_Le-EmR5QPqsZSM5oTJgQw0V42BduzhjD8dQ@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH] docs/website: use lore for ml search
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
Cc: Michael Nosthoff <buildroot@heine.tech>,
 Angelo Compagnucci <angelo@amarulasolutions.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Il giorno gio 26 ago 2021 alle ore 23:18 Arnout Vandecappelle
<arnout@mind.be> ha scritto:
>
>
>
> On 26/08/2021 15:18, Michael Nosthoff via buildroot wrote:
> > the nabble.com link is dead and lore has a good search.
> > So use lore for the search form.
> >
> > Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
>
>  Applied to master, thanks.
>
>  There's another nabble link that is supposed to load the last mails on the
> list, could be useful to replace that one as well. Though apparently the CORS
> proxy that we're supposed to use is dead anyway - Angelo, maybe you can take a
> look at that?

Looking already for a replacement. I'll send a patch as soon as I have
something working.

>
>  There's also a gmane link that is supposed to point to the mailing list,
> perhaps that one should be replaced by lore as well.
>
>  Regards,
>  Arnout
>
> > ---
> >  docs/website/support.html | 7 ++-----
> >  1 file changed, 2 insertions(+), 5 deletions(-)
> >
> > diff --git a/docs/website/support.html b/docs/website/support.html
> > index 97ca296836..90231f601c 100644
> > --- a/docs/website/support.html
> > +++ b/docs/website/support.html
> > @@ -59,11 +59,8 @@
> >                   list, since there is a good chance someone else has asked the same question
> >                   before.</p>
> >
> > -               <form method="get" action="http://buildroot-busybox.2317881.n4.nabble.com/template/NamlServlet.jtp">
> > -                 <input type="text" name="query">
> > -                 <input type="hidden" name="macro" value="search_page">
> > -                 <input type="hidden" name="node" value="2">
> > -                 <input type="hidden" name="sort" value="date">
> > +               <form method="get" action="https://lore.kernel.org/buildroot/">
> > +                 <input type="text" name="q">
> >                   <button type="submit" class="btn btn-default">Submit</button>
> >                 </form>
> >               </div>
> >
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
