Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C444FFB5173
	for <buildroot@archiver.kernel.org>; Mon,  6 Apr 2026 23:48:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E715810CE;
	Mon,  6 Apr 2026 23:48:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 17deQYGZPnZn; Mon,  6 Apr 2026 23:47:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 225ED810CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775519279;
	bh=QhREF+Mh5bS5mhDHpd0MEXAg2kzeZxeg2VFEdtjxCIw=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sNkJY81cAp/3JFzJyySzd54qEU1/0gG4poEZ3rSc279DEm1v2jd6IDhGaoBrqEdNU
	 ZbzlAD1pHM4B50tsoCC1sABPDazQExuKvueCciGpvyAVqEdkQ4cvFCOaEMShwbqu7Q
	 c/0cvZZ5bNFDQsV7+Dcb1XLwdHS0NH9E17EoWuEEFJhLUVXtfbVlpnOkF8i+HAxAsD
	 Es8hGdS4SiUy6ZVwjBYDlekkrDi0TB74crzNGqy6cPmCPZWnZ/DT4vgusWbzuIi7I/
	 aUXFOswNaQUDk80jrNVzN8/oETUkBxgL31zbgeeQ/tIi8YZPLe5XESVuQRxC7avV7m
	 hc3EYfrUxa7gg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 225ED810CF;
	Mon,  6 Apr 2026 23:47:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0853D1EB
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 23:47:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D57F9608D9
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 23:47:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 42ooUWp40rFm for <buildroot@buildroot.org>;
 Mon,  6 Apr 2026 23:47:57 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1332; helo=mail-dy1-x1332.google.com;
 envelope-from=sergio.prado@e-labworks.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8DC01608D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DC01608D7
Received: from mail-dy1-x1332.google.com (mail-dy1-x1332.google.com
 [IPv6:2607:f8b0:4864:20::1332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8DC01608D7
 for <buildroot@uclibc.org>; Mon,  6 Apr 2026 23:47:56 +0000 (UTC)
Received: by mail-dy1-x1332.google.com with SMTP id
 5a478bee46e88-2b4520f6b32so4902364eec.0
 for <buildroot@uclibc.org>; Mon, 06 Apr 2026 16:47:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775519275; cv=none;
 d=google.com; s=arc-20240605;
 b=TrDwtgG9Wo5Ntqwb4TZigJCEhABa/hkg9XZlB1MyU4yH8k01AbkZ+Q77aNOQFGxI+P
 SmuOtfza5Hh21P0KuwcyUAIehop4d51wwszZO9s9sWgrsiG6adob5QYlz4a+mmjiwAod
 OzMwr4aPNtTnxg+YMDTm4/2HJ2f7P2qriGsb1uTiKXLJOTWMcdmoH7kwzd1qwc1aM/m3
 3wFiN7huvkS+zyA4WixXMEId5hL20QdA4mxk3/1UUQ/zBLgDeLcgHIOq/RllrEHYkNUP
 upQ/o7+y7RxxMl0xhezPgHYG+yd5BjYzT0VklRTZqunfehFoIAiw4J3NVDTUT1xQtKCi
 n+8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=pPc2f+lPVfzpEBszVBIr7aEsYwhmyutMBt0ulkC5fHg=;
 fh=UOtyDyBEaQD+UD3JzTVzrDqHDb7NVYkSReCtKBEijVM=;
 b=Scu0F90VhgZMqKDNvN6PpQMkE6XfZv1mOU0tfS4cx9eqQ64+dPTlApy8xLL4MxQfsP
 V8eu/IpIDZJZBupct2Mr4rqCF7+fY2x35ZC+L6yQRjoX3BMmwtJcppqLZnOqfICzqzE0
 a+E0RZz7evERpYZ0EQFEiWUT9vzaLAgEfffgf+TM2PF1NYWaKrLrVWgJ2XkylTloVLMg
 wivDAOI5CNLDHsR/lNFWx3nznMdAEmTLuRsbBkzGRfJ/gOYGTMhNFr+ve3JTn9UZYbnf
 DuIOLKTAPkImmDU1iN5RuZ4D6DKHMPRd5j3Wlbthi25KBXPw1aMcDyVyVegkXHIV/bjZ
 G92Q==; darn=uclibc.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775519275; x=1776124075;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pPc2f+lPVfzpEBszVBIr7aEsYwhmyutMBt0ulkC5fHg=;
 b=rIeMJB9ApfanZ+b27DiSIaVnywcgXiYIOAC9yMWAD/yjHD5cc/A6c+8HNSA4br4GT8
 1XjqS2MAVV7ArqTaChay67bM4rmIdvKDHq4FL2oo+ec/pEyn/4W9hHoGhDsEx/k2ZLYN
 H4HOFhPbeBaLBWJoIzWQhDja7959G6/4dufFDMJdqoDjKGWWsGmHNn+gXjiW5dgisnLJ
 2UGMXJX6qW5K1Apmr+51s/j+citNCB0qW0VHLYP4ScTomyKL3+96s+Bc6RtWWwIgAZV0
 yKZtRfrWqbOnYvYwH0vLtEOjqD4CsrN0TlWUCUbel0ipPPNPmafk9la7drkRYdSFkcrq
 fd1w==
X-Gm-Message-State: AOJu0YzAF/Hh4OhEGY8ONTjpkbkuDtACfylgN0pN1FS/FRVXv0V87RXS
 UDB+1sPxaDwbDnyRwnknMAGGuhcOHMoh8MCzqsHEsaaMLFfgo0173ItEHiAfQ9tFjRaeg3Z4t9I
 k9pHKbVw7AJBQ5nkkYYRVdiX7IIGdD6XZqlbz+znRNTn5/5KT94qc9wU=
X-Gm-Gg: AeBDievSzPxONB5IRuLYZZwQ/JwhZ5tqQx0fBlSQoQBS3AcPCdemG/Q3Fd7Lou/5clP
 RMfWl40olx/TDOjAGYFsZ3mvx2TBouetJQcuLIgT6JLpJC0Rz4EFtEQ2v216pxytoSZB5qAkvll
 XfdrbuVY2HZTyaj5xGo/DDH1rXP/nl0dirKrtDn6joFaAD3D+3/mD8ConwvPRET2lTrFWSaZDKy
 WG5VHODMWg5pPSWzkU5DtQZAqD7c10n/5FMi4J0Kj9Ik2R6qoAqadbBHnkNijQODcEbBwx//De4
 VInKrHth3yGw7D0QQNyqSW7r28kmt1yNJIW5Wcyd
X-Received: by 2002:a05:7301:168b:b0:2c3:d51b:91c4 with SMTP id
 5a478bee46e88-2cbf99ef027mr7270764eec.7.1775519275199; Mon, 06 Apr 2026
 16:47:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260403191212.41297-1-bernd@kuhls.net>
 <9bd76f389facb56a8418edbee7d9fe8f__43245.0398498744$1775462663$gmane$org@free.fr>
 <pan$7060f$23e99787$e312250a$d96db09d@ID-313208.user.individual.net>
In-Reply-To: <pan$7060f$23e99787$e312250a$d96db09d@ID-313208.user.individual.net>
From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Mon, 6 Apr 2026 20:47:38 -0300
X-Gm-Features: AQROBzAYa_3akIMbLjLLfQJCYmztc2rU--4m4io2G5Ovqb_0vl8lEaswh2ONyiY
Message-ID: <CANu7NGtDA_18kBEWexe8ShV4d+0fxS6ZbwfWCFtBOf=nw1=6sw@mail.gmail.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@uclibc.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=e-labworks-com.20251104.gappssmtp.com; s=20251104; t=1775519275; x=1776124075;
 darn=uclibc.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pPc2f+lPVfzpEBszVBIr7aEsYwhmyutMBt0ulkC5fHg=;
 b=Ce1bZE9+L5KdzypPRZ+u4R1QSjHKnhPQutckt3B4UEn2g3TNnYe2S0GmXoQ7KpAv8x
 NH3g98w2IKTHpiKE866i67WZsbE30alHGpD5AhD3RknblGKWrjv/0NWWHRgkJpm5uKri
 +KdzAx2TTDJKmDPZFUF2K4ORtmB0INgCX5ukWsH6Z+l9VOu9OU6VqD+XE8YZsDYaeOM+
 qUz5vz2CrH5wAZtqIVEA0Zwf52CppFYZXaARnYtGbSYhlqfR9EDYYBAVmQmawaYJThWA
 mAaIVAESA2imirq+4kc1BFwe6UEiwxtlkQ3JhKFxaUTKmMrbzUEdQdeT4XFk4jkRh0SY
 Bobw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=e-labworks.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=e-labworks-com.20251104.gappssmtp.com
 header.i=@e-labworks-com.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=Ce1bZE9+
Subject: Re: [Buildroot] [PATCH 1/1] package/suricata: bump version to 8.0.4
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
Content-Type: multipart/mixed; boundary="===============6042641252855909746=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6042641252855909746==
Content-Type: multipart/alternative; boundary="000000000000b0be48064ed34b9d"

--000000000000b0be48064ed34b9d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bernd,

> Since we have snort3 we should also remove snort 2.x.
>
> @Sergio: You are the maintainer of the buildroot package. What do you
> think?
Yeah, snort (v2) is not maintained for a while now. I agree it should be
dropped.

Best regards,

Sergio Prado

Em seg., 6 de abr. de 2026 =C3=A0s 15:40, Bernd Kuhls <bernd@kuhls.net> esc=
reveu:

> Hi Julien,
>
> Am Mon, 06 Apr 2026 10:03:55 +0200 schrieb Julien Olivain via buildroot:
>
> > I did not checked when those CVEs were introduced or if they are
> > all applicable, but this should be mentioned in the commit log.
> > It is likely this bump should be marked as a "security" one.
>
> done:
> https://patchwork.ozlabs.org/project/buildroot/patch/
> 20260406181810.1853090-1-bernd@kuhls.net/
>
> > I believe your first motivation was to get rid of pcre (v1)
> > dependency
>
> Yes, sent the next batch of patches:
> https://patchwork.ozlabs.org/project/buildroot/list/?series=3D498885
>
> For Kodi and Freeswitch I am testing backported patches and will send the=
m
> later.
>
> Afaics the only package where I could not find pcre2 support is the 2.x
> branch of snort. Debian for example removed snort2 in 2024:
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D1079286
>
> Since we have snort3 we should also remove snort 2.x.
>
> @Sergio: You are the maintainer of the buildroot package. What do you
> think?
>
> Regards, Bernd
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--000000000000b0be48064ed34b9d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div class=3D"gmail_default" style=3D"font-size:small=
">Hi=C2=A0Bernd,</div><div class=3D"gmail_default" style=3D"font-size:small=
"><br></div><div class=3D"gmail_default" style=3D"font-size:small">&gt; Sin=
ce we have snort3 we should also remove snort 2.x.</div><div class=3D"gmail=
_default" style=3D"font-size:small">&gt;=C2=A0</div><span class=3D"gmail_de=
fault" style=3D"font-size:small">&gt;=C2=A0</span>@Sergio: You are the main=
tainer of the buildroot package. What do you<br><span class=3D"gmail_defaul=
t" style=3D"font-size:small">&gt;=C2=A0</span>think?<br clear=3D"all"></div=
><div><div class=3D"gmail_default" style=3D"font-size:small">Yeah, snort (v=
2) is not maintained for a while now. I agree it should be dropped.</div><d=
iv class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=
=3D"gmail_default" style=3D"font-size:small">Best regards,</div></div><div>=
<br></div><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D=
"gmail_signature"><div dir=3D"ltr">Sergio Prado<br></div></div></div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Em seg=
., 6 de abr. de 2026 =C3=A0s 15:40, Bernd Kuhls &lt;<a href=3D"mailto:bernd=
@kuhls.net" target=3D"_blank">bernd@kuhls.net</a>&gt; escreveu:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">Hi Julien,<br>
<br>
Am Mon, 06 Apr 2026 10:03:55 +0200 schrieb Julien Olivain via buildroot:<br=
>
<br>
&gt; I did not checked when those CVEs were introduced or if they are<br>
&gt; all applicable, but this should be mentioned in the commit log.<br>
&gt; It is likely this bump should be marked as a &quot;security&quot; one.=
<br>
<br>
done:<br>
<a href=3D"https://patchwork.ozlabs.org/project/buildroot/patch/" rel=3D"no=
referrer" target=3D"_blank">https://patchwork.ozlabs.org/project/buildroot/=
patch/</a><br>
<a href=3D"http://20260406181810.1853090-1-bernd@kuhls.net/" rel=3D"norefer=
rer" target=3D"_blank">20260406181810.1853090-1-bernd@kuhls.net/</a><br>
<br>
&gt; I believe your first motivation was to get rid of pcre (v1)<br>
&gt; dependency<br>
<br>
Yes, sent the next batch of patches:<br>
<a href=3D"https://patchwork.ozlabs.org/project/buildroot/list/?series=3D49=
8885" rel=3D"noreferrer" target=3D"_blank">https://patchwork.ozlabs.org/pro=
ject/buildroot/list/?series=3D498885</a><br>
<br>
For Kodi and Freeswitch I am testing backported patches and will send them =
<br>
later.<br>
<br>
Afaics the only package where I could not find pcre2 support is the 2.x <br=
>
branch of snort. Debian for example removed snort2 in 2024:<br>
<a href=3D"https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D1079286" rel=
=3D"noreferrer" target=3D"_blank">https://bugs.debian.org/cgi-bin/bugreport=
.cgi?bug=3D1079286</a><br>
<br>
Since we have snort3 we should also remove snort 2.x.<br>
<br>
@Sergio: You are the maintainer of the buildroot package. What do you <br>
think?<br>
<br>
Regards, Bernd<br>
<br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div>

--000000000000b0be48064ed34b9d--

--===============6042641252855909746==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6042641252855909746==--
