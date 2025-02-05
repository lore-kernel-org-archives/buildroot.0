Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E1BC02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 12:51:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EAFC44054A;
	Wed,  5 Feb 2025 12:51:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BmeU8suND9xr; Wed,  5 Feb 2025 12:51:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF3DE4175D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF3DE4175D;
	Wed,  5 Feb 2025 12:51:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9FD28CD
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 12:51:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8DD01410E8
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 12:51:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A49GSGa3U0Lh for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 12:51:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::2c; helo=mail-oa1-x2c.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AB6BA40A70
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB6BA40A70
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AB6BA40A70
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 12:51:45 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-29fe83208a4so447802fac.0
 for <buildroot@buildroot.org>; Wed, 05 Feb 2025 04:51:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738759904; x=1739364704;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j04A+VUcS/Gryau9nvR3r0TMmiWvrsO3Xqt5kiVt4zU=;
 b=jmurI59eZOcLqRKQOixuORdyZhJWQK+tTDZXsqmA6z8rrKGDmL1vfaxEtj76piK+i5
 qb7LnXsrCSxjzcm0EpILNy9DA3vwx/B3NuOBFAT5iCGlg1TGzpN6ZiR1kFnO/SEgu6GC
 cwMt3ei9Pv7XpOJnwExjmf2piUZBT0VYQqmhRNC/L0+ykBiNMNEDSkzKtAE6LoE/ybuG
 9POwflQII4b4m5gJ+wze3xKCKuMsZ0jIo1fnQc/PdFXifHpMgJTo9E8+spmCdqmUtd3X
 Z3TmnTG+Jy9YyH0V21oW5sQzNnwfTR9IkeNLQRQijpyFC2Lkf0j1sCZrAZiYBdqQ0KN+
 WhpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW77VRMQwTb4FG2i9VoeqFYJa+uwm4ENu0KWQpB4ro/3kw0p6KVbfJBuJQJcxUk0I4YOe+hj6uRVCU=@buildroot.org
X-Gm-Message-State: AOJu0YySv96zhOb1gKGyAz3aiMV++XuO1NOLIMU/omaCGRxI8NDfbwJ1
 Pe9zgjHxF7sSP4zQcWu0CxytMKG55LzXlJ6BeaWsT7ix5d0DeE2hfWqu0lr3hfa8aqBxvVok1kG
 y
X-Gm-Gg: ASbGnctWF2sCIwPRGdnIxp68JPJSMrONd3KB3yYVuRMHB4UobqCgtGGGM31mhXz+iw0
 QEPcgd4XnF4yEXlOCz+vOpI0GqSpMHaYcqaS58y2NiUBxyUwgeAut098DTQzeRoVGus+K2J5qFB
 pTiq09JsXJS5CWUoK4r21/Cwf99Z+mZLeJgTNWQv/Crs0/v/jIqmsMyvJW22XtYHb24Wx7GDUJE
 tR8mK741RKMCD8GjY6+bKnL06V5iWo2XK4DCsp1sts4Be9aVwh17NDSwHdXPxFAwhskOMNHb9eK
 5DGunUjWplKcNqMnPCXrHoM9dmYEgvL46F3s3w3WenUTT1K6Gqv66kg=
X-Google-Smtp-Source: AGHT+IGAnE0PxWY3VPlGFtqGVDQF7Vc1T/QsMNDsxwT1HRYsPcG+Juqgt+zqFtIAL6rRbmxPbLcgVQ==
X-Received: by 2002:a05:6870:ec8a:b0:29e:1962:7a23 with SMTP id
 586e51a60fabf-2b8047d12fcmr1861989fac.4.1738759904389; 
 Wed, 05 Feb 2025 04:51:44 -0800 (PST)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com.
 [209.85.160.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2b356112c01sm4651542fac.6.2025.02.05.04.51.43
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2025 04:51:43 -0800 (PST)
Received: by mail-oa1-f49.google.com with SMTP id
 586e51a60fabf-29fae583cc8so454623fac.1
 for <buildroot@buildroot.org>; Wed, 05 Feb 2025 04:51:43 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUPjaRfg2v+DMQbbu33R5iYdEAy8/lga22wEsVGBh3I1N5jP6zns1G+U/RXwg3k+9CmGp/F6Ghj/1M=@buildroot.org
X-Received: by 2002:a05:6870:9690:b0:29d:c9f6:efdc with SMTP id
 586e51a60fabf-2b804a75d61mr1837497fac.17.1738759903384; Wed, 05 Feb 2025
 04:51:43 -0800 (PST)
MIME-Version: 1.0
References: <20240805163133.4126564-1-james.hilliard1@gmail.com>
 <CA+h8R2oQGKFFH-vMX27WUO1uEAGyt4cz9MCwn9Cofwyujx1xDA@mail.gmail.com>
 <20240805223152.09ed915b@windsurf>
 <CADvTj4o_CnzCth+QqoxhVovBRinvYfbMf7r+SWnnY0tfVbKgbw@mail.gmail.com>
 <CA+h8R2obsR-CzMhWDpQ-A0oeEPaG-P=aCwF7BS4J-3eShmHJgg@mail.gmail.com>
 <20240806165050.234235b4@windsurf>
 <CADvTj4pOK8-2YXy0POUg1qOKa1MrjsxbnS-r1F7YMk_YXFmEAQ@mail.gmail.com>
 <CA+h8R2reErtSWPO1hGpX7tT5Xejb_SNqiuSCnXvJZKHwhzdcZg@mail.gmail.com>
In-Reply-To: <CA+h8R2reErtSWPO1hGpX7tT5Xejb_SNqiuSCnXvJZKHwhzdcZg@mail.gmail.com>
Date: Wed, 5 Feb 2025 04:51:34 -0800
X-Gmail-Original-Message-ID: <CA+h8R2oJWZw_S08XXhjE--_So0UJohVLWSoj30PpR9z66x8U1A@mail.gmail.com>
X-Gm-Features: AWEUYZkB6dmREUwUht98o3E1knYMYggWhbqJdDZRMYG-ojEBL1CdwQkty6-1eCE
Message-ID: <CA+h8R2oJWZw_S08XXhjE--_So0UJohVLWSoj30PpR9z66x8U1A@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Christian Stewart via buildroot <buildroot@buildroot.org>,
 Anisse Astier <anisse@astier.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1738759904; x=1739364704; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=j04A+VUcS/Gryau9nvR3r0TMmiWvrsO3Xqt5kiVt4zU=;
 b=cwGXMVHSu1FtoUe0lNjRtTUt4jE2y/kywPgLxDvGWVJ0q8MAkzkE1mIYQVycAV756l
 m6IcxtrXs6EkZtR7JcB8PIEh/tKi5zrw5PEvDViJbMXy1scGEDP6AHj5q4Wf0YM20R0f
 o7vfbyEvLwRucGEOPuaNF6nCpWhy8oPi7NqwJvJSNNlEJ7lBTJitQmt/AV+tpqS4zDjC
 kayW0iwoknnGwdQHnyXingLsS2Py/zRFWrl8OTQwpPqOfoPMM0vahplFGiZgHmAxVq+c
 1ZBztXoEdWdfmqCvnuiDFAsr8GzmduvXKGKRgKMGE/XXjyca57HMTGLvhV2CaU90GBkI
 kQAQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=cwGXMVHS
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
Content-Type: multipart/mixed; boundary="===============2987432468699542675=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2987432468699542675==
Content-Type: multipart/alternative; boundary="00000000000064246d062d649653"

--00000000000064246d062d649653
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

I wanted to follow up on this old topic of GOPROXY.

Below I mention a potential security issue where someone uploads a
malicious package version to the proxy and then changes the git tag to
remove the malware. In this attack mode the maintainers might check the git
tag, see no malware, and add a package with that tag.

The problem is that Go fetches from GOPROXY and silently ignores the
mismatch.

This was the reason why I have always lobbied to keep the default as
GOPROXY=3Ddirect in buildroot, as this avoids the case where the git repo
mismatches the proxy without visibility at the git level.

This attack has been used in the wild now:

https://socket.dev/blog/malicious-package-exploits-go-module-proxy-caching-=
for-persistence

See below for my reasoning

On Tue, Aug 6, 2024, 9:13=E2=80=AFAM Christian Stewart <christian@aperture.=
us>
wrote:

> Thomas, James,
>
> On Tue, Aug 6, 2024, 8:49=E2=80=AFAM James Hilliard <james.hilliard1@gmai=
l.com>
> wrote:
>
>> On Tue, Aug 6, 2024 at 8:50=E2=80=AFAM Thomas Petazzoni
>> <thomas.petazzoni@bootlin.com> wrote:
>> >
>> > On Mon, 5 Aug 2024 18:07:37 -0700
>> > Christian Stewart <christian@aperture.us> wrote:
>> >
>> > > My suggestion is to either set GOPROXY=3Ddirect for all packages, or=
 for
>> > > none of them.
>> > >
>> > > We could default to setting GOPROXY to empty, which uses the default
>> > > Google proxy.
>>
>> Why weren't we just using the default settings in the first place? I mea=
n
>> if upstreams basically only test with default settings here then using
>> something different seems problematic in general.
>>
>
>> There's reports that GOPROXY=3Ddirect is kinda broken:
>> https://drewdevault.com/2021/08/06/goproxy-breaks-go.html
>>
>> >
>> > Could you explain to a Go ignorant like me how is this proxy thing
>> > helping in solving this issue? Should a proxy just "speed up" the
>> > download? Why does it exhibit a different behavior between a
>> > GOPROXY=3Ddirect build and a GOPROXY=3Dsomethingelse ?
>>
>> Presumably the proxy acts as a cache which prevents breakage if
>> the dependency direct source changes or something like that.
>>
>
> The reasoning for using GOPROXY=3Ddirect is as follows:
>
> When we enable the proxy, the Go tool will download the sources for the
> dependencies from Google.
>
> This is OK in general, but in the context of buildroot we typically
> download sources from their upstream releases or Git repositories.
>
> GOPROXY is not broken.
>
> That said, a lot of dependencies cause problems when they change what tag
> a git release points to retroactively (rare but happens), or delete a old=
er
> commit from their repository (which happens extremely rarely).
>
> The proxy smooths this over by always serving the same thing for a git ta=
g
> or commit hash.
>
> The problem with this is, now we have something different being returned
> for a dependency than what it says in go.mod.
>
> The go.mod might say we are fetching foo at version 1.0.0, but in fact, i=
f
> you go to the repository for foo, and go to version 1.0.0, it could be a
> completely different source tree from the one we get in the proxied
> download.
>
> This opens up the opportunity for bad actors to hide code in the proxied
> version and then retroactively change the git tag to hide that bad code.
>
> For this reason the default was set to always use Git to fetch the
> dependencies for Buildroot as we would prefer to detect the mismatch and
> deal with it up front, possibly falling back to fetching the .tar.gz from
> our own mirror, rather than depend on this behavior from the Google proxy
> to always be there and save us.
>
> As you can see we have never had an issue with this setting until now,
> when we have an actual broken dependency somewhere, and its when we are
> adding the package, not retroactively, that the issue is found and solved=
.
>
> This is my pitch for keeping GOPROXY=3Ddirect. If we want to use the Goog=
le
> proxy with all the cavets I mentioned above, we could add the option
> HOST_GO_GOPROXY and default it to the Google proxy. But personally I will
> still always override this value to direct in my projects.
>


Best regards,
Christian Stewart

>

--00000000000064246d062d649653
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi all,</div><div dir=3D"auto"><br></div><div dir=3D=
"auto">I wanted to follow up on this old topic of GOPROXY.</div><div dir=3D=
"auto"><br></div><div dir=3D"auto">Below I mention a potential security iss=
ue where someone uploads a malicious package version to the proxy and then =
changes the git tag to remove the malware. In this attack mode the maintain=
ers might check the git tag, see no malware, and add a package with that ta=
g.</div><div dir=3D"auto"><br></div><div dir=3D"auto">The problem is that G=
o fetches from GOPROXY and silently ignores the mismatch.</div><div dir=3D"=
auto"><br></div><div dir=3D"auto">This was the reason why I have always lob=
bied to keep the default as GOPROXY=3Ddirect in buildroot, as this avoids t=
he case where the git repo mismatches the proxy without visibility at the g=
it level.</div><div dir=3D"auto"><br></div><div dir=3D"auto">This attack ha=
s been used in the wild now:</div><div dir=3D"auto"><br></div><div dir=3D"a=
uto"><a href=3D"https://socket.dev/blog/malicious-package-exploits-go-modul=
e-proxy-caching-for-persistence">https://socket.dev/blog/malicious-package-=
exploits-go-module-proxy-caching-for-persistence</a></div><div dir=3D"auto"=
><br></div><div dir=3D"auto">See below for my reasoning<br><br><div class=
=3D"gmail_quote gmail_quote_container" dir=3D"auto"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Aug 6, 2024, 9:13=E2=80=AFAM Christian Stewart &lt;=
<a href=3D"mailto:christian@aperture.us">christian@aperture.us</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div dir=3D"auto"><div>Thomas, J=
ames,<br><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Tue, Aug 6, 2024, 8:49=E2=80=AFAM James Hilliard &lt;<a href=3D"mailt=
o:james.hilliard1@gmail.com" target=3D"_blank" rel=3D"noreferrer">james.hil=
liard1@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On =
Tue, Aug 6, 2024 at 8:50=E2=80=AFAM Thomas Petazzoni<br>
&lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com" rel=3D"noreferrer noref=
errer" target=3D"_blank">thomas.petazzoni@bootlin.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Mon, 5 Aug 2024 18:07:37 -0700<br>
&gt; Christian Stewart &lt;<a href=3D"mailto:christian@aperture.us" rel=3D"=
noreferrer noreferrer" target=3D"_blank">christian@aperture.us</a>&gt; wrot=
e:<br>
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
=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https://drewdevault=
.com/2021/08/06/goproxy-breaks-go.html</a><br>
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
/div></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto"=
><br></div><div dir=3D"auto">Best regards,</div><div dir=3D"auto">Christian=
 Stewart</div><div dir=3D"auto"><div class=3D"gmail_quote gmail_quote_conta=
iner" dir=3D"auto"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--00000000000064246d062d649653--

--===============2987432468699542675==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2987432468699542675==--
