Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 374D1C4345F
	for <buildroot@archiver.kernel.org>; Sun, 14 Apr 2024 07:40:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C87E980E3E;
	Sun, 14 Apr 2024 07:40:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UZ5hvdBxOq1y; Sun, 14 Apr 2024 07:40:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C785881E38
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C785881E38;
	Sun, 14 Apr 2024 07:40:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 163851BF40B
 for <buildroot@lists.busybox.net>; Sun, 14 Apr 2024 07:40:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 00F5781E38
 for <buildroot@lists.busybox.net>; Sun, 14 Apr 2024 07:40:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J1lNgZQMqjuD for <buildroot@lists.busybox.net>;
 Sun, 14 Apr 2024 07:40:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com;
 envelope-from=huntchr@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1F39280E3E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F39280E3E
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1F39280E3E
 for <buildroot@buildroot.org>; Sun, 14 Apr 2024 07:40:28 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-6ef9bd94d81so1207119b3a.3
 for <buildroot@buildroot.org>; Sun, 14 Apr 2024 00:40:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713080428; x=1713685228;
 h=to:date:message-id:subject:mime-version:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PT6hb8m161d+YYVayuq9ip+Aj3DG0Nvko3cCOqUlv/g=;
 b=tnppGeR2n0sINIfxIi6Q/AWxHag3jQaKmzBVlNAXgRHJB7DNJ6V4QQZ3IMb2WGkehh
 24cxPl6tMlIWuGul4cRrt4pjSPIiyOvb59raxM2W6G7vKrShcCFtIuFt2PxpHnSRBfTm
 7SFUHcAT5gPhtrp8QnZCV/OErCrlwfDV9T5iIZhZbuP6jYvEFsPXv1TOmbif//LpLGYa
 oxIJfYveB8M8YtS3xRXpnmkjeNv5PfCLCtS4RMVk7C2zo9XPsmdpPwsD/kt0cw0b2AGu
 NYpJh+edVQedFTdgSuwjNBcoC57lHnkct4CAw7GMzmAwm2oMPxUBoe6Zp1jFAvs1J3TR
 CelQ==
X-Gm-Message-State: AOJu0YxPaWq5+aUi9waBVd47adLI6NNtrbUAuvNAzAJpFhDHaLA5jutH
 8slApQYsrMK0BxIiwsq81pRHXyELrNAb7OYabrYmg6zXBgoPGOi9faKGJg==
X-Google-Smtp-Source: AGHT+IHFprsNUb3l7VbzmY6MypRJsUP6F+Q+O8DzTWsh6TEcGH3Tv0YzfTE5eRsotcbpIIx1OShbVQ==
X-Received: by 2002:a05:6a00:1953:b0:6ea:f026:4003 with SMTP id
 s19-20020a056a00195300b006eaf0264003mr6927523pfk.3.1713080428025; 
 Sun, 14 Apr 2024 00:40:28 -0700 (PDT)
Received: from smtpclient.apple
 (2001-44b8-3127-3500-28b2-af57-fcf6-271d.static.ipv6.internode.on.net.
 [2001:44b8:3127:3500:28b2:af57:fcf6:271d])
 by smtp.gmail.com with ESMTPSA id
 lr48-20020a056a0073b000b006e724ccdc3esm5249225pfb.55.2024.04.14.00.40.26
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 14 Apr 2024 00:40:27 -0700 (PDT)
From: Christopher Hunt <huntchr@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
Message-Id: <8A84B636-FF5F-4B7A-8771-D4D299F8784F@gmail.com>
Date: Sun, 14 Apr 2024 17:40:14 +1000
To: buildroot@buildroot.org
X-Mailer: Apple Mail (2.3731.700.6)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713080428; x=1713685228; darn=buildroot.org;
 h=to:date:message-id:subject:mime-version:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=PT6hb8m161d+YYVayuq9ip+Aj3DG0Nvko3cCOqUlv/g=;
 b=ntRatwvn1jzn3Bvc+M7MKhL9tZPibnpZQsaSi4JWNfn9V3ZD4eaCSSwi0qx3HieG0O
 HLlF6hF7IaE6croE2nfIDTtQ/59cqLBTz654qcWCj9qG9gAOY4If4QXlqZZBmDXUdPiA
 QPq1e2dDBvWEU9I/BXEPnoNpuYB6++Er2G7+xVrZrEOBtTb21xlOwq7l4xIL7TRQupht
 iKy1UpXRz//01XqVr0t6Reark2VH4EOuNFnDL3Ek6dVV5Zpx5nbUky/CBaa8iWC1ufGD
 6FYZQQCq5J90kd6KTeGnP6aNntN1XeBJynv+FWotsPicYk1mmYFBZtHzffRMjJjheYGK
 7eiA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ntRatwvn
Subject: [Buildroot] Custom DTS declaration
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
Content-Type: multipart/mixed; boundary="===============5315168781445204862=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============5315168781445204862==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_61EFF643-5616-4FCF-A7A4-7014A5C8DAD9"


--Apple-Mail=_61EFF643-5616-4FCF-A7A4-7014A5C8DAD9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi there,

I=E2=80=99m somewhat confused about the device-tree that I can view from =
the Linux CLI vs what I=E2=80=99m supplying to buildroot.

If I look at /proc/device-tree/model then I see "Microchip SAMA5D27 =
WLSOM1 EK=E2=80=9D. However, my =
board/cuprous/gw/linux/dts/at91-sama5d27_wlsom1_cuprous_gw.dts declares, =
"Microchip SAMA5D27 WLSOM1 Cuprous Gateway=E2=80=9D. I=E2=80=99m =
declaring the use of that DTS via =
configs/microchip_sama5d27_wlsom1_cuprous_gw_defconfig with:

	=
BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D"at91-sama5d27_wlsom1_cuprous_gw=E2=80=9D=

	=
BR2_LINUX_KERNEL_CUSTOM_DTS_PATH=3D"board/cuprous/gw/linux/dts/at91-sama5d=
27_wlsom1_cuprous_gw.dts"

Uboot is configured to use its own DTS with the name of "Microchip =
SAMA5D27 WLSOM1 EK=E2=80=9D, so it could be that, or it could just be =
that I=E2=80=99ve not declared my custom Linux DTS correctly.

Anything obvious?

Full repo here: https://github.com/cuprous-au/buildroot/tree/2022.05.x

Thanks for any help.

Cheers,
-C=

--Apple-Mail=_61EFF643-5616-4FCF-A7A4-7014A5C8DAD9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"overflow-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;">Hi =
there,<div><br></div><div>I=E2=80=99m somewhat confused about the =
device-tree that I can view from the Linux CLI vs what I=E2=80=99m =
supplying to buildroot.</div><div><br></div><div>If I look at =
/proc/device-tree/model then I see "Microchip SAMA5D27 WLSOM1 EK=E2=80=9D.=
 However, =
my&nbsp;board/cuprous/gw/linux/dts/at91-sama5d27_wlsom1_cuprous_gw.dts =
declares, "Microchip SAMA5D27 WLSOM1 Cuprous Gateway=E2=80=9D. I=E2=80=99m=
 declaring the use of that DTS =
via&nbsp;configs/microchip_sama5d27_wlsom1_cuprous_gw_defconfig =
with:</div><div><br></div><div><div><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	=
</span>BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D"at91-sama5d27_wlsom1_cuprous_gw=
=E2=80=9D</div><div><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	=
</span>BR2_LINUX_KERNEL_CUSTOM_DTS_PATH=3D"board/cuprous/gw/linux/dts/at91=
-sama5d27_wlsom1_cuprous_gw.dts"</div></div><div><br></div><div>Uboot is =
configured to use its own DTS with the name of&nbsp;<font =
color=3D"#000000"><span style=3D"caret-color: rgb(0, 0, 0);">"Microchip =
SAMA5D27 WLSOM1 EK=E2=80=9D, so it could be that, or it could just be =
that I=E2=80=99ve not declared my custom Linux DTS =
correctly.</span></font></div><div><font color=3D"#000000"><span =
style=3D"caret-color: rgb(0, 0, 0);"><br></span></font></div><div><font =
color=3D"#000000"><span style=3D"caret-color: rgb(0, 0, 0);">Anything =
obvious?</span></font></div><div><br></div><div><font =
color=3D"#000000"><span style=3D"caret-color: rgb(0, 0, 0);">Full repo =
here:&nbsp;</span></font><a =
href=3D"https://github.com/cuprous-au/buildroot/tree/2022.05.x">https://gi=
thub.com/cuprous-au/buildroot/tree/2022.05.x</a></div><div><br></div><div>=
Thanks for any =
help.</div><div><br></div><div>Cheers,</div><div>-C</div></body></html>=

--Apple-Mail=_61EFF643-5616-4FCF-A7A4-7014A5C8DAD9--

--===============5315168781445204862==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5315168781445204862==--
