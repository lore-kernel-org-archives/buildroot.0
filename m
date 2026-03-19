Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4D3C1075290
	for <buildroot@archiver.kernel.org>; Thu, 19 Mar 2026 10:05:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16FD541678;
	Thu, 19 Mar 2026 10:05:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NRI2ER54qfSM; Thu, 19 Mar 2026 10:05:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B946417B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773914758;
	bh=iIxEFVaHMPyKxzAkC3iOF0JpHL6/+55wD965dy+f6iQ=;
	h=Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=sMWt41U6khH0ipG7g0urd4jiE1S5puMINfK+h47ikps++XjQjRzBjCeUXT0maKdWE
	 nJ49kSJqjCXwMRdu7wU5ouVysG8IC79JYXrix3nZCVM+RL638Kk0JnCShZo2QGc9q6
	 /Ulv5zxatgHnmqQFmnKd4XRfWj69fm1hyzw7zzowuuhB1oUw7al3MGuyB0Y3V6LacP
	 mAjcu6xTIdEb/+s9fHsvY5bS+0I3kvVNf10C2Icuqlvvj8iB31nhjETfjtvXzE+7lO
	 c/lqdatKDJruemoyhKBN1fAP4izGhSZGHxLx64gl8L+uoB37qw1b2y8BbRr5HWYirz
	 k0trAnEnl+RWg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B946417B7;
	Thu, 19 Mar 2026 10:05:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 32BBA1BD
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 10:05:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23150417B7
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 10:05:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KEAsOe7Iy0dz for <buildroot@buildroot.org>;
 Thu, 19 Mar 2026 10:05:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=dowan.gullient@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B93C541678
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B93C541678
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B93C541678
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 10:05:54 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b8f97c626aaso110868566b.2
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 03:05:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773914752; cv=none;
 d=google.com; s=arc-20240605;
 b=ACYXeEXxCOu1c2+6V0MrGAx5XVsVWnHlShHo+VW3ySKOAXG3okK0nNYHGPAlJ3chl6
 Ac93+DuZTqiDibcuIYQgVqzXoKXqQgK+L9E71Q2ECmEQUB4vJs4NTyNkzuQ5LRptvqta
 hfh0YP52VxltwsQx+8S2uqPN/N++XGRLr9o4GSq0d7JDg2zoljtuw8mvjoUy9gRaF7YS
 GIUvprJNWx75zyyYK74a/z49mdGecWrQpZh99s6gVxrNMc1RNu9jc05ubQuN6cbVX/+z
 7hrhpvCtyqNxRHtzXE/+kgBCScBENO00011zqp2AsAEWcpkOOA93bwkSDrGFfitLxWpE
 p2rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
 bh=qSiTMZLywjwuQ2Ppo9YN+vtgQZWF3Rg1k6fOHA5RNnQ=;
 fh=GXLuTRV6+VPoNAUER/5GCPHT5m8I+Y+2ldaK943r/EM=;
 b=N5t1lwvB9DgckYCeVgcrPVANAPFVJ68BOPDdyQ8CzXXRnnu2nN5fFlDLP1dB5qiSkp
 jRr0XL6l0jqDp1nbKqt16qsVT4vUCWYhkqgjHVTBVLyA0iM+Pie8WkSMx8WlsSQii6sZ
 E2zy8DR8JN1zF4SVwGf2jIc8NjJ7l9QFjsZMEevnoEnX5uigEbAA01Pa9HEELEOzC2DT
 ugw/eeab1p9+M7icEsuzpYVRkFbNewD+SblhKkiniI5vC/aNuvZmcG7Aj5vAHPEz4RgG
 BTo0hV0b1XW7xizlwXyELDya21W4A0m6vgbRD+8RQxH38eXErPi9jV61l9+w3gqdFJGk
 kkFQ==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773914752; x=1774519552;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qSiTMZLywjwuQ2Ppo9YN+vtgQZWF3Rg1k6fOHA5RNnQ=;
 b=RA+NLvm59H4861z11wBvs58skzO3ObKhQespEYVgWOF3Zz6E0iIYaoEm+Fli97cwH1
 pOmZr98Ajz+rOEecnRNUWT5L2403A5yb+4eRmVoQzP3czXL1mSjlj+AJPOC7PVGBnktW
 hJsRo6p4jm7LvvHgYCGBaoqzzzXttn4GfeW+WzVayb75jdNw9oLctmGcYobxUErBLbNF
 QoIVJWmXic84KdkdIhYyA6y41YiOVl6/fe5pCUAUdIZtLlY7etIvhIxWpI6Mr82viKxo
 P6beWfBabjkCZZ3ZYHnJRzDCZzQNWgeskox7fi/oo+oJSIfnEs8Gd2FilUnDDkxtvolt
 JZGw==
X-Gm-Message-State: AOJu0YzZKvqhf2PVvShla2ckUJ7RZJbWlqC5WtVuNPKrqWc0QE1PTXWA
 lZBfsvyOt8ihTwFprzF49ObseF5RArX49d4NYs4wSMsfZ6hqwN7R0spal5hhCiwfB5aSCK/R/qO
 JykzdocY2SxOmF0el/5pnOskFP0bGuGXFqN+lL3Uq4S7iNV7t7sGN9BIRwA==
X-Gm-Gg: ATEYQzwEyJjsow+0hCDx5W/rMwBNF0+idv8o1UbHI7nNEMu1gZ7Las7OjI6YmVGfYft
 trcSm1zNbWbN3Bg0+J0zNo6h5os+K/Rp/zWhlZkgQbqgWr+tauXkuP4pCcl9fD+6tumtvAgkz8E
 qn3FP8FChDQGqwk98SpHErfX/tXJliBttBFdAEqqZtmlH6HaNHzq7YYNEGblfSUcgEG/oRYIulv
 twmudLfYF/k1LIYKc6RHl8/XtxyjwlqtwfcaSCeGKc444DqJTLrqJUre8NYfbcp4Y8jIKe12prR
 luelRIROVw==
X-Received: by 2002:a17:906:d554:b0:b8e:d4ed:5eab with SMTP id
 a640c23a62f3a-b97f4a71ff4mr410929166b.31.1773914751636; Thu, 19 Mar 2026
 03:05:51 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 19 Mar 2026 11:05:39 +0100
X-Gm-Features: AaiRm53jLjdu32UreBmSxKIplU_0EXQ4uxvOtIUmnrAHJvlVkMnjig-rTXGES2Q
Message-ID: <CAARUF11ZKthafBn=mLswxnFp==oK=KJXD0PCmqj=JoP8FCbYrw@mail.gmail.com>
To: buildroot@buildroot.org
Cc: dev@matt-silva.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1773914752; x=1774519552; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=qSiTMZLywjwuQ2Ppo9YN+vtgQZWF3Rg1k6fOHA5RNnQ=;
 b=TfEI/aD64Az1vzWvwecyDlIXqW3dGZILo1HMEi9OGKU6KsXQQrM2PTHxzzixmOwTSK
 kCk+VBYwypvGRzvPavRu7D2u9vqpMM8eJFBsYIqAAkYdygIT1107diCjCAzPCBMHB3ry
 /LDZAcjl7WxRMDKyb+GHIqg5YoaqyXq1hHg8M=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=TfEI/aD6
Subject: Re: [Buildroot] [PATCH 1/1] package/partclone: new package
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
From: Dowan GULLIENT via buildroot <buildroot@buildroot.org>
Reply-To: Dowan GULLIENT <dowan.gullient@smile.fr>
Content-Type: multipart/mixed; boundary="===============0685332563440337056=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0685332563440337056==
Content-Type: multipart/alternative; boundary="000000000000a2294e064d5db625"

--000000000000a2294e064d5db625
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

I have reviewed and tested your patch using the utils/test-pkg script,
built it with make partclone and ran it on qemu.
The package works well on most architectures after the fix, but I found a
few issues that need to be addressed in a v2:

1. Architecture dependency:
The build fails on no-MMU platforms (like ARMv7-M) because partclone
depends  on util-linux (libuuid) which requires pthread_atfork, which is
unavailable there.
Please add "depends on BR2_USE_MMU" in Config.in.

2. Missing dependencies:

   - In Config.in: You need to select BR2_PACKAGE_UTIL_LINUX and
   -   BR2_PACKAGE_UTIL_LINUX_LIBUUID to ensure the uuid.pc pkg-config file
   is  generated and installed in the staging directory
   - In partclone.mk: Add host-pkgconf and util-linux to
   PARTCLONE_DEPENDENCIES.

3. Verify the dependency propagation :
Kconfig does not support propagation of dependances, so in config.in you
might have to add "depends on ..." to all the dependencies that require it,
here is few examples but I did not verified all of them :

Complete
"   select BR2_PACKAGE_NTFS_3G"
with
"   depends on BR2_USE_WCHAR
    depends on BR2_TOOLCHAIN_HAS_THREADS
    depends on BR2_USE_MMU
    depends on !BR2_STATIC_LIBS
    select BR2_PACKAGE_NTFS_3G"

and modify
"   depends on BR2_PACKAGE_XFSPROGS"
with
"   depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS # xfsprogs
    depends on BR2_USE_MMU # xfsprogs
    depends on BR2_TOOLCHAIN_HAS_THREADS # xfsprogs
    depends on BR2_INSTALL_LIBSTDCPP # xfsprogs
    depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_9 # xfsprogs
    select BR2_PACKAGE_XFSPROGS"

That way you will not break the package if you select those features and
the user only have to select one option.

4. Small typo:
In partclone.mk, --disable-brtfs should be --disable-btrfs.

With these changes, the package passes all 6 toolchains in test-pkg.
Once you send a v2, I'll be happy to provide my "Tested-by" tag.

5. Additional details:
There was a few additional details to improve the patch:

   - PARTCLONE_AUTORECONF =3D YES : maybe explain why this option is
   mandatory ?
   - Verify that the license of the package is correct
   - BR2_PACKAGE_OPENSSL : you probably used the default libopenssl
   provider but does it work with wolfSSL, LibreSSL, ... or we have to limi=
t
   the usage to libopenssl ?
   - You can include =E2=80=9CThe following features are not supported ...=
=E2=80=9D in the
   commit message instead of the makefile


Best regards,
Dowan

--000000000000a2294e064d5db625
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span>Hi Matt,<br><br>I have reviewed and tested your patc=
h using the utils/test-pkg script, built it with make partclone and ran it =
on qemu.<br>The package works well on most architectures after the fix, but=
 I found a few issues that need to be addressed in a v2:<br><br>1. Architec=
ture dependency:<br>The build fails on no-MMU platforms (like ARMv7-M) beca=
use partclone depends =C2=A0on util-linux (libuuid) which requires pthread_=
atfork, which is unavailable there. <br>Please add &quot;depends on BR2_USE=
_MMU&quot; in <span style=3D"display:none"></span><span><a href=3D"http://C=
onfig.in" target=3D"_blank" rel=3D"noopener nofollow noreferrer">Config.in<=
span style=3D"display:none"></span></a></span>.<br><br>2. Missing dependenc=
ies:<br><span style=3D"display:none"></span><ul><li>In <span style=3D"displ=
ay:none"></span><span><a href=3D"http://Config.in" target=3D"_blank" rel=3D=
"noopener nofollow noreferrer">Config.in<span style=3D"display:none"></span=
></a></span>: You need to select BR2_PACKAGE_UTIL_LINUX and <br><span style=
=3D"display:none"></span></li><li>=C2=A0 BR2_PACKAGE_UTIL_LINUX_LIBUUID to =
ensure the uuid.pc pkg-config file is =C2=A0generated and installed in the =
staging directory<br><span style=3D"display:none"></span></li><li>In <span =
style=3D"display:none"></span><span><a href=3D"http://partclone.mk" target=
=3D"_blank" rel=3D"noopener nofollow noreferrer">partclone.mk<span style=3D=
"display:none"></span></a></span>: Add host-pkgconf and util-linux to PARTC=
LONE_DEPENDENCIES.<br><span style=3D"display:none"></span></li></ul>3. Veri=
fy the dependency propagation :<br>Kconfig does not support propagation of =
dependances, so in <span style=3D"display:none"></span><span><a href=3D"htt=
p://config.in" target=3D"_blank" rel=3D"noopener nofollow noreferrer">confi=
g.in<span style=3D"display:none"></span></a></span> you might have to add &=
quot;depends on ...&quot; to all the dependencies that require it, here is =
few examples but I did not verified all of them : <br><br>Complete<br>&quot=
; =C2=A0 select BR2_PACKAGE_NTFS_3G&quot;<br>with<br>&quot; =C2=A0 depends =
on BR2_USE_WCHAR<br>=C2=A0 =C2=A0 depends on BR2_TOOLCHAIN_HAS_THREADS<br>=
=C2=A0 =C2=A0 depends on BR2_USE_MMU<br>=C2=A0 =C2=A0 depends on !BR2_STATI=
C_LIBS<br>=C2=A0 =C2=A0 select BR2_PACKAGE_NTFS_3G&quot;<br><br>and modify =
<br>&quot; =C2=A0 depends on BR2_PACKAGE_XFSPROGS&quot; <br>with <br>&quot;=
 =C2=A0 depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS # xfsprogs<br>=C2=A0 =
=C2=A0 depends on BR2_USE_MMU # xfsprogs<br>=C2=A0 =C2=A0 depends on BR2_TO=
OLCHAIN_HAS_THREADS # xfsprogs<br>=C2=A0 =C2=A0 depends on BR2_INSTALL_LIBS=
TDCPP # xfsprogs<br>=C2=A0 =C2=A0 depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST=
_5_9 # xfsprogs<br>=C2=A0 =C2=A0 select BR2_PACKAGE_XFSPROGS&quot;<br><br>T=
hat way you will not break the package if you select those features and the=
 user only have to select one option.<br><br>4. Small typo:<br>In <span sty=
le=3D"display:none"></span><span><a href=3D"http://partclone.mk" target=3D"=
_blank" rel=3D"noopener nofollow noreferrer">partclone.mk<span style=3D"dis=
play:none"></span></a></span>, --disable-brtfs should be --disable-btrfs.<b=
r><br>With these changes, the package passes all 6 toolchains in test-pkg.<=
br>Once you send a v2, I&#39;ll be happy to provide my &quot;Tested-by&quot=
; tag.<br><br>5. Additional details:<br>There was a few additional details =
to improve the patch:<br><span style=3D"display:none"></span><ul><li>PARTCL=
ONE_AUTORECONF =3D YES : maybe explain why this option is mandatory ?<br><s=
pan style=3D"display:none"></span></li><li>Verify that the license of the p=
ackage is correct<br><span style=3D"display:none"></span></li><li>BR2_PACKA=
GE_OPENSSL : you probably used the default libopenssl provider but does it =
work with wolfSSL, LibreSSL, ... or we have to limit the usage to libopenss=
l ?<br><span style=3D"display:none"></span></li><li>You can include =E2=80=
=9CThe following features are not supported ...=E2=80=9D in the commit mess=
age instead of the makefile<br><span style=3D"display:none"></span></li></u=
l><br>Best regards,<br>Dowan</span></div>

--000000000000a2294e064d5db625--

--===============0685332563440337056==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0685332563440337056==--
