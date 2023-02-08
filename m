Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66FFBC05027
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 21:28:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D11946112B;
	Wed,  8 Feb 2023 21:28:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D11946112B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NSTR64qVMZQI; Wed,  8 Feb 2023 21:28:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF0EA60C14;
	Wed,  8 Feb 2023 21:28:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF0EA60C14
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6E3701BF3DC
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 21:28:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 54DB860C14
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 21:28:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54DB860C14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KJEFJATij4NG for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 21:28:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28C9160B13
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 28C9160B13
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 21:28:48 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-16aa71c1600so135654fac.11
 for <buildroot@buildroot.org>; Wed, 08 Feb 2023 13:28:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XbYSQVP16KcI3/66CrFPjAHrsDQ3gez8b8Ko42s1OvM=;
 b=oa/yoTiqED6HLSERIxd47KLndmGj9EAdFCUCaS3cjVED+TlJXUKTTjGUN83JpAfIdB
 TKrauPPLbOadNYirKWUixZVB+kLSh/MTkCEm99ytLNhPvt83l9quuXbXXukVT15DHIOR
 WiO52Jgn12SPeapxfG8GCGIk8jKugn+dgmbpwF4I1oj3I1y4+TY+llKrl+JzjRsI6LjW
 4gKUUBIGT1CaKN5WVisBtHsKl+xwwU24D9u39Zgi0sXQ+7/J5FyPEQhkpN/w35WSJMD0
 qyAOEKQvtERVsdIgH0F6pmqqct2Q1jIwyUPIV/vL9cvgxR1etUAJe0TzmCP9SXov+JsA
 z6dw==
X-Gm-Message-State: AO0yUKVHKuASe8Imclw5g23dUJhLA+/AKkiWIJry/4mFsueGQZylNCcz
 KCQLtQSkcTSsbIPfrvZQWDe7ymPngPfVlVIXycQ=
X-Google-Smtp-Source: AK7set+slskST7kwkCWvSZvawz0wlvLl5uESov/QO6ahFE6r4rSVSM1uOJiZhrVgEULb+NsJ6zXZpBVzgwmMADb3hRU=
X-Received: by 2002:a05:6870:4346:b0:163:42d7:fa0d with SMTP id
 x6-20020a056870434600b0016342d7fa0dmr600005oah.208.1675891727111; Wed, 08 Feb
 2023 13:28:47 -0800 (PST)
MIME-Version: 1.0
References: <CADYjeSsqfaF0P7g_hxQ2EjSh=zDG9=FTnLrbq5g4+22UNJq-xw@mail.gmail.com>
 <CACHw65+r07g=hU4yv1Xhb3TFVmOVkYdSpRy3dZF9y+U44TK=Qw@mail.gmail.com>
 <CADYjeStPWnGcr23XOGnB+61eZ=iZKVj8YkhDKSaw0BUFT7WC-A@mail.gmail.com>
 <36be5bdc-591c-71cb-ea31-9e38ae8d643d@inbox.ru>
In-Reply-To: <36be5bdc-591c-71cb-ea31-9e38ae8d643d@inbox.ru>
From: Sourabh Hegde <hrsourabh011@gmail.com>
Date: Wed, 8 Feb 2023 22:28:35 +0100
Message-ID: <CADYjeSuvmoMXDGgN9rmv+RecroVxqj1_d9x3G4iakwkvLs+j9Q@mail.gmail.com>
To: Maxim Kochetkov <fido_max@inbox.ru>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XbYSQVP16KcI3/66CrFPjAHrsDQ3gez8b8Ko42s1OvM=;
 b=n8DdzRudPaLbZjBu7KV3b3wsMfwtwwENRai6o4jehryxK+Iv/pXAj0WGY7QOuL3ssC
 oKllmr8Nq53getULfa6KlyDYAM0bTvUdw+5fUmbP+HtFOztUo4740TctBraYyoxamMQa
 OSA3CAFVywXH2H7zbNmADdLjQX0jZVnoHN46AJ2nN2NOwj0MmcVunmctVnEw6fTzYY8E
 qNoVZz9QDgEoATLapY85+kKC7WnbWOQXw0mjHy9NSEKUywXYSxRcvyfmt57QBqHSxas0
 SOg8xLem0d0jwuKOtb0wg+RKzRft8CLswAuBwIRCrkGoDhHLf94FpT49DRTVAV7/cejz
 pisA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=n8DdzRud
Subject: Re: [Buildroot] How to install custom sdk in buildroot?
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
Cc: Ramon Crichlow <rcrichlow9000@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============4474188093651476027=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4474188093651476027==
Content-Type: multipart/alternative; boundary="00000000000013994205f436f3d3"

--00000000000013994205f436f3d3
Content-Type: text/plain; charset="UTF-8"

Hello Maxim,

Thanks for the update.

I think for me, the option "18.9.3. Generating a python-package from a PyPI
repository"
https://buildroot.org/downloads/manual/manual.html#_infrastructure_for_python_packages
is
suited.
I want to install this package https://pypi.org/project/awsiotsdk/. And
this package requires https://pypi.org/project/awscrt/ as dependency.
Should I create both Buildroot packages from python packages?
In the Buildroot manual, it's mentioned "Find the external python modules
menu and insert your package inside.", what should I insert here? source
code?

On Wed, 8 Feb 2023 at 21:07, Maxim Kochetkov <fido_max@inbox.ru> wrote:

>
>
> On 08.02.2023 21:19, Sourabh Hegde wrote:
> > Hello Ramon,
> >
> > I don't want an external toolchain. Maybe I was not clear. My goal is to
> > use the program/sdk from here
> > https://github.com/aws/aws-iot-device-sdk-python-v2
> > <https://github.com/aws/aws-iot-device-sdk-python-v2> , this is a
> python
> > based project. And no package is available for this. Can I use
> > python-pip to install it?
>
> Try to add your own package.
>
>
> https://buildroot.org/downloads/manual/manual.html#_infrastructure_for_python_packages
>
> You can use any python package as a reference.
> For example:
>
> https://git.buildroot.net/buildroot/commit/package?id=037dbe64d861e3d5580ecac608bd278afc9bbcc6
>
>

--00000000000013994205f436f3d3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Maxim,<div><br></div><div>Thanks for the update.</di=
v><div><br></div><div>I think for me, the option &quot;18.9.3. Generating a=
 python-package from a PyPI repository&quot;=C2=A0<a href=3D"https://buildr=
oot.org/downloads/manual/manual.html#_infrastructure_for_python_packages">h=
ttps://buildroot.org/downloads/manual/manual.html#_infrastructure_for_pytho=
n_packages</a>=C2=A0is suited.</div><div>I want to install this package=C2=
=A0<a href=3D"https://pypi.org/project/awsiotsdk/">https://pypi.org/project=
/awsiotsdk/</a>. And this package requires=C2=A0<a href=3D"https://pypi.org=
/project/awscrt/">https://pypi.org/project/awscrt/</a>=C2=A0as dependency. =
Should I create both Buildroot packages from python packages?</div><div>In =
the Buildroot manual, it&#39;s mentioned &quot;Find the external python mod=
ules menu and insert your package inside.&quot;, what should I insert here?=
 source code?</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Wed, 8 Feb 2023 at 21:07, Maxim Kochetkov &lt;<a href=
=3D"mailto:fido_max@inbox.ru">fido_max@inbox.ru</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 08.02.2023 21:19, Sourabh Hegde wrote:<br>
&gt; Hello Ramon,<br>
&gt; <br>
&gt; I don&#39;t want an external toolchain. Maybe I was not clear. My goal=
 is to <br>
&gt; use the program/sdk from here <br>
&gt; <a href=3D"https://github.com/aws/aws-iot-device-sdk-python-v2" rel=3D=
"noreferrer" target=3D"_blank">https://github.com/aws/aws-iot-device-sdk-py=
thon-v2</a> <br>
&gt; &lt;<a href=3D"https://github.com/aws/aws-iot-device-sdk-python-v2" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/aws/aws-iot-device-sd=
k-python-v2</a>&gt;=C2=A0, this is a python <br>
&gt; based project. And no package is available for this. Can I use <br>
&gt; python-pip to install it?<br>
<br>
Try to add your own package.<br>
<br>
<a href=3D"https://buildroot.org/downloads/manual/manual.html#_infrastructu=
re_for_python_packages" rel=3D"noreferrer" target=3D"_blank">https://buildr=
oot.org/downloads/manual/manual.html#_infrastructure_for_python_packages</a=
><br>
<br>
You can use any python package as a reference.<br>
For example:<br>
<a href=3D"https://git.buildroot.net/buildroot/commit/package?id=3D037dbe64=
d861e3d5580ecac608bd278afc9bbcc6" rel=3D"noreferrer" target=3D"_blank">http=
s://git.buildroot.net/buildroot/commit/package?id=3D037dbe64d861e3d5580ecac=
608bd278afc9bbcc6</a><br>
<br>
</blockquote></div>

--00000000000013994205f436f3d3--

--===============4474188093651476027==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4474188093651476027==--
