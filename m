Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A28DC30653
	for <buildroot@archiver.kernel.org>; Thu,  4 Jul 2024 13:23:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA9B98088A;
	Thu,  4 Jul 2024 13:23:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XqpGggLG_kZY; Thu,  4 Jul 2024 13:23:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5710811E0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5710811E0;
	Thu,  4 Jul 2024 13:23:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B4D131BF2AB
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 13:23:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ACEAC403F9
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 13:23:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8QpOjAZe2Szj for <buildroot@lists.busybox.net>;
 Thu,  4 Jul 2024 13:23:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::a33; helo=mail-vk1-xa33.google.com;
 envelope-from=lancethepants@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5C53A403F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C53A403F8
Received: from mail-vk1-xa33.google.com (mail-vk1-xa33.google.com
 [IPv6:2607:f8b0:4864:20::a33])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5C53A403F8
 for <buildroot@buildroot.org>; Thu,  4 Jul 2024 13:23:48 +0000 (UTC)
Received: by mail-vk1-xa33.google.com with SMTP id
 71dfb90a1353d-4f2ee3be4a1so243201e0c.2
 for <buildroot@buildroot.org>; Thu, 04 Jul 2024 06:23:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720099427; x=1720704227;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T4W/MjS0Apm2gmAZayq8C+UnIMSsPCkPU8IvERWyciY=;
 b=f33OfEV7dCHeddw+VQ+ct23sCz+fKoLYS5vk4AyP9B2x7gCRSaq6d29S40Y0MA6xji
 8LfqS5FI8h507cnF6LOxBekSqIK5/qQy1uWJ143lfC9lTdcOp3RHXSbSEa6pRKAVrCMc
 BklWUIY9PndIXOv4umPh+3Zwf0C96/qyXq5h97dYdXLE+KdbBm6IXbQTBdVkXojuh0mP
 OZiBZIbcwAtJqICy5WnuALTmQ3dh1Kkt4QERJMwIkfZ6JgzVydUXywWaZ9VlkeCJUGuk
 jNEsv76EkhPP5ddlNb7AT4hgGOaDYlnpFgfVVB95Obmhwn/hPpKCSilrw4ZxsMdnZW4f
 6zhw==
X-Gm-Message-State: AOJu0YwHMIrOaZYpzjpTJv7iGOIStSnWbwH9EWkfOZ0d+CYWoYbSza/C
 TQB+CeKz4M0tcOoiyiPL+UGzrB/Xq4d5xFjcebaUv/+cNvpgqgJ9fxlVwpZQMODGnvgBtwwtAiP
 J2D+YBzg5VHDvp7Ru+LQHLrHF4uo=
X-Google-Smtp-Source: AGHT+IGd0Nc2pQxlgsGnM9BUiIQKtpSvAHkMOXxtLgmuLZAcZoohWqKGvI8yaGCXuu/kNB9xU4MIX5O/QZm6dexLiJE=
X-Received: by 2002:a05:6122:280e:b0:4ec:efaf:a020 with SMTP id
 71dfb90a1353d-4f2f404783fmr1876420e0c.15.1720099425525; Thu, 04 Jul 2024
 06:23:45 -0700 (PDT)
MIME-Version: 1.0
References: <5e6129b8-9672-efd0-32c7-18d0defcad21@gmail.com>
 <CAEyMn7bdo1UPCxy5pRi-SXsTgjy_o9wYkPZ+CgYrh7CPDgUd0w@mail.gmail.com>
 <179f54c1-ed3c-4cdb-8110-71116525a6ac@gmail.com>
 <CAEyMn7apYeyK=YuAUUSA9ANTh2nwER3x01Q89x8Op9aRxLuNQQ@mail.gmail.com>
In-Reply-To: <CAEyMn7apYeyK=YuAUUSA9ANTh2nwER3x01Q89x8Op9aRxLuNQQ@mail.gmail.com>
From: Lance Fredrickson <lancethepants@gmail.com>
Date: Thu, 4 Jul 2024 07:23:35 -0600
Message-ID: <CABwKrPD7uN+CDd_yYmtn58zzfCccaPz_oTCwd=8jM4n+erVRfQ@mail.gmail.com>
To: heiko.thiery@gmail.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720099427; x=1720704227; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=T4W/MjS0Apm2gmAZayq8C+UnIMSsPCkPU8IvERWyciY=;
 b=IAMVwkaanOL7caoZ3yvbVEkvWdd3z2hf/bSflMQ2uDZiuqP/bOsZlEqRpkFE3MInXn
 16yeUMmnjeFERi1bO7tXO1guZno0OuA2hOq9hfSiEaLEPFGDzhUW7r5AXdH1v3ObQW96
 Mic1l4zxy9WGxgoHdHIPzPdfq45K7oqNGb9aDeYWsW5CeTxGK84pWPKIZB/soWbWjuYm
 ZGR2AVhqauCuTGM/8qxaLkTHZv1xG3Up1WnccrPbU2k0eQk2CgnDkcsignipYN00vakD
 P/IEbbOYsvhu7LUN627sS4zreOtQigsf++8mDihsDRm23Sfa9rqLP84keyXHfrM9ngSn
 lqEw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=IAMVwkaa
Subject: Re: [Buildroot] 2023.05 host ccache detects avx512 and fails to buld
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
Cc: james.hilliard1@gmail.com, yann.morin.1998@free.fr,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============1829980879574445124=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1829980879574445124==
Content-Type: multipart/alternative; boundary="0000000000003ca80e061c6bdb2b"

--0000000000003ca80e061c6bdb2b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Great! Looking forward to it in the next release.

Lance

On Thu, Jul 4, 2024, 12:52=E2=80=AFAM Heiko Thiery <heiko.thiery@gmail.com>=
 wrote:

> Hi Lance,
>
> Am Mi., 3. Juli 2024 um 17:03 Uhr schrieb Lance Fredrickson
> <lancethepants@gmail.com>:
> >
> > I've just been carrying this patch that disabled AVX512.  Seemed like
> > not a lot of people were using ccache.
> >
> >
> https://github.com/tomato64/tomato64/blob/master/src/patches/0001-disable=
-ccache-av512.patch
>
> Good to know that this is also possible. But as you can see I bumped
> ccache and added new  system dependencies to fix this issue.
>
> --
> Heiko
>
> [snip]
>

--0000000000003ca80e061c6bdb2b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Great! Looking forward to it in the next release.</p>
<p dir=3D"ltr">Lance</p>
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu=
, Jul 4, 2024, 12:52=E2=80=AFAM Heiko Thiery &lt;<a href=3D"mailto:heiko.th=
iery@gmail.com">heiko.thiery@gmail.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">Hi Lance,<br>
<br>
Am Mi., 3. Juli 2024 um 17:03 Uhr schrieb Lance Fredrickson<br>
&lt;<a href=3D"mailto:lancethepants@gmail.com" target=3D"_blank" rel=3D"nor=
eferrer">lancethepants@gmail.com</a>&gt;:<br>
&gt;<br>
&gt; I&#39;ve just been carrying this patch that disabled AVX512.=C2=A0 See=
med like<br>
&gt; not a lot of people were using ccache.<br>
&gt;<br>
&gt; <a href=3D"https://github.com/tomato64/tomato64/blob/master/src/patche=
s/0001-disable-ccache-av512.patch" rel=3D"noreferrer noreferrer" target=3D"=
_blank">https://github.com/tomato64/tomato64/blob/master/src/patches/0001-d=
isable-ccache-av512.patch</a><br>
<br>
Good to know that this is also possible. But as you can see I bumped<br>
ccache and added new=C2=A0 system dependencies to fix this issue.<br>
<br>
-- <br>
Heiko<br>
<br>
[snip]<br>
</blockquote></div>

--0000000000003ca80e061c6bdb2b--

--===============1829980879574445124==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1829980879574445124==--
