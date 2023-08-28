Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90ACEC83F11
	for <buildroot@archiver.kernel.org>; Mon, 28 Aug 2023 23:12:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B40940917;
	Mon, 28 Aug 2023 23:12:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B40940917
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9RNtj--WAhV5; Mon, 28 Aug 2023 23:12:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFF74410D2;
	Mon, 28 Aug 2023 23:12:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFF74410D2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C43F11BF295
 for <buildroot@lists.busybox.net>; Mon, 28 Aug 2023 23:12:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9BF46410D2
 for <buildroot@lists.busybox.net>; Mon, 28 Aug 2023 23:12:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BF46410D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5qw8WwOAss1e for <buildroot@lists.busybox.net>;
 Mon, 28 Aug 2023 23:12:24 +0000 (UTC)
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com
 [IPv6:2607:f8b0:4864:20::e33])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 020CE40917
 for <buildroot@buildroot.org>; Mon, 28 Aug 2023 23:12:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 020CE40917
Received: by mail-vs1-xe33.google.com with SMTP id
 ada2fe7eead31-44d45391e84so1733037137.3
 for <buildroot@buildroot.org>; Mon, 28 Aug 2023 16:12:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693264343; x=1693869143;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GddBXOn0uKVoFt3/Okj7/Xu7dsrEah2ffE0wN2CWgoU=;
 b=Rh0Br9CthOP2bIYHLjalfTYRG7u0By7USQaHs1irxhBGXxlPXIzMvlDRlF5tvPifSU
 NlXKIpGfSI9ytZ1b8X9hJVb5HDhOwERzQHut3/mKud7yzaD3hjBU2RGLIAhlxLADcF7S
 NXIlQh0Z6LX/8y+US589NiVY3Ll5JzAziz1wI9Vqcw23m5Lqtc3/E+VPtdZC5+3047Ml
 Un85k+StjqdwDHaoId+u2sPAkCtIwhEwwFKIvh0L/FWsoRHSdW/SRBepi7aYweMt3QMa
 vYiUsFYmoar/kVDN3KFrvxunopQBKP3KcTR8qBtpW2OXtQKiDlge06QSqAOjGpSleFNi
 COxg==
X-Gm-Message-State: AOJu0YylSs5m1Rjbs+I1/EUumcwQlbyt+dJDvBqdlHU1XPXmGTqzq6hV
 dm31jC8XE4t55EkSU33DbxuSAGnG6Gmzg1iPUpjQ5tRhTbc=
X-Google-Smtp-Source: AGHT+IHLn7JKrkXlhmahpsAv9O6V8dks1hJpjXM/9pbD4ZyTbtmQ2aqjr7GySR5SIKoaznsR41IvPwvqYjDAA136O2k=
X-Received: by 2002:a67:f8cf:0:b0:44e:906d:58d with SMTP id
 c15-20020a67f8cf000000b0044e906d058dmr12768168vsp.13.1693264342679; Mon, 28
 Aug 2023 16:12:22 -0700 (PDT)
MIME-Version: 1.0
References: <CABWt4ev1G2+YQ0_TzmH-YM1sb8HkAVEySW_ALfw2vPgrfcy8kA@mail.gmail.com>
 <877cpf7lln.fsf@48ers.dk> <650C7598-7ADF-4A94-8F2B-D8F1D555B12A@heine.tech>
 <CABWt4eu5oYECnC+=68QWgkJywrPKLq5_CDcrFeZm+Um8gRYksA@mail.gmail.com>
 <87r0nn5i61.fsf@48ers.dk>
In-Reply-To: <87r0nn5i61.fsf@48ers.dk>
From: Robert Smigielski <ptdropper@gmail.com>
Date: Mon, 28 Aug 2023 19:12:11 -0400
Message-ID: <CABWt4euGKoLUTuF-waa6SEh=ggLeJtxxUNLwwypz4HF95XA6BA@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693264343; x=1693869143;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GddBXOn0uKVoFt3/Okj7/Xu7dsrEah2ffE0wN2CWgoU=;
 b=nGGT9+56eCV0Bhs1DGnZuiHwEQCY1cnt/JnA2eP95bfoCulTYu9ABHRdTVlKOzGMzG
 TuPvUD/rp7KStgXOzK1Vy/P2VAhpZoqhMaGQar1kucNwN26MggoTM4tL8EYM6gLv1DWL
 Y1998fgwx/TUafdA2f0WkoN2f9MbBeDMl3sM4xcfap24ftS5RVDwVtybxwZ1Dw9dXQse
 sjtAGcHOFlrm8KlIR++H9PLXZWpJBifqisygcUWYuyC6sLFkmGHiGvUuHRKSZ/MwBE1I
 nBIjHun2GmfG/0uOascy5qvBVIcGymShO4VPOfHPfHm2Li7bIHa2BBSAzfG+eavborXF
 fsiA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=nGGT9+56
Subject: Re: [Buildroot] CycloneDX SBOM support
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
Content-Type: multipart/mixed; boundary="===============7180127467008376337=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7180127467008376337==
Content-Type: multipart/alternative; boundary="000000000000a80691060403d387"

--000000000000a80691060403d387
Content-Type: text/plain; charset="UTF-8"

>
> noticed a few things:
>
> - The purl links seems wrong (missing slash between site and filename):
>   "purl": "pkg:generic/busybox@1.36.1?download_url=
> https://www.busybox.net/downloadsbusybox-1.36.1.tar.bz2"
>

Yes this is a defect. I will create an issue, easy to correct. Thanks.
https://github.com/CycloneDX/cyclonedx-buildroot/issues/21



>
> - The patches are not mentioned in the SBOM. Adding the show-info data
>   does bring the CPE identifiers, but E.G. doesn't include _IGNORE_CVES
>   data (that we use to signal that a vulnerability is either not
>   applicable to Buildroot or fixed by a backported patch). I don't know
>   much about cyclonedx, but judging from
>   https://github.com/DependencyTrack/dependency-track/issues/919 it
>   sounds like such info can be represented in the SBOM.
>

That is a possible feature of CycloneDX I need to explore. I am
learning about the details of the spec as well. I will check on this.


>
> - Latest version in git is 1.0.4 (using an non-annotated tag, whereas
>   1.0.3 was annotated), but on pypi there is (only) a 1.0.5, which seems
>   to match the 1.0.4 sources. It is marked as needing python > 3.10, and
>   doesn't pull in the dependencies, so it doesn't work very well
>

I was hoping that everyone would ignore the third digit version error I
introduced accidentally. The only way to get the proper license into pypi
was for me to push up a 1.0.5 with the corrected open source license name.
I had a typo in the license name. It matches 1.0.4 functionally.
I am not an expert on python dependencies. My use of python since the late
1990's showed me many problems in the python dependency Hell. I am under
the impression that the set of python files I pushed to pypi are designed
to take into account the necessary dependencies as a result of the file
called "requirements.txt". I will have to check on this.


>
> - The output filename is used as a prefix, with .json .one.xml and .xml
>   variants. I understand why you do this, but it is a bit confusing
>   still. Is there any real use of the non-JSON formats / available
>   tooling to convert if needed?
>
>
I should have edited the process to remove the file <something>.one.xml
rather than keep it. It will be deleted. The CycloneDX tooling for python
can produce a JSON and an XML file, that is the reason for the two file
formats. Use them as you like.
https://github.com/CycloneDX/cyclonedx-buildroot/issues/20


> Is there a specific reason why you are maintaining it separately from
> Buildroot?
>

Yes, I took over the existing non functional CycloneDX-Buildroot project
that was in place. It was not operational. I needed the solution. I
followed the classic open source project philosophy - "scratch my own itch"
and made it work. I am involved in the security space and for several years
I asked both the Buildroot and CycloneDX communities if/when Buildroot
would be supported AS A PACKAGE MANAGER - that's one of the features. Well
CycloneDX team members showed me the project and asked if I wanted to do
it. So here I am (in Pennsylvania USA).


> Given the fairly tight link to the Buildroot details that

may change in the future (not to mention ease of use/discovery) it seems
> to me to be something that would be interesting to ship together with
> our other python based tooling inside Buildroot?
>

Feel free! I would be thrilled to have the close linkage of the projects. I
have been a Buildroot user for over 10 years on many projects. I still
support a board support package using ancient Buildroot for Linux 2.6.34.X
series boards (ugh!!!). So I am happy to share.

-- 
Robert Smigielski

--000000000000a80691060403d387
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><br><br>
noticed a few things:<br>
<br>
- The purl links seems wrong (missing slash between site and filename):<br>
=C2=A0 &quot;purl&quot;: &quot;pkg:generic/busybox@1.36.1?download_url=3D<a=
 href=3D"https://www.busybox.net/downloadsbusybox-1.36.1.tar.bz2" rel=3D"no=
referrer" target=3D"_blank">https://www.busybox.net/downloadsbusybox-1.36.1=
.tar.bz2</a>&quot;<br></blockquote><div><br></div><div>Yes this is a defect=
. I will create an issue, easy to correct. Thanks.</div><div><a href=3D"htt=
ps://github.com/CycloneDX/cyclonedx-buildroot/issues/21">https://github.com=
/CycloneDX/cyclonedx-buildroot/issues/21</a><br></div><div><br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
- The patches are not mentioned in the SBOM. Adding the show-info data<br>
=C2=A0 does bring the CPE identifiers, but E.G. doesn&#39;t include _IGNORE=
_CVES<br>
=C2=A0 data (that we use to signal that a vulnerability is either not<br>
=C2=A0 applicable to Buildroot or fixed by a backported patch). I don&#39;t=
 know<br>
=C2=A0 much about cyclonedx, but judging from<br>
=C2=A0 <a href=3D"https://github.com/DependencyTrack/dependency-track/issue=
s/919" rel=3D"noreferrer" target=3D"_blank">https://github.com/DependencyTr=
ack/dependency-track/issues/919</a> it<br>
=C2=A0 sounds like such info can be represented in the SBOM.<br></blockquot=
e><div><br></div><div>That is a possible feature of CycloneDX I need to exp=
lore. I am learning=C2=A0about the details of the spec as well. I will chec=
k on this.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
<br>
- Latest version in git is 1.0.4 (using an non-annotated tag, whereas<br>
=C2=A0 1.0.3 was annotated), but on pypi there is (only) a 1.0.5, which see=
ms<br>
=C2=A0 to match the 1.0.4 sources. It is marked as needing python &gt; 3.10=
, and<br>
=C2=A0 doesn&#39;t pull in the dependencies, so it doesn&#39;t work very we=
ll<br></blockquote><div><br></div><div>I was hoping that everyone would ign=
ore the third digit version error I introduced accidentally. The only way t=
o get the proper license into pypi was for me to push up a 1.0.5 with the c=
orrected open source license name. I had a=C2=A0typo in the license name. I=
t matches 1.0.4 functionally.</div><div>I am not an expert on python depend=
encies. My use of python since the late 1990&#39;s showed me many problems =
in the python dependency=C2=A0Hell. I am under the impression that the set =
of python files I pushed to pypi are designed to take into account the nece=
ssary dependencies as a result of the file called &quot;requirements.txt&qu=
ot;. I will have to check on this.</div><div>=C2=A0<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
<br>
- The output filename is used as a prefix, with .json .one.xml and .xml<br>
=C2=A0 variants. I understand why you do this, but it is a bit confusing<br=
>
=C2=A0 still. Is there any real use of the non-JSON formats / available<br>
=C2=A0 tooling to convert if needed?<br>
<br></blockquote><div><br></div><div>I should have edited the process to re=
move the file &lt;something&gt;.one.xml rather than keep it. It will be del=
eted. The CycloneDX tooling for python can produce a JSON and an XML file, =
that is the reason for the two file formats. Use them as you like.</div><di=
v><a href=3D"https://github.com/CycloneDX/cyclonedx-buildroot/issues/20">ht=
tps://github.com/CycloneDX/cyclonedx-buildroot/issues/20</a><br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Is there a specific reason why you are maintaining it separately from<br>
Buildroot?=C2=A0<br></blockquote><div><br></div><div>Yes, I took over the e=
xisting non functional CycloneDX-Buildroot project that was in place. It wa=
s not operational. I needed the solution. I followed the classic open sourc=
e project philosophy - &quot;scratch my own itch&quot; and made it work. I =
am involved in the security space and for several years I asked both the Bu=
ildroot and CycloneDX communities if/when Buildroot would be supported AS A=
 PACKAGE MANAGER - that&#39;s one of the features. Well CycloneDX team memb=
ers showed me the project and asked if I wanted to do it. So here I am (in =
Pennsylvania USA).</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">Given the fairly tight link to the Buildroot details that=
=C2=A0</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">may ch=
ange in the future (not to mention ease of use/discovery) it seems<br>
to me to be something that would be interesting to ship together with<br>
our other python based tooling inside Buildroot?<br></blockquote><div><br><=
/div><div>Feel free! I would be thrilled to have the close linkage of the p=
rojects. I have been a Buildroot user for over 10 years on many projects. I=
 still support a board support package using ancient Buildroot for Linux 2.=
6.34.X series boards (ugh!!!). So I am happy to share.</div><div><br></div>=
</div><span class=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">Robert Sm=
igielski<br><span></span><span></span></div></div></div></div></div>

--000000000000a80691060403d387--

--===============7180127467008376337==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7180127467008376337==--
