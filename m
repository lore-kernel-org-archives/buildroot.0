Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C350FC636CC
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 14:26:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62B9960E80;
	Mon, 20 Feb 2023 14:26:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62B9960E80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s4H-IRUAyfcL; Mon, 20 Feb 2023 14:26:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1DAD60BF2;
	Mon, 20 Feb 2023 14:26:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1DAD60BF2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 712631BF2B4
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 14:26:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 583E981311
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 14:26:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 583E981311
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ml-5_ix3dgpf for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 14:26:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A285F81288
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A285F81288
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 14:26:02 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id a7so822016pfx.10
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 06:26:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RIStincCAYoOSH8cDRZWtOQ0GiJ8OipB4sb1mc8BIcU=;
 b=PdbNPkk28E7432iHiIxeAxdRMTZJltxZA0/+1YeatJeyXi0uIb7v4GQ37aNcWtiPIx
 HJzeIq2c/Af/8mhDFTbKKeBmk2hNfSrtqpTlBaUlOtvXYl5+ovTrUbFXafhYwY3DFlGJ
 89WRVjz+hvW/ZpVpN3GTUinP5hH6VQyr6iNf6p1iWxAGhyYQIViH5BeXjTvnK39T3bS/
 zkQVFhSxgBysvCItlQKo/HazEf5hpomJBa+kLeqINQv57cigCav9EZj64SXZraQlFIWt
 YrzSpJzDK5JWu/lXjveXI+f+WnV3BTrT3bb2ozeR0DIsW71zdcghOileotTORVO2+rlA
 cNKQ==
X-Gm-Message-State: AO0yUKXKiU1dNL1LuJDOLoXo6j0dhDNrHA+NIcD687c6nQthTVv7Wo07
 0sjKvmXVD8cxf67usKZA6mrXOMulR4hx9/qfFtE=
X-Google-Smtp-Source: AK7set+3hoAzSVKOQs3MwlpqhQ+V3F8+P74Ea1wOX9nFqsJ1fPrgaEChwkAiry9ntp7pNBmgN2L1t5IsFoAhVx+RkTQ=
X-Received: by 2002:a62:52c2:0:b0:590:3182:9339 with SMTP id
 g185-20020a6252c2000000b0059031829339mr185892pfb.0.1676903162046; Mon, 20 Feb
 2023 06:26:02 -0800 (PST)
MIME-Version: 1.0
References: <20230220094653.105814-1-fontaine.fabrice@gmail.com>
 <20230220150625.6a523f4f@windsurf>
In-Reply-To: <20230220150625.6a523f4f@windsurf>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 20 Feb 2023 15:25:50 +0100
Message-ID: <CAPi7W82NmJu4Fj4PE=Kk-nC=k55Rao+pB_D-Zcvyri5Gx6MpKg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RIStincCAYoOSH8cDRZWtOQ0GiJ8OipB4sb1mc8BIcU=;
 b=jsitf7SkqumIo2V060PiebAQIfUe6oZM8dDoLhc/1lR2qpvtgOIevdNRR93cuHA80M
 deLac7l+QIY47YQqDY3iVaGblId7cOQ3RkAnL/qz8GCT2b97ak7rjcgeAhJq/wLug7g7
 hbhzYXN+xVyIECNshHislUt8uNCMG9LUSlnhaeVLpeK+vdKbYvJjUi0NXEXc6jTd1hHQ
 KAXJmjpSK0VJ2mMmnpRhGNKF+6b/Y7sExJnjjTlBIj0vRsFUyITHFUw6kwo+ZZCFoYJq
 sL72EfdduzYNqwjws5+geNwIK8qxkHFE4S3aPwJUu4Bm88PzeQAwIMCjGdFLLFgB2o5e
 xvYA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=jsitf7Sk
Subject: Re: [Buildroot] [PATCH 1/1] package/libarchive: fix per-package
 build
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============6809708562410095997=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6809708562410095997==
Content-Type: multipart/alternative; boundary="0000000000004bf0b605f522714c"

--0000000000004bf0b605f522714c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Thomas,

Le lun. 20 f=C3=A9vr. 2023 =C3=A0 15:06, Thomas Petazzoni <
thomas.petazzoni@bootlin.com> a =C3=A9crit :

> Hello Fabrice,
>
> On Mon, 20 Feb 2023 10:46:53 +0100
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > Fix the following per-package build failure raised since commit
> > 9525bc7e64e8f44c31ab9dfd3f516ecb35982429:
>
> Thanks for the fix. However, why do you think this is related to
> per-package?
>

Indeed, the build failures are also raised without per-package, I'll send a
v2.


>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com


Best Regards,

Fabrice

--0000000000004bf0b605f522714c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Thomas,<br><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">Le=C2=A0lun. 20 f=C3=A9vr. 2023 =C3=A0=C2=A01=
5:06, Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com" =
target=3D"_blank">thomas.petazzoni@bootlin.com</a>&gt; a =C3=A9crit=C2=A0:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hello Fabrice,<b=
r>
<br>
On Mon, 20 Feb 2023 10:46:53 +0100<br>
Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice@gmail.com" target=
=3D"_blank">fontaine.fabrice@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Fix the following per-package build failure raised since commit<br>
&gt; 9525bc7e64e8f44c31ab9dfd3f516ecb35982429:<br>
<br>
Thanks for the fix. However, why do you think this is related to<br>
per-package?<br></blockquote><div><br></div><div>Indeed, the build failures=
 are also raised without per-package, I&#39;ll send a v2.<br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Best regards,<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a></blockquote><div><br></div><div>Best Regards,</div><div><=
br></div><div>Fabrice <br></div></div></div>

--0000000000004bf0b605f522714c--

--===============6809708562410095997==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6809708562410095997==--
