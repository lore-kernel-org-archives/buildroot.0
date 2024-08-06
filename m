Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C6AAC52D71
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 16:14:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C46CE402F8;
	Tue,  6 Aug 2024 16:14:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K7VwiBX5DJd9; Tue,  6 Aug 2024 16:14:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4E2C40382
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4E2C40382;
	Tue,  6 Aug 2024 16:14:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 417721BF32A
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 16:14:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 396D980FA0
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 16:14:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jc4_2VvgGArf for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 16:14:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7C6CF80F94
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C6CF80F94
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7C6CF80F94
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 16:14:05 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-52efd08e6d9so1450221e87.1
 for <buildroot@buildroot.org>; Tue, 06 Aug 2024 09:14:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722960842; x=1723565642;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LFh0gohwcMP2WvxkVMjyikPnJVKJYU/CxQxun5MYjtE=;
 b=Cw7UW+DJx+pPKrBD8iD8BETIIfOsXrLp6VVdhapBeQ9Z53ompcPDH8hltvuyACX1CH
 PFSyYAKdAaiclIxgNcCjoFC07Ca/zPLFSQFvvUB5FYYVSZ5QPyXvMTFZ+Wbw4GIvEY60
 GzadbxAu1USkkyAz2MpbvPGE+ZKbF4Y1Pgy8iwxRqkoDYsxvdZtv/tibF7gMbt+H4St/
 MBPZpWOFWgSvJdOz/tVLY6AiNNiLPW5BMOGeWznT4YVkxohMdNDr5P1FYk5u+rUhCMDm
 YHcgPXtuPeWCFqQVK1Hink0TAgyyDIoP6t16W6pxDbuF7GhWehUBneb2/698g7MqQRbG
 ZyXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWoH8EwGfjz1AxMwIkhVj6a7PM5g5+51ym0xaIBEvnh5OQ9kfvM/71k7FC/y/i/klOQ2N3TzvdRH9Mg9EIlmEHTPZFyO/k4PA==
X-Gm-Message-State: AOJu0YyQ5mbb2lpGsHubSo+cwklGeAyX0Kc7tqbqfSIXcyq7ilVRl63a
 GotJrj5mJrIAvymGCmViG3c7E12vg5Rng2ncl6buhKULueKBpRaIzY5voZofDIj2RayMKfT/NGd
 ysZKX+Q==
X-Google-Smtp-Source: AGHT+IFsdU+NdzausO2XHBS6xcsNaBaQyu9HjtwKOdh+cyjQlUknXb86leV1Sx1odNinouaccyAv/w==
X-Received: by 2002:a05:6512:b08:b0:52e:9694:3f98 with SMTP id
 2adb3069b0e04-530bb3a05c4mr10317912e87.27.1722960841638; 
 Tue, 06 Aug 2024 09:14:01 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com.
 [209.85.218.47]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bacbcf7b58sm3671844a12.83.2024.08.06.09.14.00
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Aug 2024 09:14:00 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a7d26c2297eso116815766b.2
 for <buildroot@buildroot.org>; Tue, 06 Aug 2024 09:14:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXzxQI2BKgj11YmWzE7EhXw8hdw5oD8WlOWOpuRCleeQEBq4g9xGYHfpKBReigk6iElS6QOk1QcA9cu6n4DaW2251kTrR/NzQ==
X-Received: by 2002:a17:907:94cb:b0:a77:b052:877e with SMTP id
 a640c23a62f3a-a7dc4e5626fmr1212503566b.19.1722960839936; Tue, 06 Aug 2024
 09:13:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240805163133.4126564-1-james.hilliard1@gmail.com>
 <CA+h8R2oQGKFFH-vMX27WUO1uEAGyt4cz9MCwn9Cofwyujx1xDA@mail.gmail.com>
 <20240805223152.09ed915b@windsurf>
 <CADvTj4o_CnzCth+QqoxhVovBRinvYfbMf7r+SWnnY0tfVbKgbw@mail.gmail.com>
 <CA+h8R2obsR-CzMhWDpQ-A0oeEPaG-P=aCwF7BS4J-3eShmHJgg@mail.gmail.com>
 <20240806165050.234235b4@windsurf>
 <CADvTj4pOK8-2YXy0POUg1qOKa1MrjsxbnS-r1F7YMk_YXFmEAQ@mail.gmail.com>
In-Reply-To: <CADvTj4pOK8-2YXy0POUg1qOKa1MrjsxbnS-r1F7YMk_YXFmEAQ@mail.gmail.com>
Date: Tue, 6 Aug 2024 09:13:50 -0700
X-Gmail-Original-Message-ID: <CA+h8R2reErtSWPO1hGpX7tT5Xejb_SNqiuSCnXvJZKHwhzdcZg@mail.gmail.com>
Message-ID: <CA+h8R2reErtSWPO1hGpX7tT5Xejb_SNqiuSCnXvJZKHwhzdcZg@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1722960842; x=1723565642; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LFh0gohwcMP2WvxkVMjyikPnJVKJYU/CxQxun5MYjtE=;
 b=ONtiIqY+6bhvpAhXtdackl6B6DrdRZgS/xvr0eLKcOYv7+8j18lQKVVK0YvqQAYU1B
 wx6xcW5DCMS3IePtMh2WxhMxavXRuzohacW3aTOM/RDzehqQsTt6WwY4+ulpv68VGTCX
 2LqpDJcrT80auw+Iuxs4dkSo2DrOJqzQ5lQhEaV1r3qzmIvnJ5zL97kF3gcw62V2EuTb
 2fClPETyVnyHZUtQBOPNQTFOJaZBk7QlkGxB+XXZV5Nmh6tKErcQLA1bniwQIgkJBqI1
 Vpwy0Lp454lebUjWNGQ7Xao8Z8w9wZzOv8+jtAq4wQ4fbLLSngU2dITzfQW2hV0VvtTj
 42uQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=ONtiIqY+
Subject: Re: [Buildroot] [PATCH v4 1/2] package/pkg-golang.mk: allow
 packages to override download GOPROXY
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Christian Stewart via buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============9168821109987426851=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============9168821109987426851==
Content-Type: multipart/alternative; boundary="000000000000d39dc0061f06145b"

--000000000000d39dc0061f06145b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thomas, James,

On Tue, Aug 6, 2024, 8:49=E2=80=AFAM James Hilliard <james.hilliard1@gmail.=
com>
wrote:

> On Tue, Aug 6, 2024 at 8:50=E2=80=AFAM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> >
> > On Mon, 5 Aug 2024 18:07:37 -0700
> > Christian Stewart <christian@aperture.us> wrote:
> >
> > > My suggestion is to either set GOPROXY=3Ddirect for all packages, or =
for
> > > none of them.
> > >
> > > We could default to setting GOPROXY to empty, which uses the default
> > > Google proxy.
>
> Why weren't we just using the default settings in the first place? I mean
> if upstreams basically only test with default settings here then using
> something different seems problematic in general.
>

> There's reports that GOPROXY=3Ddirect is kinda broken:
> https://drewdevault.com/2021/08/06/goproxy-breaks-go.html
>
> >
> > Could you explain to a Go ignorant like me how is this proxy thing
> > helping in solving this issue? Should a proxy just "speed up" the
> > download? Why does it exhibit a different behavior between a
> > GOPROXY=3Ddirect build and a GOPROXY=3Dsomethingelse ?
>
> Presumably the proxy acts as a cache which prevents breakage if
> the dependency direct source changes or something like that.
>

The reasoning for using GOPROXY=3Ddirect is as follows:

When we enable the proxy, the Go tool will download the sources for the
dependencies from Google.

This is OK in general, but in the context of buildroot we typically
download sources from their upstream releases or Git repositories.

GOPROXY is not broken.

That said, a lot of dependencies cause problems when they change what tag a
git release points to retroactively (rare but happens), or delete a older
commit from their repository (which happens extremely rarely).

The proxy smooths this over by always serving the same thing for a git tag
or commit hash.

The problem with this is, now we have something different being returned
for a dependency than what it says in go.mod.

The go.mod might say we are fetching foo at version 1.0.0, but in fact, if
you go to the repository for foo, and go to version 1.0.0, it could be a
completely different source tree from the one we get in the proxied
download.

This opens up the opportunity for bad actors to hide code in the proxied
version and then retroactively change the git tag to hide that bad code.

For this reason the default was set to always use Git to fetch the
dependencies for Buildroot as we would prefer to detect the mismatch and
deal with it up front, possibly falling back to fetching the .tar.gz from
our own mirror, rather than depend on this behavior from the Google proxy
to always be there and save us.

As you can see we have never had an issue with this setting until now, when
we have an actual broken dependency somewhere, and its when we are adding
the package, not retroactively, that the issue is found and solved.

This is my pitch for keeping GOPROXY=3Ddirect. If we want to use the Google
proxy with all the cavets I mentioned above, we could add the option
HOST_GO_GOPROXY and default it to the Google proxy. But personally I will
still always override this value to direct in my projects.

For now we can just include the latest commit hash of tailscale until they
make a new release and nothing else needs to be changed.

Thanks,
Christian Stewart

--000000000000d39dc0061f06145b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Thomas, James,<br><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 6, 2024, 8:49=E2=80=AFAM Jam=
es Hilliard &lt;<a href=3D"mailto:james.hilliard1@gmail.com">james.hilliard=
1@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Tue, =
Aug 6, 2024 at 8:50=E2=80=AFAM Thomas Petazzoni<br>
&lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com" target=3D"_blank" rel=
=3D"noreferrer">thomas.petazzoni@bootlin.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Mon, 5 Aug 2024 18:07:37 -0700<br>
&gt; Christian Stewart &lt;<a href=3D"mailto:christian@aperture.us" target=
=3D"_blank" rel=3D"noreferrer">christian@aperture.us</a>&gt; wrote:<br>
&gt;<br>
&gt; &gt; My suggestion is to either set GOPROXY=3Ddirect for all packages,=
 or for<br>
&gt; &gt; none of them.<br>
&gt; &gt;<br>
&gt; &gt; We could default to setting GOPROXY to empty, which uses the defa=
ult<br>
&gt; &gt; Google proxy.<br>
<br>
Why weren&#39;t we just using the default settings in the first place? I me=
an<br>
if upstreams basically only test with default settings here then using<br>
something different seems problematic in general.<br></blockquote></div></d=
iv><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><br>
There&#39;s reports that GOPROXY=3Ddirect is kinda broken:<br>
<a href=3D"https://drewdevault.com/2021/08/06/goproxy-breaks-go.html" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://drewdevault.com/2021/0=
8/06/goproxy-breaks-go.html</a><br>
<br>
&gt;<br>
&gt; Could you explain to a Go ignorant like me how is this proxy thing<br>
&gt; helping in solving this issue? Should a proxy just &quot;speed up&quot=
; the<br>
&gt; download? Why does it exhibit a different behavior between a<br>
&gt; GOPROXY=3Ddirect build and a GOPROXY=3Dsomethingelse ?<br>
<br>
Presumably the proxy acts as a cache which prevents breakage if<br>
the dependency direct source changes or something like that.<br></blockquot=
e></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">The reasoning f=
or using GOPROXY=3Ddirect is as follows:</div><div dir=3D"auto"><br></div><=
div dir=3D"auto">When we enable the proxy, the Go tool will download the so=
urces for the dependencies from Google.</div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">This is OK in general, but in the context of buildroot we t=
ypically download sources from their upstream releases or Git repositories.=
</div><div dir=3D"auto"><br></div><div dir=3D"auto">GOPROXY is not broken.<=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">That said, a lot of depe=
ndencies cause problems when they change what tag a git release points to r=
etroactively (rare but happens), or delete a older commit from their reposi=
tory (which happens extremely rarely).</div><div dir=3D"auto"><br></div><di=
v dir=3D"auto">The proxy smooths this over by always serving the same thing=
 for a git tag or commit hash.</div><div dir=3D"auto"><br></div><div dir=3D=
"auto">The problem with this is, now we have something different being retu=
rned for a dependency than what it says in go.mod.</div><div dir=3D"auto"><=
br></div><div dir=3D"auto">The go.mod might say we are fetching foo at vers=
ion 1.0.0, but in fact, if you go to the repository for foo, and go to vers=
ion 1.0.0, it could be a completely different source tree from the one we g=
et in the proxied download.</div><div dir=3D"auto"><br></div><div dir=3D"au=
to">This opens up the opportunity for bad actors to hide code in the proxie=
d version and then retroactively change the git tag to hide that bad code.<=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">For this reason the defa=
ult was set to always use Git to fetch the dependencies for Buildroot as we=
 would prefer to detect the mismatch and deal with it up front, possibly fa=
lling back to fetching the .tar.gz from our own mirror, rather than depend =
on this behavior from the Google proxy to always be there and save us.</div=
><div dir=3D"auto"><br></div><div dir=3D"auto">As you can see we have never=
 had an issue with this setting until now, when we have an actual broken de=
pendency somewhere, and its when we are adding the package, not retroactive=
ly, that the issue is found and solved.</div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">This is my pitch for keeping GOPROXY=3Ddirect. If we want t=
o use the Google proxy with all the cavets I mentioned above, we could add =
the option HOST_GO_GOPROXY and default it to the Google proxy. But personal=
ly I will still always override this value to direct in my projects.</div><=
div dir=3D"auto"><br></div><div dir=3D"auto">For now we can just include th=
e latest commit hash of tailscale until they make a new release and nothing=
 else needs to be changed.</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">Thanks,</div><div dir=3D"auto">Christian Stewart</div></div>

--000000000000d39dc0061f06145b--

--===============9168821109987426851==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9168821109987426851==--
