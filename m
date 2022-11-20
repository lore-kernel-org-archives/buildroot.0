Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D02DC4332F
	for <buildroot@archiver.kernel.org>; Sun, 20 Nov 2022 09:50:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 254F040919;
	Sun, 20 Nov 2022 09:50:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 254F040919
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3dcT9-o0qdgp; Sun, 20 Nov 2022 09:49:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 244AF40915;
	Sun, 20 Nov 2022 09:49:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 244AF40915
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C4C761BF40E
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 09:49:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F9EA81445
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 09:49:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F9EA81445
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ojjjal6p5Otf for <buildroot@lists.busybox.net>;
 Sun, 20 Nov 2022 09:49:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E3F88141D
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6E3F88141D
 for <buildroot@buildroot.org>; Sun, 20 Nov 2022 09:49:55 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id ci10so1900009pjb.1
 for <buildroot@buildroot.org>; Sun, 20 Nov 2022 01:49:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n/P5QX2gtq6qrMAANqwu47xJ2H0qXnZ31iLgvYCYqZ8=;
 b=kYcbWNw5NINpcuMnkuVp5mgS782Lg1LS8xz1JQW/cj2wWEW/6nyevSpw+vDO9Wsm0J
 P6q09yVEzl5ihb2iB+pxsslMdpZ3OmUZCRXjwh2xsOBAbLHg8iXSsDe13ceNoYfdwBsE
 ScK/PdyXZ0k4ujG7CkEW0MW2xDhhSVbwpQcYg2LBRwSm2Km66beipII79R34kH3heUyw
 7SF7p8H54FmHUtYtiY/PaqW55hMg+IerIUg1Peke7cI7Xp+cRhzo8ayPxdqNn0D6NoA/
 kIsrppf2fwex9VOtusbSTtTUMKps/82gk2SvATSoZqT9eF7NaK0Q/+8A2z7OhxL81/uV
 DHOA==
X-Gm-Message-State: ANoB5pk6W/+oG7G2A++JCvAAnMpc0Pn/bxwNRD5x96/RtdmSTF0m7luR
 bAgVVRyy4DxMwtyl5e5jYimtFyoM77T8iWhfHv+zDjjHcCw=
X-Google-Smtp-Source: AA0mqf4AN2TQTaEztTiinCG7gwkfSC+ERV4mCOgeVOo87ZPGM5PPx4x5QRDnr3fWTcA07jatB92BTH/Nt0jJRZt6haA=
X-Received: by 2002:a17:90a:f402:b0:218:7b33:60f with SMTP id
 ch2-20020a17090af40200b002187b33060fmr13702112pjb.79.1668937794854; Sun, 20
 Nov 2022 01:49:54 -0800 (PST)
MIME-Version: 1.0
References: <20221120090654.312078-1-alexander.lukichev@gmail.com>
 <20221120091706.GR2123054@scaer>
In-Reply-To: <20221120091706.GR2123054@scaer>
From: Alexander Lukichev <alexander.lukichev@gmail.com>
Date: Sun, 20 Nov 2022 11:49:43 +0200
Message-ID: <CAAHaz6H6ao3ovqCmj+nLcnF-N2fdrNaSHxqfPAkRUopGV-_Fgg@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=n/P5QX2gtq6qrMAANqwu47xJ2H0qXnZ31iLgvYCYqZ8=;
 b=cv0YEMWcUJI/5NC7AR+DLHvA0cS6kVrHQ985zZ5JBjpwIwvIlhyQzw+Pu4o3LkzWzh
 qQVmAvOVW6Hna6bSRixhnIGCUp93LMv3BVpJP9dmWMzEo187a5+UiXP0iLmHiJehFckE
 eCm+jb4iMSH7CUsGr7fLGPA7aiayFvpL3BTz1LVacik4ieob81pI3kbHxc+d6Wakd9Cg
 c6NlMUskICeXnRlmebeoa5ghMpKEgmBP0Q46FQVqbTdwtfidVRipDeWaQHIOQYpl3VQX
 LfJuoVEjaH9M3+3K3oK2s/HTfYmwlraZO1G2mnGldsn9ZH1bB/VsAoA3jE6KgGDNlSbY
 oWyQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=cv0YEMWc
Subject: Re: [Buildroot] [PATCH 1/1] package/openpgm: fix build for non-x86
 targets
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============7356175016937010229=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7356175016937010229==
Content-Type: multipart/alternative; boundary="0000000000006a25e405ede3dc67"

--0000000000006a25e405ede3dc67
Content-Type: text/plain; charset="UTF-8"

Hi Yann,

> So I slightly tweaked it to make it obvious it is a backport rather than
> a pending patch.

Thanks, I'll take care to tag them properly next time!

--
Best regards,
  Alexander Lukichev

--0000000000006a25e405ede3dc67
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi Yann,</div><div><br></div><div>&g=
t;=20
So I slightly tweaked it to make it obvious it is a backport rather than<br=
>&gt; a pending patch.<br>
</div><div><br></div><div>Thanks, I&#39;ll take care to tag them properly n=
ext time!<br></div><div><br></div><div><div><div dir=3D"ltr" class=3D"gmail=
_signature">--<br>Best regards,<br>=C2=A0 Alexander Lukichev<br></div></div=
></div></div></div>

--0000000000006a25e405ede3dc67--

--===============7356175016937010229==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7356175016937010229==--
