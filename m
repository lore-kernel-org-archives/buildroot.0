Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B62F5C2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 05:18:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1986F60B18;
	Sat, 17 May 2025 05:18:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hDVxxpPc9Wnm; Sat, 17 May 2025 05:18:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BFBE60A89
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BFBE60A89;
	Sat, 17 May 2025 05:18:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2050D1137
 for <buildroot@buildroot.org>; Sat, 17 May 2025 05:18:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 06BEF4094F
 for <buildroot@buildroot.org>; Sat, 17 May 2025 05:18:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A2HVIew35ucn for <buildroot@buildroot.org>;
 Sat, 17 May 2025 05:18:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b31; helo=mail-yb1-xb31.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E02B04023C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E02B04023C
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E02B04023C
 for <buildroot@buildroot.org>; Sat, 17 May 2025 05:18:33 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-e7b811be778so1064362276.2
 for <buildroot@buildroot.org>; Fri, 16 May 2025 22:18:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747459112; x=1748063912;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Boh5OAn42W48OUc0rPVCmL2M5VxmOhAgEQ41icgiMbw=;
 b=paAX1cBXtzE+iT1YhwZK5b0c9TFOhZFWkYQ6on1NBL0/6Tw+s7nIevFO/V0yJzQJde
 UdOm2kmnociYQKXR9+Glfk1NK+fm0BwAESvVp+3cC9nDAiTS3MmRXR/OlfOBC2k9mULY
 2QQfs/CYkc1uGmzpIv76R7hBvT73dAY2cI1z6Lwt1f2m0OJzZ0j74+eDoXTroY0SKFqE
 5BpOio5nK/BkUuHDRtxplMdYNDf8BRugnXfhmHPigi+omtPI/sRLdh+/7VoJannhnjgz
 xsO0qO/v6iDHQh0FtEqQ8Wj8I0uNXepYeIirbIsPYSM5zVUwKiiStxF/oongLs+xaofE
 k41g==
X-Gm-Message-State: AOJu0YyCRfwprfU2z5xTLb9l1vzsED6JL+it3YiAn82sZPWMnRkl9/9p
 bzI/YBBpKBwb9QAWGJq/xXPiv14uLsEtaw1vLAXujb6bhB6j+93GYgqluokivV1Xjb16jixKbBV
 vSsroXJMiThnjd5NixWSTy+6Q6RGddGs=
X-Gm-Gg: ASbGncuJ6MNzP3WzoRmBvH6qxQIoTZ4cS7oxx2TfpFwR6Mg+drE6wphPfqbV9rJO/m3
 9LFwng0KYu9+QH+TI/HhB7+Ds1dJ8PaTH+/XQDliITCMrxA6j1UjEUG1R1IdGbeMEvMJwG6Q/1l
 xHP3KDLtuUIuW5nRg91eSbCScmbXcpaGfy6Q==
X-Google-Smtp-Source: AGHT+IH7TopD3W2/mYodfH+1g5mdUXOtmB13A71ZEXBbd1xVwduGNxcIIEsXSAC+atsleuSMiJvZlTyQk/vRZ7emxm0=
X-Received: by 2002:a05:6902:1808:b0:e7b:7dd5:3863 with SMTP id
 3f1490d57ef6-e7b7dd539c8mr3897094276.41.1747459112533; Fri, 16 May 2025
 22:18:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250515103632.2631227-1-roykollensvendsen@gmail.com>
 <20250515103632.2631227-9-roykollensvendsen@gmail.com>
 <20250516225158.706cccf5@windsurf>
In-Reply-To: <20250516225158.706cccf5@windsurf>
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Sat, 17 May 2025 07:18:19 +0200
X-Gm-Features: AX0GCFspgLG88qanxOy93Uk-kLmgb8sbZ8l48UlGX0qJrLhpNCML7ZXOetyCQt0
Message-ID: <CA+R_deo8cJVqYuPNiQdnXXbGuaY9o11rMYp1CsaRqVdfRSM_AQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Christian Hitz <christian@klarinett.li>, 
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>, Baxiche Su <baxiche@gmail.com>, 
 Jesse Van Gavere <jesseevg@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747459112; x=1748063912; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Boh5OAn42W48OUc0rPVCmL2M5VxmOhAgEQ41icgiMbw=;
 b=etnGJLVIlNZx/GSTMmQ/XnDX6ERf+K+n/MxVKGbFC2TaZUWfo7ukmsg1ZSKmr/oiIy
 sz0Vc0PQ2qh29GqLNOh6GcS2DbPdR9wl1cBKxU2If/UrOfBopjt9hFtIJgoBoCiX2SO5
 QQTV+H033lO/srovyo+jFbKx8yUkDN+Z0mC5tOtuNF5sGoz5bYPw1qAf5JIO6uDkxKva
 Dh4IjD+9bj+usAHjSOtn1FcyZt5yGMtXpmfDzKq7LuHAs/beFyDj6RgT69bCNNi5kSfm
 XG9j1ap2G+br2CbUoylPg66B9lUAVN5F5IkiK/xTPstSMUQ0wDHozAhvCHwfKvtEzvkd
 WMRA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=etnGJLVI
Subject: Re: [Buildroot] [PATCH 09/10] package/qt6/qt6tools: build only host
 linguist tools
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
Content-Type: multipart/mixed; boundary="===============7131625821048570248=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7131625821048570248==
Content-Type: multipart/alternative; boundary="000000000000a98aef06354e0728"

--000000000000a98aef06354e0728
Content-Type: text/plain; charset="UTF-8"

fre. 16. mai 2025 kl. 22:52 skrev Thomas Petazzoni <
thomas.petazzoni@bootlin.com>:

> Hello Roy,
>
> Thanks for the great patch series! I'm going through it, and I'm hoping
> to merge it progressively in the next days. I have one question on this
> patch though.
>
> On Thu, 15 May 2025 12:36:25 +0200
> Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:
>
> > Strip down qt6tools to the bare minimum by:
> > - Removing the target package
> > - Disabling all features except for the linguist tools
> >
> > This change addresses ongoing issues with qt6tools and focuses on its
> > primary intended use: providing linguist tools for translating Qt6
> > applications during the build process.
> >
> > The linguist tools are essential for internationalization (i18n) of Qt6
> > applications and are now available as a host package for
> cross-compilation
> > purposes.
> >
> > This modification should resolve stability issues while still maintaining
> > the core functionality required for Qt6 application translation.
> >
> > update host package
>
> What does this mean?
>
>
The last sentence ended up there unintentionally during a rebase.


> > Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
>
> Could you clarify why PATCH 09/10 and 10/10 are separate? It feels odd
> to drop the target package, only to re-introduce it one commit after. I
> was thinking of squashing both commits together. What do you think?
>

I think it is best to drop patch 10/10 for now. I can reintroduce that
change when I need it.

By the way, is 9/10 too large? Should we split the commit? Maybe it is
better to gradually
fix the concrete build failures than "starting from scratch?"

Thanks for your feedback!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--000000000000a98aef06354e0728
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">fre. 16. mai 20=
25 kl. 22:52 skrev Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@=
bootlin.com">thomas.petazzoni@bootlin.com</a>&gt;:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">Hello Roy,<br>
<br>
Thanks for the great patch series! I&#39;m going through it, and I&#39;m ho=
ping<br>
to merge it progressively in the next days. I have one question on this<br>
patch though.<br>
<br>
On Thu, 15 May 2025 12:36:25 +0200<br>
Roy Kollen Svendsen &lt;<a href=3D"mailto:roykollensvendsen@gmail.com" targ=
et=3D"_blank">roykollensvendsen@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Strip down qt6tools to the bare minimum by:<br>
&gt; - Removing the target package<br>
&gt; - Disabling all features except for the linguist tools<br>
&gt; <br>
&gt; This change addresses ongoing issues with qt6tools and focuses on its<=
br>
&gt; primary intended use: providing linguist tools for translating Qt6<br>
&gt; applications during the build process.<br>
&gt; <br>
&gt; The linguist tools are essential for internationalization (i18n) of Qt=
6<br>
&gt; applications and are now available as a host package for cross-compila=
tion<br>
&gt; purposes.<br>
&gt; <br>
&gt; This modification should resolve stability issues while still maintain=
ing<br>
&gt; the core functionality required for Qt6 application translation.<br>
&gt; <br>
&gt; update host package<br>
<br>
What does this mean?<br>
<br></blockquote><div><br></div><div>The last sentence ended up there unint=
entionally during a rebase.<div>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
&gt; Signed-off-by: Roy Kollen Svendsen &lt;<a href=3D"mailto:roykollensven=
dsen@gmail.com" target=3D"_blank">roykollensvendsen@gmail.com</a>&gt;<br>
<br>
Could you clarify why PATCH 09/10 and 10/10 are separate? It feels odd<br>
to drop the target package, only to re-introduce it one commit after. I<br>
was thinking of squashing both commits together. What do you think?<br></bl=
ockquote><div><br></div><div>I think it is best to drop patch 10/10 for now=
. I can reintroduce that change when I need it. <br></div><div><br></div><d=
iv>By the way, is 9/10 too large? Should we split the commit? Maybe it is b=
etter to gradually</div><div>fix the concrete build failures than &quot;sta=
rting from scratch?&quot;</div><div><br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
Thanks for your feedback!<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div></div></div>

--000000000000a98aef06354e0728--

--===============7131625821048570248==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7131625821048570248==--
