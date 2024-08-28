Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4F04C636EE
	for <buildroot@archiver.kernel.org>; Wed, 28 Aug 2024 18:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B47C60D70;
	Wed, 28 Aug 2024 18:46:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0XcnEN3jA3vp; Wed, 28 Aug 2024 18:46:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A253060D7B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A253060D7B;
	Wed, 28 Aug 2024 18:46:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 12B2F1BF3DB
 for <buildroot@lists.busybox.net>; Wed, 28 Aug 2024 18:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0017560D70
 for <buildroot@lists.busybox.net>; Wed, 28 Aug 2024 18:46:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o8AWgdO6w0aI for <buildroot@lists.busybox.net>;
 Wed, 28 Aug 2024 18:46:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::112f; helo=mail-yw1-x112f.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E8BB660D6B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8BB660D6B
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E8BB660D6B
 for <buildroot@buildroot.org>; Wed, 28 Aug 2024 18:46:44 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-6b0c5b1adfaso63291077b3.0
 for <buildroot@buildroot.org>; Wed, 28 Aug 2024 11:46:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724870804; x=1725475604;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=723S2v6mxDV9QJeTshmCbE4VKGYCKAlpnNSfC/Nigzo=;
 b=YrHDpJV8yNdy0YXrU2HajDDfaxmM7sn9HVfG8BYivKGB/jgzKkbC0eMEqQ/BF95/hM
 oxaQDq9O+LFRjU8yPwPUhItcQ26+qP5Fg+wiK2Nm40zgGe51qVgwXYzQss829lnOvf96
 9809gyzRlPBbOF3jOBkTVztIEUhp7ZT37qKSrUMp4Aio+1FUmznmFoCtr0WOsa9+XOh8
 H0AV6krZRYb6H8sJbGdvS90CfPkKtpORngKWUC+plge/GxwoeJHwUv+JqhbPyxwlT5z8
 Z5x8YxuKTJXfmmFbw2C1of9yKx/RVR2uFCGhiwFS7kub1pOkqje0YY/k7tjQJz+BJGdJ
 b7eg==
X-Gm-Message-State: AOJu0YxAtopv86s9wF/MX2OxSBRHv+MRauKLJY2o6CmmvwVNbiVXNVHL
 +cpgXpZm5gDo3MKtGBqwok1H8EUFcil8Xm46AqPxv6aqdeUXan8TwPcF2smu6IVCVgEdpA/uFaK
 EH3nxrdaijrjBHxFndQdZELWbatkNZ120
X-Google-Smtp-Source: AGHT+IFAWg1vDtxCO/lYREzi9gCP3PXChTFyFb84Cptk4/twKkRZ+8BFT+KZw9V1v64TkFYQKbkX0O0hBCyxoDhslT0=
X-Received: by 2002:a05:690c:25c5:b0:630:f7c9:80d6 with SMTP id
 00721157ae682-6d2769e58ffmr3495387b3.27.1724870803578; Wed, 28 Aug 2024
 11:46:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240828110647.150583-1-roykollensvendsen@gmail.com>
 <20240828174017.3862c155@windsurf>
In-Reply-To: <20240828174017.3862c155@windsurf>
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Wed, 28 Aug 2024 20:46:31 +0200
Message-ID: <CA+R_deruYqyuKD4M1fdODoG57F+HW15gtwz7VRM7dzVGVc2VFw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724870804; x=1725475604; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=723S2v6mxDV9QJeTshmCbE4VKGYCKAlpnNSfC/Nigzo=;
 b=ROw4Tr5d9elfWr1tZnFkJofKBCilcf3vZuybgugaxCNEzwRJD+Ta5iuVcOaX2l1xA4
 uSw9U4pxtKt+6wVKtPoO/gtMBoaI7bwEe+FxURrIuoKAkWKfeDsFP3iiZf7azYcCMSZ6
 xPVaPnyDS1hUJIKbAzFPhnmU/7FmAjyomMubZ1W2lnCBvteaGmI/Z6KhthlmLMf8gjrb
 TPxdqUAA62t+YTbziQADKs9fv/zvoSKsobmaAZTTMcEyCHbXDq20MaTH10cG8vULgyDX
 HReZsMxGRWHuzu1NYFCfCqyZ0+Hb/PC0XO1sJNZ71ZlB666LhDBBDt5go3jPviRIcyNo
 cQAw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ROw4Tr5d
Subject: Re: [Buildroot] [PATCH 1/1] package/qt6: fix license information
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
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Jesse Van Gavere <jesseevg@gmail.com>,
 Andreas Naumann <ANaumann@ultratronik.de>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============5153088733083926072=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5153088733083926072==
Content-Type: multipart/alternative; boundary="00000000000087e88b0620c2c78c"

--00000000000087e88b0620c2c78c
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

I submitted the patch to get some general feedback on the final result.

Since the process is mostly automated it should be easy to make changes.

Yes, I will describe my process in v2 of this patch set. The script script
I'm using needs some cleanup, but I'll describe the steps.

Regards,
Roy



ons. 28. aug. 2024, 17:40 skrev Thomas Petazzoni <
thomas.petazzoni@bootlin.com>:

> Hello Roy,
>
> On Wed, 28 Aug 2024 13:06:46 +0200
> Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:
>
> > Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
>
> Do you have more details? There's no commit log, and it's just a huge
> change in the licensing. It is based on what?
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--00000000000087e88b0620c2c78c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Thomas,</div><div><br></div><div><div>I submitted =
the patch to get some general feedback on the final result. <br></div><div>=
<br></div><div>Since the process is mostly automated it should be easy to m=
ake changes.<br><div><div><br></div></div></div></div><div>Yes, I will desc=
ribe my process in v2 of this patch set. The script script I&#39;m using ne=
eds some cleanup, but I&#39;ll describe the steps.<br></div><div><br></div>=
<div>Regards,</div><div>Roy<br></div><div><div><br></div><div><br></div></d=
iv></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">ons. 28. aug. 2024, 17:40 skrev Thomas Petazzoni &lt;<a href=3D"mailto:t=
homas.petazzoni@bootlin.com" target=3D"_blank">thomas.petazzoni@bootlin.com=
</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hello =
Roy,<br>
<br>
On Wed, 28 Aug 2024 13:06:46 +0200<br>
Roy Kollen Svendsen &lt;<a href=3D"mailto:roykollensvendsen@gmail.com" rel=
=3D"noreferrer" target=3D"_blank">roykollensvendsen@gmail.com</a>&gt; wrote=
:<br>
<br>
&gt; Signed-off-by: Roy Kollen Svendsen &lt;<a href=3D"mailto:roykollensven=
dsen@gmail.com" rel=3D"noreferrer" target=3D"_blank">roykollensvendsen@gmai=
l.com</a>&gt;<br>
<br>
Do you have more details? There&#39;s no commit log, and it&#39;s just a hu=
ge<br>
change in the licensing. It is based on what?<br>
<br>
Thanks!<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://bootlin.com</a><br>
</blockquote></div>

--00000000000087e88b0620c2c78c--

--===============5153088733083926072==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5153088733083926072==--
