Return-Path: <SRS0=49zi=O7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62F76C433EF
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 04:45:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9191160EB1
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 04:45:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9191160EB1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E8F581B26;
	Mon, 11 Oct 2021 04:45:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id El1NKqO_ceI0; Mon, 11 Oct 2021 04:45:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1214B81B3E;
	Mon, 11 Oct 2021 04:45:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 05A691BF409
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 04:45:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 01AE8605FD
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 04:45:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HDCUgeg5Y2Lw for <buildroot@lists.busybox.net>;
 Mon, 11 Oct 2021 04:45:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 912BE60592
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 04:45:24 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id a25so46776336edx.8
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 21:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:thread-topic:thread-index:date:message-id
 :references:in-reply-to:accept-language:content-language
 :mime-version; bh=kg6DoYb9UERFjDgRIHlO88yHqLntSfFVAh55AOhqkAY=;
 b=Du0OyA1pCGZGYLmVkyFWXMNBvA3xd+tkd89l0qXB7Obb2ZzwFoR987N5CmeNCSRScg
 YZ25n4OjLa9KX7buRtp8dgpiVCk2eMFIUEw8lhsgguB5TgJW5DsJJbs+W91XU5F3ZIyA
 8I5mMbL6aOAwQb4o2lGHQ8oqRthvvuclK8vEtD51vMcu4cwqa94oaOyWdKtXmUPZgq6J
 6mzl/iFyIzzbTVQPpPM7/8FMPOV2/MPJSOvDSqx7RyfVSMA9LT6W3hXvJiN6EqWXi7Bb
 BhJQ5y7dujYLhjiwMnq5AESWPdE3Gr/nF7thQYgRLvt6xGNRYsV9ArnGs8cAIJ4lZIuL
 /GwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:thread-topic:thread-index
 :date:message-id:references:in-reply-to:accept-language
 :content-language:mime-version;
 bh=kg6DoYb9UERFjDgRIHlO88yHqLntSfFVAh55AOhqkAY=;
 b=e/zrV4jwUwdUeo0HQeN+Fmo+hkCsirMD/IkDLlLlpzrl1pyQc2LM164hXx72/qUr1J
 fTQCooj5OcldPVSCLFTtXnvgZjEVPfjsRYMGM+MwO7fnmRRuCo+otclPcthteGZkI/LJ
 yl8/dfCzXgffQmWs0SQdlAHhJkYZYcR1j72/Yc7CS+GooWiqAbKwPA3yIsAHplmFQKkc
 YiJDEBLdzUXG8sTvdIwR2oh6SV5/fue2wdsxsP5Enm7sK3HSkL/4wwW0xHNC3zLCxZ8i
 07WcGL5Gw6JkRTpKdJJmjOnfvwEj8DqTpilQEYdpMBUr4E4zw6k1R3AFosa0uGNd31iU
 Hm1A==
X-Gm-Message-State: AOAM532YwUykEpZNskFTCnutqbeTdogrSKMq0EUOpi2BqG5Xoqpg8NYZ
 cxV2hAou1wg/jFQV9dND5yE=
X-Google-Smtp-Source: ABdhPJyoKspzTrSErFDXKqA/cuR9SoImlAnEeqrgJHgEVKnVk5aixM9Yfk3qeANVuuJfVvsjb2Oauw==
X-Received: by 2002:a17:907:7388:: with SMTP id
 er8mr23501583ejc.324.1633927522587; 
 Sun, 10 Oct 2021 21:45:22 -0700 (PDT)
Received: from BY5PR19MB3668.namprd19.prod.outlook.com
 ([2603:1036:307:4062::5])
 by smtp.gmail.com with ESMTPSA id g20sm3465822edw.71.2021.10.10.21.45.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 10 Oct 2021 21:45:22 -0700 (PDT)
From: ratbert90 <aduskett@gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH 00/20] package/python3: bump to version 3.10
Thread-Index: AXRkNS4yomrhXkEHdf3EnMEHOr8k0TI3LjUxOThHMDDDWM4ssQ==
X-MS-Exchange-MessageSentRepresentingType: 1
Date: Mon, 11 Oct 2021 04:45:15 +0000
Message-ID: <BY5PR19MB3668F598352B7532E5E4D414FBB59@BY5PR19MB3668.namprd19.prod.outlook.com>
References: <20211009205523.3137859-1-aduskett@gmail.com>
 <20211010155556.7a2760b2@windsurf> <20211010193025.GP2081069@scaer>
In-Reply-To: <20211010193025.GP2081069@scaer>
Accept-Language: en-US
Content-Language: it-IT
X-MS-Has-Attach: 
X-MS-Exchange-Organization-SCL: -1
X-MS-TNEF-Correlator: 
X-MS-Exchange-Organization-RecordReviewCfmType: 0
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 00/20] package/python3: bump to version 3.10
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Samuel Martin <s.martin49@gmail.com>,
 Philippe Proulx <eeppeliteloop@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Matt Weber <matthew.weber@collins.com>, Julien Olivain <ju.o@free.fr>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 Mauro Condarelli <mc5686@mclink.it>, Oli Vogt <oli.vogt.pub01@gmail.com>
Content-Type: multipart/mixed; boundary="===============4487663957741882482=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4487663957741882482==
Content-Language: it-IT
Content-Type: multipart/alternative;
	boundary="_000_BY5PR19MB3668F598352B7532E5E4D414FBB59BY5PR19MB3668namp_"

--_000_BY5PR19MB3668F598352B7532E5E4D414FBB59BY5PR19MB3668namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hello
________________________________
Da: Yann E. MORIN <yann.morin.1998@free.fr>
Inviato: domenica, ottobre 10, 2021 12:30
A: Thomas Petazzoni
Cc: Adam Duskett; Jugurtha BELKALEM; Samuel Martin; Philippe Proulx; Asaf K=
ahlon; Oli Vogt; Julien Olivain; buildroot@buildroot.org; Mauro Condarelli;=
 Matt Weber
Oggetto: Re: [Buildroot] [PATCH 00/20] package/python3: bump to version 3.1=
0

Thomas, All,

On 2021-10-10 15:55 +0200, Thomas Petazzoni spake thusly:
> On Sat,  9 Oct 2021 13:55:03 -0700
> Adam Duskett <aduskett@gmail.com> wrote:
> > In the following patch series python3 (eventually) gets bumped to versi=
on 3.10
> >
> > - The first parts involve updating packages that are not compatible wit=
h 3.10.
> >   Either by updating versions or adding patches.
> >
> > - Then I fix a typo in python-pathvalidate
> > - Then I complain about python-setuptools and split add support for bot=
h
> >   setuptools 48 (compatible with python2) and 58 (compatible with pytho=
n3.10)
> > - Finally I update python3 to 3.10
> >
> > This patch series has been tested against every python2 and python3 uni=
t-test
> > available in buildroot, including against https://patchwork.ozlabs.org/=
project/buildroot/patch/20211006203823.2740442-1-yann.morin.1998@free.fr/
> >
> > In addition, I also selected *EVERY* python module to ensure all of the=
m at
> > least build against python3.10, and everything passes.
>
> Thanks a lot for this effort!
You=92re very welcome!

> Should we have a configuration, or a test
> case that builds all Python modules, to facilitate this kind of testing
> in the future ?
It would save my thumb some pain from having to select all the modules! :D
>
> Also, should we drop Python 2.x entirely before merging this, to avoid
> the complexity on the setuptools package? Or do we consider the
> complexity to be reasonable, and therefore we handle the Python 2.x
> removal later?
I am fine with dropping Python 2 support all together. The only major packa=
ge left that requires Python 2 for building is nodejs and that has a pendin=
g patch anyways.

> I've done a (quick) inventory of all the things we have > that still
require python2; no package requires python2, but for some optional
parts:

    avahi           -> auto support
    cracklib        -> auto support
    jailhouse       -> opt scripts
    libdnet         -> opt module
    libpwquality    -> auto support
    nfs-utils       -> auto script
    nmap            -> opt script
    owfs            -> auto support
    pcm-tools       -> opt script

    'opt': explicit with Config.in option
    'auto': implicit with .mk conditions
    'module': builds one+ python module
    'script': installs one+ python script
    'support': generic python support (ie. bindings?)

I am totally fine with dropping python2, if we accept the loss of the
features above, an d I think the loss is acceptable.

Note: I haven't had a look at the python-packages. For those that are
python2-only, and that have a python3-compatible version, we bump to
that version, otherwise we drop the package.

Regards,
>  Yann E. MORIN.

Agreed, there isn=92t a lot left. I was working on the larger packages firs=
t (node, Polkit) before I sent a patch removing python2 altogether.

Adam

--
.-----------------.--------------------.------------------.----------------=
----.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspira=
cy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___           =
    |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is =
no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspirac=
y.  |
'------------------------------^-------^------------------^----------------=
----'

--_000_BY5PR19MB3668F598352B7532E5E4D414FBB59BY5PR19MB3668namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
</head>
<body>
<div dir=3D"ltr">
<div></div>
<div>
<div>
<div dir=3D"ltr" style=3D"color: rgb(0, 0, 0); background-color: rgb(255, 2=
55, 255);">
Hello</div>
</div>
<div id=3D"ms-outlook-mobile-signature">
<div></div>
</div>
</div>
<div id=3D"id-1d620bd3-4489-483d-b8fc-9b34a0773abb" class=3D"ms-outlook-mob=
ile-reference-message">
<hr style=3D"display: inline-block; width: 98%; font-family: -webkit-standa=
rd; font-size: 9.72pt; color: rgb(0, 0, 0);" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif"><b=
>Da:</b> Yann E. MORIN &lt;yann.morin.1998@free.fr&gt;<br>
<b>Inviato:</b> domenica, ottobre 10, 2021 12:30<br>
<b>A:</b> Thomas Petazzoni<br>
<b>Cc:</b> Adam Duskett; Jugurtha BELKALEM; Samuel Martin; Philippe Proulx;=
 Asaf Kahlon; Oli Vogt; Julien Olivain; buildroot@buildroot.org; Mauro Cond=
arelli; Matt Weber<br>
<b>Oggetto:</b> Re: [Buildroot] [PATCH 00/20] package/python3: bump to vers=
ion 3.10
<div>&nbsp;</div>
</font></div>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Thomas, All,<br>
<br>
On 2021-10-10 15:55 +0200, Thomas Petazzoni spake thusly:<br>
&gt; On Sat,&nbsp; 9 Oct 2021 13:55:03 -0700<br>
&gt; Adam Duskett &lt;aduskett@gmail.com&gt; wrote:<br>
&gt; &gt; In the following patch series python3 (eventually) gets bumped to=
 version 3.10<br>
&gt; &gt; <br>
&gt; &gt; - The first parts involve updating packages that are not compatib=
le with 3.10.<br>
&gt; &gt;&nbsp;&nbsp; Either by updating versions or adding patches.<br>
&gt; &gt; <br>
&gt; &gt; - Then I fix a typo in python-pathvalidate<br>
&gt; &gt; - Then I complain about python-setuptools and split add support f=
or both<br>
&gt; &gt;&nbsp;&nbsp; setuptools 48 (compatible with python2) and 58 (compa=
tible with python3.10)<br>
&gt; &gt; - Finally I update python3 to 3.10<br>
&gt; &gt; <br>
&gt; &gt; This patch series has been tested against every python2 and pytho=
n3 unit-test<br>
&gt; &gt; available in buildroot, including against <a href=3D"https://patc=
hwork.ozlabs.org/project/buildroot/patch/20211006203823.2740442-1-yann.mori=
n.1998@free.fr/">
https://patchwork.ozlabs.org/project/buildroot/patch/20211006203823.2740442=
-1-yann.morin.1998@free.fr/</a><br>
&gt; &gt; <br>
&gt; &gt; In addition, I also selected *EVERY* python module to ensure all =
of them at<br>
&gt; &gt; least build against python3.10, and everything passes.<br>
&gt; <br>
&gt; Thanks a lot for this effort!</div>
<div class=3D"PlainText" dir=3D"ltr">You=92re very welcome!</div>
<div class=3D"PlainText" dir=3D"ltr"><br>
</div>
<div class=3D"PlainText">&gt; Should we have a configuration, or a test<br>
&gt; case that builds all Python modules, to facilitate this kind of testin=
g<br>
&gt; in the future ?</div>
<div class=3D"PlainText">It would save my thumb some pain from having to se=
lect all the modules! :D<br>
&gt; <br>
&gt; Also, should we drop Python 2.x entirely before merging this, to avoid=
<br>
&gt; the complexity on the setuptools package? Or do we consider the<br>
&gt; complexity to be reasonable, and therefore we handle the Python 2.x<br=
>
&gt; removal later?<br>
I am fine with dropping Python 2 support all together. The only major packa=
ge left that requires Python 2 for building is nodejs and that has a pendin=
g patch anyways.&nbsp;<br>
<br>
<span style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); background-c=
olor: rgb(255, 255, 255); display: inline !important;">&gt;<span>&nbsp;</sp=
an></span>I've done a (quick) inventory of all the things we have<span styl=
e=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); background-color: rgb(=
255, 255, 255); display: inline !important;"><span>&nbsp;<span style=3D"car=
et-color: rgb(0, 0, 0); color: rgb(0, 0, 0); background-color: rgb(255, 255=
, 255); display: inline !important;">&gt;<span>&nbsp;</span></span></span><=
/span>that
 still<br>
require python2; no package requires python2, but for some optional<br>
parts:<br>
<br>
&nbsp;&nbsp;&nbsp; avahi&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; -&gt; auto support<br>
&nbsp;&nbsp;&nbsp; cracklib&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -&gt;=
 auto support<br>
&nbsp;&nbsp;&nbsp; jailhouse&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -&gt; opt =
scripts<br>
&nbsp;&nbsp;&nbsp; libdnet&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
-&gt; opt module<br>
&nbsp;&nbsp;&nbsp; libpwquality&nbsp;&nbsp;&nbsp; -&gt; auto support<br>
&nbsp;&nbsp;&nbsp; nfs-utils&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -&gt; auto=
 script<br>
&nbsp;&nbsp;&nbsp; nmap&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; -&gt; opt script<br>
&nbsp;&nbsp;&nbsp; owfs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; -&gt; auto support<br>
&nbsp;&nbsp;&nbsp; pcm-tools&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -&gt; opt =
script<br>
<br>
&nbsp;&nbsp;&nbsp; 'opt': explicit with Config.in option<br>
&nbsp;&nbsp;&nbsp; 'auto': implicit with .mk conditions<br>
&nbsp;&nbsp;&nbsp; 'module': builds one+ python module<br>
&nbsp;&nbsp;&nbsp; 'script': installs one+ python script<br>
&nbsp;&nbsp;&nbsp; 'support': generic python support (ie. bindings?)<br>
<br>
I am totally fine with dropping python2, if we accept the loss of the<br>
features above, an d I think the loss is acceptable.<br>
<br>
Note: I haven't had a look at the python-packages. For those that are<br>
python2-only, and that have a python3-compatible version, we bump to<br>
that version, otherwise we drop the package.<br>
<br>
Regards,<br>
<span style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); background-c=
olor: rgb(255, 255, 255); display: inline !important;">&gt;<span>&nbsp;&nbs=
p;</span></span>Yann E. MORIN.</div>
<div class=3D"PlainText" dir=3D"ltr"><br>
</div>
<div class=3D"PlainText">Agreed, there isn=92t a lot left. I was working on=
 the larger packages first (node, Polkit) before I sent a patch removing py=
thon2 altogether.&nbsp;</div>
<div class=3D"PlainText" dir=3D"ltr"><br>
</div>
<div class=3D"PlainText">Adam<br>
<br>
-- <br>
.-----------------.--------------------.------------------.----------------=
----.<br>
|&nbsp; Yann E. MORIN&nbsp; | Real-Time Embedded | /&quot;\ ASCII RIBBON | =
Erics' conspiracy: |<br>
| +33 662 376 056 | Software&nbsp; Designer | \ / CAMPAIGN&nbsp;&nbsp;&nbsp=
;&nbsp; |&nbsp; ___&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
| +33 561 099 427 `------------.-------:&nbsp; X&nbsp; AGAINST&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; |&nbsp; \e/&nbsp; There is no&nbsp; |<br>
| <a href=3D"http://ymorin.is-a-geek.org/">http://ymorin.is-a-geek.org/</a>=
 | _/*\_ | / \ HTML MAIL&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; v&nbsp;&nbsp; cons=
piracy.&nbsp; |<br>
'------------------------------^-------^------------------^----------------=
----'<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_BY5PR19MB3668F598352B7532E5E4D414FBB59BY5PR19MB3668namp_--

--===============4487663957741882482==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4487663957741882482==--
