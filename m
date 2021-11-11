Return-Path: <SRS0=/juA=P6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4BA0C433F5
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 09:05:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 527EC611CE
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 09:05:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 527EC611CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 17E694016E;
	Thu, 11 Nov 2021 09:05:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M-m5ca57p0xA; Thu, 11 Nov 2021 09:05:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1237E40224;
	Thu, 11 Nov 2021 09:05:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2A88C1BF2E3
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 09:05:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 19D068101A
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 09:05:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wqV9UwZX3rW5 for <buildroot@lists.busybox.net>;
 Thu, 11 Nov 2021 09:05:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2CFC68100D
 for <buildroot@buildroot.org>; Thu, 11 Nov 2021 09:05:50 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id bi29so5190410qkb.5
 for <buildroot@buildroot.org>; Thu, 11 Nov 2021 01:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g+/1VYa5bV0LWK4uCjNmrTI1c18G/notVl6intY48Z0=;
 b=nFsI+LcVNNO3smuy3wTTCgPM8H7Gzr5FR5A2Qby0sd/tMf2Bzr4d1VeRufezsmWYsb
 YBwcbNio8TDv6Ggf24FwWK06qkuoGD4TD4oECArfhUlaEVROcFF3u+imtNAD1tqP5PCA
 iUgD2JHM7y2U60DpvAobii6BhvZ8FcMw6extABLlF2az+75y3s3OmP+CAKZlgRBA2Twe
 TnI291g78P6DZGU8xowfzKaIkoD9WbloyqIxSoX/mtI0CvpQ79fe1XQUaNBFyEPYEAqN
 mMJVnLV6BVoNA25Ujew3qHh0YEdG5ZFHc+0zq1GBaZUEL/U3JkXckvG8mD5mUk4IjMzV
 flcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g+/1VYa5bV0LWK4uCjNmrTI1c18G/notVl6intY48Z0=;
 b=MNRRxC6qwtEKaVpQ0k/Xy5nbzAUq5mHi+EsV52hQfXDcCRK1j81DHTcaMFmELonu+I
 QbGWIi6Q+mUyn9ktEXZBsu+qjpcwgh4Vd6dTTjr5D/yUv0SicBbg4y/u3Sv1wYy/mKbf
 FdrF07WQjuwQ/ySpgMKJkscdBE6f587Ue56Ha1nyA/7DVKfWTIsGxphzJxVoA7F4A6+d
 e8LsRscIAiESbgRZ0XIBcfSrK6dSn8VKFi8oIMoNqFfqmsyFT4PGCKVLxzLSMu0PRKbQ
 nRDDJ8H8YfbtOSLr9IRyFcYkbCQq62IpBPvlOKaY33+WYMMhEhn3tPYoTDhfSI4TbdeR
 rfDQ==
X-Gm-Message-State: AOAM530bY+WRN1xf3a9a/tzP+7FeRWhROs9x0n4HTt0qsyrdmViDWRbD
 C/rFIz+Uq+iRYUGdAkSDR21forOMTc60uGZaVAddFu+XJO0=
X-Google-Smtp-Source: ABdhPJwHeei4+zgC/R8TqWr2YuOwIN3jdYJzEEP91OtALF8KqRQZQDbkL5TnK4CPif6rrxUOde7SBtzcnakohkXGVQo=
X-Received: by 2002:a05:620a:4450:: with SMTP id
 w16mr2397139qkp.26.1636621548884; 
 Thu, 11 Nov 2021 01:05:48 -0800 (PST)
MIME-Version: 1.0
References: <CACaKL1yyn2cj68Bdt+S7BRtLDWV5Ja6Pe-rHQj8dsSEK22Bu3A@mail.gmail.com>
 <20211111082828.GB2504300@scaer>
In-Reply-To: <20211111082828.GB2504300@scaer>
From: Jacques Samoun <jacques.samoun33@gmail.com>
Date: Thu, 11 Nov 2021 11:05:38 +0200
Message-ID: <CACaKL1wBKYVWbDg0YohYsgDiZ7ck6N7wE2NnCN+tS0ZXCx9SUg@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] building U-Boot fw_printenv
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
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============0665937974242664486=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0665937974242664486==
Content-Type: multipart/alternative; boundary="0000000000000d977605d07fa627"

--0000000000000d977605d07fa627
Content-Type: text/plain; charset="UTF-8"

Thanks !
Found it and it works perfectly.

rgds,
Jacques

On Thu, Nov 11, 2021 at 10:28 AM Yann E. MORIN <yann.morin.1998@free.fr>
wrote:

> Jacques, All,
>
> On 2021-11-11 09:55 +0200, Jacques Samoun spake thusly:
> > i am using BR off tag 2020.01, and using U-Boot as a bootloader (ARM
> platform).
> > I am just unable to make U-Boot build env tools, namely fw_printenv.
> > I obviously verified the fw_printenv.c and makefile are indeed present
> in tools/env.
> > I tried a few settings, but am mot able to get this tool built. None of
> the settings, either from BR or Uboot seem to be able to do
> > that.
> > Am i missing something  basic here ?
>
> If you need fw_printenv on the target, you'll need to look at
> uboot-tools (BR2_PACKAGE_UBOOT_TOOLS); if you want it at build time,
> you'll want host-uboot-tools (BR2_PACKAGE_HOST_UBOOT_TOOLS).
>
> Regards,
> Yann E. MORIN.
>
> --
>
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is
> no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
>
> '------------------------------^-------^------------------^--------------------'
>

--0000000000000d977605d07fa627
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Thanks !<div>Found it and it works perfec=
tly.</div><div><br></div><div>rgds,</div><div>Jacques</div></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 11, =
2021 at 10:28 AM Yann E. MORIN &lt;<a href=3D"mailto:yann.morin.1998@free.f=
r">yann.morin.1998@free.fr</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">Jacques, All,<br>
<br>
On 2021-11-11 09:55 +0200, Jacques Samoun spake thusly:<br>
&gt; i am using BR off tag 2020.01, and using U-Boot as a bootloader (ARM p=
latform).<br>
&gt; I am just unable to make U-Boot build env tools, namely fw_printenv.<b=
r>
&gt; I obviously=C2=A0verified the fw_printenv.c and makefile are indeed pr=
esent in tools/env.<br>
&gt; I tried a few settings, but am mot able to get this tool built. None o=
f the settings, either from BR or Uboot seem to be able to do<br>
&gt; that.<br>
&gt; Am i missing=C2=A0something=C2=A0=C2=A0basic here ?<br>
<br>
If you need fw_printenv on the target, you&#39;ll need to look at<br>
uboot-tools (BR2_PACKAGE_UBOOT_TOOLS); if you want it at build time,<br>
you&#39;ll want host-uboot-tools (BR2_PACKAGE_HOST_UBOOT_TOOLS).<br>
<br>
Regards,<br>
Yann E. MORIN.<br>
<br>
-- <br>
.-----------------.--------------------.------------------.----------------=
----.<br>
|=C2=A0 Yann E. MORIN=C2=A0 | Real-Time Embedded | /&quot;\ ASCII RIBBON | =
Erics&#39; conspiracy: |<br>
| +33 662 376 056 | Software=C2=A0 Designer | \ / CAMPAIGN=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 ___=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
| +33 561 099 427 `------------.-------:=C2=A0 X=C2=A0 AGAINST=C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 \e/=C2=A0 There is no=C2=A0 |<br>
| <a href=3D"http://ymorin.is-a-geek.org/" rel=3D"noreferrer" target=3D"_bl=
ank">http://ymorin.is-a-geek.org/</a> | _/*\_ | / \ HTML MAIL=C2=A0 =C2=A0 =
|=C2=A0 =C2=A0v=C2=A0 =C2=A0conspiracy.=C2=A0 |<br>
&#39;------------------------------^-------^------------------^------------=
--------&#39;<br>
</blockquote></div></div>

--0000000000000d977605d07fa627--

--===============0665937974242664486==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0665937974242664486==--
