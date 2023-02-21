Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E5EC61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 14:29:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 18F5B40FC5;
	Tue, 21 Feb 2023 14:29:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18F5B40FC5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hGxtSg9ZhP0b; Tue, 21 Feb 2023 14:29:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3BD3A40CD9;
	Tue, 21 Feb 2023 14:29:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3BD3A40CD9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EC3F01BF2F0
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 14:29:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D39B9611D2
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 14:29:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D39B9611D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kHQeJqBG4IYr for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 14:29:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8011160AD8
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8011160AD8
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 14:29:31 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id c32so2507941pgc.7
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 06:29:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RVVyXQpfk5P1L1PvkRqj0LdCamxGt5gdJQb1TUhyfO4=;
 b=jjdaiCS02WozpplVjdlC6kFR51XAgDBIs863IaLOWy91g6Rqc4jyzvQtWLRCVkn2ex
 wTglpvWivUg/Z9mCjjrYIZCCpoInJ5sfRylacNSewXZIxpc4zplVGDg0rSv3Dhkx4R+E
 Mw7UPgyNUJ6CnwjfqdNSzeeyBE3t8qDzjaFPJEBSwTpodvr3ZnABsY1iASCHtrxkiFhK
 gDruxqa2AeV2JxhlLZkFw7iMF1n79sTe9evaybp9qJ6POWg2StWiod7atp88nU3BknXc
 pdWwviW736kiTML3XimvhOraDFK7g0q3s+W2Dystn1Xag8tzDmcBnfe3GGyTKR+y6upR
 idDw==
X-Gm-Message-State: AO0yUKXU48aY4dlq+TGsjJTh+2+LJ9MAZMcTrcyV7NyjjdhuKg2ah5+M
 Ic4v3chwGkEwvfFcuS5mpQ3mRK/AeUv/aRTrgrlctDqGiPM=
X-Google-Smtp-Source: AK7set+pNGgzwcX6CBGiRRr8JUxFFTDMkR9Ko0DJa3/QXKv6xlCgGbHoVtW2/LKXkEmRdfOSORfsSG9LtmH6kV335SU=
X-Received: by 2002:a62:aa0d:0:b0:5a8:dc7b:db54 with SMTP id
 e13-20020a62aa0d000000b005a8dc7bdb54mr720973pff.35.1676989770657; Tue, 21 Feb
 2023 06:29:30 -0800 (PST)
MIME-Version: 1.0
References: <20230221112911.177963-1-fontaine.fabrice@gmail.com>
 <20230221150122.63e353f7@windsurf>
 <CAPi7W80vMSG032z4F_R94DkaKZ1YoD+z5UG8-7U6-kqi3_Nkqg@mail.gmail.com>
 <20230221152100.27549e20@windsurf>
In-Reply-To: <20230221152100.27549e20@windsurf>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 21 Feb 2023 15:29:19 +0100
Message-ID: <CAPi7W823EMjTZ8j2qJK0UdkaTCp9GGgu2_dcsvX1THvcuS+FSw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RVVyXQpfk5P1L1PvkRqj0LdCamxGt5gdJQb1TUhyfO4=;
 b=j7ZNIdKrFzFTaH+NICZrAFut6M1XHpLoaw4dvIQCTonPo0se835BJCPtn+k/1KqD89
 O4wWZqONHBXltMABo9j70+siuSo5d0ljWJAOlGfvtqtd6QrMYl1gHHIFFU9KKcK+cIWc
 of0hEebeUNIL2Tej/xg05++W/ElVYl5ZuQATtgTxR7OisidDaqFOw1JEqy8cTG8jN3LS
 zbJW2x3shW8ITPB3mZX8boAFrTtboTx/yDW+C2uX2q/ku830vuWD8lwyip6ST+tkB/Zz
 UuFZcuarm9KDSRCZJFpiTrEfPbJUiaO+FCcVtlkmRGFOw/jznE3Wdy6J1uipQy5e5hI9
 GoFg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=j7ZNIdKr
Subject: Re: [Buildroot] [PATCH 1/1]
 toolchain/toolchain-external/toolchain-external-synopsys-arc: drop locale
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============3150754527107978383=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3150754527107978383==
Content-Type: multipart/alternative; boundary="00000000000092730705f5369b50"

--00000000000092730705f5369b50
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 21 f=C3=A9vr. 2023 =C3=A0 15:21, Thomas Petazzoni <
thomas.petazzoni@bootlin.com> a =C3=A9crit :

> On Tue, 21 Feb 2023 15:09:47 +0100
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > I think the issue is that __UCLIBC_HAS_XLOCALE__ is disabled.
> > To my understanding, locale_t is defined in xlocale.h:
> >
> https://github.com/wbx-github/uclibc-ng/blob/ab1dd83bec59c9e65c31efd6e887=
182948f627be/include/xlocale.h#L46
>
> Possible indeed. There are newer versions of the ARC toolchain
> available at
> https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/release=
s
> ,
> but I checked the latest and it still has xlocale disabled.
>
> One option is to ask the ARC/Synopsys people to enable XLOCALE in their
> uClibc configuration.
>

I added a comment to an issue opened in 2020:
https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/issues/24=
1


>
> Another option is to drop the ARC/Synopsys toolchain entirely.
>
> A third option is to change the check done by Buildroot to verify
> __UCLIBC_HAS_XLOCALE__ instead of __UCLIBC_HAS_LOCALE__. This way it
> will be valid to say that the ARC toolchain does not have locale
> support.
>

I'll send a patch.


>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--00000000000092730705f5369b50
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mar. 21 f=C3=A9vr. 2023 =C3=
=A0=C2=A015:21, Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@boo=
tlin.com">thomas.petazzoni@bootlin.com</a>&gt; a =C3=A9crit=C2=A0:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, 21 Feb 2023 15:0=
9:47 +0100<br>
Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice@gmail.com" target=
=3D"_blank">fontaine.fabrice@gmail.com</a>&gt; wrote:<br>
<br>
&gt; I think the issue is that __UCLIBC_HAS_XLOCALE__ is disabled.<br>
&gt; To my understanding, locale_t is defined in xlocale.h:<br>
&gt; <a href=3D"https://github.com/wbx-github/uclibc-ng/blob/ab1dd83bec59c9=
e65c31efd6e887182948f627be/include/xlocale.h#L46" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/wbx-github/uclibc-ng/blob/ab1dd83bec59c9e65c=
31efd6e887182948f627be/include/xlocale.h#L46</a><br>
<br>
Possible indeed. There are newer versions of the ARC toolchain<br>
available at<br>
<a href=3D"https://github.com/foss-for-synopsys-dwc-arc-processors/toolchai=
n/releases" rel=3D"noreferrer" target=3D"_blank">https://github.com/foss-fo=
r-synopsys-dwc-arc-processors/toolchain/releases</a>,<br>
but I checked the latest and it still has xlocale disabled.<br>
<br>
One option is to ask the ARC/Synopsys people to enable XLOCALE in their<br>
uClibc configuration.<br></blockquote><div><br></div><div>I added a comment=
 to an issue opened in 2020:</div><div><a href=3D"https://github.com/foss-f=
or-synopsys-dwc-arc-processors/toolchain/issues/241">https://github.com/fos=
s-for-synopsys-dwc-arc-processors/toolchain/issues/241</a></div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Another option is to drop the ARC/Synopsys toolchain entirely.<br>
<br>
A third option is to change the check done by Buildroot to verify<br>
__UCLIBC_HAS_XLOCALE__ instead of __UCLIBC_HAS_LOCALE__. This way it<br>
will be valid to say that the ARC toolchain does not have locale<br>
support.<br></blockquote><div><br></div><div>I&#39;ll send a patch.<br></di=
v><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div></div>

--00000000000092730705f5369b50--

--===============3150754527107978383==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3150754527107978383==--
