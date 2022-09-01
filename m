Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99CF0ECAAD3
	for <buildroot@archiver.kernel.org>; Thu,  1 Sep 2022 19:44:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2CA67401E1;
	Thu,  1 Sep 2022 19:44:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2CA67401E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9dyJcOZoX3EN; Thu,  1 Sep 2022 19:44:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D0AB403A2;
	Thu,  1 Sep 2022 19:44:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D0AB403A2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 395E71BF308
 for <buildroot@lists.busybox.net>; Thu,  1 Sep 2022 19:44:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1435E8186B
 for <buildroot@lists.busybox.net>; Thu,  1 Sep 2022 19:44:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1435E8186B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2ZCKCfq_CWSS for <buildroot@lists.busybox.net>;
 Thu,  1 Sep 2022 19:44:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80C9481865
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 80C9481865
 for <buildroot@busybox.net>; Thu,  1 Sep 2022 19:44:10 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id m1so32981edb.7
 for <buildroot@busybox.net>; Thu, 01 Sep 2022 12:44:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=dyUkRwSMaQzbcdTPVesec4afdOHeSHqMCY3DpKHzfTU=;
 b=bDN/+0moh2BuRXU9sq0EdsF3ZLf1cKdy5MjfXH7EHsB9GweNUJJjyBZTWCNruE0E8p
 I7Q324kxco9BVUnJrV5Y7H53I1AxVaPsJrO7WiPbMQHJdKbkSBJ9ZYcUqxZUQ3crEdql
 aXus6ePHRaADkoPUIwDnBmRf7tmcipLZmftnWobaoLg6KMitTzUS/WuQ0sMmZIF5E5ZU
 mE6kqAKPgRJ8SD5uZ+PmXp4D9DwLwMcCWtzofslv/JUUqUhpjOS5RxhQfyoav+UdGgVo
 EYLnuzthUX8I4uBDgOFoDf5PNEmWLUd/b5UwG3pmv7If1RE9aGXHTCdQT/YvbFoVjLLm
 4Xxw==
X-Gm-Message-State: ACgBeo2KSm6ro+25hWPqaM8kNT6FKFmmhpyfiBPuTBb2WFlk+vSdSR5k
 kVPNUItsZXsdUfCLz+xcOYD5HT/TXxA2eq+Pk+U=
X-Google-Smtp-Source: AA6agR44+JN7Yw0PkpCPdPZEgz909wn/YJZptIRmcBHXDHAZNPtccpw5MZD6vNz2SOjx3ueqS5hy+NeuEO0L+4IW/EY=
X-Received: by 2002:aa7:d155:0:b0:447:e6b9:ae97 with SMTP id
 r21-20020aa7d155000000b00447e6b9ae97mr24868904edo.161.1662061448640; Thu, 01
 Sep 2022 12:44:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220805143625.16542-1-guillaume.bressaix@gmail.com>
 <20220805143625.16542-2-guillaume.bressaix@gmail.com>
 <CAJe0E3cL8MK4ipwq3tLDy_D6dqrEJ2gfi20J1rXEewW4fUSkcw@mail.gmail.com>
 <28767d03-5c5f-d40e-12d1-ebdc6b3a5900@mind.be>
 <20220808231302.08adad89@windsurf>
 <CAJe0E3fy_HBXg9nwBaWSOADuMLtPhJLr3weAx2n1R13h_+OMTQ@mail.gmail.com>
 <CAJe0E3fFrw5ShPYbQohf9A_LRn309C_4tdrKF53eN2NKVarGYA@mail.gmail.com>
 <CABL7CQjFbqaDd2ULBsPVyKM3cAEjCSHEdnY9vfxA=VMuRbdNjg@mail.gmail.com>
In-Reply-To: <CABL7CQjFbqaDd2ULBsPVyKM3cAEjCSHEdnY9vfxA=VMuRbdNjg@mail.gmail.com>
From: Guillaume Bres <guillaume.bressaix@gmail.com>
Date: Thu, 1 Sep 2022 21:43:42 +0200
Message-ID: <CAJe0E3dBxEHYJxZQpJFm48eWzmJbAyRYVy-PuPOL6rHxrRQeFg@mail.gmail.com>
To: Ralf Gommers <ralf.gommers@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=dyUkRwSMaQzbcdTPVesec4afdOHeSHqMCY3DpKHzfTU=;
 b=QmR9MQAITPaSTHlEW65F04NBQu9KuFDVAgTIZacRfAzMpi7XTwFHImcLZuwWaO01Q/
 EuLLIhY3LSQbxeg909S2AtG6ihDwkZctaiFClgLFol91RAY7MdkGH+klhdMbDbjFC8tn
 FRe6Puen/Ul3fby3ydBTcT1WcKkFEQR2Y48Khs/Rh0ZzANQJmzWSs/IBNM8kFoICan6O
 ks+VJ2LddaLBR5fVZ8b//uEGVqWm2R/zy7pQs5lJ821n0ADKD0fahh440gy07PFx/c1m
 vTgtJ+36+z+c1komlNiCSA/h9uteY57bjqfiETB0jKXeY3pb1flSEvz52CYDU2rK9EFl
 AM0Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=QmR9MQAI
Subject: Re: [Buildroot] [RFC v3 2/2] package/python-scipy: bump version to
 1.9.0
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
Cc: buildroot@busybox.net, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: multipart/mixed; boundary="===============7377128014566631260=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7377128014566631260==
Content-Type: multipart/alternative; boundary="0000000000003dbc3605e7a2d614"

--0000000000003dbc3605e7a2d614
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>1.9.2 should be the first version built with Meson now that we've got the
wheel build machinery switched over [..]
>I will note that SciPy CI now contains one cross-compilation job (macOS
x-86-64 to arm64), so that should be more robust now

Thank you this is valuable information Ralf

>The main issue for cross-compilation is running the Python interpreter on
the build machine to retrieve numpy and pybind11
Indeed I understand the problem

>Note that you can either wait a bit longer, or if you do want to include
SciPy 1.9.1, just build it with distutils - if that worked for 1.8.x it
will still work for 1.9.1
Ok let's do that then

Guillaume W. Bres
Software engineer
<guillaume.bressaix@gmail.com>


Le sam. 27 ao=C3=BBt 2022 =C3=A0 11:54, Ralf Gommers <ralf.gommers@gmail.co=
m> a
=C3=A9crit :

> Hi Guillaume, all,
>
>
> On Sat, Aug 27, 2022 at 12:11 PM Guillaume Bres <
> guillaume.bressaix@gmail.com> wrote:
>
>> Hello all,
>>
>> I suggest we wait for new updates of scipy before converting the package
>> to meson.
>>
>
> That does sound like the right call. The SciPy wheels on PyPI for 1.9.1
> are still built with distutils; 1.9.2 should be the first version built
> with Meson now that we've got the wheel build machinery switched over.
> Making that move to Meson before SciPy itself has finalized it is likely =
to
> uncover some more issues. I will note that SciPy CI now contains one
> cross-compilation job (macOS x-86-64 to arm64), so that should be more
> robust now.
>
>
>> In the meantime, I expect pybind and numpy to be sanitized too (probably
>> the impulse of scipy), so we should keep track of these.
>>
>
> Indeed. The main issue for cross-compilation is running the Python
> interpreter on the build machine to retrieve numpy and pybind11. I'm tryi=
ng
> to get rid of that need. I will note that the distutils-based build does
> the same and ends up with incorrect static libraries included in the Pyth=
on
> extension modules, but it happens to work for odd reasons (basically two
> bugs cancelling each other out there). The Meson builds correctly detects
> that situation as problematic and errors out rather than including a stat=
ic
> library with the wrong architecture.
>
> For information, scipy-v1.9.1 has just been released but it does not come
>> with anything new regarding meson scripts.
>>
>> I currently have a v3 patch that is able to upgrade scipy to v1.9.0 and
>> meson, but it involves patching the build script (it's fairly minor).
>> But this patch is not 100% ready and needs to be finalized.
>> What do you guys think is best? Should I conclude this, or we remain as
>> is (which works fine) and wait for new releases?
>>
>
> Note that you can either wait a bit longer, or if you do want to include
> SciPy 1.9.1, just build it with distutils - if that worked for 1.8.x it
> will still work for 1.9.1
>
> Cheers,
> Ralf
>
>
> I am worried such tweaks appear fine at first, but might raise lots of
>> issues once injected into BR
>>
>> Guillaume W. Bres
>> Software engineer
>> <guillaume.bressaix@gmail.com>
>>
>>
>> Le mar. 9 ao=C3=BBt 2022 =C3=A0 10:37, Guillaume Bres <guillaume.bressai=
x@gmail.com>
>> a =C3=A9crit :
>>
>>> for information,
>>> pybind will soon become pkg-config knowledgeable, as this issue is abou=
t
>>> to get merged https://github.com/pybind/pybind11/pull/4077
>>>
>>> Guillaume W. Bres
>>> Software engineer
>>> <guillaume.bressaix@gmail.com>
>>>
>>>
>>> Le lun. 8 ao=C3=BBt 2022 =C3=A0 23:13, Thomas Petazzoni <
>>> thomas.petazzoni@bootlin.com> a =C3=A9crit :
>>>
>>>> On Mon, 8 Aug 2022 22:58:46 +0200
>>>> Arnout Vandecappelle <arnout@mind.be> wrote:
>>>>
>>>> >   pybind is consistently annoying, it uses ldd and stuff to discover
>>>> paths...
>>>>
>>>> Well, it's not just pybind. Python itself, in its ctype.find_library()
>>>> function, uses ldconfig, tries to use gcc on the target, and more funk=
y
>>>> stuff that borks terribly in a Buildroot situation.
>>>>
>>>> Thomas
>>>> --
>>>> Thomas Petazzoni, co-owner and CEO, Bootlin
>>>> Embedded Linux and Kernel engineering and training
>>>> https://bootlin.com
>>>>
>>>

--0000000000003dbc3605e7a2d614
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">&gt;1.9.2 should be the first version bui=
lt with Meson now that we&#39;ve got the wheel build machinery switched ove=
r [..]<br>&gt;I will note that SciPy CI now contains one cross-compilation =
job (macOS x-86-64 to arm64), so that should be more robust now<br><br>Than=
k you this is valuable information Ralf<br><br>&gt;The main issue for cross=
-compilation is running the Python interpreter on the build machine to retr=
ieve numpy and pybind11<br>Indeed I understand the problem<br><br>&gt;Note =
that you can either wait a bit longer, or if you do want to include SciPy 1=
.9.1, just build it with distutils - if that worked for 1.8.x it will still=
 work for 1.9.1<div>Ok let&#39;s do that then</div><br clear=3D"all"><div><=
div dir=3D"ltr" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div di=
r=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div><div><div><font face=3D"ar=
ial,helvetica,sans-serif">Guillaume W. Bres<br></font></div><font face=3D"a=
rial,helvetica,sans-serif">Software engineer</font><br></div><font face=3D"=
arial,helvetica,sans-serif"></font></div><font face=3D"arial,helvetica,sans=
-serif">&lt;<a href=3D"mailto:guillaume.bressaix@gmail.com" target=3D"_blan=
k">guillaume.bressaix@gmail.com</a>&gt;<br></font></div></div></div></div><=
/div></div><br></div><br></div><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Le=C2=A0sam. 27 ao=C3=BBt 2022 =C3=A0=C2=A011:54, Ralf=
 Gommers &lt;<a href=3D"mailto:ralf.gommers@gmail.com" target=3D"_blank">ra=
lf.gommers@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Hi Guillaume, all,</=
div><div><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Sat, Aug 27, 2022 at 12:11 PM Guillaume Bres &lt;<a href=3D=
"mailto:guillaume.bressaix@gmail.com" target=3D"_blank">guillaume.bressaix@=
gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr">Hello all,<br><br>I suggest we wait for new upd=
ates of scipy before converting the package to meson.=C2=A0<br></div></bloc=
kquote><div><br></div><div>That does sound like the right call. The SciPy w=
heels on PyPI for 1.9.1 are still built with distutils; 1.9.2 should be the=
 first version built with Meson now that we&#39;ve got the wheel build mach=
inery switched over. Making that move to Meson before SciPy itself has fina=
lized it is likely to uncover some more issues. I will note that SciPy CI n=
ow contains one cross-compilation job (macOS x-86-64 to arm64), so that sho=
uld be more robust now.<br></div><div>=C2=A0<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex"><div dir=3D"ltr">In the meantime, I expect pyb=
ind and numpy to be sanitized too=C2=A0(probably the impulse of scipy), so =
we should keep track of these.=C2=A0<br></div></blockquote><div><br></div><=
div>Indeed. The main issue for cross-compilation is running the Python inte=
rpreter on the build machine to retrieve numpy and pybind11. I&#39;m trying=
 to get rid of that need. I will note that the distutils-based build does t=
he same and ends up with incorrect static libraries included in the Python =
extension modules, but it happens to work for odd reasons (basically two bu=
gs cancelling each other out there). The Meson builds correctly detects tha=
t situation as problematic and errors out rather than including a static li=
brary with the wrong architecture.<br></div><div><br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><div dir=3D"ltr">For information, scipy-v=
1.9.1 has just been released but it does not come with anything new regardi=
ng=C2=A0meson scripts.<div><br>I currently have a v3 patch that is able to =
upgrade scipy to v1.9.0 and meson, but it involves patching the build scrip=
t (it&#39;s fairly minor).<br>But this patch is not=C2=A0100% ready and nee=
ds to be=C2=A0finalized. <br>What do you guys think is best? Should I concl=
ude this, or we remain as is (which works fine) and wait for new releases?=
=C2=A0<br></div></div></blockquote><div><br></div><div>Note that you can ei=
ther wait a bit longer, or if you do want to include SciPy 1.9.1, just buil=
d it with distutils - if that worked for 1.8.x it will still work for 1.9.1=
</div><div><br></div><div>Cheers,<br></div><div>Ralf</div><div><br></div><d=
iv><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"=
ltr"><div>I am worried such tweaks appear fine at first, but might raise lo=
ts of issues once injected into BR=C2=A0<div><br clear=3D"all"><div><div di=
r=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"lt=
r"><div><div><div><font face=3D"arial,helvetica,sans-serif">Guillaume W. Br=
es<br></font></div><font face=3D"arial,helvetica,sans-serif">Software engin=
eer</font><br></div><font face=3D"arial,helvetica,sans-serif"></font></div>=
<font face=3D"arial,helvetica,sans-serif">&lt;<a href=3D"mailto:guillaume.b=
ressaix@gmail.com" target=3D"_blank">guillaume.bressaix@gmail.com</a>&gt;<b=
r></font></div></div></div></div></div></div><br></div></div></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mar. 9=
 ao=C3=BBt 2022 =C3=A0=C2=A010:37, Guillaume Bres &lt;<a href=3D"mailto:gui=
llaume.bressaix@gmail.com" target=3D"_blank">guillaume.bressaix@gmail.com</=
a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr">for information,<br>pybind will soon become pkg=
-config knowledgeable, as this issue is about to get merged <a href=3D"http=
s://github.com/pybind/pybind11/pull/4077" target=3D"_blank">https://github.=
com/pybind/pybind11/pull/4077</a><br><br clear=3D"all"><div><div dir=3D"ltr=
"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div>=
<div><div><font face=3D"arial,helvetica,sans-serif">Guillaume W. Bres<br></=
font></div><font face=3D"arial,helvetica,sans-serif">Software engineer</fon=
t><br></div><font face=3D"arial,helvetica,sans-serif"></font></div><font fa=
ce=3D"arial,helvetica,sans-serif">&lt;<a href=3D"mailto:guillaume.bressaix@=
gmail.com" target=3D"_blank">guillaume.bressaix@gmail.com</a>&gt;<br></font=
></div></div></div></div></div></div><br></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0lun. 8 ao=C3=BBt 2022 =C3=
=A0=C2=A023:13, Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@boo=
tlin.com" target=3D"_blank">thomas.petazzoni@bootlin.com</a>&gt; a =C3=A9cr=
it=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon=
, 8 Aug 2022 22:58:46 +0200<br>
Arnout Vandecappelle &lt;<a href=3D"mailto:arnout@mind.be" target=3D"_blank=
">arnout@mind.be</a>&gt; wrote:<br>
<br>
&gt;=C2=A0 =C2=A0pybind is consistently annoying, it uses ldd and stuff to =
discover paths...<br>
<br>
Well, it&#39;s not just pybind. Python itself, in its ctype.find_library()<=
br>
function, uses ldconfig, tries to use gcc on the target, and more funky<br>
stuff that borks terribly in a Buildroot situation.<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>
</blockquote></div>
</blockquote></div></div>
</blockquote></div>

--0000000000003dbc3605e7a2d614--

--===============7377128014566631260==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7377128014566631260==--
