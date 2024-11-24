Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6D08E668A0
	for <buildroot@archiver.kernel.org>; Sun, 24 Nov 2024 09:01:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49C0F608B2;
	Sun, 24 Nov 2024 09:01:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eX6j-P2GFW8R; Sun, 24 Nov 2024 09:01:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7281B6151A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7281B6151A;
	Sun, 24 Nov 2024 09:01:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 038A8E11
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 09:01:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E4F5741769
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 09:01:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hW1_GwBpBnmB for <buildroot@buildroot.org>;
 Sun, 24 Nov 2024 09:01:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7C36B40BDF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C36B40BDF
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7C36B40BDF
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 09:01:25 +0000 (UTC)
Received: from [10.30.201.153] (unknown [37.165.174.113])
 (Authenticated sender: vjardin@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id AEDCC60137;
 Sun, 24 Nov 2024 10:01:20 +0100 (CET)
From: Vincent Jardin <vjardin@free.fr>
To: Julien Olivain <ju.o@free.fr>, Peter Korsgaard <peter@korsgaard.com>
CC: <buildroot@buildroot.org>
Date: Sun, 24 Nov 2024 10:01:20 +0100
Message-ID: <1935d676f00.2856.ffe91ee9dc07baa0c1c4561a0e181c1b@free.fr>
In-Reply-To: <3a4e6ae025bfd288bb98c7b492ec499f@free.fr>
References: <20241123225155.3362363-1-peter@korsgaard.com>
 <3a4e6ae025bfd288bb98c7b492ec499f@free.fr>
User-Agent: AquaMail/1.53.0 (build: 105300523)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1732438883;
 bh=PUfBeb60P8GBLc8Plg76UN2oWLh/clw8OdX7iyLtg2I=;
 h=From:To:CC:Date:In-Reply-To:References:Subject:From;
 b=rQMDpnu3yVTDLUIqZBosSCIcI2Jbha4t+uNwEYYXuUQ/pGayrwf4yLf8L4jkSbsxV
 RuAM9BakqC6qF0hz162LtvOfwhHmq2IHYIqgO69BKrGc+H1yD2yN4JtTaDA9dKUCg6
 a5nW223CMEKI3FrgZWoyJ+uvuoCPQxkpYNuxHP6vtw2dXgSeMp1NBhpaX+maNiaLk/
 Z+JmHt1zPcDp6y4hWVRbHYCZ6dRy/v1jhgdv01t3VuoiMDbOAe1dd03f6ckIdCFt8k
 Fboh/SVknMl8cS60gx8y9DKNaheEELRmpCD17uQ11sH58iU4LKNO4K6Z2Fy2QcKvcK
 9o0I9ioIDIr4g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=rQMDpnu3
Subject: Re: [Buildroot] [PATCH] package/quagga: fetch from
 sources.buildroot.net
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
Content-Type: multipart/mixed; boundary="===============2693157420889573548=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.
--===============2693157420889573548==
Content-Type: multipart/alternative; boundary="1935d6772d1b6d28561e10d74"

This is a multi-part message in MIME format.
--1935d6772d1b6d28561e10d74
Content-Type: text/plain; format=flowed; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi Peter and Julien,

Le 24 novembre 2024 01:41:17 Julien Olivain <ju.o@free.fr> a écrit :

> Hi Peter,
>
> On 23/11/2024 23:51, Peter Korsgaard wrote:
>> Fixes
>> https://autobuild.buildroot.org/results/54a/54a165827f536be47cd45c98da3937a1e94a7c65/
>>
>> Upstream is no longer accessible, so use s.b.n instead.
>>
>> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
>> ---
>> package/quagga/quagga.mk | 3 ++-
>> 1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
>> index 5d8d52263a..dd921552f1 100644
>> --- a/package/quagga/quagga.mk
>> +++ b/package/quagga/quagga.mk
>> @@ -5,7 +5,8 @@
>>
>> ################################################################################
>>
>> QUAGGA_VERSION = 1.2.4
>> -QUAGGA_SITE = http://download.savannah.gnu.org/releases/quagga
>> +# upstream (http://download.savannah.gnu.org/releases/quagga) dead
>> +QUAGGA_SITE = http://sources.buildroot.net/quagga
>
> Should we use https instead? The default BR2_BACKUP_SITE value
> is using it:
> https://gitlab.com/buildroot.org/buildroot/-/blob/2024.11-rc2/Config.in#L265

Shouldn't we give up this package since FRR is a mature alternative ?

>
>
>> QUAGGA_INSTALL_STAGING = YES
>> QUAGGA_DEPENDENCIES = host-gawk host-pkgconf
>> QUAGGA_LICENSE = GPL-2.0+
>> --
>> 2.39.5
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
>
> Best regards,
>
> Julien.
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot


--1935d6772d1b6d28561e10d74
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.=
w3.org/TR/html4/loose.dtd">
<html>
<body>
<div dir=3D"auto">
<div dir=3D"auto">Hi Peter and Julien,</div><div dir=3D"auto"><br></div>
<div id=3D"aqm-original" style=3D"color: black;">
<div dir=3D"auto">Le 24 novembre 2024 01:41:17 Julien Olivain &lt;ju.o@free=
.fr&gt; a =C3=A9crit :</div>
<div><br></div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #808080; padding-left: 0.75ex;">
<div dir=3D"auto">Hi Peter,</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">On 23/11/2024 23:51, Peter Korsgaard wrote:</div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #0099CC; padding-left: 0.75ex;">
<div dir=3D"auto">Fixes&nbsp;</div>
<div dir=3D"auto">https://autobuild.buildroot.org/results/54a/54a165827f536=
be47cd45c98da3937a1e94a7c65/</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Upstream is no longer accessible, so use s.b.n instead.</=
div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Signed-off-by: Peter Korsgaard &lt;peter@korsgaard.com&gt=
;</div>
<div dir=3D"auto">---</div>
<div dir=3D"auto">package/quagga/quagga.mk | 3 ++-</div>
<div dir=3D"auto">1 file changed, 2 insertions(+), 1 deletion(-)</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">diff --git a/package/quagga/quagga.mk b/package/quagga/qu=
agga.mk</div>
<div dir=3D"auto">index 5d8d52263a..dd921552f1 100644</div>
<div dir=3D"auto">--- a/package/quagga/quagga.mk</div>
<div dir=3D"auto">+++ b/package/quagga/quagga.mk</div>
<div dir=3D"auto">@@ -5,7 +5,8 @@</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">#########################################################=
#######################</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">QUAGGA_VERSION =3D 1.2.4</div>
<div dir=3D"auto">-QUAGGA_SITE =3D http://download.savannah.gnu.org/release=
s/quagga</div>
<div dir=3D"auto">+# upstream (http://download.savannah.gnu.org/releases/qu=
agga) dead</div>
<div dir=3D"auto">+QUAGGA_SITE =3D http://sources.buildroot.net/quagga</div=
>
</blockquote>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Should we use https instead? The default BR2_BACKUP_SITE =
value</div>
<div dir=3D"auto">is using it:</div>
<div dir=3D"auto">https://gitlab.com/buildroot.org/buildroot/-/blob/2024.11=
-rc2/Config.in#L265</div></blockquote></div><div dir=3D"auto"><br></div><di=
v dir=3D"auto">Shouldn't we give up this package since FRR is a mature alte=
rnative ?</div><div dir=3D"auto"><br></div><div id=3D"aqm-original" style=
=3D"color: black;" dir=3D"auto"><blockquote type=3D"cite" class=3D"gmail_qu=
ote" style=3D"margin: 0 0 0 0.75ex; border-left: 1px solid #808080; padding=
-left: 0.75ex;"><div dir=3D"auto"></div>
<div dir=3D"auto"><br></div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #0099CC; padding-left: 0.75ex;">
<div dir=3D"auto">QUAGGA_INSTALL_STAGING =3D YES</div>
<div dir=3D"auto">QUAGGA_DEPENDENCIES =3D host-gawk host-pkgconf</div>
<div dir=3D"auto">QUAGGA_LICENSE =3D GPL-2.0+</div>
<div dir=3D"auto">--</div>
<div dir=3D"auto">2.39.5</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">_______________________________________________</div>
<div dir=3D"auto">buildroot mailing list</div>
<div dir=3D"auto">buildroot@buildroot.org</div>
<div dir=3D"auto">https://lists.buildroot.org/mailman/listinfo/buildroot</d=
iv>
</blockquote>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Best regards,</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Julien.</div>
<div dir=3D"auto">_______________________________________________</div>
<div dir=3D"auto">buildroot mailing list</div>
<div dir=3D"auto">buildroot@buildroot.org</div>
<div dir=3D"auto">https://lists.buildroot.org/mailman/listinfo/buildroot</d=
iv>
</blockquote>
</div><div dir=3D"auto"><br></div>
</div></body>
</html>

--1935d6772d1b6d28561e10d74--


--===============2693157420889573548==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2693157420889573548==--

