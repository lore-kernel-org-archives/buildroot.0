Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC4CC47258
	for <buildroot@archiver.kernel.org>; Sat, 20 Jan 2024 18:05:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17EDC83EFC;
	Sat, 20 Jan 2024 18:05:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17EDC83EFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fk7lHvhj_mLM; Sat, 20 Jan 2024 18:05:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55ED784446;
	Sat, 20 Jan 2024 18:05:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55ED784446
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2EFC21BF409
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 18:05:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 078E784446
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 18:05:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 078E784446
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 63E519GhzsZT for <buildroot@lists.busybox.net>;
 Sat, 20 Jan 2024 18:05:50 +0000 (UTC)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 897DA83EFC
 for <buildroot@busybox.net>; Sat, 20 Jan 2024 18:05:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 897DA83EFC
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1d50d0c98c3so23445515ad.1
 for <buildroot@busybox.net>; Sat, 20 Jan 2024 10:05:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705773950; x=1706378750;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gr2hKKUDE+EFE6M+2bcAlhGVHOOSO9qoj4fQgDVvkFU=;
 b=WjwJ5Mil28jy3JXgV2LJRCVdoXopIgvCWUDeojGXZx/reC05goaiQLGn3GIwTit48H
 lZqbmcr/2ICJoXVDaDyOXz2zs2f+Yq7z9DZNcYov9z9pWTZvN94riRl1At+InllLCwkB
 qgd5XKt84Ag3jpJArGHDtP5M6Aw2TbtQz7SQauaN1HhgcGL1PcBHcCssgVxYCxxeCN/r
 BVazfTf1KFQ/3l0IGtz+4TDiTGvatApAz3ke0ZGw3PStzoXRF1Fl8Etia3QX9BERbjOq
 i4pWEqZuqSoXD8HFuQoAqFRYlyohLQwSTUXEPNDBXVnwrI44NZCq4COU4Gcf0B4I16hN
 KehA==
X-Gm-Message-State: AOJu0Yw9TfuS0UNKY7TPpjPSI0bEGq3gy1ZQerNSOS8VRDCa854TR7VL
 rkcxw+8Fe0wYrHTVVqNDoMytXgsK/ZBJG1ZuKFGCGoAWc6PR166mMmliXFqsMRnOuXzhCjGefTE
 1yZELw+tVpjkB8tsBlteeew3pclLveDMR6KISdOPx3+vzfLC2lg==
X-Google-Smtp-Source: AGHT+IGvNTdwSoh/F8B5nweJOevzb3IxIzqa9CU8UtcJuLQ74XgqEOs0JawqM+5pEGHnaDKajEqIYBIe3hvoRlbsnag=
X-Received: by 2002:a17:90b:607:b0:290:5246:beb3 with SMTP id
 gb7-20020a17090b060700b002905246beb3mr3549359pjb.37.1705773949737; Sat, 20
 Jan 2024 10:05:49 -0800 (PST)
MIME-Version: 1.0
References: <20240118182808.551258-1-francois.perrad@gadz.org>
 <20240119122459.253ad24c@windsurf>
In-Reply-To: <20240119122459.253ad24c@windsurf>
From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sat, 20 Jan 2024 19:05:38 +0100
Message-ID: <CAAE6iEVMQ48Bc4S3iHqEBe5vCPfx_N3JUHLERc01RppxtMiOfg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@busybox.net
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1705773950; x=1706378750; darn=busybox.net;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gr2hKKUDE+EFE6M+2bcAlhGVHOOSO9qoj4fQgDVvkFU=;
 b=YXg1Uxp5ByyqLLCC/ttiW8QJElVTSRSX+KesdOkgbNXAjeYQKmYIqaTG53dnIyFKLT
 U7AXhu86BRqGrXbKBrGkQd9uolx1cHkTItMo3dQX4/CCVk6Or6dJ1m/r1jwwZ7c5ibrp
 M67Gt5F1b7+HWYTxe0GODSOcpxjPo6tRGNkFvF2Ugj6g0kXD1x971GriGf3HpHeEEPSj
 35Hjzj1pE6G2FjOmTGkD4AKqJ0l8Tdt9OGAjFsGCHNcA3RkbKIS8f0TVwoKzJv5rVygg
 PEv2IFbFb+TfcVL0lVpPhbfDmKsL4WPv7zr0B03ucz+LvxvSV+SUDf19qZUlW8Mv6Ldp
 CBtw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=YXg1Uxp5
Subject: Re: [Buildroot] [PATCH] package/autoconf: bump to version 2.72
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
Content-Type: multipart/mixed; boundary="===============0313489453440861426=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0313489453440861426==
Content-Type: multipart/alternative; boundary="00000000000057f3ea060f6472b5"

--00000000000057f3ea060f6472b5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 19 janv. 2024 =C3=A0 12:25, Thomas Petazzoni via buildroot <
buildroot@buildroot.org> a =C3=A9crit :

> Hello Fran=C3=A7ois,
>
> On Thu, 18 Jan 2024 19:28:08 +0100
> Francois Perrad <fperrad@gmail.com> wrote:
>
> > https://git.savannah.gnu.org/cgit/autoconf.git/tree/NEWS?h=3Dv2.72
> > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>
> Thanks for the bump. How much testing did you do after this bump with
> packages that have AUTORECONF =3D YES ?
>
> It is indeed fairly common for autoconf bumps to break things. We
> certainly don't need a full testing coverage before merging (we have
> autobuilders for that), but the testing of a reasonably large
> configurations of packages that set AUTORECONF =3D YES would be nice.
>
>
Hello Thomas,

successfully tested with these packages:
luasyslog memcached mfoc mini-snmpd minizip-zlib monit mstpd mtr netsnmp
ngrep nut octave openntpd openocd openpgm pdbg perftest pixman
pkcs11-helper poke powertop pppd privoxy procps-ng psplash ptm2human ptpd2
python3 raptor restclient-cpp rrdtool screen scrub sdl sdl_mixer sedutil
shared-mime-info smack sngrep snort socketcand sofia-sip softether sox
spi-tools sscep start-stop-daemon stress syslog-ng tftpd tinydtls tinyxml
trousers util-linux vtun wolftpm wpan-tools zabbixzyre

It seems that this bump will not cause too many breakage.

Fran=C3=A7ois


> Thanks a lot!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--00000000000057f3ea060f6472b5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0ven. 19 janv. 2024 =C3=A0=C2=
=A012:25, Thomas Petazzoni via buildroot &lt;<a href=3D"mailto:buildroot@bu=
ildroot.org">buildroot@buildroot.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">Hello Fran=C3=A7ois,<br>
<br>
On Thu, 18 Jan 2024 19:28:08 +0100<br>
Francois Perrad &lt;<a href=3D"mailto:fperrad@gmail.com" target=3D"_blank">=
fperrad@gmail.com</a>&gt; wrote:<br>
<br>
&gt; <a href=3D"https://git.savannah.gnu.org/cgit/autoconf.git/tree/NEWS?h=
=3Dv2.72" rel=3D"noreferrer" target=3D"_blank">https://git.savannah.gnu.org=
/cgit/autoconf.git/tree/NEWS?h=3Dv2.72</a><br>
&gt; Signed-off-by: Francois Perrad &lt;<a href=3D"mailto:francois.perrad@g=
adz.org" target=3D"_blank">francois.perrad@gadz.org</a>&gt;<br>
<br>
Thanks for the bump. How much testing did you do after this bump with<br>
packages that have AUTORECONF =3D YES ?<br>
<br>
It is indeed fairly common for autoconf bumps to break things. We<br>
certainly don&#39;t need a full testing coverage before merging (we have<br=
>
autobuilders for that), but the testing of a reasonably large<br>
configurations of packages that set AUTORECONF =3D YES would be nice.<br>
<br></blockquote><div><br></div><div>Hello Thomas,<br><br>successfully test=
ed with these packages:<br>luasyslog memcached mfoc mini-snmpd minizip-zlib=
 monit mstpd mtr netsnmp ngrep nut octave openntpd openocd openpgm pdbg per=
ftest pixman pkcs11-helper poke powertop pppd privoxy procps-ng psplash ptm=
2human ptpd2 python3 raptor restclient-cpp rrdtool screen scrub sdl sdl_mix=
er sedutil shared-mime-info smack sngrep snort socketcand sofia-sip softeth=
er sox spi-tools sscep start-stop-daemon stress syslog-ng tftpd tinydtls ti=
nyxml trousers util-linux vtun wolftpm wpan-tools zabbixzyre<br><br>It seem=
s that this bump will not cause too many breakage.<br><br>Fran=C3=A7ois<br>=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Thanks a lot!<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div></div>

--00000000000057f3ea060f6472b5--

--===============0313489453440861426==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0313489453440861426==--
