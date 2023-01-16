Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB80C46467
	for <buildroot@archiver.kernel.org>; Mon, 16 Jan 2023 13:39:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2249240918;
	Mon, 16 Jan 2023 13:39:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2249240918
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PwSl1hY1F2j2; Mon, 16 Jan 2023 13:39:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1803D40910;
	Mon, 16 Jan 2023 13:39:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1803D40910
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9BA271BF366
 for <buildroot@lists.busybox.net>; Mon, 16 Jan 2023 13:39:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7DED0404CF
 for <buildroot@lists.busybox.net>; Mon, 16 Jan 2023 13:39:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7DED0404CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zebugDQg3lbj for <buildroot@lists.busybox.net>;
 Mon, 16 Jan 2023 13:39:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A939E404C2
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A939E404C2
 for <buildroot@buildroot.org>; Mon, 16 Jan 2023 13:39:32 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id a37so4128373ljq.0
 for <buildroot@buildroot.org>; Mon, 16 Jan 2023 05:39:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ScnS13L1dzRiMYbwLDF+x8aB/v+8A8RY3EneVOXkMiI=;
 b=aXSK2gsekB1vHRuvv8KJxCPBOm01TR5qzq9MH72mndzyU2dJby2m0HW60ekvI2Ctja
 NCXH9hv8LAGa8De6gKoNYe/CQwQgtmXdO5GC+sJGXmUftiQ7YQGUgQ13tEH8+Mll3L2O
 NEzQ4qTNQ7tiPx3wa6HkqyGLyqhK+7sK1j7PGuAIFmeCPDy8obt6zIDuW7C/JDC+Ue7a
 t6rKfg7PAYW9HTwE+ebfTm+jJvykT/TqWoodAPU7F5sKoai5WNlfEmAdjXfLcqrdnI+4
 DdT7SPniG3BDQMgWvXA3A0+RhLlXsb9zvQlhzprcDvweh2epzpzOpOVeXHih/fHC9cgX
 K3Vg==
X-Gm-Message-State: AFqh2kr7t/2xapYmy3rqxaxAZblrZgU1VofPyqp1cWhm8bwQ7/DeFT1T
 1BTLitXIQRTdQJ9LvhJGAnk9idAO+jU2cep47HEhdBHM
X-Google-Smtp-Source: AMrXdXuX1PDBMCjuEtWnSQ+CWn5IwsrQJQoKec+bIhWF4C+rp/IFqyCxcBfOUp+xcVrQ5qz7rrpdrOM14JlyQIKJzFg=
X-Received: by 2002:a05:651c:1681:b0:286:4fb:2531 with SMTP id
 bd1-20020a05651c168100b0028604fb2531mr2467347ljb.161.1673876370253; Mon, 16
 Jan 2023 05:39:30 -0800 (PST)
MIME-Version: 1.0
References: <20230114104832.12702-1-heiko.thiery@gmail.com>
 <20230114104832.12702-3-heiko.thiery@gmail.com>
 <87sfga4p71.fsf@dell.be.48ers.dk>
In-Reply-To: <87sfga4p71.fsf@dell.be.48ers.dk>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Mon, 16 Jan 2023 14:39:18 +0100
Message-ID: <CAEyMn7ZcNNa8vXsyF65gUviuuCvJycZEUKZFopCQF9s2viC42w@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ScnS13L1dzRiMYbwLDF+x8aB/v+8A8RY3EneVOXkMiI=;
 b=RQVGeTSGs59K3TOKmzzMYeBSoJBAv9zSjJ/4Kt+S610mIBN30iaILUZUR/IyJCwslh
 gGZ7hMRiMd6FaKoss6vWe0IuLyXxg4fCBbSgwf3eH7CVrn2ezMEd9P66cAe/vp9N4Xh3
 WzGF7XS8hDvfP/lN3SkDQPh5/DNj7OVDN2+V/beOjbE7xl7W6ILB+Txdgs72O/iTymxb
 1kCLVdjYvyPJfgsCCxgItCnnfErJRGTubTTuCcHaRic/I8ZXk5bb7ugE4X3k9vO3qe9D
 ZJH1A0lkym4dS6beV6yT2NaD2hjyQGQfdvL36TMng2PXie8PvlUcOIzKIHcGYyayumy2
 tePw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=RQVGeTSG
Subject: Re: [Buildroot] [PATCH 3/4] package/libnetconf2: bump version 2.2.12
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
Cc: =?UTF-8?B?SmFuIEt1bmRyw6F0?= <jan.kundrat@cesnet.cz>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,


Am Mo., 16. Jan. 2023 um 13:52 Uhr schrieb Peter Korsgaard
<peter@korsgaard.com>:
>
> >>>>> "Heiko" == Heiko Thiery <heiko.thiery@gmail.com> writes:
>
>  > Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
>  > ---
>  >  package/sysrepo/sysrepo.hash | 2 +-
>  >  package/sysrepo/sysrepo.mk   | 2 +-
>  >  2 files changed, 2 insertions(+), 2 deletions(-)
>
>  > diff --git a/package/sysrepo/sysrepo.hash b/package/sysrepo/sysrepo.hash
>  > index 1db33df626..a90d8259bf 100644
>  > --- a/package/sysrepo/sysrepo.hash
>  > +++ b/package/sysrepo/sysrepo.hash
>  > @@ -1,3 +1,3 @@
>  >  # Locally calculated
>  > -sha256  357a50851e4cc052b484b924ed0a5808c29159a7c9d48d9b1b8c42784c4b6917  sysrepo-2.1.64.tar.gz
>  > +sha256  1bc866f13e41ba5e7e4acd52b5c3d42b1a2a1e032775e0a9b094f3265844cd25  sysrepo-2.2.12.tar.gz
>  >  sha256  88f1b7e5c64d2c113e07105aa9c0fb80639b40287565be1c2afd0949df83d826  LICENSE
>  > diff --git a/package/sysrepo/sysrepo.mk b/package/sysrepo/sysrepo.mk
>  > index 0ed27e3cfb..9da8c22ca2 100644
>  > --- a/package/sysrepo/sysrepo.mk
>  > +++ b/package/sysrepo/sysrepo.mk
>  > @@ -4,7 +4,7 @@
>  >  #
>  >  ################################################################################
>
>  > -SYSREPO_VERSION = 2.1.64
>  > +SYSREPO_VERSION = 2.2.12
>
> NIT: This is sysrepo, not libnetconf2.

damn ...  you're right .. that was a bad mistake.

-- 
Heiko

>
> --
> Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
