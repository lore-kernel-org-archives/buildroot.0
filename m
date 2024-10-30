Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C30D6D74977
	for <buildroot@archiver.kernel.org>; Wed, 30 Oct 2024 06:14:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31DCF60850;
	Wed, 30 Oct 2024 06:14:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T1dNl78FFNqM; Wed, 30 Oct 2024 06:14:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0382E60856
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0382E60856;
	Wed, 30 Oct 2024 06:14:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A0A14969
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 06:14:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EBEDE808AB
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 06:14:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hb5v8Fg9FXdG for <buildroot@buildroot.org>;
 Wed, 30 Oct 2024 06:14:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::a2b; helo=mail-vk1-xa2b.google.com;
 envelope-from=lars@underjord.io; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7398980C44
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7398980C44
Received: from mail-vk1-xa2b.google.com (mail-vk1-xa2b.google.com
 [IPv6:2607:f8b0:4864:20::a2b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7398980C44
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 06:14:01 +0000 (UTC)
Received: by mail-vk1-xa2b.google.com with SMTP id
 71dfb90a1353d-50d2d300718so1783720e0c.1
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 23:14:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730268840; x=1730873640;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AXLooKE3PF1zRfZmo7RS1L3Pcejo8MMIUMuc4ylJsi8=;
 b=HaRRqW9j7tPS3o4RhOsjAWuDNvCz06mU4aCLjJVv6imM1dbE3xZlnHzwiRFIjj16F8
 JW2c72+ZcihYrGFFrdYA6bocXB5OcVpEESg9oJCWBba7dGA0lSOGEKrshjd8Cft/n1OX
 riprk7qfDcNbw3Be16+eFw5u0OtcgCLnywk//zTTqf+2nyA6rR6mDHsmXUYss8Zx7zOr
 /Lb9DtxcDXCsNJgVv6vhnqNHJC5RLzPZbNoq9YEcv4eqcSgvjwHlrUOHio0cNAwokZQ2
 cq+UUSjPACkC0Bu2OQbdtRgBKSpcoycwmj66/JgZ9rp11PDmgBiToyzaesDkkQ6fAmBr
 OMUQ==
X-Gm-Message-State: AOJu0Yw3Afi3bvnDY3+TNIvPnFq/O3emQCSBxkU/2D1dSUFkJWidJuAi
 BFYtXvLTKh6D+rFbwxWRAJKE8qnKedxH5V+zMCIrrWvaL79qe4AFYl9IXwtf+Z4Q4akrwGS+ARY
 uP0TBiPgCJtNBAG1nEDrKgFZfM4NAq3PShxjk6Q==
X-Google-Smtp-Source: AGHT+IGPUKwGU6bfqn9mdKHk96Irs1Z+HcHru+hqfV7XUi6t53mDlY3h5ZzRSlM/GDsD+ZFl74GVLa9yN9HlSexoFQA=
X-Received: by 2002:a05:6122:ca7:b0:50d:bfd3:c834 with SMTP id
 71dfb90a1353d-5101501ea43mr12090837e0c.4.1730268840013; Tue, 29 Oct 2024
 23:14:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240903100952.3789698-1-lars@underjord.io>
 <20241029230630.5e4d6805@windsurf>
In-Reply-To: <20241029230630.5e4d6805@windsurf>
From: Lars Wikman <lars@underjord.io>
Date: Wed, 30 Oct 2024 07:13:49 +0100
Message-ID: <CADqW+qnHgcbQQ8AwEk6L9r_wQ+_hr7VPpv=uFyn1uFMD6jM3Rg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Sergey Matyukevich <geomatsi@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=underjord.io; s=google; t=1730268840; x=1730873640; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AXLooKE3PF1zRfZmo7RS1L3Pcejo8MMIUMuc4ylJsi8=;
 b=a2uIbn6nW3m2j9tzY127ojG9wI+wo5ivObtg3o9FOHrRRn9an9geSidhs2jCgq8d1t
 FryiHlU1avSSn+GAtKFwGeNtzRdllv6yJISWL+xbUaZu91ikXJXXzTUafb9U6/WknuPW
 SzFrk3DDpFFBSOQchCdjvwxhE8bWv/I2Nw3CsI0rksz6D+bFIHmN6WQ839qVgTIyltdz
 LWiyiePh+IwufktNdmwoispFmcH1qfWsMZRxAUqhlaercY7uHl3NUNyKSVTto/XJlCz7
 yUxWJ+2j40AXBMhG85y6QdF8mrAj4v2cr65jW7B/0GjUF1r+N217eaKQvvye3Ixyr/dA
 QvKg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=underjord.io
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=underjord.io header.i=@underjord.io header.a=rsa-sha256
 header.s=google header.b=a2uIbn6n
Subject: Re: [Buildroot] [PATCH v3] package/wpa_supplicant: add Smart card
 option
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============5043829062751071552=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5043829062751071552==
Content-Type: multipart/alternative; boundary="0000000000009349f50625ab9b43"

--0000000000009349f50625ab9b43
Content-Type: text/plain; charset="UTF-8"

Hi

Thanks for testing it out. I think you have the right idea. I can add those.

-L

On Tue, 29 Oct 2024 at 23:06, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
wrote:

> Hello Lars,
>
> On Tue,  3 Sep 2024 12:09:52 +0200
> Lars Wikman <lars@underjord.io> wrote:
>
> > CONFIG_SMARTCARD was unconditionally disabled which has meant that
> > even if OpenSSL is compiled with engine support and the supplicant
> > is configured to use an engine it would warn that it was compiled
> > without engine support.
> >
> > This mechanism is used to enable the more secure forms of 802.1x
> > networking authentication such as EAP-TLS with hardware-delegated
> > cryptography and private keys protected in hardware.
> >
> > It is still disabled by default in case there was an original reason.
> >
> > Enabling the option will allow delegating private key access to TPM2,
> > ARM TrustZone and other specialized secure hardware for establishing
> > a network connection.
> >
> > Signed-off-by: Lars Wikman <lars@underjord.io>
> >
> > ---
> > Changes v1 -> v2:
> >   - Change option name to focus on smartcard  (suggested by Sergey)
> > Changes v2 -> v3:
> >   - Change setting disabled to match convention (suggested by Baruch)
>
> Sorry for the delay in getting back to you. I reviewed/tested your
> patch, but I believe something needs to be improved, but I wasn't sure
> so I wasn't confident to do it myself.
>
> I built the following configuration:
>
> BR2_arm=y
> BR2_cortex_a9=y
> BR2_ARM_ENABLE_VFP=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> BR2_INIT_NONE=y
> BR2_SYSTEM_BIN_SH_NONE=y
> # BR2_PACKAGE_BUSYBOX is not set
> BR2_PACKAGE_WPA_SUPPLICANT=y
> # BR2_PACKAGE_WPA_SUPPLICANT_NL80211 is not set
> BR2_PACKAGE_WPA_SUPPLICANT_SMARTCARD=y
> # BR2_TARGET_ROOTFS_TAR is not set
>
> which really has just wpa_supplicant with all options disabled except
> smartcard. And my understanding is that in this configuration...
> enabling the smartcard option is a no-op, because I don't even have
> OpenSSL enabled in my configuration.
>
> Since the smartcard option only affects the OpenSSL integration in
> wpa_supplicant, shouldn't this option have:
>
>         select BR2_PACKAGE_OPENSSL
>         select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
>
> like the other options that need OpenSSL support?
>
> Thanks in advance for your feedback,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

--0000000000009349f50625ab9b43
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi</div><div dir=3D"auto"><br></div><div dir=3D"auto">Tha=
nks for testing it out. I think you have the right idea. I can add those.</=
div><div dir=3D"auto"><br></div><div dir=3D"auto">-L</div><div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 29 Oct 202=
4 at 23:06, Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin=
.com">thomas.petazzoni@bootlin.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;b=
order-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)"=
>Hello Lars,<br>
<br>
On Tue,=C2=A0 3 Sep 2024 12:09:52 +0200<br>
Lars Wikman &lt;<a href=3D"mailto:lars@underjord.io" target=3D"_blank">lars=
@underjord.io</a>&gt; wrote:<br>
<br>
&gt; CONFIG_SMARTCARD was unconditionally disabled which has meant that<br>
&gt; even if OpenSSL is compiled with engine support and the supplicant<br>
&gt; is configured to use an engine it would warn that it was compiled<br>
&gt; without engine support.<br>
&gt; <br>
&gt; This mechanism is used to enable the more secure forms of 802.1x<br>
&gt; networking authentication such as EAP-TLS with hardware-delegated<br>
&gt; cryptography and private keys protected in hardware.<br>
&gt; <br>
&gt; It is still disabled by default in case there was an original reason.<=
br>
&gt; <br>
&gt; Enabling the option will allow delegating private key access to TPM2,<=
br>
&gt; ARM TrustZone and other specialized secure hardware for establishing<b=
r>
&gt; a network connection.<br>
&gt; <br>
&gt; Signed-off-by: Lars Wikman &lt;<a href=3D"mailto:lars@underjord.io" ta=
rget=3D"_blank">lars@underjord.io</a>&gt;<br>
&gt; <br>
&gt; ---<br>
&gt; Changes v1 -&gt; v2:<br>
&gt;=C2=A0 =C2=A0- Change option name to focus on smartcard=C2=A0 (suggeste=
d by Sergey)<br>
&gt; Changes v2 -&gt; v3:<br>
&gt;=C2=A0 =C2=A0- Change setting disabled to match convention (suggested b=
y Baruch)<br>
<br>
Sorry for the delay in getting back to you. I reviewed/tested your<br>
patch, but I believe something needs to be improved, but I wasn&#39;t sure<=
br>
so I wasn&#39;t confident to do it myself.<br>
<br>
I built the following configuration:<br>
<br>
BR2_arm=3Dy<br>
BR2_cortex_a9=3Dy<br>
BR2_ARM_ENABLE_VFP=3Dy<br>
BR2_TOOLCHAIN_EXTERNAL=3Dy<br>
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=3Dy<br>
BR2_INIT_NONE=3Dy<br>
BR2_SYSTEM_BIN_SH_NONE=3Dy<br>
# BR2_PACKAGE_BUSYBOX is not set<br>
BR2_PACKAGE_WPA_SUPPLICANT=3Dy<br>
# BR2_PACKAGE_WPA_SUPPLICANT_NL80211 is not set<br>
BR2_PACKAGE_WPA_SUPPLICANT_SMARTCARD=3Dy<br>
# BR2_TARGET_ROOTFS_TAR is not set<br>
<br>
which really has just wpa_supplicant with all options disabled except<br>
smartcard. And my understanding is that in this configuration...<br>
enabling the smartcard option is a no-op, because I don&#39;t even have<br>
OpenSSL enabled in my configuration.<br>
<br>
Since the smartcard option only affects the OpenSSL integration in<br>
wpa_supplicant, shouldn&#39;t this option have:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_OPENSSL<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL<br>
<br>
like the other options that need OpenSSL support?<br>
<br>
Thanks in advance for your feedback,<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, CTO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div></div>

--0000000000009349f50625ab9b43--

--===============5043829062751071552==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5043829062751071552==--
