Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40344CFA466
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 20:37:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 914704013C;
	Wed, 23 Oct 2024 20:37:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dfqs8BFqQEea; Wed, 23 Oct 2024 20:37:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A922140147
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A922140147;
	Wed, 23 Oct 2024 20:37:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C4D7A972
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 20:37:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F25E80D58
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 20:37:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S1QzAqNZ2mYC for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 20:37:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::22a; helo=mail-oi1-x22a.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E9208802EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9208802EB
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E9208802EB
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 20:37:02 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-3e60825aa26so184499b6e.1
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 13:37:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729715821; x=1730320621;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VHL3LlmQE8FsFXTlE9eduho8a37/I4eWHRDifY/Q38c=;
 b=SIbGnHqxRF0smCGekzXN/kK6U8175frl/u673DOATSeJ36ddhFNVwwZy1Lba4ZuJqO
 /54hGWEo9w65ocBz/RuOx4oudEBHrTrfc8qHIVd2Mnu47DEl0BgKgrcNVfb8ugDOCmW9
 g/pr/jtzjkRPGgoF6rGIB1ndhNNubn5ow0jOQZEmO9Sdcr6x9DaY/6lw9w7pBCqUY8PZ
 6Se4ajKVsvtBVNMKDEAIfXKszvSVn/4PlFnl3ELM3aYMAhJPsv9PfoGL8CntXCYvzCWx
 P61xjBL5nWtB0/UmDf1VBqtpKJXB2hc7vpAoFMepHf1nN+veu+YcpVKBsalOu1AoJzAU
 OOuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5wuqwk7pFjXiTbssPA+mcdAEicGYyHxcPr+E4fY9AiwFJsHJDX2d6ffre83NDfdL3MjaFOXEiVo4=@buildroot.org
X-Gm-Message-State: AOJu0YyV0+AJCgmq3vj0MrEbc3tJBUXoeAPJso8TMYYRPmu1wrgxBB0W
 gQURSgC4mHnElNWFOWUr83QzpqGvuZKiH7g4TP7xz2l4KARpO3DCsLgClnOooCks+RcM9xyRIoS
 r
X-Google-Smtp-Source: AGHT+IFPViqXvD3rKsCP3TcfXcQAlBCbuPtPKLpDj3jvH9KfnMI/ASCWKUF9UBkZL9QdJ2HsDJudog==
X-Received: by 2002:a05:6808:2388:b0:3e5:fd7f:c13f with SMTP id
 5614622812f47-3e624520287mr3913126b6e.11.1729715821502; 
 Wed, 23 Oct 2024 13:37:01 -0700 (PDT)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com.
 [209.85.210.48]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-3e6102b6677sm1942597b6e.4.2024.10.23.13.37.00
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Oct 2024 13:37:00 -0700 (PDT)
Received: by mail-ot1-f48.google.com with SMTP id
 46e09a7af769-71811707775so134705a34.3
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 13:37:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVclVcInoZgRQ2TN2d+BBemceIB+kEW1jvWonQrPQdVxcIfxQBsZYploexAMtAR40eD0BDYjwOQzCY=@buildroot.org
X-Received: by 2002:a05:6871:3145:b0:270:172c:32ae with SMTP id
 586e51a60fabf-28ccb9e52bemr4275076fac.32.1729715820646; Wed, 23 Oct 2024
 13:37:00 -0700 (PDT)
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
 <CA+h8R2o--yr=J8bmo6R=rBStYLxwOW+fvEKQ3zfLuKrdZznCCA@mail.gmail.com>
 <20241023212545.28838fc1@windsurf>
 <CADvTj4p6EOBciNjy03REWUTkwA6VRYqVYRiYbeDueNC1gbSS_A@mail.gmail.com>
In-Reply-To: <CADvTj4p6EOBciNjy03REWUTkwA6VRYqVYRiYbeDueNC1gbSS_A@mail.gmail.com>
Date: Wed, 23 Oct 2024 13:36:50 -0700
X-Gmail-Original-Message-ID: <CA+h8R2r0e97u77C9QzSYr_jczF=2zC0+Hz=Y73HUpVh7NGgJUw@mail.gmail.com>
Message-ID: <CA+h8R2r0e97u77C9QzSYr_jczF=2zC0+Hz=Y73HUpVh7NGgJUw@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Christian Stewart via buildroot <buildroot@buildroot.org>,
 Anisse Astier <anisse@astier.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1729715821; x=1730320621; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VHL3LlmQE8FsFXTlE9eduho8a37/I4eWHRDifY/Q38c=;
 b=Ahx3Xr9/dNYw7ul9kSOUVBTXsQOz6Y6zhQEBZg2WPxaHQI5/u89PgCZuiUDVf72z9c
 TMXOnQlScvrzKtNVlPnWFErueNVRuX6Lfut+yEG4ljHVNahnxAYBYc1f6bXIeF3kFuK/
 bxttFfSyLbq1wHaECQ6vr1LB+6FkYOmYtpx09HMh5E+wk7lPyRhFH7ol7K5O7SFJiVA7
 EEassHJsikIWq0dXPiZP1Ezbwcz9QU5bxTQJ62BsO6YJfNH4GoLJlytt/ASooqGUlNOk
 0okoxTNP1XwwI6dZFU/H5Ol0lrguXq5LRTSzR6mxygpMtbKYGeN3xGVwRr+7Q9gLM3t3
 /f0Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=Ahx3Xr9/
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
Content-Type: multipart/mixed; boundary="===============1680804314332245578=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1680804314332245578==
Content-Type: multipart/alternative; boundary="0000000000000d66f406252ad96e"

--0000000000000d66f406252ad96e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

James,

On Wed, Oct 23, 2024, 12:49=E2=80=AFPM James Hilliard <james.hilliard1@gmai=
l.com>
wrote:

> On Wed, Oct 23, 2024 at 1:25=E2=80=AFPM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> >
> > Hello,
> >
> > On Wed, 23 Oct 2024 09:35:16 -0700
> > Christian Stewart via buildroot <buildroot@buildroot.org> wrote:
> >
> > > It is a proxy, not a download URL. The intent of the entire Go module
> > > system is to be based on source control under the hood. We should be
> able
> > > to check out the git repositories of the underlying source without
> having
> > > to use the Google proxy.
> > >
> > > If we make a habit of ignoring these hash mismatches it will become
> very
> > > easy for people to stuff code into a release on GitHub and then chang=
e
> the
> > > tag to something else later, leaving behind the old record in GOPROXY
> and
> > > tricking maintainers into reviewing the wrong code on the modified
> GitHub
> > > tag.
> > >
> > > There must be some reason why your package is having this issue. With
> > > anchore quill package we found that it was git lfs with test files
> causing
> > > the problem.
> >
> > I continue to agree with Christian. If using caching proxies is needed
> > to avoid downloading the "real" upstream because the real upstream has
> > changed/is broken, things are severely wrong.
>
> This is only for dependencies of the project, the issue is they can often
> point to unstable dependency repositories AFAIU and upstreams just
> tend to rely on this caching proxy.
>

That really doesn't make any sense because Go modules versions and go.sum
point to not only a specific release tag, but a specific hash of that tag,
as well as (if not using a release) a commit hash and date.

That system is designed to ensure integrity.

The repository being "unstable dependencies" doesn't give any explanation
for why the checksums are failing.


>
> > Instead, I would recommend to patch netbird to resolve this issue. I
> > know this requires patches to be applied *before* the vendoring step,
> > but that it something that anyway would be useful to have. So I would
> > suggest to find a way to do that. Perhaps some special patch extension,
> > like package/<foo>/*.vendoring-patch or some other better name, that
> > would be applied before the vendoring step takes place?
>
> I'm not actually trying to modify the dependencies specified at all, if
> the only download location for a specified dependency I need is on
> https://proxy.golang.org then I'm not sure how I would patch the
> package to use that instead.
>

You should report the issue to the upstream repository like I did with
tailscale, they will update the dependency to a newer version that doesn't
have the checksums mismatch

Or feel free to post the issue here and we can try to figure out why the
checksums are failing.


Also then what do we do when a package dependency inevitably
> breaks again due to the download location becoming broken, do
> we just keep patching the package over and over again every time
> one of its dependencies breaks?
>

Why is the location breaking at all?...

For this purpose we mirror to the buildroot mirror with all the
dependencies vendored.

Best regards,
Christian

--0000000000000d66f406252ad96e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>James,<br><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Wed, Oct 23, 2024, 12:49=E2=80=AFPM James Hil=
liard &lt;<a href=3D"mailto:james.hilliard1@gmail.com">james.hilliard1@gmai=
l.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Wed, Oct 23=
, 2024 at 1:25=E2=80=AFPM Thomas Petazzoni<br>
&lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com" target=3D"_blank" rel=
=3D"noreferrer">thomas.petazzoni@bootlin.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hello,<br>
&gt;<br>
&gt; On Wed, 23 Oct 2024 09:35:16 -0700<br>
&gt; Christian Stewart via buildroot &lt;<a href=3D"mailto:buildroot@buildr=
oot.org" target=3D"_blank" rel=3D"noreferrer">buildroot@buildroot.org</a>&g=
t; wrote:<br>
&gt;<br>
&gt; &gt; It is a proxy, not a download URL. The intent of the entire Go mo=
dule<br>
&gt; &gt; system is to be based on source control under the hood. We should=
 be able<br>
&gt; &gt; to check out the git repositories of the underlying source withou=
t having<br>
&gt; &gt; to use the Google proxy.<br>
&gt; &gt;<br>
&gt; &gt; If we make a habit of ignoring these hash mismatches it will beco=
me very<br>
&gt; &gt; easy for people to stuff code into a release on GitHub and then c=
hange the<br>
&gt; &gt; tag to something else later, leaving behind the old record in GOP=
ROXY and<br>
&gt; &gt; tricking maintainers into reviewing the wrong code on the modifie=
d GitHub<br>
&gt; &gt; tag.<br>
&gt; &gt;<br>
&gt; &gt; There must be some reason why your package is having this issue. =
With<br>
&gt; &gt; anchore quill package we found that it was git lfs with test file=
s causing<br>
&gt; &gt; the problem.<br>
&gt;<br>
&gt; I continue to agree with Christian. If using caching proxies is needed=
<br>
&gt; to avoid downloading the &quot;real&quot; upstream because the real up=
stream has<br>
&gt; changed/is broken, things are severely wrong.<br>
<br>
This is only for dependencies of the project, the issue is they can often<b=
r>
point to unstable dependency repositories AFAIU and upstreams just<br>
tend to rely on this caching proxy.<br></blockquote></div></div><div dir=3D=
"auto"><br></div><div dir=3D"auto">That really doesn&#39;t make any sense b=
ecause Go modules versions and go.sum point to not only a specific release =
tag, but a specific hash of that tag, as well as (if not using a release) a=
 commit hash and date.</div><div dir=3D"auto"><br></div><div dir=3D"auto">T=
hat system is designed to ensure integrity.</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">The repository being &quot;unstable dependencies&quot; =
doesn&#39;t give any explanation for why the checksums are failing.</div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto"><di=
v class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
&gt;<br>
&gt; Instead, I would recommend to patch netbird to resolve this issue. I<b=
r>
&gt; know this requires patches to be applied *before* the vendoring step,<=
br>
&gt; but that it something that anyway would be useful to have. So I would<=
br>
&gt; suggest to find a way to do that. Perhaps some special patch extension=
,<br>
&gt; like package/&lt;foo&gt;/*.vendoring-patch or some other better name, =
that<br>
&gt; would be applied before the vendoring step takes place?<br>
<br>
I&#39;m not actually trying to modify the dependencies specified at all, if=
<br>
the only download location for a specified dependency I need is on<br>
<a href=3D"https://proxy.golang.org" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://proxy.golang.org</a> then I&#39;m not sure how I would =
patch the<br>
package to use that instead.<br></blockquote></div></div><div dir=3D"auto">=
<br></div><div dir=3D"auto">You should report the issue to the upstream rep=
ository like I did with tailscale, they will update the dependency to a new=
er version that doesn&#39;t have the checksums mismatch</div><div dir=3D"au=
to"><br></div><div dir=3D"auto">Or feel free to post the issue here and we =
can try to figure out why the checksums are failing.</div><div dir=3D"auto"=
><br></div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmai=
l_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">
Also then what do we do when a package dependency inevitably<br>
breaks again due to the download location becoming broken, do<br>
we just keep patching the package over and over again every time<br>
one of its dependencies breaks?<br></blockquote></div></div><div dir=3D"aut=
o"><br></div><div dir=3D"auto">Why is the location breaking at all?...</div=
><div dir=3D"auto"><br></div><div dir=3D"auto">For this purpose we mirror t=
o the buildroot mirror with all the dependencies vendored.</div><div dir=3D=
"auto"><br></div><div dir=3D"auto">Best regards,</div><div dir=3D"auto">Chr=
istian=C2=A0</div></div>

--0000000000000d66f406252ad96e--

--===============1680804314332245578==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1680804314332245578==--
