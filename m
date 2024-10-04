Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18663CF885B
	for <buildroot@archiver.kernel.org>; Fri,  4 Oct 2024 21:15:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86C4841809;
	Fri,  4 Oct 2024 21:15:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cJmaClvoYGWm; Fri,  4 Oct 2024 21:15:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF4E74180F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF4E74180F;
	Fri,  4 Oct 2024 21:15:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E78901BF5F5
 for <buildroot@lists.busybox.net>; Fri,  4 Oct 2024 21:15:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D5806403A5
 for <buildroot@lists.busybox.net>; Fri,  4 Oct 2024 21:15:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZmXrNk8N0rFy for <buildroot@lists.busybox.net>;
 Fri,  4 Oct 2024 21:15:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b2a; helo=mail-yb1-xb2a.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 822E4400F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 822E4400F2
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 822E4400F2
 for <buildroot@buildroot.org>; Fri,  4 Oct 2024 21:15:26 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-dff1ccdc17bso2732724276.0
 for <buildroot@buildroot.org>; Fri, 04 Oct 2024 14:15:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728076525; x=1728681325;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z0OZtdxnnRMQ/JowXY2B6cG15+4Pz2AJkDxZXbkFcNk=;
 b=xTpy+Mz/VIYEoSFKK0UfHIx+8RJRcHkdwIaAYGM2jv6qmUjhlN4TAqteMbiev5ifuv
 gGiM+hqlw8QmtTIAZMeOFV0Z7s/dzpLCsDrY2KK77Jxf0zgcCrybgMMdIJjUm1ZJw/TS
 +gh086WF+hcenS14xXUkyUBueo2xcuVGtI8EDx9OPz5TBOmSScChJPyvucv+YVyoCIqY
 NBm/gJK3GQnq0X/3nQNwXBZppyXcaFrLmbOXFds7uQQRiQ0Mvp2P00mZuM8wcbD/gq1v
 n4CHVBXsrmGuV1Td57w3KW3Mx07nFyx2M1majDf4FVxaWP8FA5XXl+W0RUOEQU50bKWB
 o2FQ==
X-Gm-Message-State: AOJu0YyUdzQTQONLoSwGpiWaZUPs1ySi8vSrKPALuPqcjhLM1hj7amgn
 uhgXICTHejwocgSwyZmxp3AB7HiarkoM5HM4ilzCFvueCMWC4TYdquSUo1mB4NZyWb22LwkV9ua
 pJidRWRm3UnPSbBPon9NyjDoiErY=
X-Google-Smtp-Source: AGHT+IEHLXRPMRgX459ETD3VYIGM/Ebdkes03+OrydHhvmJRbBWPQGd4kko/9dno59dNZoDd8/cR6Ws7b90DJHnDvM0=
X-Received: by 2002:a05:6902:1109:b0:e11:45fa:e344 with SMTP id
 3f1490d57ef6-e2893928950mr3963631276.43.1728076525130; Fri, 04 Oct 2024
 14:15:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ6EmCfKm3W5yFiTTnMO48n75YRKr2kPFHUttwfwvCn8tbSeaA@mail.gmail.com>
In-Reply-To: <CAJ6EmCfKm3W5yFiTTnMO48n75YRKr2kPFHUttwfwvCn8tbSeaA@mail.gmail.com>
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Fri, 4 Oct 2024 23:15:13 +0200
Message-ID: <CA+R_deqU5yWHwVoFZG2-Kiywje+EWiu7y2LqJnPSCnHTrMd3Bw@mail.gmail.com>
To: Patricia Holden <pholden@nklabs.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728076525; x=1728681325; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=z0OZtdxnnRMQ/JowXY2B6cG15+4Pz2AJkDxZXbkFcNk=;
 b=lH+IbovevRTOuANdURZLaGjTNIyRcb0QfKRrqNG2eerGR4WY2oUcIQt2EnAHTALgzk
 pGP+I1OZhZfYiZqJEQJyfvJQo5IFkFl78/wXtZbZC+kh1cGiYwmDjXHKOx/kCa7joZWx
 WOiOzykCmiMlTTdlm1sZ1ib/1bObcRs62MsIIkqQHDAR9EIzb5/Mo0kKAIbyrLIbm3ru
 efp7edmyYkkDEJstto7u76q4sXfgxRTdT5+ZW8/YUoOJFQIDhnuipFg1gmVzYJEblB8r
 9LqP6vb3VIwKWO8M7YaLXJvYuY0a+qi7r2C97+g2E8CBG9WRMDumDr7b0jufkofg4n/i
 LRFA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=lH+Ibove
Subject: Re: [Buildroot] Qt6Charts support in 2024.02
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
Content-Type: multipart/mixed; boundary="===============4928973679493590056=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4928973679493590056==
Content-Type: multipart/alternative; boundary="0000000000006ce2fb0623ad2b71"

--0000000000006ce2fb0623ad2b71
Content-Type: text/plain; charset="UTF-8"

Hi Patricia,

I added Qt Charts here:

https://patchwork.ozlabs.org/project/buildroot/list/?series=426643

But note that it will be replaced by Qt Graphs in Qt 6.8.0.

Regards,
Roy

fre. 4. okt. 2024 kl. 19:56 skrev Patricia Holden <pholden@nklabs.com>:

> I am working on a TI AM62x project which will feature a QT based UI.  We
> need Qt6Charts support for some of the screens for this UI.  Is there a
> patch available to enable Qt6Charts?
>
> Thanks!
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--0000000000006ce2fb0623ad2b71
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Patricia,</div><div><br></div><div>I added Qt Char=
ts here:</div><div><br></div><div><a href=3D"https://patchwork.ozlabs.org/p=
roject/buildroot/list/?series=3D426643">https://patchwork.ozlabs.org/projec=
t/buildroot/list/?series=3D426643</a></div><div><br></div><div>But note tha=
t it will be replaced by Qt Graphs in Qt 6.8.0.</div><br><div>Regards,</div=
><div>Roy<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">fre. 4. okt. 2024 kl. 19:56 skrev Patricia Holden &lt;<a=
 href=3D"mailto:pholden@nklabs.com">pholden@nklabs.com</a>&gt;:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">I am worki=
ng on a TI AM62x project which will feature a QT based UI.=C2=A0 We need Qt=
6Charts=C2=A0support for some of the screens for this UI.=C2=A0 Is there a =
patch available to enable Qt6Charts?<div><br></div><div>Thanks!</div></div>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div>

--0000000000006ce2fb0623ad2b71--

--===============4928973679493590056==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4928973679493590056==--
