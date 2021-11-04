Return-Path: <SRS0=01xH=PX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BC56C433EF
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 15:41:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC21D61212
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 15:41:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EC21D61212
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=openest.io
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE81B605C5;
	Thu,  4 Nov 2021 15:41:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lRTKjjsHAhrs; Thu,  4 Nov 2021 15:41:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFF3E60AFE;
	Thu,  4 Nov 2021 15:41:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EF65D1BF5A1
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 15:41:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF31E40246
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 15:41:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xcYPDCLQ1Qsc for <buildroot@lists.busybox.net>;
 Thu,  4 Nov 2021 15:41:15 +0000 (UTC)
X-Greylist: delayed 01:19:47 by SQLgrey-1.8.0
Received: from 17.mo584.mail-out.ovh.net (17.mo584.mail-out.ovh.net
 [46.105.41.16])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7149140168
 for <buildroot@buildroot.org>; Thu,  4 Nov 2021 15:41:15 +0000 (UTC)
Received: from player761.ha.ovh.net (unknown [10.109.143.18])
 by mo584.mail-out.ovh.net (Postfix) with ESMTP id A0D21214EE
 for <buildroot@buildroot.org>; Thu,  4 Nov 2021 14:21:25 +0000 (UTC)
Received: from openest.io (mail-lj1-f176.google.com [209.85.208.176])
 (Authenticated sender: julien.grossholtz@openest.io)
 by player761.ha.ovh.net (Postfix) with ESMTPSA id 8AAD523F35B49
 for <buildroot@buildroot.org>; Thu,  4 Nov 2021 14:21:24 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G00250f424e3-8022-4fbf-8bfa-a89470e63568,
 5C2FC7E0CCE22E1D561A6E016AAB8B496B6D56F2)
 smtp.auth=julien.grossholtz@openest.io
X-OVh-ClientIp: 209.85.208.176
Received: by mail-lj1-f176.google.com with SMTP id k24so9816005ljg.3
 for <buildroot@buildroot.org>; Thu, 04 Nov 2021 07:21:24 -0700 (PDT)
X-Gm-Message-State: AOAM533HjqgncRMh4OiMtyqjW3i2/31C+42mVe2/2ZzuHY8fD18zgIBt
 JYXTp9aJIJ3ihpC8zZQuWsc3jIsav4gpQxGns6U=
X-Google-Smtp-Source: ABdhPJxEDw5Q0ZxWdd/KyTnD6jt1kfdDtRfXiE5V1nRRWemQGxr0299UyAgbnExskINpfdQe0mdHduELloz9gd/tI0I=
X-Received: by 2002:a2e:8009:: with SMTP id j9mr3207120ljg.275.1636035683852; 
 Thu, 04 Nov 2021 07:21:23 -0700 (PDT)
MIME-Version: 1.0
References: <20211030213600.3445223-1-julien.grossholtz@openest.io>
 <20211103210603.3a135f02@gmx.net>
In-Reply-To: <20211103210603.3a135f02@gmx.net>
From: Julien Grossholtz <julien.grossholtz@openest.io>
Date: Thu, 4 Nov 2021 15:21:07 +0100
X-Gmail-Original-Message-ID: <CAFN3DJir2SjFoROPpFNhf3Eqt-mAnhep4xFcKKhBGja5VwN+wA@mail.gmail.com>
Message-ID: <CAFN3DJir2SjFoROPpFNhf3Eqt-mAnhep4xFcKKhBGja5VwN+wA@mail.gmail.com>
To: Peter Seiderer <ps.report@gmx.net>
X-Ovh-Tracer-Id: 17033739691580842101
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrtdeggdehlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeggfhgjrhfhfffkuffvtgesrgdtreertddtjeenucfhrhhomheplfhulhhivghnucfirhhoshhshhholhhtiicuoehjuhhlihgvnhdrghhrohhsshhhohhlthiisehophgvnhgvshhtrdhioheqnecuggftrfgrthhtvghrnhepgfefgfefueeghfehteevleekvedtudehudfftdejkefftdeihfeklefgveffueeknecuffhomhgrihhnpehgihhthhhusgdrtghomhdpohiilhgrsghsrdhorhhgnecukfhppedtrddtrddtrddtpddvtdelrdekhedrvddtkedrudejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepphhlrgihvghrjeeiuddrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehjuhhlihgvnhdrghhrohhsshhhohhlthiisehophgvnhgvshhtrdhiohdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
Subject: Re: [Buildroot] [v2 PATCH 0/2] Raspberry-Pi Zero 2 W support
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
Reply-To: julien.grossholtz@openest.io
Cc: Martin Bark <martin@barkynet.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============1171228186829966878=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1171228186829966878==
Content-Type: multipart/alternative; boundary="000000000000c6a76605cff73d0c"

--000000000000c6a76605cff73d0c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Peter,

Thanks for the review. See my answers below.


Le mer. 3 nov. 2021 =C3=A0 21:06, Peter Seiderer <ps.report@gmx.net> a =C3=
=A9crit :

> Hello Julien,
>
> On Sat, 30 Oct 2021 23:35:58 +0200, Julien Grossholtz <
> julien.grossholtz@openest.io> wrote:
>
> > Hello,
> >
> > Here is an update of my previous Raspberry-Pi Zero 2 W support.
> > As Peter Seiderer pointed out, the Raspberry-Pi Linux Kernel was
> > updated with a new bcm2710-rpi-zero-2.dtb [1] a few hours after I sent
> > the patch.
>
> Seems you are to fast, with commit [2] a 'bcm2710-rpi-zero-2-w.dtb' was
> added (as a permanent replacement/name-change for bcm2710-rpi-zero-2.dtb)
> ...
>
Did you see they also updated the supported binaries for the Wi-Fi
firmwares within the dts  [5]  ? I am not sure what it means for the
rpi-wifi-firmware, maybe we will have to bump it at some point too. I will
ensure Wi-Fi is still functional for my board at least.

>
> >
> > Therefore, I bumped the Raspberry-Pi Linux kernel to 5.10.76 for all
> related
> > boards. I built and tested it for the Pis I have access to : Pi Zero W
> > and Pi 4 (32 and 64 bit versions). But, I cannot test the other.
>
> Would like to keep rpi-firmware up-to-date with the rpi-kernel (see
> for example [3] and [4])...
>
> Mind to re-spin your patchset?
>

I will update my commits.


> Regards,
> Peter
>
> [2]
> https://github.com/raspberrypi/linux/commit/093bc6d7ffd3cfba05712a7208c8d=
bfdcffbbf47
> [3]
> https://patchwork.ozlabs.org/project/buildroot/patch/20211006213728.1069-=
1-ps.report@gmx.net/
> [4]
> https://patchwork.ozlabs.org/project/buildroot/patch/20211006213728.1069-=
2-ps.report@gmx.net/
>
> >
> > Regarding the Raspberry-Pi Zero 2 W, I updated the patch with the new
> > dts and kernel git sha1. I booted it, everything seems to work: HDMI,
> > Micro SD and Wi-Fi with some extra packages.
> >
> > Let me know what you think,
> >
> > Julien Grossholtz
> >
> >
> > [1]
> https://github.com/raspberrypi/linux/commit/84dc624be6ae704fdb3c413b7d863=
15cf49fbb0b
> >
> >
> > *** BLURB HERE ***
> >
> > Julien Grossholtz (2):
> >   configs/raspberrypi: bump kernel to 581049d (5.10.76)
> >   board/raspberrypi: add Raspberry Pi Zero 2 W
> >
> >  board/raspberrypi/config_zero2w.txt           | 29 +++++++++++++++
> >  .../genimage-raspberrypizero2w.cfg            | 31 ++++++++++++++++
> >  board/raspberrypi/readme.txt                  |  5 +++
> >  board/raspberrypizero2w                       |  1 +
> >  configs/raspberrypi0_defconfig                |  2 +-
> >  configs/raspberrypi0w_defconfig               |  2 +-
> >  configs/raspberrypi2_defconfig                |  2 +-
> >  configs/raspberrypi3_64_defconfig             |  2 +-
> >  configs/raspberrypi3_defconfig                |  2 +-
> >  configs/raspberrypi3_qt5we_defconfig          |  2 +-
> >  configs/raspberrypi4_64_defconfig             |  2 +-
> >  configs/raspberrypi4_defconfig                |  2 +-
> >  configs/raspberrypi_defconfig                 |  2 +-
> >  configs/raspberrypicm4io_64_defconfig         |  2 +-
> >  configs/raspberrypicm4io_defconfig            |  2 +-
> >  configs/raspberrypizero2w_defconfig           | 36 +++++++++++++++++++
> >  16 files changed, 113 insertions(+), 11 deletions(-)
> >  create mode 100644 board/raspberrypi/config_zero2w.txt
> >  create mode 100644 board/raspberrypi/genimage-raspberrypizero2w.cfg
> >  create mode 120000 board/raspberrypizero2w
> >  create mode 100644 configs/raspberrypizero2w_defconfig
> >
>
>
Thanks,

Julien Grossholtz

[5]
https://github.com/raspberrypi/linux/commit/f71d77d11ea3a0cc391030b6c4eb5a0=
b22e9e787

--000000000000c6a76605cff73d0c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hello Peter,<div><br></div><div>Thanks fo=
r the review. See my answers below.</div><div><div><div dir=3D"ltr" class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><d=
iv style=3D"text-align:left"><br></div></div></div></div></div></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer.=
 3 nov. 2021 =C3=A0=C2=A021:06, Peter Seiderer &lt;<a href=3D"mailto:ps.rep=
ort@gmx.net">ps.report@gmx.net</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">Hello Julien,<br>
<br>
On Sat, 30 Oct 2021 23:35:58 +0200, Julien Grossholtz &lt;<a href=3D"mailto=
:julien.grossholtz@openest.io" target=3D"_blank">julien.grossholtz@openest.=
io</a>&gt; wrote:<br>
<br>
&gt; Hello,<br>
&gt;<br>
&gt; Here is an update of my previous Raspberry-Pi Zero 2 W support.<br>
&gt; As Peter Seiderer pointed out, the Raspberry-Pi Linux Kernel was<br>
&gt; updated with a new bcm2710-rpi-zero-2.dtb [1] a few hours after I sent=
<br>
&gt; the patch.<br>
<br>
Seems you are to fast, with commit [2] a &#39;bcm2710-rpi-zero-2-w.dtb&#39;=
 was<br>
added (as a permanent replacement/name-change for bcm2710-rpi-zero-2.dtb)<b=
r>
...<br></blockquote><div>Did you see they also updated the supported binari=
es for the Wi-Fi firmwares within the dts=C2=A0 [5]=C2=A0 ? I am not sure w=
hat it means for the rpi-wifi-firmware, maybe we will have to bump it at so=
me point too. I will ensure Wi-Fi is still functional for my board at least=
.</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
&gt;<br>
&gt; Therefore, I bumped the Raspberry-Pi Linux kernel to 5.10.76 for all r=
elated<br>
&gt; boards. I built and tested it for the Pis I have access to : Pi Zero W=
<br>
&gt; and Pi 4 (32 and 64 bit versions). But, I cannot test the other.<br>
<br>
Would like to keep rpi-firmware up-to-date with the rpi-kernel (see<br>
for example [3] and [4])...<br>
<br>
Mind to re-spin your patchset?<br></blockquote><div>=C2=A0</div><div>I will=
 update my commits.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
Regards,<br>
Peter<br>
<br>
[2] <a href=3D"https://github.com/raspberrypi/linux/commit/093bc6d7ffd3cfba=
05712a7208c8dbfdcffbbf47" rel=3D"noreferrer" target=3D"_blank">https://gith=
ub.com/raspberrypi/linux/commit/093bc6d7ffd3cfba05712a7208c8dbfdcffbbf47</a=
><br>
[3] <a href=3D"https://patchwork.ozlabs.org/project/buildroot/patch/2021100=
6213728.1069-1-ps.report@gmx.net/" rel=3D"noreferrer" target=3D"_blank">htt=
ps://patchwork.ozlabs.org/project/buildroot/patch/20211006213728.1069-1-ps.=
report@gmx.net/</a><br>
[4] <a href=3D"https://patchwork.ozlabs.org/project/buildroot/patch/2021100=
6213728.1069-2-ps.report@gmx.net/" rel=3D"noreferrer" target=3D"_blank">htt=
ps://patchwork.ozlabs.org/project/buildroot/patch/20211006213728.1069-2-ps.=
report@gmx.net/</a><br>
<br>
&gt;<br>
&gt; Regarding the Raspberry-Pi Zero 2 W, I updated the patch with the new<=
br>
&gt; dts and kernel git sha1. I booted it, everything seems to work: HDMI,<=
br>
&gt; Micro SD and Wi-Fi with some extra packages.<br>
&gt;<br>
&gt; Let me know what you think,<br>
&gt;<br>
&gt; Julien Grossholtz<br>
&gt;<br>
&gt;<br>
&gt; [1] <a href=3D"https://github.com/raspberrypi/linux/commit/84dc624be6a=
e704fdb3c413b7d86315cf49fbb0b" rel=3D"noreferrer" target=3D"_blank">https:/=
/github.com/raspberrypi/linux/commit/84dc624be6ae704fdb3c413b7d86315cf49fbb=
0b</a><br>
&gt;<br>
&gt;<br>
&gt; *** BLURB HERE ***<br>
&gt;<br>
&gt; Julien Grossholtz (2):<br>
&gt;=C2=A0 =C2=A0configs/raspberrypi: bump kernel to 581049d (5.10.76)<br>
&gt;=C2=A0 =C2=A0board/raspberrypi: add Raspberry Pi Zero 2 W<br>
&gt;<br>
&gt;=C2=A0 board/raspberrypi/config_zero2w.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 29 +++++++++++++++<br>
&gt;=C2=A0 .../genimage-raspberrypizero2w.cfg=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 31 ++++++++++++++++<br>
&gt;=C2=A0 board/raspberrypi/readme.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 5 +++<br>
&gt;=C2=A0 board/raspberrypizero2w=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt;=C2=A0 configs/raspberrypi0_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt;=C2=A0 configs/raspberrypi0w_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt;=C2=A0 configs/raspberrypi2_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt;=C2=A0 configs/raspberrypi3_64_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt;=C2=A0 configs/raspberrypi3_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt;=C2=A0 configs/raspberrypi3_qt5we_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 2 +-<br>
&gt;=C2=A0 configs/raspberrypi4_64_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt;=C2=A0 configs/raspberrypi4_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt;=C2=A0 configs/raspberrypi_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt;=C2=A0 configs/raspberrypicm4io_64_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 2 +-<br>
&gt;=C2=A0 configs/raspberrypicm4io_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt;=C2=A0 configs/raspberrypizero2w_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 36 +++++++++++++++++++<br>
&gt;=C2=A0 16 files changed, 113 insertions(+), 11 deletions(-)<br>
&gt;=C2=A0 create mode 100644 board/raspberrypi/config_zero2w.txt<br>
&gt;=C2=A0 create mode 100644 board/raspberrypi/genimage-raspberrypizero2w.=
cfg<br>
&gt;=C2=A0 create mode 120000 board/raspberrypizero2w<br>
&gt;=C2=A0 create mode 100644 configs/raspberrypizero2w_defconfig<br>
&gt;<br>
<br></blockquote><div><br></div><div>Thanks,</div><div><br></div><div>Julie=
n Grossholtz</div><div><br></div><div>[5]=C2=A0<a href=3D"https://github.co=
m/raspberrypi/linux/commit/f71d77d11ea3a0cc391030b6c4eb5a0b22e9e787">https:=
//github.com/raspberrypi/linux/commit/f71d77d11ea3a0cc391030b6c4eb5a0b22e9e=
787</a>=C2=A0</div></div></div>

--000000000000c6a76605cff73d0c--

--===============1171228186829966878==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1171228186829966878==--
