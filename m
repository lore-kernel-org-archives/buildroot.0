Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93F00C32771
	for <buildroot@archiver.kernel.org>; Thu, 29 Sep 2022 01:28:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0543418B3;
	Thu, 29 Sep 2022 01:28:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0543418B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MIfarVs95p2F; Thu, 29 Sep 2022 01:28:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 193D441886;
	Thu, 29 Sep 2022 01:28:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 193D441886
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CE7F41BF28C
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 01:28:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B1B7C40D35
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 01:28:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1B7C40D35
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lmhb9OV0V5KX for <buildroot@lists.busybox.net>;
 Thu, 29 Sep 2022 01:28:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BCD6E4023B
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BCD6E4023B
 for <buildroot@buildroot.org>; Thu, 29 Sep 2022 01:28:46 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id o64so127022oib.12
 for <buildroot@buildroot.org>; Wed, 28 Sep 2022 18:28:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-language:thread-index:mime-version:message-id:date:subject
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=wEnkJ9yj3av4N5vq4mkwsA91I5usNR7mGQPEtfVEVP4=;
 b=R/2ka3pXFe/IlC+XGaZUS4Xt2IhUak0AGAFeK6jmSsYbyYDAecBxy+jax1+x3iyE6l
 dLoeAllDSeC2+T1a08r4yyUIkrVqAwdOHk3OtfbPDZ/ngVOlhYE3Msg2BFWJghgL+eoA
 iyL/UOm+esINcm6M2p7ZQOfnxIUYtm6O9HLeaXbDlSja6/kGTbM0wyFJf9y97+lCDZbr
 qDKUOgfX6+fSqmwP8UInMxnyg0BnVAjUolF4TvQswKTDx+cJZVClgPapWiCvgwt6+q+o
 2JPIggu2H5bqyT2ftUAVOBoL4ZFUIFjXAIJkiutdSWaUCcbaeSo7RxbeUaN+RD0bPdZX
 PlIw==
X-Gm-Message-State: ACrzQf19AUN0+dxtIE+hkS30VqeE9unA2IrB0BrZSY/tj/IKCUhyganI
 vcjmvoaHRMK6l47d+6NblFnwePAVaZUFtw==
X-Google-Smtp-Source: AMsMyM6sdj/F1/IzojH9+MLWkmF7cZy0ao+c/XbKkuVEgpodhNC1EvRtoSZzkKuScdAAZdO/Xcxrpw==
X-Received: by 2002:a54:4182:0:b0:34f:f1b4:5421 with SMTP id
 2-20020a544182000000b0034ff1b45421mr5572432oiy.146.1664414925107; 
 Wed, 28 Sep 2022 18:28:45 -0700 (PDT)
Received: from DESKTOP6P277K1 (072-190-192-161.res.spectrum.com.
 [72.190.192.161]) by smtp.gmail.com with ESMTPSA id
 u4-20020a4aae84000000b0044b24273f55sm2602685oon.6.2022.09.28.18.28.42
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Sep 2022 18:28:44 -0700 (PDT)
From: <jautry@tekvox.com>
To: <buildroot@buildroot.org>
Date: Wed, 28 Sep 2022 20:28:43 -0500
Message-ID: <022201d8d3a2$d0b8e310$722aa930$@tekvox.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdjTonSYn6kH98FbRGKCaBCPkSIHyw==
Content-Language: en-us
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tekvox.com; s=google;
 h=content-language:thread-index:mime-version:message-id:date:subject
 :to:from:from:to:cc:subject:date;
 bh=wEnkJ9yj3av4N5vq4mkwsA91I5usNR7mGQPEtfVEVP4=;
 b=JyCVrQyo/ri8TuMA37CPflEr75e/8z2SuDlz4lzOd75VFA7ANtAzAD752Ym+385nNr
 wweOdmkNNlx6ApoI6W5fGbhp1EKKvSt551+LrK2ilkSc9AdBPW8BR/aVYDSEEV4EtXTq
 1/Gws0xuFNqPK3h+sCgqtAKcnAl2acGdkYfSM=
Subject: [Buildroot] i.MXRT10xx support
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
Content-Type: multipart/mixed; boundary="===============1025944299387408797=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multipart message in MIME format.

--===============1025944299387408797==
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0223_01D8D378.E7E32930"
Content-Language: en-us

This is a multipart message in MIME format.

------=_NextPart_000_0223_01D8D378.E7E32930
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

I noted on a site utilizing buildroot that there was i.MXRT10xx support.  In
downloading buildroot, I did not notice the MXRT1060 EVK board included in
any of the defconfigs.  I was just curious if this does exist?

 

thx


------=_NextPart_000_0223_01D8D378.E7E32930
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><META =
HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii"><meta name=3DGenerator content=3D"Microsoft Word 15 =
(filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-US =
link=3D"#0563C1" vlink=3D"#954F72" style=3D'word-wrap:break-word'><div =
class=3DWordSection1><p class=3DMsoNormal>I noted on a site utilizing =
buildroot that there was i.MXRT10xx support.&nbsp; In downloading =
buildroot, I did not notice the MXRT1060 EVK board included in any of =
the defconfigs.&nbsp; I was just curious if this does =
exist?<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>thx<o:p></o:p></p></div></body></html>
------=_NextPart_000_0223_01D8D378.E7E32930--


--===============1025944299387408797==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1025944299387408797==--

