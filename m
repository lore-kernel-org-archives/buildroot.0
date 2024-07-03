Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A60C30653
	for <buildroot@archiver.kernel.org>; Wed,  3 Jul 2024 05:35:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BE7D940231;
	Wed,  3 Jul 2024 05:35:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 72TSzfVDPdbu; Wed,  3 Jul 2024 05:35:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20ADE40190
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 20ADE40190;
	Wed,  3 Jul 2024 05:35:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D6C9B1BF349
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 05:35:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CEC4340190
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 05:35:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jK8MA6-ZMmF1 for <buildroot@lists.busybox.net>;
 Wed,  3 Jul 2024 05:35:48 +0000 (UTC)
X-Greylist: delayed 566 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 03 Jul 2024 05:35:48 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 335A140128
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 335A140128
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=23.83.212.17;
 helo=bird.elm.relay.mailchannels.net; envelope-from=al@inline.audio;
 receiver=<UNKNOWN> 
Received: from bird.elm.relay.mailchannels.net
 (bird.elm.relay.mailchannels.net [23.83.212.17])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 335A140128
 for <buildroot@buildroot.org>; Wed,  3 Jul 2024 05:35:47 +0000 (UTC)
X-Sender-Id: 101domain|x-authsender|al@inline.audio
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id CAEDC502364
 for <buildroot@buildroot.org>; Wed,  3 Jul 2024 05:26:20 +0000 (UTC)
Received: from pl106-bhs5.hostingpanel1.com (unknown [127.0.0.6])
 (Authenticated sender: 101domain)
 by relay.mailchannels.net (Postfix) with ESMTPA id 0C51D50238D
 for <buildroot@buildroot.org>; Wed,  3 Jul 2024 05:26:19 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1719984380; a=rsa-sha256;
 cv=none;
 b=kc1JSiUjbXdzjV+gmYvQwdDHYGvh/lKau86LsfBvpBOyIpNMP39R+v3lUSaOS9K4wHfISu
 4apeab7NDdMvvGUTnh0p6hID1ys2wn08JDC7O/I9vRfWvswqZmUA31zS0jsBlkLjOk4pKP
 HBA8Jc0hBNBDf3A530NP1Fmoxxa13OeDn8dxF0ohGE0FF8QDZ+MZTrFfzeUCeAHvKhqz/6
 hRoIwFRwy61Dc0xFJ6q7mS4npOR4GlEHMkIdrc4uemX4+YmNI4jcftoQeUxVjeTq14s0AZ
 aPvCLey51e8SiV4rLpZx/6y1N2tq+4qly+dPALD/s6Hf/1F1iR8RAtRc8DzblQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net; s=arc-2022; t=1719984380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=6UvNaxCed9dIARItQsqVErREPKHeebrECdQ2Wv15cK0=;
 b=bfsl9aeT19c6P91Eqz9nuWUDTU5eXdTxaI8Dv9v7dVisxOXtz7R7GfrCE1cBA1hTXpyTF8
 /9ge9EnuZY40XLnBZRKUNglzt9viKcry43H706UVmKu3bjlDKUSwK+2khEagbERoHpp+ux
 oho+Xlw9j2J3Kj6afx2yL57mn78Iw7rJjXYs7GHxP7TwjysbTjDzOmSgJvjGVwzk+2NzR2
 2xgMs4LlE13HOBgCSDZdyQZAy94r9xDvVqC+/WyBMf3OkHBBt6Hu0i+K671eq4hmvCuBpK
 Zb9rcVxiA1DU3ciRQBpZS6JqnWQjUJX4BnpujT59kkQzuhBmGHVXTGixXVKupA==
ARC-Authentication-Results: i=1; rspamd-79677bdb95-s6zmk;
 auth=pass smtp.auth=101domain smtp.mailfrom=al@inline.audio
X-Sender-Id: 101domain|x-authsender|al@inline.audio
X-MC-Relay: Neutral
X-MailChannels-SenderId: 101domain|x-authsender|al@inline.audio
X-MailChannels-Auth-Id: 101domain
X-Arithmetic-Left: 1c24eb5f39399a9a_1719984380557_2258560789
X-MC-Loop-Signature: 1719984380557:3318890200
X-MC-Ingress-Time: 1719984380557
Received: from pl106-bhs5.hostingpanel1.com (pl106-bhs5.hostingpanel1.com
 [144.217.70.157]) (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
 by 100.112.86.14 (trex/6.10.3); Wed, 03 Jul 2024 05:26:20 +0000
Received: from [192.168.33.150] (unknown [203.166.221.196])
 (Authenticated sender: al@inline.audio)
 by pl106-bhs5.hostingpanel1.com (Postfix) with ESMTPSA id 0AB55F40C0F
 for <buildroot@buildroot.org>; Wed,  3 Jul 2024 05:26:17 +0000 (UTC)
Received-SPF: pass (pl106-bhs5.hostingpanel1.com: connection is authenticated)
User-Agent: Microsoft-MacOutlook/16.86.24060916
Date: Wed, 03 Jul 2024 13:26:21 +0800
From: Al Walker <al@inline.audio>
To: <buildroot@buildroot.org>
Message-ID: <92110F02-FA7C-4C28-BADE-CF912167AA1B@contoso.com>
Thread-Topic: Buildroot Newbie
Mime-version: 1.0
Content-type: multipart/mixed;
	boundary="B_3802857993_729635507"
X-PPP-Message-ID: <171998437911.4131963.3472069428350207750@pl106-bhs5.hostingpanel1.com>
X-PPP-Vhost: inline.audio
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=inline.audio
X-Mailman-Original-Authentication-Results: pl106-bhs5.hostingpanel1.com;
 spf=pass (sender IP is 203.166.221.196) smtp.mailfrom=al@inline.audio
 smtp.helo=[192.168.33.150]
Subject: [Buildroot] Buildroot Newbie
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
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

> This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

--B_3802857993_729635507
Content-type: multipart/related;
	boundary="B_3802857993_4166780347"

--B_3802857993_4166780347
Content-type: multipart/alternative;
	boundary="B_3802857993_497562480"


--B_3802857993_497562480
Content-type: text/plain;
	charset="UTF-8"
Content-transfer-encoding: quoted-printable

Hello,

=20

I=E2=80=99m new to Buildroot and this community and keen to contribute where I ca=
n, although obviously I have a bit of a learning curve first.

=20

Is this the best place to post technical questions, especially for my initi=
al steps, please? Any help and guidance is very much appreciated.

=20

In the first instance I=E2=80=99ve set myself the challenge of creating a Buildro=
ot build for the STM32MP157D-DK1 board. There isn=E2=80=99t a pre-existing specifi=
c defconfig file for this variant, so it seems like a good starting point.

=20

So far I=E2=80=99ve successfully built the project using the default pin assignme=
nts in STM32CubeIDE and created the .dts/.dtsi files for the Cortex-A7 cores=
, but dtc didn=E2=80=99t work for compiling the .dtb files.

=20

Kind Regards,

Al
=20
Al Walker
Founder & CEO
Inline Audio (HK) Limited
al@inline.audio

m. +86 130 6811 5264
m. +44 7810 540120






CONFIDENTIALITY NOTICE: This message (including any attachments) contains i=
nformation that may be confidential. Unless you are the intended recipient (=
or authorised to receive for the intended recipient), you may not read, prin=
t, retain, use, copy, distribute or disclose to anyone the message or any in=
formation contained in the message. If you have received the message in erro=
r, please advise the sender by reply e-mail, and destroy all copies of the o=
riginal message (including any attachments).

=20


--B_3802857993_497562480
Content-type: text/html;
	charset="UTF-8"
Content-transfer-encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-microsof=
t-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" xmlns:m=
=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http://www.w3.org=
/TR/REC-html40"><head><meta http-equiv=3DContent-Type content=3D"text/html; char=
set=3Dutf-8"><meta name=3DGenerator content=3D"Microsoft Word 15 (filtered medium)=
"><!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Aptos;
	panose-1:2 11 0 4 2 2 2 2 2 4;}
@font-face
	{font-family:"Times New Roman \(Body CS\)";
	panose-1:2 11 6 4 2 2 2 2 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Aptos",sans-serif;
	mso-ligatures:standardcontextual;
	mso-fareast-language:EN-US;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:11.0pt;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style></head><body lang=3DEN-GB link=3D"#467886" vlink=3D"#96607D" style=3D'wo=
rd-wrap:break-word'><div class=3DWordSection1><p class=3DMsoNormal><span lang=3DEN=
-US style=3D'font-family:"Calibri",sans-serif'>Hello,<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US style=3D'font-family:"Calibri",sans-serif'><o=
:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US style=3D'font-fa=
mily:"Calibri",sans-serif'>I=E2=80=99m new to Buildroot and this community and kee=
n to contribute where I can, although obviously I have a bit of a learning c=
urve first.<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US style=3D'=
font-family:"Calibri",sans-serif'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNo=
rmal><span lang=3DEN-US style=3D'font-family:"Calibri",sans-serif'>Is this the b=
est place to post technical questions, especially for my initial steps, plea=
se? Any help and guidance is very much appreciated.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US style=3D'font-family:"Calibri",sans-serif'><o=
:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US style=3D'font-fa=
mily:"Calibri",sans-serif'>In the first instance I=E2=80=99ve set myself the chall=
enge of creating a Buildroot build for the STM32MP157D-DK1 board. There isn=E2=
=80=99t a pre-existing specific defconfig file for this variant, so it seems lik=
e a good starting point.<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3D=
EN-US style=3D'font-family:"Calibri",sans-serif'><o:p>&nbsp;</o:p></span></p><=
p class=3DMsoNormal><span lang=3DEN-US style=3D'font-family:"Calibri",sans-serif'>=
So far I=E2=80=99ve successfully built the project using the default pin assignmen=
ts in STM32CubeIDE and created the .dts/.dtsi files for the Cortex-A7 cores,=
 but dtc didn=E2=80=99t work for compiling the .dtb files.<o:p></o:p></span></p><p=
 class=3DMsoNormal><span style=3D'font-family:"Calibri",sans-serif'><o:p>&nbsp;<=
/o:p></span></p><div><div><p class=3DMsoNormal><span style=3D'font-family:"Calib=
ri",sans-serif;color:black;mso-ligatures:none;mso-fareast-language:EN-GB'>Ki=
nd Regards,<br><br>Al<br>&nbsp;<br>Al Walker<br>Founder &amp; CEO<br>Inline =
Audio (HK) Limited<br><a href=3D"mailto:al@inline.audio" title=3D"mailto:al@inli=
ne.audio"><span style=3D'color:#0563C1'>al@inline.audio</span></a><o:p></o:p><=
/span></p><p class=3DMsoNormal><span style=3D'font-family:"Calibri",sans-serif;c=
olor:black;mso-ligatures:none;mso-fareast-language:EN-GB'>m. +86 130 6811 52=
64<br>m. +44 7810 540120<o:p></o:p></span></p><p class=3DMsoNormal><span style=
=3D'font-family:"Calibri",sans-serif;color:black;mso-ligatures:none;mso-fareas=
t-language:EN-GB'><br><br><img border=3D0 width=3D227 height=3D56 style=3D'width:2.3=
645in;height:.5833in' id=3D"Picture_x0020_1" src=3D"cid:image001.png@01DACD4C.98=
6D9D20" alt=3D"Icon&#10;&#10;Description automatically generated"><br><br><br>=
CONFIDENTIALITY&nbsp;NOTICE: This message&nbsp;(including any&nbsp;attachmen=
ts) contains&nbsp;information that may be&nbsp;confidential. Unless you&nbsp=
;are the intended recipient&nbsp;(or&nbsp;authorised to receive&nbsp;for the=
 intended&nbsp;recipient), you may not&nbsp;read, print,&nbsp;retain, use,&n=
bsp;copy, distribute or&nbsp;disclose to anyone the&nbsp;message or any&nbsp=
;information contained in&nbsp;the message. If you have&nbsp;received the me=
ssage in&nbsp;error, please advise the&nbsp;sender by reply e-mail,&nbsp;and=
 destroy all copies of&nbsp;the&nbsp;original message&nbsp;(including any&nb=
sp;attachments).</span><span style=3D'font-family:"Calibri",sans-serif'><o:p><=
/o:p></span></p></div></div><p class=3DMsoNormal><span lang=3DEN-US style=3D'font-=
family:"Calibri",sans-serif'><o:p>&nbsp;</o:p></span></p></div></body></html=
>

--B_3802857993_497562480--


--B_3802857993_4166780347
Content-type: image/png; name="image001.png";
 x-mac-creator="4F50494D";
 x-mac-type="504E4766"
Content-ID: <image001.png@01DACD4C.986D9D20>
Content-disposition: inline;
	filename="image001.png"
Content-transfer-encoding: base64


iVBORw0KGgoAAAANSUhEUgAAAsUAAACyCAYAAACqc7JIAAAAAXNSR0IArs4c6QAAAAlwSFlz
AAAuIwAALiMBeKU/dgAAAVlpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADx4OnhtcG1ldGEg
eG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IlhNUCBDb3JlIDUuNC4wIj4KICAg
PHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1z
eW50YXgtbnMjIj4KICAgICAgPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIKICAgICAg
ICAgICAgeG1sbnM6dGlmZj0iaHR0cDovL25zLmFkb2JlLmNvbS90aWZmLzEuMC8iPgogICAg
ICAgICA8dGlmZjpPcmllbnRhdGlvbj4xPC90aWZmOk9yaWVudGF0aW9uPgogICAgICA8L3Jk
ZjpEZXNjcmlwdGlvbj4KICAgPC9yZGY6UkRGPgo8L3g6eG1wbWV0YT4KTMInWQAAKPhJREFU
eAHtnUt628bShhug4ngm7cDKAizzrEDMwHJmZlZgnRVYjpyx5PGxImUFkVdw5JljD0KtILSy
gDAr+OVZjmMCfxUI0JDMK9CN64vnkUjiUl39Ni4f+lLt7e2chGb5cvn26rC3fLdm7SFsBpKj
3bm58sz70PP33w2fDefuw4bMBDg3jVl6Dk7otvL6zHxitezA77r/6QWB/9uybPt+8O2b4Y+D
Zfs1bfsK95nXH31/fzB8dt20vJedn1XPTfHzhWiQ47L9dZX+Cuegq6Sxe5PAC//mb36tRSA0
D7wg+P3Rzk9nve7p1lrHsjMEIAABCNSBwOM7QTB6tHNyUAdn8RECEMhOAFGcnd30yNCET/Wm
uXf/ZX+6ki8QgAAEINAUApvSpHqqLTcPu6fdpmSKfEAAAjcJIIpv8sjza9N43n/1pvld93Q7
jyGOhQAEIACBShLYpXWwkuWCUxCwQgBRbAXjDSO7QRD8KeL4+MZafkAAAhCAQCMIaOvgV0Ew
pHWwEcVJJiAwJYAonqKw/uXo4c7JSAcSWLeMQQhAAAIQKJWAZ8w9WgdLLQISh4B1Aohi60g/
G9Sbpo763tt5ec5AvM9c+AYBCECgQQS0dXBI62CDSpSstJYAoriQoveeMHq5ENAkAgEIQKAM
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
HcwAjUMKI4AoLgw1Ca1KgIDwq5JiPwhAAAL1JEDrYD3Lreleb0Qzji3J5dhsaPzB1i1SY3nQ
MZ+2FmW8rWwWMbG1TQPCS2zji7vmU3eezabzX+UcnMeG9asRaPo59LfZGN71P327jIbut2yf
Jm5f5RlozMaoiXkvO0+fYxufnhnzaXu+P83mv9o5OJ8OWyAAAQhAAAIQgAAEIAABCEAAAhCA
AAQgAAEIQAACEIAABCAAAQhAAAIQgAAEIAABCEAAAhCAAAQgAAEIQAACEIAABCAAAQhAAAIQ
gAAEIAABCEAAAhCAAAQgAAEIQAACEIAABCAAAQhAAAIQgAAEIAABCEAAAhCAAAQgAAEIQAAC
EIAABCAAAQhAAAIQgAAEIAABCEAAAhCAAAQgAAEIQAACEIAABCAAAQhAAAIQgAAEIAABCEAA
AhCAAAQgAAEIQAACEIAABCAAAQhAAAIQgAAEIAABCEAAAhCAAAQgAAEIQAACEIAABCAAAQhA
AAIQgAAEIAABCEAAAhCAAAQgAAEIQAACEIAABCAAAQhAAAIQgAAEIAABCEAAAhCAAAQgAAEI
QAACEIAABCAAAQhAAAIQgAAEIAABCEAAAhCAAAQgAAEIQAACEIAABCAAAQhAAAIQgAAEIAAB
CEAAAhCAAAQgAAEIQAACEIAABCAAAQhAAAIQgAAEIAABCEAAAhCAAAQgAAEIQAACEIAABCAA
AQhAAAIQgAAEIAABCEAAAhCAAAQgAAEIQAACEIAABCAAAQhAAAIQgAAEIAABCEAAAhCAAAQg
AAEIQAACEIAABCAAAQhAAAIQgAAEIAABCEAAAhCAAAQgAAEIQAACEIAABCAAAQhAAAIQgAAE
IAABCEAAAhCAAAQgAAEIQAACEIAABCAAAQhAAAIQgAAEIAABCEAAAhCAAAQgAAEIQAACEIAA
BCAAAQhAAAIQgAAEIAABCEAAAhCAAAQgAAEIQAACEIAABCAAAQhAAAIQgAAEIAABCEAAAhCA
AAQgAAEIQAACEIAABCAAAQhAAAIQgAAEIAABCEAAAhCAAAQgsISAt2Q7myEAAQhAAAIQgAAE
akjgu+7ptjGf5G+yBGNvy3heN/md5dP3g0H6uL/NxnAwfHadXlfX760Rxd91/9Nbt5CaVNDr
5r1O+z/snnY75tNWXp/HZuP63fDZMK+dthwP98UlneWes9hivba+Gf44qJfH7fO21z3dums+
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
--B_3802857993_4166780347--


--B_3802857993_729635507
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--B_3802857993_729635507--


