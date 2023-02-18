Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B12A5C61DA4
	for <buildroot@archiver.kernel.org>; Sat, 18 Feb 2023 17:09:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20CD182251;
	Sat, 18 Feb 2023 17:09:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20CD182251
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P8q0xRdIjSCr; Sat, 18 Feb 2023 17:09:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5EFF482248;
	Sat, 18 Feb 2023 17:09:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5EFF482248
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8E4401BF3E5
 for <buildroot@lists.busybox.net>; Sat, 18 Feb 2023 17:09:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F18581FE4
 for <buildroot@lists.busybox.net>; Sat, 18 Feb 2023 17:09:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F18581FE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6_klUTKvuJyr for <buildroot@lists.busybox.net>;
 Sat, 18 Feb 2023 17:09:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83E2582003
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 83E2582003
 for <buildroot@buildroot.org>; Sat, 18 Feb 2023 17:09:10 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id 10so1141461oiz.3
 for <buildroot@buildroot.org>; Sat, 18 Feb 2023 09:09:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6D+JrGf1GuKPtxYMBiS3kKsg0bk3uypHYA9mSwxI9cs=;
 b=MgYrUKm6RPEXy1h1zISBn6B8iqLHTt9UFD9TVYNheRKPItoTHKbcQEDV+0DxOBUctR
 dY2Wd/mkCOXO69JdUEUQkbi5jMITeKheg7C3++B8oslFZWfElFFq9v7PFZ8YG/PptJcG
 H68nzxQjiI0tisxurhyQoiU/flkHQPRoT/FcA8GOubiB25kOsIsV/tdwx3Becnpz9X0j
 5Z3fJuWrGCCL0dXSBny4nLVAd2j1X5NS9jYRV5E6zyXoZOp0Z+JtdYMjQe0VrutNO/Jr
 PSE5rMUTfEeZ/5hY8fEgBEaSNA69wk0wj4uvvnNYLCiS0oMK95qCYJOVHL9uKm0pDae3
 HNlQ==
X-Gm-Message-State: AO0yUKV+RGqGTQ2Q7PDL8pRTzo4v1Qn6M5Ttf/gsXwQYUtKifYYL0YdX
 Dc299d7YPeNTA3mYYS+8+OWWw0G0fPIaBxzu54O4/OiQbs0=
X-Google-Smtp-Source: AK7set/2NK7ZIsteOD0o1N0KI0KJckMPCq+kz5PhohaHTIRF+vbGhmI5sMj0PV/u5XHmcmqybetaJJcG2UspgCrFajs=
X-Received: by 2002:a05:6808:2385:b0:367:18a6:eb14 with SMTP id
 bp5-20020a056808238500b0036718a6eb14mr879173oib.208.1676740149456; Sat, 18
 Feb 2023 09:09:09 -0800 (PST)
MIME-Version: 1.0
References: <CADYjeStw7HOAxA_ipNUNW4EsQzUZQydhW+Uaa8_UusE_wisy-g@mail.gmail.com>
 <20230218121846.306f95f5@windsurf>
In-Reply-To: <20230218121846.306f95f5@windsurf>
From: Sourabh Hegde <hrsourabh011@gmail.com>
Date: Sat, 18 Feb 2023 18:09:00 +0100
Message-ID: <CADYjeSuabp-+BxUL+nEhqfUA5saeaxQvQOvM9rniYSqp3moosQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6D+JrGf1GuKPtxYMBiS3kKsg0bk3uypHYA9mSwxI9cs=;
 b=A+kxJvvy2FuykfDsC0BBTjvuTMEdmE/yGtR8ek6F83IvyqDyLj4SgXd+67MAs9ihsT
 xjSpCFNTpdyA0/In7M1wGe2Sbb//SxXW8JBa6qmX6C+nmoWwLRLbcWsXZpGXsUA3oOcj
 VnSCjVOhCsaEb6xh21ZlrmH8fSG5XPBJy07oCCO11dBKhndp9C8YIl85WOt3FHLrQlZ8
 FgcB1aVpbHvDTW2+8ICZSS2XszzsIS4w2AvuiG9qHhDhDWJ6xK7dTNopvhqhAXcpTxjH
 6npvr6SVvPH2X7f2fWT+Gpe3di292inKzbx7HrQTBMHVe83ghnQaOBKss5R5Hc/owfMA
 5VSw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=A+kxJvvy
Subject: Re: [Buildroot] Missing curl binary
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
Content-Type: multipart/mixed; boundary="===============8189021515410564378=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8189021515410564378==
Content-Type: multipart/alternative; boundary="000000000000fd31ce05f4fc7c2d"

--000000000000fd31ce05f4fc7c2d
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

Yes, that was the issue. Doing "make libcurl-dirclean all" fixed it.

Thanks for the support

On Sat, 18 Feb 2023 at 12:18, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
wrote:

> On Fri, 17 Feb 2023 16:52:49 +0100
> Sourabh Hegde <hrsourabh011@gmail.com> wrote:
>
> > I am trying to include curl binary in my image. I have
> > selected BR2_PACKAGE_LIBCURL=y , BR2_PACKAGE_LIBCURL_CURL=y in the
> Config.
> > But still the curl binary is not installed in the target. Can anyone
> please
> > let me know what is the issue here and how to resolve it?
>
> I suppose you did a build with BR2_PACKAGE_LIBCURL=y, then after the
> build completed you changed the configuration to enable
> BR2_PACKAGE_LIBCURL_CURL=y and just ran "make". This doesn't work, as
> the libcurl package is already built, and Buildroot is not smart enough
> to detect that you changed something related to the libcurl
> configuration.
>
> Run: "make libcurl-dirclean all" to force rebuilding the libcurl
> package (or do a full rebuild).
>
> See https://buildroot.org/downloads/manual/manual.html#full-rebuild for
> more details.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--000000000000fd31ce05f4fc7c2d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Thomas,<div><br></div><div>Yes, that was the issue. Doi=
ng &quot;make libcurl-dirclean all&quot; fixed it.</div><div><br></div><div=
>Thanks for the support</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Sat, 18 Feb 2023 at 12:18, Thomas Petazzon=
i &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com">thomas.petazzoni@boot=
lin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On Fri, 17 Feb 2023 16:52:49 +0100<br>
Sourabh Hegde &lt;<a href=3D"mailto:hrsourabh011@gmail.com" target=3D"_blan=
k">hrsourabh011@gmail.com</a>&gt; wrote:<br>
<br>
&gt; I am trying to include curl binary in my image. I have<br>
&gt; selected BR2_PACKAGE_LIBCURL=3Dy , BR2_PACKAGE_LIBCURL_CURL=3Dy in the=
 Config.<br>
&gt; But still the curl binary is not installed in the target. Can anyone p=
lease<br>
&gt; let me know what is the issue here and how to resolve it?<br>
<br>
I suppose you did a build with BR2_PACKAGE_LIBCURL=3Dy, then after the<br>
build completed you changed the configuration to enable<br>
BR2_PACKAGE_LIBCURL_CURL=3Dy and just ran &quot;make&quot;. This doesn&#39;=
t work, as<br>
the libcurl package is already built, and Buildroot is not smart enough<br>
to detect that you changed something related to the libcurl<br>
configuration.<br>
<br>
Run: &quot;make libcurl-dirclean all&quot; to force rebuilding the libcurl<=
br>
package (or do a full rebuild).<br>
<br>
See <a href=3D"https://buildroot.org/downloads/manual/manual.html#full-rebu=
ild" rel=3D"noreferrer" target=3D"_blank">https://buildroot.org/downloads/m=
anual/manual.html#full-rebuild</a> for<br>
more details.<br>
<br>
Best regards,<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>

--000000000000fd31ce05f4fc7c2d--

--===============8189021515410564378==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8189021515410564378==--
