Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 549CBD49790
	for <buildroot@archiver.kernel.org>; Mon,  2 Dec 2024 00:29:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D31CD84A22;
	Mon,  2 Dec 2024 00:29:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pFwBF5xzoxOd; Mon,  2 Dec 2024 00:29:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5F1284A1E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5F1284A1E;
	Mon,  2 Dec 2024 00:29:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 81B4160
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 00:29:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 59937405E8
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 00:29:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0jl4QkL2cyIu for <buildroot@buildroot.org>;
 Mon,  2 Dec 2024 00:29:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B387C4054C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B387C4054C
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B387C4054C
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 00:29:46 +0000 (UTC)
Received: from [10.157.211.162] (unknown [37.171.234.98])
 (Authenticated sender: vjardin@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id C404C13F88F;
 Mon,  2 Dec 2024 01:29:41 +0100 (CET)
From: Vincent Jardin <vjardin@free.fr>
To: Julien Olivain <ju.o@free.fr>
CC: <buildroot@buildroot.org>
Date: Mon, 02 Dec 2024 01:29:41 +0100
Message-ID: <19384c55080.2856.ffe91ee9dc07baa0c1c4561a0e181c1b@free.fr>
In-Reply-To: <ccdc7b70ca33f0839caa1809e22c95d7@free.fr>
References: <20241201162741.61891-1-vjardin@free.fr>
 <ccdc7b70ca33f0839caa1809e22c95d7@free.fr>
User-Agent: AquaMail/1.53.0 (build: 105300523)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1733099383;
 bh=C8haPGWY0gBH4zu9scycwZmCN6RPkWFkFYGxuNfBFoo=;
 h=From:To:CC:Date:In-Reply-To:References:Subject:From;
 b=OltfSJ+dAtTubSgDJEtrdpR5mq3Fal4Z+u2e3iLpWFh4aIOLRxcpBJwT2Ti3xtZaF
 wkNpOI9OWc2M518PV+CbpJO7e/jgLuIrR2UWT/cj76UDd7Hg/ftpcoOfw1MNdmFLdp
 BNizu+LajvFJO/tqgfPuDwC3OqjCXHXByyUa/p+h+AlUJpyyulZkWKY5i5skeyilmq
 lCq0dhcg1Q/V5wTaQ81vxE2lx9TaWiIZ5xvsZq32T3pqfEjHt4Teq4k0hIlr+Sa33v
 tWD7zOiW/qCE2fP7qV+C2MD4eAtPnNr3tXAmyjIq7xQrxU5QIs7Qcc/9wYcEgN+3uJ
 O6NWXwxR9SeIA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=OltfSJ+d
Subject: Re: [Buildroot] [PATCH 1/1] package/libpam-radius-auth: bump to
 version 3.0.0
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
Content-Type: multipart/mixed; boundary="===============1143767647779397960=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.
--===============1143767647779397960==
Content-Type: multipart/alternative; boundary="19384c5e2c315a22856a7ab49d"

This is a multi-part message in MIME format.
--19384c5e2c315a22856a7ab49d
Content-Type: text/plain; format=flowed; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi Julien,


Le 1 décembre 2024 22:05:29 Julien Olivain <ju.o@free.fr> a écrit :

> Hi Vincent,
>
> On 01/12/2024 17:27, Vincent Jardin wrote:
>> See:
>> https://github.com/FreeRADIUS/pam_radius/blob/release_3_0_0/Changelog
>>
>> Signed-off-by: Vincent Jardin <vjardin@free.fr>
>
> I applied to branch next. I reworked the patch a bit, to switch
> to github release files, to allow PGP signature checking.
> See:
> https://gitlab.com/buildroot.org/buildroot/-/commit/bd94801092f6cdce71f78423abb602b0b72f6bec

Thanks. I do not understand this URL: 
https://github.com/FreeRADIUS/pam_radius/releases/download/

I'll investigate.

Best regards,
  Vincent


>
> Best regards,
>
> Julien.


--19384c5e2c315a22856a7ab49d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.=
w3.org/TR/html4/loose.dtd">
<html>
<body>
<div dir=3D"auto">
<div dir=3D"auto">Hi Julien,</div><div dir=3D"auto"><br></div><div dir=3D"a=
uto"><br></div>
<div id=3D"aqm-original" style=3D"color: black;">
<div dir=3D"auto">Le 1 d=C3=A9cembre 2024 22:05:29 Julien Olivain &lt;ju.o@=
free.fr&gt; a =C3=A9crit :</div>
<div><br></div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #808080; padding-left: 0.75ex;">
<div dir=3D"auto">Hi Vincent,</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">On 01/12/2024 17:27, Vincent Jardin wrote:</div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #0099CC; padding-left: 0.75ex;">
<div dir=3D"auto">See:</div>
<div dir=3D"auto">https://github.com/FreeRADIUS/pam_radius/blob/release_3_0=
_0/Changelog</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Signed-off-by: Vincent Jardin &lt;vjardin@free.fr&gt;</di=
v>
</blockquote>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">I applied to branch next. I reworked the patch a bit, to =
switch</div>
<div dir=3D"auto">to github release files, to allow PGP signature checking.=
</div>
<div dir=3D"auto">See:</div>
<div dir=3D"auto">https://gitlab.com/buildroot.org/buildroot/-/commit/bd948=
01092f6cdce71f78423abb602b0b72f6bec</div></blockquote></div><div dir=3D"aut=
o"><br></div><div dir=3D"auto">Thanks. I do not understand this URL: <a hre=
f=3D"https://github.com/FreeRADIUS/pam_radius/releases/download/">https://g=
ithub.com/FreeRADIUS/pam_radius/releases/download/</a></div><div dir=3D"aut=
o"><br></div><div dir=3D"auto">I'll investigate.</div><div dir=3D"auto"><br=
></div><div dir=3D"auto">Best regards,</div><div dir=3D"auto">&nbsp; Vincen=
t&nbsp;</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div i=
d=3D"aqm-original" style=3D"color: black;" dir=3D"auto"><blockquote type=3D=
"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75ex; border-left: 1p=
x solid #808080; padding-left: 0.75ex;"><div dir=3D"auto"></div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Best regards,</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Julien.</div>
</blockquote>
</div><div dir=3D"auto"><br></div>
</div></body>
</html>

--19384c5e2c315a22856a7ab49d--


--===============1143767647779397960==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1143767647779397960==--

