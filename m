Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E5ECEB64DC
	for <buildroot@archiver.kernel.org>; Mon, 17 Jul 2023 17:45:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA91860E59;
	Mon, 17 Jul 2023 17:45:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA91860E59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uAivcFCG20XC; Mon, 17 Jul 2023 17:45:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58CE160E1A;
	Mon, 17 Jul 2023 17:44:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58CE160E1A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 085E71BF337
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 17:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E2BCE813D7
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 17:44:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2BCE813D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6NUHEbT3lXkE for <buildroot@lists.busybox.net>;
 Mon, 17 Jul 2023 17:44:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A5AD813D5
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2A5AD813D5
 for <buildroot@buildroot.org>; Mon, 17 Jul 2023 17:44:56 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2b8392076c9so57068921fa.1
 for <buildroot@buildroot.org>; Mon, 17 Jul 2023 10:44:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689615894; x=1692207894;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Nob6XBGH3V9b+hobB8RZ+rVgsCFIiAQKS/NdZqs9Gfg=;
 b=knVzLBG2OC2gMgoBp+Z+e90JTHWMh2pENdVmUFPej5LKM68XjYs7Er82Cfd/HKYujA
 eIYIpCUCOy9uo8S/r7cLc5Sq93jaYk6RH6BjvNutcxDvrbR+bHyVfEhbmf/rrUzH7wFP
 Vw2awyr4YFn/+aAbC65B40OaMw+zuDn39CvMm9rZiNqSFBpMZCHu3APMyDRJzrvgwswq
 AjaHgFA5H/DQKUGiN1k7Ps6qEPjGu/SKPKWzzcJdVdMx4aqrE7V7AyfqvICIiKWEUcXp
 rGDBtJ134CAlKcF5f2vBgBKdziaEUrwMQ9byys04KmPtzP1veslXQxtm6Zs2r/hO7dA+
 coQw==
X-Gm-Message-State: ABy/qLar8crLwls1Hnpuy18vh0sIX/bvOdgNGunoNGipNseLVEzHIiNn
 9MkYLJSEG8SBzT9PRUiPbWvvC95onUeeAhWI2tE=
X-Google-Smtp-Source: APBJJlHZV9Sorw1MsraMoXMb6J3Mvb7t2IQUXj6Y0FZnj5QubVbGlSNnYELcUD1aNCpG4df+5jIau6+5XIB144uOAoM=
X-Received: by 2002:a2e:9f43:0:b0:2b6:d4f7:b7fa with SMTP id
 v3-20020a2e9f43000000b002b6d4f7b7famr8557787ljk.5.1689615893604; Mon, 17 Jul
 2023 10:44:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAFSsvmqOZCu+nRz4Ym-h1zHV53BEgdGkLahXpaiDu=-T17qNpA@mail.gmail.com>
 <70d47a45-5570-9cd3-4647-b6ce223ef716@mind.be>
In-Reply-To: <70d47a45-5570-9cd3-4647-b6ce223ef716@mind.be>
From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 17 Jul 2023 10:44:42 -0700
Message-ID: <CAFSsvmq9rBQhJ+bTSDgyrke-LNyUvgaG9Y-x_-NZ6w4HYHui7A@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689615894; x=1692207894;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Nob6XBGH3V9b+hobB8RZ+rVgsCFIiAQKS/NdZqs9Gfg=;
 b=ot5T6rVuklumIFgPfUa9pptywPQZbYDNZxXk5DpuZOCioDDgCSwAodK6JPgXOH1BIz
 nMaadBT6qwR/iuo6YV9DVWgXwp5s+G2nOoKqXo7en6Kuwgp+LDyLVexiZjbvEUOUuNGv
 KEDmHkGDoC6ght0wRsdGbgQ9sLrGB81LyVxRo5Bf4WOvUBxaoikvviQCbKL9cXB7aO0B
 OWG8i0a+AeUgRRakUJqjh5a9+HdhwTHXRy8blFo1RV0EvUDBZjVLhuqQZ9MmjuXtdlZF
 kALc/YllUe9HXNjDn+/2Act3Blw1BEqOQwyvMsyXQaQG7QJKfu32o0yYb8tD5MNgNE/7
 ea5g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=ot5T6rVu
Subject: Re: [Buildroot] Flutter-engine package help wanted.
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============2857101579483832760=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2857101579483832760==
Content-Type: multipart/alternative; boundary="000000000000252d750600b25bb8"

--000000000000252d750600b25bb8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey Arnout!

On Sun, Jul 16, 2023 at 8:32=E2=80=AFAM Arnout Vandecappelle <arnout@mind.b=
e> wrote:

>
>
> On 15/07/2023 05:02, Adam Duskett wrote:
> > Hello! I have a task to port Flutter to Buildroot and to make the
> packages
> > suitable for the master branch.
> >
> > I have talked with Yann in IRC about the problems facing the first
> package,
> > flutter-engine [https://github.com/flutter/engine
> > <https://github.com/flutter/engine>]. However, after another full
> > day of hacking away at the package, it's time to talk about a significa=
nt
> > problem I must overcome.
> >
> > Here is a summary of the issue I am facing and the main reason for the
> email:
> >
> > Flutter is developed and maintained by Google.
> > Of course, it stands to reason that Flutter does not use a conventional
> > configure/build system. Oh no, it couldn't be that easy. Instead,
> Flutter uses
> > gclient and gn from the chromium depot_tools repository, which contains
> all
> > sorts of exciting utilities. One of which is gclient.
>
>   My first reaction was: oh, we'll need specific download infrastructure
> like
> for go and cargo...
>
> > What is gclient? From:
> https://www.chromium.org/developers/how-tos/depottools
> > <https://www.chromium.org/developers/how-tos/depottools>
> >
> > gclient is a Python script to manage a workspace of modular dependencie=
s
> that
> > are each checked out independently from different subversion or git
> > repositories. Features include:
> >
> >    - Dependencies can be specified on a per-OS basis.
> >    - Dependencies can be specified relative to their parent dependency.
> >    - Variables can be used to abstract concepts.
> >    - Hooks can be specified to be run after a checkout.
> >    - .gclient and DEPS are Python scripts. You can hack in easily or ad=
d
> >       additional configuration data.
>
>   I haven't looked at the details, but it sounds like even with separate
> download infrastructure it may be tricky. It sounds like it might be
> difficult
> to decouple the download from the configuration and/or build..
>


>   (And also bad: this stuff is running arbitrary code before checking the
> hash.
> But we have the same problem with go and cargo already as well.)
>
> Extremely difficult unfortunately. :(


> > .gclient file: It's the primary file. It is, in fact, a Python script. =
It
> > specifies the following variables:
> >
> >    - solutions: an array of dictionaries specifying the projects that
> will be
> >                 fetched.
> >    - hooks: additional hooks to be run when this meta checkout is synce=
d.
> >    - target_os: an optional array of (target) operating systems to fetc=
h
> >                 OS-specific dependencies for.
> >    - cache_dir: Primarily for bots, multiple working sets use a single
> git
> >                 cache.
> >
> >
> > Why is this a significant issue?
> >
> > The release tarballs from https://github.com/flutter/engine
> > <https://github.com/flutter/engine> are in no state to
> > compile! No, they are only for the use of gclient to download and build=
 a
> > source directory structure suitable to build the Flutter engine! If you
> > download, extract and attempt to run
> > ./tools/gn --no-goma --no-prebuilt-dart-sdk,
> > you receive the error message:
> > No such file or directory: 'flutter/flutter/third_party/gn/gn.'
> >
> > But wait! Wasn't the gn binary just called? No, that's a wrapper in the
> Flutter
> > source tree that formats arguments to call the real gn binary. The real
> gn is
> > not provided in the tarball but is downloaded via gclient
> > (among many other repositories.)
> >
> > The above leads to the question: What do we do about this? We can't use
> the
> > existing download infrastructure to download the tarball from Git Hub,
> as that
> > isn't meant for us. The gclient download works if called out directly
> via a
> > pre_download hook; however, this leads to other issues in recreating a
> > consistent tarball because gclient writes the date to various files all
> around
> > the directory, thus changing the shasum every time I attempt to generat=
e
> a
> > tarball. I can sed the dates in a flutter-engine-gen-tarball script I'v=
e
> made,
>
>   You could also use fakedate to pre-set the date to a fixed value.
>
>   Or could you patch gclient to not do that rewriting?
>
> I didn't think about fakedate, I'll play around with it!


> > which solves the problem; however, there is one last hurdle to overcome=
:
> When I
> > compress the directory created by gclient, any .git folder in a
> subdirectory
> > also changes when running mk_tar_gz from the script.
>
>   Huh? That shouldn't happen... mk_tar_gz doesn't do anything that
> modifies the
> filesystem, other than changing access time filestamps. And it certainly
> doesn't
> do anything specific for .git directories.
>
> Yeah, I misremembered. It's actually gclient (again) creating new
checkouts on a clone with the current date.


> > The .git directories, of
> > course, can be removed, and that DOES create a reproducible tarball, bu=
t
> the
> > build system relies on the .git directories to fill in a bunch of
> information
> > before configuring, causing failures.
> >
> > I won't ask the best course of action because anything we decide will b=
e
> pretty
> > ugly, thanks to Google and its decisions. Instead, I will ask, what is
> the
> > least-bad solution that can be upstreamed to the master branch?
>
>   If we're going for ugly solutions: one option would be to download
> everything
> that gclient downloads in a pre-download hook, create an extra tarball ou=
t
> of
> it, and in a pre-extract hook extract that tarball. That way, what we
> present to
> gn in the configure and build steps looks like an already-expanded gclien=
t
> tree
> and it won't download again. It's of course horrible to find out what all
> needs
> to be downloaded and where to put this stuff, but you can e.g. write a
> script
> that monkey-patches gclient to get URLs instead of actually downloading.
> But in
> the end, I guess there's not much improvement compared to just doing the
> download by calling gclient/gn.
>

A pre-download hook is exactly what I used at first, but creating a
reproducible
tarball was.. painful. I wasn't aware of fakedate, however, so I'll give
that a try!

  Regards,
>   Arnout
>
>
> >
> > If you want to play around with any of this, you can clone
> > git@gitlab.com:aduskett/buildroot-flutter.git and build the
> flutter_defconfig.
> >
> > Thanks!
> > Adam
>

--000000000000252d750600b25bb8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hey Arnout!</div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Sun, Jul 16, 2023 at 8:32=E2=80=AFAM Ar=
nout Vandecappelle &lt;<a href=3D"mailto:arnout@mind.be">arnout@mind.be</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 15/07/2023 05:02, Adam Duskett wrote:<br>
&gt; Hello! I have a task to port Flutter to Buildroot and to make the pack=
ages<br>
&gt; suitable for the master branch.<br>
&gt; <br>
&gt; I have talked with Yann in IRC about the problems facing the first pac=
kage,<br>
&gt; flutter-engine [<a href=3D"https://github.com/flutter/engine" rel=3D"n=
oreferrer" target=3D"_blank">https://github.com/flutter/engine</a> <br>
&gt; &lt;<a href=3D"https://github.com/flutter/engine" rel=3D"noreferrer" t=
arget=3D"_blank">https://github.com/flutter/engine</a>&gt;]. However, after=
 another full<br>
&gt; day of hacking away at the package, it&#39;s time to talk about a sign=
ificant<br>
&gt; problem I must overcome.<br>
&gt; <br>
&gt; Here is a summary of the issue I am facing and the main reason for the=
 email:<br>
&gt; <br>
&gt; Flutter is developed and maintained by Google.<br>
&gt; Of course, it stands to reason that Flutter does not use a conventiona=
l<br>
&gt; configure/build system. Oh no, it couldn&#39;t be that easy. Instead, =
Flutter uses<br>
&gt; gclient and gn from the chromium depot_tools repository, which contain=
s all<br>
&gt; sorts of exciting utilities. One of which is gclient.<br>
<br>
=C2=A0 My first reaction was: oh, we&#39;ll need specific download infrastr=
ucture like <br>
for go and cargo...<br>
<br>
&gt; What is gclient? From: <a href=3D"https://www.chromium.org/developers/=
how-tos/depottools" rel=3D"noreferrer" target=3D"_blank">https://www.chromi=
um.org/developers/how-tos/depottools</a> <br>
&gt; &lt;<a href=3D"https://www.chromium.org/developers/how-tos/depottools"=
 rel=3D"noreferrer" target=3D"_blank">https://www.chromium.org/developers/h=
ow-tos/depottools</a>&gt;<br>
&gt; <br>
&gt; gclient is a Python script to manage a workspace of modular dependenci=
es that<br>
&gt; are each checked out independently from different subversion or git<br=
>
&gt; repositories. Features include:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 - Dependencies can be specified on a per-OS basis.<br>
&gt;=C2=A0 =C2=A0 - Dependencies can be specified relative to their parent =
dependency.<br>
&gt;=C2=A0 =C2=A0 - Variables can be used to abstract concepts.<br>
&gt;=C2=A0 =C2=A0 - Hooks can be specified to be run after a checkout.<br>
&gt;=C2=A0 =C2=A0 - .gclient and DEPS are Python scripts. You can hack in e=
asily or add<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0additional configuration data.<br>
<br>
=C2=A0 I haven&#39;t looked at the details, but it sounds like even with se=
parate <br>
download infrastructure it may be tricky. It sounds like it might be diffic=
ult <br>
to decouple the download from the configuration and/or build..<br></blockqu=
ote><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 (And also bad: this stuff is running arbitrary code before checking =
the hash. <br>
But we have the same problem with go and cargo already as well.)<br>
<br></blockquote><div>Extremely difficult unfortunately. :(</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; .gclient file: It&#39;s the primary file. It is, in fact, a Python scr=
ipt. It<br>
&gt; specifies the following variables:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 - solutions: an array of dictionaries specifying the proj=
ects that will be<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fetched.<=
br>
&gt;=C2=A0 =C2=A0 - hooks: additional hooks to be run when this meta checko=
ut is synced.<br>
&gt;=C2=A0 =C2=A0 - target_os: an optional array of (target) operating syst=
ems to fetch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OS-specif=
ic dependencies for.<br>
&gt;=C2=A0 =C2=A0 - cache_dir: Primarily for bots, multiple working sets us=
e a single git<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cache.<br=
>
&gt; <br>
&gt; <br>
&gt; Why is this a significant issue?<br>
&gt; <br>
&gt; The release tarballs from <a href=3D"https://github.com/flutter/engine=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/flutter/engine</a=
> <br>
&gt; &lt;<a href=3D"https://github.com/flutter/engine" rel=3D"noreferrer" t=
arget=3D"_blank">https://github.com/flutter/engine</a>&gt; are in no state =
to<br>
&gt; compile! No, they are only for the use of gclient to download and buil=
d a<br>
&gt; source directory structure suitable to build the Flutter engine! If yo=
u<br>
&gt; download, extract and attempt to run<br>
&gt; ./tools/gn --no-goma --no-prebuilt-dart-sdk,<br>
&gt; you receive the error message:<br>
&gt; No such file or directory: &#39;flutter/flutter/third_party/gn/gn.&#39=
;<br>
&gt; <br>
&gt; But wait! Wasn&#39;t the gn binary just called? No, that&#39;s a wrapp=
er in the Flutter<br>
&gt; source tree that formats arguments to call the real gn binary. The rea=
l gn is<br>
&gt; not provided in the tarball but is downloaded via gclient<br>
&gt; (among many other repositories.)<br>
&gt; <br>
&gt; The above leads to the question: What do we do about this? We can&#39;=
t use the<br>
&gt; existing download infrastructure to download the tarball from Git Hub,=
 as that<br>
&gt; isn&#39;t meant for us. The gclient download works if called out direc=
tly via a<br>
&gt; pre_download hook; however, this leads to other issues in recreating a=
<br>
&gt; consistent tarball because gclient writes the date to various files al=
l around<br>
&gt; the directory, thus changing the shasum every time I attempt to genera=
te a<br>
&gt; tarball. I can sed the dates in a flutter-engine-gen-tarball script I&=
#39;ve made,<br>
<br>
=C2=A0 You could also use fakedate to pre-set the date to a fixed value.<br=
>
<br>
=C2=A0 Or could you patch gclient to not do that rewriting?<br>
<br></blockquote><div>I didn&#39;t think about fakedate, I&#39;ll play arou=
nd with it!</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
&gt; which solves the problem; however, there is one last hurdle to overcom=
e: When I<br>
&gt; compress the directory created by gclient, any .git folder in a subdir=
ectory<br>
&gt; also changes when running mk_tar_gz from the script.<br>
<br>
=C2=A0 Huh? That shouldn&#39;t happen... mk_tar_gz doesn&#39;t do anything =
that modifies the <br>
filesystem, other than changing access time filestamps. And it certainly do=
esn&#39;t <br>
do anything specific for .git directories.<br>
<br></blockquote><div>Yeah, I misremembered. It&#39;s actually gclient (aga=
in) creating new checkouts on a=C2=A0clone with the current date.</div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; The .git directories, of<br>
&gt; course, can be removed, and that DOES create a reproducible tarball, b=
ut the<br>
&gt; build system relies on the .git directories to fill in a bunch of info=
rmation<br>
&gt; before configuring, causing failures.<br>
&gt; <br>
&gt; I won&#39;t ask the best course of action because anything we decide w=
ill be pretty<br>
&gt; ugly, thanks to Google and its decisions. Instead, I will ask, what is=
 the<br>
&gt; least-bad solution that can be upstreamed to the master branch?<br>
<br>
=C2=A0 If we&#39;re going for ugly solutions: one option would be to downlo=
ad everything <br>
that gclient downloads in a pre-download hook, create an extra tarball out =
of <br>
it, and in a pre-extract hook extract that tarball. That way, what we prese=
nt to <br>
gn in the configure and build steps looks like an already-expanded gclient =
tree <br>
and it won&#39;t download again. It&#39;s of course horrible to find out wh=
at all needs <br>
to be downloaded and where to put this stuff, but you can e.g. write a scri=
pt <br>
that monkey-patches gclient to get URLs instead of actually downloading. Bu=
t in <br>
the end, I guess there&#39;s not much improvement compared to just doing th=
e <br>
download by calling gclient/gn.<br></blockquote><div>=C2=A0</div><div>A pre=
-download hook is exactly what I used at first, but creating a reproducible=
</div><div>tarball was.. painful. I wasn&#39;t aware of fakedate, however, =
so I&#39;ll give that a try!</div><div><br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
=C2=A0 Regards,<br>
=C2=A0 Arnout<br>
<br>
<br>
&gt; <br>
&gt; If you want to play around with any of this, you can clone<br>
&gt; git@gitlab.com:aduskett/buildroot-flutter.git and build the flutter_de=
fconfig.<br>
&gt; <br>
&gt; Thanks!<br>
&gt; Adam<br>
</blockquote></div></div>

--000000000000252d750600b25bb8--

--===============2857101579483832760==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2857101579483832760==--
