Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0B31E784BB
	for <buildroot@archiver.kernel.org>; Mon,  2 Oct 2023 15:07:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DE3F82035;
	Mon,  2 Oct 2023 15:07:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DE3F82035
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l-Z3gx5OoQUP; Mon,  2 Oct 2023 15:07:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BED978202F;
	Mon,  2 Oct 2023 15:07:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BED978202F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 796B11BF2B7
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 15:07:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 528D040C2A
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 15:07:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 528D040C2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JpUDUM3xttqQ for <buildroot@lists.busybox.net>;
 Mon,  2 Oct 2023 15:07:23 +0000 (UTC)
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DC03F405BE
 for <buildroot@buildroot.org>; Mon,  2 Oct 2023 15:07:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC03F405BE
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-50433d8385cso24865240e87.0
 for <buildroot@buildroot.org>; Mon, 02 Oct 2023 08:07:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696259241; x=1696864041;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Frmyp4fqLiZE3O7Mv/VfjCMgFf4VRzuXfdGNfF0CkNY=;
 b=rpt1wbnoWpn2MJGu5Lf/I7Xx6Cbh3xN5FfNjcUTUXtb2ok3tNTMfSXYYye/E/Gh4FY
 0NsjJRX3EnrAdOZMQSzfwS6hErD/DlIPbgjsFFinsVxrO28gimSSsDyZc4O62r5N9fhy
 Ax89s2zdcg5c0NN+IEe/JN8QcCK7rHpvc0dVNCY6E2mqJHBwdxM0YJtT8gF1o4bnQDAH
 Q2BrGiqje0cZjgW7jk2FsHyvCvwJwRiKTotdkXSlxw0PhBTDlQwh5ZYqZknHemU5a1Ea
 hHNpmgQe4KLj0VpY3jYnqfvAPP4HW7j1TTC6LTdpm3Cjpb1GsBN11XWa0mUY0hyAHjed
 XkYw==
X-Gm-Message-State: AOJu0YzEasNz6GYvJTGasqO0MwYUN33QEhuo/Ds6nNmI+A9GEvQlG9Zi
 V4I+z+1j5IRz9I5CjSjsYt/L8OtpWiPaOs/u980=
X-Google-Smtp-Source: AGHT+IEY7vnmxtM0arwfMkezdmyo0O3yyA4hgMCZ6vEVcg6Hl9JArVWUXTO4NxMtHcNxe4pNxmPNhO5fv8pkVcMZZB0=
X-Received: by 2002:a05:6512:3d22:b0:4ff:8f71:9713 with SMTP id
 d34-20020a0565123d2200b004ff8f719713mr12739609lfv.42.1696259240394; Mon, 02
 Oct 2023 08:07:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230930132822.436857-1-fontaine.fabrice@gmail.com>
 <20230930160831.11292fee@windsurf>
In-Reply-To: <20230930160831.11292fee@windsurf>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 2 Oct 2023 17:07:08 +0200
Message-ID: <CAPi7W830r5TrZ0dsBnWdwifMpAemDu4aoNi98NDYquMTa67xKA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696259241; x=1696864041; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Frmyp4fqLiZE3O7Mv/VfjCMgFf4VRzuXfdGNfF0CkNY=;
 b=T6NueCKM2qtfz9zCwKGq9IqKlAmB92mJLVfuOKUKMqouZRAa99Zgaib+U6WXaQknqW
 V4/E5O7K8gL95hgLuK7SH6T8+6Zyc6idSVwmdM59HorekM95tRdN7lCV6RPSNtEDcIVL
 yhGmITkw1pQ6Df6X8fKmfwfuplxKczRt07bNY2UnsXov8Ay925/W8KO7RV9UO5tnxi0/
 3j8CY0gtYXlIjqrV33Lc/gPOoNQUsrlnsGdEkDbNcsm4TNRfZj5lSAXi/nk+GW7uNnEa
 1U/PCgb5qJuQrHLSkIw2hXIuzUdq8yXze23UPnu6g3JTEbbuxr7Nbri8hxW1KCwjZSwc
 Mwig==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=T6NueCKM
Subject: Re: [Buildroot] [PATCH 1/1] package/open-iscsi: fix musl build
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
Cc: TIAN Yuanhao <tianyuanhao3@163.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============3896906828271475309=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3896906828271475309==
Content-Type: multipart/alternative; boundary="0000000000007883ac0606bd219d"

--0000000000007883ac0606bd219d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le sam. 30 sept. 2023 =C3=A0 16:08, Thomas Petazzoni <
thomas.petazzoni@bootlin.com> a =C3=A9crit :

> On Sat, 30 Sep 2023 15:28:22 +0200
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > ++#ifndef GLOB_ONLYDIR
> > ++#define GLOB_ONLYDIR        0x100
> > ++#endif
>
> But musl doesn't support this flag, so isn't that wrong? musl will most
> likely ignore it. What is the impact on the application if the glob
> also matches files, not just directories? Perhaps it breaks the
> application behavior. Are you sure we can just blindly do this
> workaround?
>

Upstream thinks that the application will not break:
https://github.com/open-iscsi/open-iscsi/pull/426#issuecomment-1743136865


>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com

Best Regards,

Fabrice

--0000000000007883ac0606bd219d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0sam. 30 sept. 2023 =C3=A0=C2=
=A016:08, Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.c=
om">thomas.petazzoni@bootlin.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">On Sat, 30 Sep 2023 15:28:22 +=
0200<br>
Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice@gmail.com" target=
=3D"_blank">fontaine.fabrice@gmail.com</a>&gt; wrote:<br>
<br>
&gt; ++#ifndef GLOB_ONLYDIR<br>
&gt; ++#define GLOB_ONLYDIR=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x100<br>
&gt; ++#endif<br>
<br>
But musl doesn&#39;t support this flag, so isn&#39;t that wrong? musl will =
most<br>
likely ignore it. What is the impact on the application if the glob<br>
also matches files, not just directories? Perhaps it breaks the<br>
application behavior. Are you sure we can just blindly do this<br>
workaround?<br></blockquote><div><br></div><div>Upstream thinks that the ap=
plication will not break: <a href=3D"https://github.com/open-iscsi/open-isc=
si/pull/426#issuecomment-1743136865">https://github.com/open-iscsi/open-isc=
si/pull/426#issuecomment-1743136865</a></div><div>=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a></blockquote><div>Best Regards,</div><div><br></div><div>F=
abrice <br></div></div></div>

--0000000000007883ac0606bd219d--

--===============3896906828271475309==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3896906828271475309==--
