Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F79C636D4
	for <buildroot@archiver.kernel.org>; Wed, 15 Feb 2023 21:18:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96FFF40284;
	Wed, 15 Feb 2023 21:18:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96FFF40284
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8CkO-olMt1Js; Wed, 15 Feb 2023 21:18:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 847A54020B;
	Wed, 15 Feb 2023 21:18:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 847A54020B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 73E851BF3A0
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 21:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4DC1381446
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 21:18:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DC1381446
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ydLWt0yQaDRL for <buildroot@lists.busybox.net>;
 Wed, 15 Feb 2023 21:18:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72AA781432
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 72AA781432
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 21:18:14 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-16df32f2ffdso358332fac.1
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 13:18:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Nw/CkPcFVtKaXwCj0JSmUPWr3h2QMQ3Puuk1Zt+Yr+c=;
 b=BSDVvJcet1y4o9wwCIJJxUqYu6GFAflpIUXYRsDMAV/lWDG3Z4lywk/KF6D6lkc7pw
 QUKL5Wpfjsxo2SipesqqNeUQmrdxq5an1GCheJwUyXmlx6Sa66w7jGTwEbp7AtItUh+g
 wTb93E1oMzuCWpkpN1EqWceO+k5yXzY+HtNZ8avvlreJpCXnn/K2MNdOCiYX458mo50C
 iT2CcD/w2TUMsnW/BhjUCZqlsbfdzPrZB7NOGvvtVkOefO0D7jA+ztr0T1xOfB0KSUX3
 +7W6rwds9V4sQWKzlo/x3yYxIVTCkinserhDbXqftj4sAeHNHu3OXWPm0B/TTDEbc/Xq
 Aidw==
X-Gm-Message-State: AO0yUKVUROYI2iTIgjOdgfr1UIBxv/jsJRfLhgct6ivSjPIojqGZqD1f
 YWXpYpL6OVMdsBhZMIcN6iLLZHVh2ixoB3Yp/1734STuxUc=
X-Google-Smtp-Source: AK7set+Lm3NYj5M1O9G5n+MI1htIl1gYzPJOdhleZxpXT+GE4Wm2dyPQBprfNyR2HOuCSK2j5BmFMmx14r8iiuFeg+k=
X-Received: by 2002:a05:6870:1494:b0:16d:f057:bf55 with SMTP id
 k20-20020a056870149400b0016df057bf55mr339489oab.93.1676495893483; Wed, 15 Feb
 2023 13:18:13 -0800 (PST)
MIME-Version: 1.0
References: <20230208005343.2544457-1-james.hilliard1@gmail.com>
 <a70284ec-03ae-3ec5-6ed4-473bd6f3377a@mind.be>
In-Reply-To: <a70284ec-03ae-3ec5-6ed4-473bd6f3377a@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 15 Feb 2023 14:18:02 -0700
Message-ID: <CADvTj4pLxi6iijodMj-24U0nrvWiA2DcWZaaUkwh6r+_qNgW9w@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Nw/CkPcFVtKaXwCj0JSmUPWr3h2QMQ3Puuk1Zt+Yr+c=;
 b=JIoDzWkFAhUPJsXxP4sCbUpb2ebiWld8WvD+EzBeI2eCnZ0I7vYmgkga8j8GZSO8Wa
 bleyYOrZniRg3868cJgYnFjCBx5R95XsRwsAsVA+UahiG24L/tXSigDZN7aU2AnqikZn
 02J/kW5UCwsLEjR0lDXufjOEBGE7I1TmD6AMmiZlVFRUHVpCTJOaydRenzKXUwdcIf39
 Bc5ZlekCOLazF5Cq3wqE9vSWUg/tFdAr1RYZRQrx1BFxr5rJLJRoUy6OFECVHLMhmmgW
 eSHL5vkWR+DvxmLmJYhpxFWts3tnmn6enodgeISIXXmjjdfooG6aAhvmuokk9ew6jzYm
 ZJ0g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=JIoDzWkF
Subject: Re: [Buildroot] [PATCH 1/1] utils/genrandconfig: fix relative
 toolchain_csv paths
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Feb 15, 2023 at 1:48 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 08/02/2023 01:53, James Hilliard wrote:
> > The default toolchain_csv path is a relative path to the buildroot
> > directory.
> >
> > If we run genrandconfig with a cwd that is not the buildroot directory
> > the default toolchain_csv path will be wrong.
> >
> > To fix this prepend the buildroot directory path to the toolchain_csv
> > path whenever the toolchain_csv path is not absolute.
>
>   Well, a typical use case for running genrandconfig with a cwd that is not the
> buildroot directory could be from a br2-external, with a custom csv as argument.
> In that case, we actually *do* want the toolchains_csv to be interpreted
> relative to cwd rather than buildrootdir...
>
>   Since people may already be relying on that behaviour, I think it would be
> better to fix it by just making the default one an absolute path, not anything
> passed explicitly through the commandline.

Changed the default to an absolute path in v2:
https://patchwork.ozlabs.org/project/buildroot/patch/20230215211531.331246-1-james.hilliard1@gmail.com/

>
>   Regards,
>   Arnout
>
> >
> > Fixes:
> > FileNotFoundError: [Errno 2] No such file or directory: 'support/config-fragments/autobuild/toolchain-configs.csv'
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >   utils/genrandconfig | 3 +++
> >   1 file changed, 3 insertions(+)
> >
> > diff --git a/utils/genrandconfig b/utils/genrandconfig
> > index b3576f8a51..b96f2ee6de 100755
> > --- a/utils/genrandconfig
> > +++ b/utils/genrandconfig
> > @@ -115,6 +115,9 @@ def get_toolchain_configs(toolchains_csv, buildrootdir):
> >       toolchain configuration is itself an array of lines of the defconfig.
> >       """
> >
> > +    if not os.path.isabs(toolchains_csv):
> > +        toolchains_csv = os.path.join(buildrootdir, toolchains_csv)
> > +
> >       with open(toolchains_csv) as r:
> >           # filter empty lines and comments
> >           lines = [t for t in r.readlines() if len(t.strip()) > 0 and t[0] != '#']
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
