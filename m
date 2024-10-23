Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFD4BCFA44E
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 16:35:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0A8240033;
	Wed, 23 Oct 2024 16:35:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xL2jlGvf3McC; Wed, 23 Oct 2024 16:35:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1150E4027C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1150E4027C;
	Wed, 23 Oct 2024 16:35:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E895627ED
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 16:35:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C8A9681026
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 16:35:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NHyTOxo3J-It for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 16:35:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c33; helo=mail-oo1-xc33.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AC3A280E57
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC3A280E57
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AC3A280E57
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 16:35:29 +0000 (UTC)
Received: by mail-oo1-xc33.google.com with SMTP id
 006d021491bc7-5ebbfcab9f4so2110870eaf.2
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 09:35:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729701328; x=1730306128;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=b3NmNA1FE6uyW7kWrYrsOlSBkV3YejSzLApvB128OQ0=;
 b=sbV2rajfZBgZJHFzvfpA7ADhtqzCw3Qps6U7Dp2DIH5z0GLKrHO85YPwi+9MyFX8ow
 k9RlTTxnbJkuDJw33t2P1HJ4jH6NakJTeMtpRrubFfsrNT32p8INAbTP6bHKri/S7bZq
 SBPSaTaqzksp4SCMOJMrzyC3fld0oN/nGIDOKdn3UmsbLK1otGglzb/9Uej/o9mnJaqE
 XG9fMD0dyb9c3JI8fUU98l6SHDfWM/rzmxlwQak+DKx+ipwjkX4tjPx/rjgZekEljphZ
 NZtUaVDd2+8FhXvKpCuEwI+3svJpY0tH4tSY4BkfXv7+hGRSWlODo2m6R1aqmQtnCcZT
 OcdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2aa1GtZCAMJURrJ1xUfX+w+y6ev6HoEurtn84w7+ZMVAfA7Ezvx2TKPXPzoNEiIGJe3L4YijWVVs=@buildroot.org
X-Gm-Message-State: AOJu0YxL+WJuEtgca6VxYdcn452HXOVJDViLwQ4J51Nt9boFOiRMfG44
 yM+xQ4uM1TYo0CL1aup73oWAl+ukNmQZYr/FCfUaA9ZP9Ww540qMTbQXlCDUb8qpqDzYDsIDVsF
 2
X-Google-Smtp-Source: AGHT+IGP+JdAHGv17RSHR1aVoB9xYU2hNkxkU90IAkodcseP5YSATlmxZ5/ro0xH0rjxLniNovAOwQ==
X-Received: by 2002:a05:6820:2290:b0:5eb:c5dc:a636 with SMTP id
 006d021491bc7-5ebee4d67f9mr2309128eaf.2.1729701328175; 
 Wed, 23 Oct 2024 09:35:28 -0700 (PDT)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com.
 [209.85.160.42]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-5ebb7adfc2dsm1818884eaf.32.2024.10.23.09.35.27
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Oct 2024 09:35:27 -0700 (PDT)
Received: by mail-oa1-f42.google.com with SMTP id
 586e51a60fabf-28854674160so32808fac.2
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 09:35:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUJmiAoadsEc7ChYGTMUFKL+pTk3B/5sktiHYxlF8jzeevMO+QRpgRTTo+YrCJzR386fVUpWcULqF8=@buildroot.org
X-Received: by 2002:a05:6870:b627:b0:270:74f2:8e97 with SMTP id
 586e51a60fabf-28ccb4a4663mr3801848fac.15.1729701326824; Wed, 23 Oct 2024
 09:35:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240805163133.4126564-1-james.hilliard1@gmail.com>
 <CA+h8R2oQGKFFH-vMX27WUO1uEAGyt4cz9MCwn9Cofwyujx1xDA@mail.gmail.com>
 <20240805223152.09ed915b@windsurf>
 <CADvTj4o_CnzCth+QqoxhVovBRinvYfbMf7r+SWnnY0tfVbKgbw@mail.gmail.com>
 <CA+h8R2obsR-CzMhWDpQ-A0oeEPaG-P=aCwF7BS4J-3eShmHJgg@mail.gmail.com>
 <20240806165050.234235b4@windsurf>
 <CADvTj4pOK8-2YXy0POUg1qOKa1MrjsxbnS-r1F7YMk_YXFmEAQ@mail.gmail.com>
 <CA+h8R2reErtSWPO1hGpX7tT5Xejb_SNqiuSCnXvJZKHwhzdcZg@mail.gmail.com>
 <20240806185731.372f8f3e@windsurf>
 <CA+h8R2rnNhM0nKyZm4_y6ZFrNyn7YzFa7BHeH57cLif38FSrxA@mail.gmail.com>
 <CADvTj4p2heLayPzF7uTK0TLzbbo4C_305vTg9=3W3aCQbAoQGw@mail.gmail.com>
In-Reply-To: <CADvTj4p2heLayPzF7uTK0TLzbbo4C_305vTg9=3W3aCQbAoQGw@mail.gmail.com>
Date: Wed, 23 Oct 2024 09:35:16 -0700
X-Gmail-Original-Message-ID: <CA+h8R2o--yr=J8bmo6R=rBStYLxwOW+fvEKQ3zfLuKrdZznCCA@mail.gmail.com>
Message-ID: <CA+h8R2o--yr=J8bmo6R=rBStYLxwOW+fvEKQ3zfLuKrdZznCCA@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Christian Stewart via buildroot <buildroot@buildroot.org>,
 Anisse Astier <anisse@astier.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1729701328; x=1730306128; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=b3NmNA1FE6uyW7kWrYrsOlSBkV3YejSzLApvB128OQ0=;
 b=H54UpW8dhpr58gW0zpjjKz/jpj484l5N1pxeTEgdILD7a97mQSPgdW5D8LqvrhxFq7
 W246NpUybYvdCmxvE8lhH/TfksHlRBomGx6qJySYQgCdxmlm3J9mMlLR1auh/JfMtF7b
 cK6BZfUUbrPf10/xrvtDOqQaJz+VfmxVoCI6bl8ePEEzIwHuwzHGdaKai8QfDRN9yDSx
 fx/NkzZnFF4MwhwpC+YeuyHmozOFJ3Petw2zfR8OsA+INqF/Z+mcjQ+dHW5Ae5dorjR0
 75vkj9zk1I4rM1JzMtQAf+eNbjEtjENE8AKgXIh8xHfFyhTHN5g3zY5g3ciH01m6fvws
 P6mA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=H54UpW8d
Subject: Re: [Buildroot] [PATCH v4 1/2] package/pkg-golang.mk: allow
 packages to override download GOPROXY
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Content-Type: multipart/mixed; boundary="===============3644324272759243390=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3644324272759243390==
Content-Type: multipart/alternative; boundary="0000000000002734fc0625277939"

--0000000000002734fc0625277939
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

James,

On Wed, Oct 23, 2024, 8:21=E2=80=AFAM James Hilliard <james.hilliard1@gmail=
.com>
wrote:

> On Tue, Aug 6, 2024 at 12:53=E2=80=AFPM Christian Stewart <christian@aper=
ture.us>
> wrote:
> >
> > Thomas,
> >
> > On Tue, Aug 6, 2024, 9:57=E2=80=AFAM Thomas Petazzoni <
> thomas.petazzoni@bootlin.com> wrote:
> >>
> >> > For now we can just include the latest commit hash of tailscale unti=
l
> they
> >> > make a new release and nothing else needs to be changed.
> >>
> >> Don't understand this last part. What is your proposal to fix the
> >> tailscale situation?
> >
> >
> > They fixed the issue upstream and now the main branch of tailscale work=
s
> fine with GOPROXY=3Ddirect. See:
>
> I think trying to get packages to make GOPROXY=3Ddirect work is getting
> rather annoying, while trying to add another package(netbird) I once agai=
n
> ran into this exact same issue.
>
> >
> >
> https://github.com/tailscale/tailscale/issues/12859#issuecomment-22391575=
63
> >
> > It is fine to use the main branch of tailscale here even if it's an
> external service as tailscale keeps compatibility between releases - I ev=
en
> have many machines running quite out of date tailscale clients which stil=
l
> connect and run perfectly. The same can be said for forwards compatibilit=
y.
> >
> > All that I ask with regards to GOPROXY is that:
> >
> > - we do not override it per package,
>
> I'm a bit confused why we would not want to override it per package if
> the breakage is per package.
>
> > - if we do decide to change the default to use Google, please make it a
> configurable option (like BR2_MIRROR) so that I (and other users) can
> override it back to be direct.
>
> If a package is known to not build with GOPROXY=3Ddirect then why would
> one want to override the default GOPROXY rather than a package specific
> GOPROXY?
>


It is a proxy, not a download URL. The intent of the entire Go module
system is to be based on source control under the hood. We should be able
to check out the git repositories of the underlying source without having
to use the Google proxy.

If we make a habit of ignoring these hash mismatches it will become very
easy for people to stuff code into a release on GitHub and then change the
tag to something else later, leaving behind the old record in GOPROXY and
tricking maintainers into reviewing the wrong code on the modified GitHub
tag.

There must be some reason why your package is having this issue. With
anchore quill package we found that it was git lfs with test files causing
the problem.

Best regards,
Christian Stewart

>

--0000000000002734fc0625277939
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>James,<br><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Wed, Oct 23, 2024, 8:21=E2=80=AFAM James Hill=
iard &lt;<a href=3D"mailto:james.hilliard1@gmail.com">james.hilliard1@gmail=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Tue, Aug 6, =
2024 at 12:53=E2=80=AFPM Christian Stewart &lt;<a href=3D"mailto:christian@=
aperture.us" target=3D"_blank" rel=3D"noreferrer">christian@aperture.us</a>=
&gt; wrote:<br>
&gt;<br>
&gt; Thomas,<br>
&gt;<br>
&gt; On Tue, Aug 6, 2024, 9:57=E2=80=AFAM Thomas Petazzoni &lt;<a href=3D"m=
ailto:thomas.petazzoni@bootlin.com" target=3D"_blank" rel=3D"noreferrer">th=
omas.petazzoni@bootlin.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; &gt; For now we can just include the latest commit hash of tailsca=
le until they<br>
&gt;&gt; &gt; make a new release and nothing else needs to be changed.<br>
&gt;&gt;<br>
&gt;&gt; Don&#39;t understand this last part. What is your proposal to fix =
the<br>
&gt;&gt; tailscale situation?<br>
&gt;<br>
&gt;<br>
&gt; They fixed the issue upstream and now the main branch of tailscale wor=
ks fine with GOPROXY=3Ddirect. See:<br>
<br>
I think trying to get packages to make GOPROXY=3Ddirect work is getting<br>
rather annoying, while trying to add another package(netbird) I once again<=
br>
ran into this exact same issue.<br>
<br>
&gt;<br>
&gt; <a href=3D"https://github.com/tailscale/tailscale/issues/12859#issueco=
mment-2239157563" rel=3D"noreferrer noreferrer" target=3D"_blank">https://g=
ithub.com/tailscale/tailscale/issues/12859#issuecomment-2239157563</a><br>
&gt;<br>
&gt; It is fine to use the main branch of tailscale here even if it&#39;s a=
n external service as tailscale keeps compatibility between releases - I ev=
en have many machines running quite out of date tailscale clients which sti=
ll connect and run perfectly. The same can be said for forwards compatibili=
ty.<br>
&gt;<br>
&gt; All that I ask with regards to GOPROXY is that:<br>
&gt;<br>
&gt; - we do not override it per package,<br>
<br>
I&#39;m a bit confused why we would not want to override it per package if<=
br>
the breakage is per package.<br>
<br>
&gt; - if we do decide to change the default to use Google, please make it =
a configurable option (like BR2_MIRROR) so that I (and other users) can ove=
rride it back to be direct.<br>
<br>
If a package is known to not build with GOPROXY=3Ddirect then why would<br>
one want to override the default GOPROXY rather than a package specific<br>
GOPROXY?<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto"><br></div><div dir=3D"auto">It is a proxy, not a download URL. Th=
e intent of the entire Go module system is to be based on source control un=
der the hood. We should be able to check out the git repositories of the un=
derlying source without having to use the Google proxy.</div><div dir=3D"au=
to"><br></div><div dir=3D"auto">If we make a habit of ignoring these hash m=
ismatches it will become very easy for people to stuff code into a release =
on GitHub and then change the tag to something else later, leaving behind t=
he old record in GOPROXY and tricking maintainers into reviewing the wrong =
code on the modified GitHub tag.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">There must be some reason why your package is having this issue. =
With anchore quill package we found that it was git lfs with test files cau=
sing the problem.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Best r=
egards,</div><div dir=3D"auto">Christian Stewart</div><div dir=3D"auto"><di=
v class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--0000000000002734fc0625277939--

--===============3644324272759243390==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3644324272759243390==--
