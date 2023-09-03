Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8144DC83F2C
	for <buildroot@archiver.kernel.org>; Sun,  3 Sep 2023 06:43:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E224B40361;
	Sun,  3 Sep 2023 06:43:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E224B40361
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UFEAgoWE4MfG; Sun,  3 Sep 2023 06:43:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4D9E400DF;
	Sun,  3 Sep 2023 06:43:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4D9E400DF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 65B5E1BF3EF
 for <buildroot@lists.busybox.net>; Sun,  3 Sep 2023 06:43:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 38ACA401AD
 for <buildroot@lists.busybox.net>; Sun,  3 Sep 2023 06:43:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38ACA401AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 069X45e344IV for <buildroot@lists.busybox.net>;
 Sun,  3 Sep 2023 06:43:04 +0000 (UTC)
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 59ECF400EC
 for <buildroot@buildroot.org>; Sun,  3 Sep 2023 06:43:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59ECF400EC
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5298e43bb67so884431a12.1
 for <buildroot@buildroot.org>; Sat, 02 Sep 2023 23:43:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693723382; x=1694328182;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Yb2804OQ1ruchU9/G8DWYpDn4bnYm74sFsS6wURqP88=;
 b=ZTgDTcfgC0YeKO1q4HGFOM85a0cZoQgSpwNUE74ZcGFOiEV8aWR6inWLoJSQ6FrUMb
 OyDYEuJ4rDDQXPb3lVd/921OCFoN5IncOwQlzCbMpDCKhKRPowVnmZ/bsPlgsQiET3Wy
 7n6T6yF7gZ5MhXRduIPFzDwy6MOR/Kma533irGSN62mXBWzSphjr7j1v26SVv0f7Tnkq
 s0r0BgkZQWUiv+l5vTs8bNAvwo+73sMOfWrxFkWnX67rt6SNNAapKNkDvg9skPyZJV79
 tTAx6WxlBEMd+YWlo14Ovxd+fDHMH1r6EVQET46/JRL/DAQI7dFZ3vhPGL6x9ItHVHc0
 GzZg==
X-Gm-Message-State: AOJu0Yz423hPzE/rEkMT8B/nH2RtsnAGBE3RkLAZHfEOVAlSY+109QAr
 zKpw+blfeiv+ue3xAoWhKqb1PABw/d0BAbcKzOQ=
X-Google-Smtp-Source: AGHT+IEsf7bQlqrpTaBKhKG/rjOXUSMCz0pm2n7g2LXuBLh8cpyUywmf6ZZWN0td21FZz7l1OjnDQK/UmEHAPgUYIhc=
X-Received: by 2002:a05:6402:17d0:b0:52c:8e9b:6bcd with SMTP id
 s16-20020a05640217d000b0052c8e9b6bcdmr2276360edy.12.1693723382183; Sat, 02
 Sep 2023 23:43:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAPmASevJ9KynWxPBga3chKQCBVUCeZ-gt88LMfAzt6+-F6bZHw@mail.gmail.com>
 <b8d73440-18af-a0c6-d3ca-928104b22844@benettiengineering.com>
In-Reply-To: <b8d73440-18af-a0c6-d3ca-928104b22844@benettiengineering.com>
From: Andrea Simeoni <andreasimeoni73@gmail.com>
Date: Sun, 3 Sep 2023 08:42:51 +0200
Message-ID: <CAPmASes2TPHpX_uZbatW8icnq1hhheKVrd7nJAuCcosc6AyPsA@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693723382; x=1694328182; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Yb2804OQ1ruchU9/G8DWYpDn4bnYm74sFsS6wURqP88=;
 b=n+8dgldL8VH7iJlGUSX0lbL0yH46DTprvqJ5rt7cjWTniguLcx/M2MC5Yy3OlIuDLG
 xlEE/rvyBpLnoXHKeCJtpbrWGagsr7sNrhq7mMPGApeBeEIaHe0wo+wEYN8R7T4HNGus
 WfXzfuUPpNeMKmauDaWiZAc+RpaI9f8ipzGX47HbYADuYzUBa/eikttOKDatxfmCGQqV
 AjqfRm2wpqz5/AGRbip0KGukru2ifD3HtMI2McyX4kIeqwJrc9W3szBLzmSVBvOp/5pi
 6WXazyr24KjBMI9l3P5R6Dkr9v5bnNGF+AXpAf4szmGOT7Z7tTNXiCOTSXAbqDWy8Y0o
 UB0Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=n+8dgldL
Subject: Re: [Buildroot] stat command missing
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
Content-Type: multipart/mixed; boundary="===============0215614705913269590=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0215614705913269590==
Content-Type: multipart/alternative; boundary="0000000000008afc7306046eb4d3"

--0000000000008afc7306046eb4d3
Content-Type: text/plain; charset="UTF-8"

> Enabling Busybox CONFIG_STAT option works good for me. How do you enable
> it?
>
> I mean, you have to add a busybox config file or a fragment.
> To do the first test you can issue:
> $ make busybox-menuconfig
> and enable it under Coreutils
> then you have to rebuild it with:
> $ make busybox-rebuild
>
> but the best way is to supply a busybox config fragment.
>

Hi Giulio,
I set BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES to  CONFIG_STAT=y and then
I issued make busybox-dirclean && make busybox-reconfigure. But as said it
didn't accept that option.

I didn't know the <package>-menuconfig target. It's great!
I followed your steps and now I have a working stat on my image, thanks!
Andrea

--0000000000008afc7306046eb4d3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_quote"><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
Enabling Busybox CONFIG_STAT option works good for me. How do you enable<br=
>
it?<br>
<br>
I mean, you have to add a busybox config file or a fragment.<br>
To do the first test you can issue:<br>
$ make busybox-menuconfig<br>
and enable it under Coreutils<br>
then you have to rebuild it with:<br>
$ make busybox-rebuild<br>
<br>
but the best way is to supply a busybox config fragment.<br></blockquote><d=
iv><br></div><div>Hi Giulio,<br></div><div>I set=C2=A0BR2_PACKAGE_BUSYBOX_C=
ONFIG_FRAGMENT_FILES to=C2=A0 CONFIG_STAT=3Dy and then I issued make busybo=
x-dirclean &amp;&amp; make busybox-reconfigure. But as said it didn&#39;t a=
ccept that option.<br></div><div><br></div><div>I didn&#39;t know the &lt;p=
ackage&gt;-menuconfig target. It&#39;s great!</div><div>I followed your ste=
ps and now I have a working stat on my image, thanks!</div><div>Andrea</div=
><div><br></div></div></div>

--0000000000008afc7306046eb4d3--

--===============0215614705913269590==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0215614705913269590==--
