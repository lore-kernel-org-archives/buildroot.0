Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA0CCCCD194
	for <buildroot@archiver.kernel.org>; Thu, 16 Oct 2025 05:37:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5DA7617BB;
	Thu, 16 Oct 2025 05:37:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SRuw6ZiyQicr; Thu, 16 Oct 2025 05:37:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B1726174E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B1726174E;
	Thu, 16 Oct 2025 05:37:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F98C116F
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 05:37:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 21769403EA
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 05:37:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0YzBNvVt6hKP for <buildroot@buildroot.org>;
 Thu, 16 Oct 2025 05:37:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com;
 envelope-from=pierre.ficheux@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DA57E403AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA57E403AD
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DA57E403AD
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 05:37:52 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-58affa66f2bso423857e87.1
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 22:37:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760593070; x=1761197870;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fN+Dzv8npH4i3Hc2P1w/ibVl2LrlizQ+X2+yXkentZY=;
 b=R3FcEJ+Dt0fmge71rw/RbWxaSHMrGCJCu9ZAAqlEnjxc+3Enp1HpXNhwwWR5OOZJA+
 mRpTcfHtsQyoAoGZHNzqKGkB4CqpAyKjhCSnjDtpf6VnMwEW3I99PDLdOKdbG8h8juNv
 CsW9/TaQRqLL9sQCSHlHSmwdQn3tklWgWE6MDCfVrQPchPFFMMZ2jR7HVaMhOa4HOrnU
 rZJ/K4TpPKbavncWHX2vbX1B797WkqPZpPdeMJRlJTne5/PkzFfp64jc19/jXpdQxijy
 j0FQTxfCIZn/NJ8vVnlsse2sOLksdjw+QFEGouOpvUGdcCGZDI0sLjXSm8e8cLi4GoBd
 igHw==
X-Gm-Message-State: AOJu0YxKiSb88FEB2wdW6YPmJodhiAvc+B2PNcG2u1ephu+t+ByPNzEK
 9peKVPC9EhCvfyzTiQkLTSapGB0v7RHW5bgsFT55o+mF1JS9xgPscjAiIQ/zo22sJpoDwHbA1+c
 zikpaycJxZUnhVuB+WuNn+nheSsFO5jQgp3idbmgFimCd2feZiJHoYTI=
X-Gm-Gg: ASbGncszBGdZ+hIIkwLTx+OTHAvZkvC/WOIjTT4rlbOnlvPZVERgOGOqkArrs2Nmpnd
 7SAo4PezD4GTEsSJ1fmFSRSWEhJqfVrDpTUxsTnxOELKyz88T7Dc4siGoIIwz3RW7Sp3k/TnK5d
 xejwFW/GCLyKsP1MqAzqYBYlA6pda0ZeTf0EFHzHIm5oYjc9gMd1y/1aOnLB0NaQSVx7OKPQ4Wv
 vMdieG7GRlzN+wLHZLhvYu8jC5xjwUkc8p/TmbJCOs0vOLlthYet8jaIVyL4aBvw2HVyROZJVFB
 XspkPnasoChAuph+pSAFqfctits=
X-Google-Smtp-Source: AGHT+IF6UawlrnKkG0UForlPY6uzSVX5I5I4minHn8P/ON9njBM6kwmAKnWO+FRMwzIYbMXcrT4Q+Ig1zABke4lnmrA=
X-Received: by 2002:a2e:a582:0:b0:372:9bf0:aed6 with SMTP id
 38308e7fff4ca-37609e64b6bmr75904271fa.25.1760593070039; Wed, 15 Oct 2025
 22:37:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAFc1U0tQYsSWe1=EtduNZogzNTtJHGr4eX3pjnYro5zJeArniA@mail.gmail.com>
 <81b9aa9b-4904-4296-96a8-81de83f8575c@rnout.be>
In-Reply-To: <81b9aa9b-4904-4296-96a8-81de83f8575c@rnout.be>
Date: Thu, 16 Oct 2025 07:37:31 +0200
X-Gm-Features: AS18NWASc8NrSqP0VAKUDjGOdEINTcBCc0RXt62kVq9aUulL8ngx-ewo4kvIQvQ
Message-ID: <CAFc1U0tCdwSN1AMQsV41e1j=TqPhFQLZ40e4peUZ46O_MD-7xQ@mail.gmail.com>
To: Arnout Vandecappelle <arnout@rnout.be>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1760593070; x=1761197870; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fN+Dzv8npH4i3Hc2P1w/ibVl2LrlizQ+X2+yXkentZY=;
 b=aQ7SfDPnIDyTu5v8uZIxxnWv7TKc+DiiU7yHhpxdSjtUtbxOu9eeLncPeKovMTq4KE
 Ny0NgyBu98mpeg8wch5nk0W5NBobODaiV0sVo2fUkFNBtResTmFqtT2gW7DG8xWjETnD
 Wo0rzProafRZ0jmF63RiVKR6EemBa58maA17M=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=aQ7SfDPn
Subject: Re: [Buildroot] PocketBeagle2 support
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
From: Pierre FICHEUX via buildroot <buildroot@buildroot.org>
Reply-To: Pierre FICHEUX <pierre.ficheux@smile.fr>
Content-Type: multipart/mixed; boundary="===============0061000401050259478=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0061000401050259478==
Content-Type: multipart/alternative; boundary="00000000000088c3ed0641400485"

--00000000000088c3ed0641400485
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

The PB2 uses an AM6254 SoC, different from the AM335x.

Do you think it could work ?



Le mer. 15 oct. 2025 =C3=A0 21:50, Arnout Vandecappelle <arnout@rnout.be> a
=C3=A9crit :

>
>
> On 13/10/2025 08:07, Pierre FICHEUX via buildroot wrote:
> > Hi all,
> >
> > Are you considering any BR support for PB2 ? I saw the following link
> but it's old:
> >
> > https://github.com/mixaz/buildroot-pocketbeagle
>   I expect that the pocketbeagle can use the same config as the
> beaglebone_defconfig, just add ti/omap/am335x-pocketbeagle.dts to
> BR2_LINUX_KERNEL_INTREE_DTS_NAME.
>
>   If that works, we'd welcome a patch. Make sure you also update
> board/beagleboard/beaglebone/readme.txt
>
>   Regards,
>   Arnout
>


--=20

Pierre FICHEUX -/- CTO Smile ECS, France -\- pierre.ficheux@smile.fr
                             http://www.smile.fr
                             https://smile.eu/fr/offres/embarque-iot
I would love to change the world, but they won't give me the source code

--00000000000088c3ed0641400485
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,sa=
ns-serif">Hi,</div><div class=3D"gmail_default" style=3D"font-family:arial,=
sans-serif"><br></div><div class=3D"gmail_default" style=3D""><span style=
=3D"font-family:arial,sans-serif">The PB2 uses an AM6254=C2=A0SoC</span><fo=
nt color=3D"#474747" face=3D"Arial, sans-serif"><span style=3D"font-size:14=
px">, different=C2=A0from the AM335x.=C2=A0</span></font></div><div class=
=3D"gmail_default" style=3D""><font color=3D"#474747" face=3D"Arial, sans-s=
erif"><span style=3D"font-size:14px"><br></span></font></div><div class=3D"=
gmail_default" style=3D""><font color=3D"#474747" face=3D"Arial, sans-serif=
"><span style=3D"font-size:14px">Do you think it could work ?</span></font>=
</div><div class=3D"gmail_default" style=3D""><font color=3D"#474747" face=
=3D"Arial, sans-serif"><span style=3D"font-size:14px"><br></span></font></d=
iv><div class=3D"gmail_default" style=3D""><font color=3D"#474747" face=3D"=
Arial, sans-serif"><span style=3D"font-size:14px"><br></span></font></div><=
/div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" =
class=3D"gmail_attr">Le=C2=A0mer. 15 oct. 2025 =C3=A0=C2=A021:50, Arnout Va=
ndecappelle &lt;<a href=3D"mailto:arnout@rnout.be">arnout@rnout.be</a>&gt; =
a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><br>
<br>
On 13/10/2025 08:07, Pierre FICHEUX via buildroot wrote:<br>
&gt; Hi all,<br>
&gt; <br>
&gt; Are you considering any BR support for PB2 ? I saw the following link =
but it&#39;s old:<br>
&gt; <br>
&gt; <a href=3D"https://github.com/mixaz/buildroot-pocketbeagle" rel=3D"nor=
eferrer" target=3D"_blank">https://github.com/mixaz/buildroot-pocketbeagle<=
/a><br>
=C2=A0 I expect that the pocketbeagle can use the same config as the <br>
beaglebone_defconfig, just add ti/omap/am335x-pocketbeagle.dts to <br>
BR2_LINUX_KERNEL_INTREE_DTS_NAME.<br>
<br>
=C2=A0 If that works, we&#39;d welcome a patch. Make sure you also update <=
br>
board/beagleboard/beaglebone/readme.txt<br>
<br>
=C2=A0 Regards,<br>
=C2=A0 Arnout<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr"><pre style=3D"margin-top:0px;margin-bottom:0px;p=
adding:0px;font-size:12px;color:rgb(51,51,51);white-space:pre-wrap">Pierre =
FICHEUX -/- CTO Smile ECS, France -\- <a href=3D"mailto:pierre.ficheux@smil=
e.fr" style=3D"color:rgb(1,134,186)" target=3D"_blank">pierre.ficheux@smile=
.fr</a>
                             <a href=3D"http://www.smile.fr/" style=3D"colo=
r:rgb(1,134,186)" target=3D"_blank">http://www.smile.fr</a>
                             <a href=3D"https://smile.eu/fr/offres/embarque=
-iot" style=3D"color:rgb(1,134,186)" target=3D"_blank">https://smile.eu/fr/=
offres/embarque-iot</a>
I would love to change the world, but they won&#39;t give me the source cod=
e</pre></div></div>

--00000000000088c3ed0641400485--

--===============0061000401050259478==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0061000401050259478==--
