Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3FEDE77197
	for <buildroot@archiver.kernel.org>; Tue,  7 Jan 2025 07:01:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D4B3406C8;
	Tue,  7 Jan 2025 07:01:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8VpI8FvUpynm; Tue,  7 Jan 2025 07:01:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 665B3406E4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 665B3406E4;
	Tue,  7 Jan 2025 07:01:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 059C17AA
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 07:01:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA68281363
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 07:01:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4NkQmPcIYcuw for <buildroot@buildroot.org>;
 Tue,  7 Jan 2025 07:01:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b36; helo=mail-yb1-xb36.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 80CA68135B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80CA68135B
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 80CA68135B
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 07:01:27 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id
 3f1490d57ef6-e549a71dd3dso5591527276.0
 for <buildroot@buildroot.org>; Mon, 06 Jan 2025 23:01:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736233286; x=1736838086;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=efAZaksmnaWbbF49E/h21qBmwXI5Wb4CDIixaZPMZJI=;
 b=IhN+O6TlO2KyeZ+hGTaumna2ymOPysqBo3+NgshCPFqApq5XR6aPE6MM680B1SMPah
 R6kkRxSnjj/0ccoMr6x6OCnWTethJzD21EZXe4tuk0bmihj5nuiIwei2SrtQcGEGDbci
 IanGbhZWRR6wr7YTPr+gW/HIO3/4eQu4Dbz5Do9fvOPjxe6cHW4CPv+NIIWLVnv8HDPb
 nnd+8Iuc0ynxxYtTbdazy7SYT3EGZ9Emw9WgWzjn4yMtz7QIm7gVnspHWy0beL5Rey1v
 ItFIjt8E1jxGPrwv8DeB9fnn4BV1qCJ8adocZS7usiEjVvjLDn1k0TiWIwUl8zUG7Jav
 D6aQ==
X-Gm-Message-State: AOJu0Yy1SU1HHgq2xUeon5L6v+vZzC5QqKlA4t7tfp6XK3p91REd5WLS
 pZmYBTkP17e+B3phNp93ZLF4k7dKGnyH7JUNT0VWH2y1kmePaLJtRrTO69GbyqF8+Urlq1cnd9x
 BZpgTvCNQUn0wxiJNvmRsHdiT2R0irg==
X-Gm-Gg: ASbGncu8WadtC0yKbWk2+0zmYiBQ9OF6wi64wOT9WIFhLgASy9vT0zsMOgcdzMRVchW
 UEDvidjjq89gb4d2g85gH9b/SY0Nr3pwL24W7OI8=
X-Google-Smtp-Source: AGHT+IF5bFe6f1gww9TQs30yoX/zIbU8kraEXH9ez7+JeOJm2YFC47uSzV6IVNO+S++rRQ+zGTUKhyIkTGngBSEh7F8=
X-Received: by 2002:a05:690c:3612:b0:6ef:4b7a:eb07 with SMTP id
 00721157ae682-6f3f82387edmr434718537b3.36.1736233286180; Mon, 06 Jan 2025
 23:01:26 -0800 (PST)
MIME-Version: 1.0
References: <20250106210623.1296442-1-thomas.petazzoni@bootlin.com>
 <CA+R_deqLs+aSCBvoTGj9rJn8D5ARu1=QFKDy19qgTP_YWBdU0g@mail.gmail.com>
 <20250106231954.734c2006@windsurf>
In-Reply-To: <20250106231954.734c2006@windsurf>
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Tue, 7 Jan 2025 08:01:14 +0100
X-Gm-Features: AbW1kvYURdi0JowoMpkdNLEeIQXHYKpjF6QdrtxJmMp6Ufa887jJJbLv0vyp0wo
Message-ID: <CA+R_derBbXPowNj_aq2iY6EpHKi9JDstCR0o8RJcR5_C2u+y_A@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736233286; x=1736838086; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=efAZaksmnaWbbF49E/h21qBmwXI5Wb4CDIixaZPMZJI=;
 b=g8PdpM35l54IA45bdVrzWxl+x+89MnBJ2UqdiIjLMZtDITivZXnBdIdwbrCysh32FL
 4IWZNTz6WkytsRWCl7U8973NWnAV2gRrFpDQJDGV1ldZvwhZc/QtPONEXylbN9wARTQi
 dIchMpWj0I1Cz49UBKEEc22Ro60aQ5u3YECE+WQBR5KIJnitRqRbumMHXGy/OQrqIkPS
 uoNO5xUBZkBLXW49ZkNCiiMWVIK7qyKV24j0m90p8pwXfoM0Bsox0/AdDQiDA0DwALlW
 Zw6N4nXw/XkYmf/h7+lFtRgWFVPD4PVjA+kdvBxeya5r33HWYjufX1BgsnNWUc+Ucnyj
 aaRg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=g8PdpM35
Subject: Re: [Buildroot] [PATCH] package/qt6/qt6quicktimeline: add missing
 select BR2_PACKAGE_QT6DECLARATIVE
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
Content-Type: multipart/mixed; boundary="===============7190949139496663993=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7190949139496663993==
Content-Type: multipart/alternative; boundary="000000000000452783062b18507b"

--000000000000452783062b18507b
Content-Type: text/plain; charset="UTF-8"

Thanks. Now I got the warning, and it disappeared after applying your patch.


man. 6. jan. 2025 kl. 23:19 skrev Thomas Petazzoni <
thomas.petazzoni@bootlin.com>:

> Hello Roy,
>
> On Mon, 6 Jan 2025 23:07:46 +0100
> Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:
>
> > How can I recreate the warning reported by kconfig?
>
> Like this:
>
> $ cat > .config <<EOF
> BR2_arm=y
> BR2_cortex_a9=y
> BR2_ARM_ENABLE_VFP=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> BR2_PACKAGE_QT6=y
> BR2_PACKAGE_QT6QUICKTIMELINE=y
> EOF
> $ make olddefconfig
> WARNING: unmet direct dependencies detected for
> BR2_PACKAGE_QT6DECLARATIVE_QUICK
>   Depends on [n]: BR2_PACKAGE_QT6 [=y] && BR2_PACKAGE_QT6DECLARATIVE [=n]
>   Selected by [y]:
>   - BR2_PACKAGE_QT6QUICKTIMELINE [=y] && BR2_PACKAGE_QT6 [=y]
> #
> # configuration written to /home/thomas/projets/buildroot/.config
> #
>
> Basically, just enable qt6 and qt6quicktimeline. You can even do it
> from menuconfig, and then when you exit menuconfig, you will see the
> kconfig warning.
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--000000000000452783062b18507b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks. Now I got the warning, and it disappeared aft=
er applying your patch.</div><div><br></div></div><br><div class=3D"gmail_q=
uote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">man. 6. j=
an. 2025 kl. 23:19 skrev Thomas Petazzoni &lt;<a href=3D"mailto:thomas.peta=
zzoni@bootlin.com">thomas.petazzoni@bootlin.com</a>&gt;:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">Hello Roy,<br>
<br>
On Mon, 6 Jan 2025 23:07:46 +0100<br>
Roy Kollen Svendsen &lt;<a href=3D"mailto:roykollensvendsen@gmail.com" targ=
et=3D"_blank">roykollensvendsen@gmail.com</a>&gt; wrote:<br>
<br>
&gt; How can I recreate the warning reported by kconfig?<br>
<br>
Like this:<br>
<br>
$ cat &gt; .config &lt;&lt;EOF<br>
BR2_arm=3Dy<br>
BR2_cortex_a9=3Dy<br>
BR2_ARM_ENABLE_VFP=3Dy<br>
BR2_TOOLCHAIN_EXTERNAL=3Dy<br>
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=3Dy<br>
BR2_PACKAGE_QT6=3Dy<br>
BR2_PACKAGE_QT6QUICKTIMELINE=3Dy<br>
EOF<br>
$ make olddefconfig<br>
WARNING: unmet direct dependencies detected for BR2_PACKAGE_QT6DECLARATIVE_=
QUICK<br>
=C2=A0 Depends on [n]: BR2_PACKAGE_QT6 [=3Dy] &amp;&amp; BR2_PACKAGE_QT6DEC=
LARATIVE [=3Dn]<br>
=C2=A0 Selected by [y]:<br>
=C2=A0 - BR2_PACKAGE_QT6QUICKTIMELINE [=3Dy] &amp;&amp; BR2_PACKAGE_QT6 [=
=3Dy]<br>
#<br>
# configuration written to /home/thomas/projets/buildroot/.config<br>
#<br>
<br>
Basically, just enable qt6 and qt6quicktimeline. You can even do it<br>
from menuconfig, and then when you exit menuconfig, you will see the<br>
kconfig warning.<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>

--000000000000452783062b18507b--

--===============7190949139496663993==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7190949139496663993==--
