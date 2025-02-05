Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26071C02198
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 20:01:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9643E607D3;
	Wed,  5 Feb 2025 20:01:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mxlu_SeYo_fB; Wed,  5 Feb 2025 20:01:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E42760DF6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E42760DF6;
	Wed,  5 Feb 2025 20:01:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6467012A
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 20:01:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 53CFF60DF6
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 20:01:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OB3F_Cz-2FWJ for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 20:01:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::22d; helo=mail-oi1-x22d.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2EFD8607D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EFD8607D3
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2EFD8607D3
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 20:01:52 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id
 5614622812f47-3eb8db8ae9aso82783b6e.1
 for <buildroot@buildroot.org>; Wed, 05 Feb 2025 12:01:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738785711; x=1739390511;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hQvb4KFccxVTinkG1+c3sA8jH4ELM8OWAwtL2EbpKCA=;
 b=LaU1ETHArNByEwWQ6l7l5DrTv+yOsQaoewV2BOF6mb1HetICCAbYuIiCS92ELGMaNB
 q6AxGZUAvxZYRyK6hjPBSgKkWx/kWVjTUKxGuRth6H4UUuSKDSG1mzsaQhvEHJqm3jhL
 wos161apGKRS5dTdHbSnEyrX4KD/BosUGJx7NmsZUcm7rs2qEIi96InS/4dTrvptNlGm
 vOO4MaiQbiS5cAQaqreeUVNrGgsyMUPqm0k9uHczAN0Y/qi9c1sinTm2OY+8qAx+Ijwe
 cN8Z8U8gl1+vKHTtJ3xIHt1f0rA+hCnYZTjNkD9pni9LZIEqi0ROQr8Lkb1ZbFnG94GD
 Yr0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXg1cE70hDchFs4vn0xYyo6ua/Oegf6V0VlqsAr1YYklodN0p7dJw4Q8eLIm5UL9+HC46vIv3K6+oc=@buildroot.org
X-Gm-Message-State: AOJu0YzTshxwnWyAVjfp0Lrkgj1M9kFTZNgMQYtP1XKJ4qruuVH4c5TP
 GPJpR67usTGOj9o1tUQnqIRodO0Dwqmrivaz9djaVsZUteCirLiPSVw3nlGhxGIU87QKZgg2DNP
 I
X-Gm-Gg: ASbGnctC230N9vdC7EP5+AW0Mw95kx2oxt9eU8v+D8f/4dpKJQ/zPAlkEwyYsjFbaGA
 fQIgmK9+df7H9yJmlds+G8vMS9xd43thIdhQDcEuBSSiGMUbXQcTFQq0819eQR9S0Y1d9DBJ4ig
 xtKhkUOUPrlSBMHyY64pEhKp7JD9I2DIEOOAI+Fgt5Iak0am/+pfH7DJurmB5vitE4fEg3uGlnv
 vjl3TtjQNiVDv3X+vEdFP/DnN6B+/KcFJEM2FGEOM2R66i87LSpSBKPBmU3BnLrUFHslreS6U1L
 +0mohntobVv+YG7il5+ItW1u9Y7HT1ODD5JXopwbrCu/rWkGON7TaDY=
X-Google-Smtp-Source: AGHT+IFUEJdmWo4j9nnfEwtFjdoflYH/z/lBxy4xdvMXShotFjeth1kvtCDov1r3MZu0bpfdvICQpA==
X-Received: by 2002:a05:6870:56a9:b0:288:e7f2:e9da with SMTP id
 586e51a60fabf-2b804fcdab9mr2501396fac.20.1738785710820; 
 Wed, 05 Feb 2025 12:01:50 -0800 (PST)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com.
 [209.85.160.44]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2b3562483bdsm4854365fac.26.2025.02.05.12.01.50
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2025 12:01:50 -0800 (PST)
Received: by mail-oa1-f44.google.com with SMTP id
 586e51a60fabf-2b815390155so44389fac.1
 for <buildroot@buildroot.org>; Wed, 05 Feb 2025 12:01:50 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCV46BO11Mbsga8pdZqA9QJbNvXnM4DAXDqEXJuLGXmwPCD29vQOdo/voaZG2l4FARSxOuxSDc34Hq8=@buildroot.org
X-Received: by 2002:a05:6870:558b:b0:29e:499d:1d33 with SMTP id
 586e51a60fabf-2b804f6f6dcmr2856745fac.14.1738785709977; Wed, 05 Feb 2025
 12:01:49 -0800 (PST)
MIME-Version: 1.0
References: <20240805163133.4126564-1-james.hilliard1@gmail.com>
 <CA+h8R2oQGKFFH-vMX27WUO1uEAGyt4cz9MCwn9Cofwyujx1xDA@mail.gmail.com>
 <20240805223152.09ed915b@windsurf>
 <CADvTj4o_CnzCth+QqoxhVovBRinvYfbMf7r+SWnnY0tfVbKgbw@mail.gmail.com>
 <CA+h8R2obsR-CzMhWDpQ-A0oeEPaG-P=aCwF7BS4J-3eShmHJgg@mail.gmail.com>
 <20240806165050.234235b4@windsurf>
 <CADvTj4pOK8-2YXy0POUg1qOKa1MrjsxbnS-r1F7YMk_YXFmEAQ@mail.gmail.com>
 <CA+h8R2reErtSWPO1hGpX7tT5Xejb_SNqiuSCnXvJZKHwhzdcZg@mail.gmail.com>
 <CA+h8R2oJWZw_S08XXhjE--_So0UJohVLWSoj30PpR9z66x8U1A@mail.gmail.com>
 <CADvTj4r5ZAFkyqMctj4fV=vnkqDn2g+oG3g2PjTHJKSkVLQNVQ@mail.gmail.com>
 <edd5e025-798f-4e5b-9d31-baed883a65bf@mind.be>
 <CADvTj4rQsmOq_+AcZU8yQNfod_=kyKtO3HP+F4VZ_PMuYXmd6w@mail.gmail.com>
In-Reply-To: <CADvTj4rQsmOq_+AcZU8yQNfod_=kyKtO3HP+F4VZ_PMuYXmd6w@mail.gmail.com>
Date: Wed, 5 Feb 2025 12:01:39 -0800
X-Gmail-Original-Message-ID: <CA+h8R2oU_CHcTw6aCdyTXGH9F-eEd+nxwzjfcZPhb99ZJvHe0Q@mail.gmail.com>
X-Gm-Features: AWEUYZly9TWKvIGAWHBKnuNkUk8odRFkViJyDhPtZ2G2Yg-gk5B2HZZgzu7JPfE
Message-ID: <CA+h8R2oU_CHcTw6aCdyTXGH9F-eEd+nxwzjfcZPhb99ZJvHe0Q@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1738785711; x=1739390511; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hQvb4KFccxVTinkG1+c3sA8jH4ELM8OWAwtL2EbpKCA=;
 b=oMEHiWxGLmyVcBSo0FFzWh13xoPbyp2A1RVQPgTqc5lVlbnseQNVP29uj7QOZUVckY
 1Gk9q7Xud7jccoyfoAfwLyqetSKL0l8xs1YpM2RTKDva60rXggWnvN6TMJO6kcLdCPtA
 z8vQzQ2rWVC3chUyynAr+eajmZhmrWqA/drEABeJ7jotUOcm9fCvmzcBEOWaMnA5jnGx
 Kvp2z/FUs8oR9ArmcL4XMiS/YqDBKv/mfUrIMVYMsPY3NQbgMwnRgOE6zYGtFYAj9DTc
 VwFT8Ks4pG78U5KBQz+EtlR/oPe0IpHIHN6etcfVtoHdyt8+9jFvfl40dKSZCCUk8Vte
 I56g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=oMEHiWxG
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
Cc: Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Christian Stewart via buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============8873524368284812048=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8873524368284812048==
Content-Type: multipart/alternative; boundary="00000000000095800e062d6a98c4"

--00000000000095800e062d6a98c4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

James,

On Wed, Feb 5, 2025, 10:02=E2=80=AFAM James Hilliard <james.hilliard1@gmail=
.com>
wrote:

I agree with your baseline assertion that the security of these packages
comes from the go.sum hashes.


This is kinda a maintainability nightmare, dependencies will break randomly
> for
> various reasons with GOPROXY=3Ddirect due to unreliable dependency downlo=
ad
> locations/urls.
>

Do you have any examples of cases where this has happened?

If it does happen, we can mirror the package .tar.gz in the buildroot
mirror. Have we ever needed to do this thus far?


For example netbird is still broken with GOPROXY=3Ddirect due to url breaka=
ge
> issues which have not had fixes merged(surprise surprise maintainers don'=
t
> care or test with GOPROXY=3Ddirect seemingly ever as it's not the default=
):
> https://github.com/netbirdio/netbird/pull/3240


I don't agree that your 1 week old PR not being merged yet is a suitable
indicator that maintainers don't care about their dependencies matching
what is in Git.

This will be especially problematic for stable releases as go packages ofte=
n
> have a ton of dependencies, any one of which can break a package build
> when not using the cache thus requiring patches that are unlikely to be
> accepted
> upstream due to package versions in stable release often not being
> maintained
> upstream anymore.
>

The remedy for a dependency not being available anymore via Git is to
mirror the entire package .tar.gz in the buildroot mirror, not to submit
patches.

The submitting patches is part of the initial process of adding or updating
a Go package in buildroot. Consider it due diligence to make sure that any
mismatches between the proxy and the upstream Git source are addressed.

I agree with your logic that:

1) The developers of go projects like Docker or Netbird have pinned
dependencies in go.sum which we can reasonably trust.
2) buildroot maintainers don't typically exhaustively audit all
dependencies.

What I disagree with is;

1) It is impossible to avoid adding a Google hosted service as a dependency
for building Go packages in buildroot.
2) It is not feasible to, at the moment a package is merged into buildroot,
expect new packages or package versions to build cleanly without the proxy
mentioned in 1).

Should a upstream Git source go missing, we can mirror that package .tar.gz
in the buildroot mirror. We can easily reproduce that .tar.gz using the
Google proxy as needed, by setting GOPROXY to the Google proxy and running
"make pkg-extract"

Hopefully this clarifies a bit.

Best regards,
Christian

--00000000000095800e062d6a98c4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>James,<br><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Wed, Feb 5, 2025, 10:02=E2=80=AFAM James Hill=
iard &lt;<a href=3D"mailto:james.hilliard1@gmail.com" target=3D"_blank" rel=
=3D"noreferrer">james.hilliard1@gmail.com</a>&gt; wrote:</div><div dir=3D"l=
tr" class=3D"gmail_attr"><br></div><div dir=3D"ltr" class=3D"gmail_attr">I =
agree with your baseline assertion that the security of these packages come=
s from the go.sum hashes.</div><div dir=3D"ltr" class=3D"gmail_attr"><br></=
div><div dir=3D"ltr" class=3D"gmail_attr"><br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">
This is kinda a maintainability nightmare, dependencies will break randomly=
 for<br>
various reasons with GOPROXY=3Ddirect due to unreliable dependency download=
<br>
locations/urls.<br></blockquote></div></div><div dir=3D"auto"><br></div><di=
v dir=3D"auto">Do you have any examples of cases where this has happened?</=
div><div dir=3D"auto"><br></div><div dir=3D"auto">If it does happen, we can=
 mirror the package .tar.gz in the buildroot mirror. Have we ever needed to=
 do this thus far?</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br><=
/div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">
For example netbird is still broken with GOPROXY=3Ddirect due to url breaka=
ge<br>
issues which have not had fixes merged(surprise surprise maintainers don&#3=
9;t<br>
care or test with GOPROXY=3Ddirect seemingly ever as it&#39;s not the defau=
lt):<br>
<a href=3D"https://github.com/netbirdio/netbird/pull/3240" rel=3D"noreferre=
r noreferrer noreferrer" target=3D"_blank">https://github.com/netbirdio/net=
bird/pull/3240</a></blockquote></div></div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">I don&#39;t agree that your 1 week old PR not being merged ye=
t is a suitable indicator that maintainers don&#39;t care about their depen=
dencies matching what is in Git.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
This will be especially problematic for stable releases as go packages ofte=
n<br>
have a ton of dependencies, any one of which can break a package build<br>
when not using the cache thus requiring patches that are unlikely to be acc=
epted<br>
upstream due to package versions in stable release often not being maintain=
ed<br>
upstream anymore.<br></blockquote></div></div><div dir=3D"auto"><br></div><=
div dir=3D"auto">The remedy for a dependency not being available anymore vi=
a Git is to mirror the entire package .tar.gz in the buildroot mirror, not =
to submit patches.</div><div dir=3D"auto"><br></div><div dir=3D"auto">The s=
ubmitting patches is part of the initial process of adding or updating a Go=
 package in buildroot. Consider it due diligence to make sure that any mism=
atches between the proxy and the upstream Git source are addressed.</div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">I agree with your logic that:</=
div><div dir=3D"auto"><br></div><div dir=3D"auto">1) The developers of go p=
rojects like Docker or Netbird have pinned dependencies in go.sum which we =
can reasonably trust.</div><div dir=3D"auto">2) buildroot maintainers don&#=
39;t typically exhaustively audit all dependencies.</div><div dir=3D"auto">=
<br></div><div dir=3D"auto">What I disagree with is;</div><div dir=3D"auto"=
><br></div><div dir=3D"auto">1) It is impossible to avoid adding a Google h=
osted service as a dependency for building Go packages in buildroot.</div><=
div dir=3D"auto">2) It is not feasible to, at the moment a package is merge=
d into buildroot, expect new packages or package versions to build cleanly =
without the proxy mentioned in 1).</div><div dir=3D"auto"><br></div><div di=
r=3D"auto">Should a upstream Git source go missing, we can mirror that pack=
age .tar.gz in the buildroot mirror. We can easily reproduce that .tar.gz u=
sing the Google proxy as needed, by setting GOPROXY to the Google proxy and=
 running &quot;make pkg-extract&quot;</div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">Hopefully this clarifies a bit.</div><div dir=3D"auto"><br></=
div><div dir=3D"auto">Best regards,</div><div dir=3D"auto">Christian=C2=A0<=
/div></div>

--00000000000095800e062d6a98c4--

--===============8873524368284812048==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8873524368284812048==--
