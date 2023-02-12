Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 602E8C636D3
	for <buildroot@archiver.kernel.org>; Sun, 12 Feb 2023 11:26:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB58360E34;
	Sun, 12 Feb 2023 11:26:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB58360E34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EVJT-slDOqFJ; Sun, 12 Feb 2023 11:26:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 182CD60E2E;
	Sun, 12 Feb 2023 11:26:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 182CD60E2E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 14ECD1BF599
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 11:26:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EFD2E81902
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 11:26:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFD2E81902
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mYfTjrG8tzKH for <buildroot@lists.busybox.net>;
 Sun, 12 Feb 2023 11:26:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7834181775
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7834181775
 for <buildroot@buildroot.org>; Sun, 12 Feb 2023 11:26:11 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 d21-20020a056830005500b0068bd2e0b25bso2956542otp.1
 for <buildroot@buildroot.org>; Sun, 12 Feb 2023 03:26:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5rliafuN8Qmj3oKhweJWpse1q1jBCrCNW6l5SPa10lo=;
 b=E+WoVI7bL2BovIVznelZ0/01FALAgJvI1xh2k8M22JGtDOIZfejWju/xUKnyT8n6/8
 V3esFKb7E3z6l0uDY2cnMvUi6Lry+iEr1DnhUfV2761oGaPpCb2qoOLsDpDdgOOHU9T3
 RKDsKqx03uf2YutR7/zb0+tmWvLrRQAUCoQYyCVsZTPMJYFiZuG2oxBwWtpVMV2h8jOZ
 reBTyPaOgCzaJR23W/PYZeNeN44JXnxHo7U5Yvm3a2EtaYoyfEvwk2iLN679Hb102ZcY
 1GTC6j6ZDxzD2x4BONbCnNLn+YnZNZ7Bph9Qm16DgPg/GEzlq+IpqUkR+SnfJ27tSikr
 TANQ==
X-Gm-Message-State: AO0yUKV9wvqaLonkvRTD3lBUq0JBhTAD2JTGXRmbjLnzC1+QtCIVTLia
 OBeZOZ3pEKmqcbiZWX8FcUu39AEGGI6NJ5EBTI0=
X-Google-Smtp-Source: AK7set8/AzThQ2zCcixyR9TmQhbTNEVLMuS1fWEgFxnuqfAR/T41+NdQgp1FqFBr87ayKML67G7Diasfd7n7CxajzXY=
X-Received: by 2002:a9d:74d7:0:b0:68d:c53a:a0c1 with SMTP id
 a23-20020a9d74d7000000b0068dc53aa0c1mr1334132otl.113.1676201170357; Sun, 12
 Feb 2023 03:26:10 -0800 (PST)
MIME-Version: 1.0
References: <20230211184346.1192333-1-james.hilliard1@gmail.com>
 <20230212091914.GJ2796@scaer>
 <CADvTj4pWs_a+Qbx8ZWZKoUY+H1vJpTEpdZF7Ruz6inV8eCXV-A@mail.gmail.com>
 <20230212110612.GN2796@scaer>
In-Reply-To: <20230212110612.GN2796@scaer>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 12 Feb 2023 04:25:59 -0700
Message-ID: <CADvTj4rW_bbzB-TzoVFnVSR2dFBq6vnCTx715tdqrfHSk2aJLQ@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5rliafuN8Qmj3oKhweJWpse1q1jBCrCNW6l5SPa10lo=;
 b=E4g2pOcLgm9CZsygjgnHGtHGt090HeeDe5cYccbUAOrnaeSWPpWvYHsWba0YGLtLz1
 p5AlDIr4ikS7qPTvCSJY/yaADEOnO7EKYRzKmrw8qLtl1iNixTF/9XD71oQlXKdx97b/
 AfRzp1BCnQL1mb4aX+HRGV3+q7eb2a0/JL++h88d321/OkJgFK1svio9qEM9CQKqaHAi
 9LwCT9ZYPNMh/jsHjUor/fL4ZAQ3EEkMmOALatU+9Fgqye2QATglykPw9B7SrUVLSMWL
 N6aEW7qTub24/PEbuDIO9H1OPMm/CE+KfkzakZkSxsJjbvuAHEotmxWIrstd0ZJBv2FQ
 ce8A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=E4g2pOcL
Subject: Re: [Buildroot] [PATCH 1/1] Makefile: fix rule order for legal-info
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

On Sun, Feb 12, 2023 at 4:06 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> James, All,
>
> On 2023-02-12 03:12 -0700, James Hilliard spake thusly:
> > On Sun, Feb 12, 2023 at 2:19 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > > On 2023-02-11 11:43 -0700, James Hilliard spake thusly:
> > > > This command relies on the clean/prepare operations being in a
> > > > specific order.
> [--SNIP--]
> > > However, in the legal-info case, the rule is definitely not
> > > parallel-safe, and we do really want it and its dependencies *not* to
> > > execute in parallel in fact.
> > >
> > > Indeed, all PKG-legal-info rules will emit a little blurb that is
> > > appended to the manisfest.csv, with commands like:
> > >     echo 'PKG,VERSION,blablsablab' >> manifest.csv
> > >
> > > So, if we run that in parallel, this is going to explode [1].
> > Hmm, might just need a flock operation when doing the manifest.csv
> > file echo append.
>
> Except we probably want, no, sorry: we do want, that the manifest to be
> reproducible (and alphabeticaly sorted), which would not be guaranteed
> with an flock.

Hmm, I thought we were sorting afterwards like this, guess that needs
to be checked:
https://github.com/buildroot/buildroot/blob/59b2e826f2a6c1874c5d032d3a5852326028bc0e/Makefile#L851

>
> > We do something like that for downloads already:
> > https://github.com/buildroot/buildroot/blob/2022.11.1/package/pkg-download.mk#L113
>
> Careful there: the flock is to protect against a concurrent Buildroot
> build, not an internal protection (although it also serves as an
> internal protection, when two packages have the same dl dir, like mesa3d
> and mesa3d-headers).

I assumed it was mostly for packages with the same dl dir, I think it matters
more what it can do rather than what it was designed to do ;).

>
> > > So, I believe in this case, we do not want to use :: rules, but really
> > > ensure that legal-info and all PKG-legal-info rules are never run in
> > > parallel, *and* that they are executed in the order they are listed in
> > > the prerequisites.
> >
> > Well legal-info can take a while to run so it might make sense to make
> > it work in parallel.
>
> I understand that, but I still think legal-info should produce a
> reproducible output, and that can't be guaranteed if all we change is
> using an flock around the manifests.

It should be reproducible if we run a sort right?

>
> Also, legal-info is probably run after a complete build, so the overhead
> of downloading, extracting, and patching, ahs already been paid during
> the build.

Doesn't it still take a little while even if that's done?

>
> We talked about legal-info during the dev-days, and one idea that
> floated was that we need to generate an SBOM of the build, and the
> closest we have now is legal-info. The SBOM should always be generated,
> and I believe legal-info should awlays be generated, so the overhead
> point would be moot (but would be replaced by the overhead of running
> legal-info for every builds...) More needs to be dug on that topic...

Well I think for both cases the faster the generation the better so parallel
where possible has advantages there.

If something is too slow it's less likely to be used/tested.

>
> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
