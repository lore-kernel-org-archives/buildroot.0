Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E48E9CED24E
	for <buildroot@archiver.kernel.org>; Tue,  8 Oct 2024 00:39:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F07E40319;
	Tue,  8 Oct 2024 00:39:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e4tMDh_JeYJy; Tue,  8 Oct 2024 00:39:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5AD084031B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AD084031B;
	Tue,  8 Oct 2024 00:39:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5BA211BF966
 for <buildroot@lists.busybox.net>; Tue,  8 Oct 2024 00:39:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4AAD260727
 for <buildroot@lists.busybox.net>; Tue,  8 Oct 2024 00:39:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NGvhuZJti6_C for <buildroot@lists.busybox.net>;
 Tue,  8 Oct 2024 00:39:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com;
 envelope-from=andrew.2.622266@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 455A3605E1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 455A3605E1
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 455A3605E1
 for <buildroot@buildroot.org>; Tue,  8 Oct 2024 00:39:42 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5389917ef34so5787174e87.2
 for <buildroot@buildroot.org>; Mon, 07 Oct 2024 17:39:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728347979; x=1728952779;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O3FqwVpO5aXL2aBcX+H8xmXGHsXSYuCGuFJV5SRkBvU=;
 b=CP/NesvYfJD4qFxJmDjlDLjoF/q01Dq1McFBipd49uTfMumzXRj2XXA60woSXFRMUV
 4EW2fFyFswObBf8Iiddw1rzbNxKJp0t+DvO0Yfzf8gtXZVyjphQnT2e7Bd2i8MIdqN3b
 o8lcVpNsqXDP5zBMr9o7KAkrBTwyGWr8WB2opFPT/ofw76NTg4iSlyRRIzD7CGOXE5S7
 eR6j0vbIWFYZT5cSXf5KqAWc6p0BvtQpQ7+60YMH/u8AuwtFTHJQRAKdPyjYvHYEErod
 HVF7/lR7H9WlpCIdc2g4z6ocKqZemx0C4VG7d07haFYDFVacWPkmqemGm2eBpt1hZHTy
 x+jw==
X-Gm-Message-State: AOJu0YzQb1UgJkfB8mClyB06bb7yNhAx1nLfpM8SAckZt/Djb+ZdkX+9
 q0cDUs16wUE/7dc077lGoGWDo+7mRBIqoIVDHpWOBdY3WOmdqH1nd6EJArBdzVGhgkr8xAV00YL
 GBiXdvwxNANA2FeaOuydPhm0f9Y9tXg==
X-Google-Smtp-Source: AGHT+IEzZLGqVP4i2h0VGYF+bo3LVd73FrCrpAiQv6uWcC5z//ZYVXJ0FKzjgTsc8QWQ3TDoYrCBgB8rrHxu+IATgao=
X-Received: by 2002:a05:6512:308f:b0:539:986e:cd68 with SMTP id
 2adb3069b0e04-539ab9ec4eemr6081167e87.60.1728347979123; Mon, 07 Oct 2024
 17:39:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAPKzRz-Yye+toUmfTE02zEY7JACBbZ-wHEE6Xnk15rooaVrrhA@mail.gmail.com>
In-Reply-To: <CAPKzRz-Yye+toUmfTE02zEY7JACBbZ-wHEE6Xnk15rooaVrrhA@mail.gmail.com>
From: Andrew McCann <andrew.2.622266@gmail.com>
Date: Mon, 7 Oct 2024 20:39:27 -0400
Message-ID: <CAPKzRz90MviGdB+-S=VakYG-6sTr510eFAmApJUSH4RkaEYNng@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728347979; x=1728952779; darn=buildroot.org;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=O3FqwVpO5aXL2aBcX+H8xmXGHsXSYuCGuFJV5SRkBvU=;
 b=TX2XxE81u8rsFtC6AUX1UMv0F+QXmMs0xrLEfcSOcSQchBNIo/P/1x7hw+uOIcHqSE
 UEtb0zQoDqX6jpGQPfkLwXKae2xtClfhVoTjeXoC566iQnbaAB1ztkMZIIe1zejdKmDY
 8oWBxWpd9a6kL8rCcaUu/MtQTF2SkYwWnx6ADQhoo73DgpeQ0QGcgkSmV8SS0nesqWll
 VpQ45E9NpRcPwimqy0FJx83yJz8y6s8LnlBKHLajXr6lBRDGSSVKEwmgxOCmda4ufGmP
 S8SvOlu7eC4q1aTk4AZ6mEViTNCdBFeOEUbSKs806q7INp7kAS7Bm4VJUCUJF9iNgi/v
 IzDg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TX2XxE81
Subject: Re: [Buildroot] Ethernet Connection
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
Content-Type: multipart/mixed; boundary="===============0741848881565977504=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0741848881565977504==
Content-Type: multipart/alternative; boundary="000000000000581ad10623ec5f5f"

--000000000000581ad10623ec5f5f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Can anyone comment on whether you expect the default rpi3b+ configuration
to connect to LAN?
Regards
Andy

On Wed, Oct 2, 2024 at 5:24=E2=80=AFPM Andrew McCann <andrew.2.622266@gmail=
.com>
wrote:

> Hi All
>
> I'm trying to get basic networking working with a Rpi-3b+.  I note that
> with the default config, raspberrypi3_64_defconfig, eth0 is setup as the
> network interface to configure through DHCP.  Also
> BR2_PACKAGE_IFUPDOWN_SCRIPTS are enabled by default.
>
> However, when I boot the system with sdcard.img, the pi does not connect
> to my network. Are there are things that I need to enable that are not pa=
rt
> of the default configuration?
>
> My longer term goal is to ssh (using dropbear) into my pi via the LAN, an=
d
> use iwctl to configure iwd for wireless connectivity.  But first I need t=
o
> establish the LAN connection.  Please let me know any advice that you hav=
e,
> or any documentation that you can recommend.
>
> Regards
> Andy
>

--000000000000581ad10623ec5f5f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Can anyone comment on whether you expect the default =
rpi3b+ configuration to connect to LAN?</div><div>Regards</div><div>Andy<br=
></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, Oct 2, 2024 at 5:24=E2=80=AFPM Andrew McCann &lt;<a href=3D"=
mailto:andrew.2.622266@gmail.com">andrew.2.622266@gmail.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"=
><div>Hi All</div><div><br></div><div>I&#39;m trying to get basic networkin=
g working with a Rpi-3b+.=C2=A0 I note that with the default config, raspbe=
rrypi3_64_defconfig, eth0 is setup as the network interface to configure th=
rough DHCP.=C2=A0 Also BR2_PACKAGE_IFUPDOWN_SCRIPTS are enabled by default.=
=C2=A0=C2=A0</div><div><br></div><div>However, when I boot the system with =
sdcard.img, the pi does not connect to my network. Are there are things tha=
t I need to enable that are not part of the default configuration? =C2=A0=
=C2=A0</div><div><br></div><div>My longer term goal is to ssh (using dropbe=
ar) into my pi via the LAN, and use iwctl to configure iwd for wireless con=
nectivity.=C2=A0 But first I need to establish the LAN connection.=C2=A0 Pl=
ease let me know any advice that you have, or any documentation that you ca=
n recommend.</div><div><br></div><div>Regards</div><div>Andy<br></div></div=
>
</blockquote></div>

--000000000000581ad10623ec5f5f--

--===============0741848881565977504==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0741848881565977504==--
