Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D695EC369A2
	for <buildroot@archiver.kernel.org>; Tue,  8 Apr 2025 12:51:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56B3260D9D;
	Tue,  8 Apr 2025 12:51:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3sSum9iMIecL; Tue,  8 Apr 2025 12:51:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E02160810
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E02160810;
	Tue,  8 Apr 2025 12:51:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 80C4E1F1
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 12:51:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D72E81F91
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 12:51:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mJUdHglXf4dM for <buildroot@buildroot.org>;
 Tue,  8 Apr 2025 12:51:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=ptdropper@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7551781FE3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7551781FE3
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7551781FE3
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 12:51:41 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-aaf0f1adef8so884929366b.3
 for <buildroot@buildroot.org>; Tue, 08 Apr 2025 05:51:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744116699; x=1744721499;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4r3UtM1XKlFmFCH+8UIRoVcR9f7rePYbLL2AN8Da5J4=;
 b=CINnflykDythnSMkLpl/N17TDTewGxc8bKWpDzcArA48xJYUNQo7Ig3Y+eaPvJd0pX
 duNfpkzbwVxdfjYAxIjz6LEwHrmWslQVdXnK89n7DdPq6LcgsVBzz9gr1w8ePoFfvmHj
 XR6zwbNNtpLv9/4WVJfCz2T/JpOMwKhwb3R74pqjWKgtfzGG2o6K2abR2jogOQCs6EHG
 sPFMtJZTDFKESkfsCoRXViJLbF3RR2TWjTgGSkdkS6Cs4nfc2LQFaX4MtIP4YRhO++Yd
 DXXkF3ZZi2N2hiMoLroDeovDilWzpUYjXOnG8WgTh2xeb1mW2EJ0LaveZ0//vYyCmc4K
 8dkA==
X-Gm-Message-State: AOJu0YwGlOKMivZbpdtNBlGf66EXmA0Yw6rV8X3pD1auNi2pHXI4d70P
 N5t7yZA+obq+R7+Az+9bCGa3QaYT/KA3zV8h6bN7MKgLLUSHOdqCANFQPjONn4cPz44vwS7I6PH
 LZd9xyCVmLMLuLeQ85OSBQGJ6UsdE2tTzsYA=
X-Gm-Gg: ASbGncurHrqViwTxKcodPTwEZncQBbYkC7H+GN/sjBHXKKbn1Qy+rWjgnef15p/RO87
 /wyrgMgUsVQGzVP25AaJg/kmdhHg2Z3LLmQaTcfkAo8nENwCvDfqC5A7WUK/d77DVhfAEnIN3E4
 Kf71JxAPUR4Eh+k//d2jn4mtokxA==
X-Google-Smtp-Source: AGHT+IEKkERwxT0M0aKLJLqVl2a/l2nXwF6/PVq7OqAMMDqRKFJcxSETqxOa0gkOSSGln0OvcYnplK3oOlknJ+ORZOU=
X-Received: by 2002:a17:907:b1a:b0:ac8:16fb:7c8a with SMTP id
 a640c23a62f3a-ac816fb80a5mr290141166b.0.1744116698590; Tue, 08 Apr 2025
 05:51:38 -0700 (PDT)
MIME-Version: 1.0
From: Robert Smigielski <ptdropper@gmail.com>
Date: Tue, 8 Apr 2025 08:51:26 -0400
X-Gm-Features: ATxdqUGmmwVDR_7qq8MOTRQoEcbM5xUGG-RSVqhOiLfV6vM_HnmnEazzleqUB4c
Message-ID: <CABWt4esC76kvwq0FmZD8WrhhpywUnZPs=4HRjd9yKUwCght=KQ@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744116699; x=1744721499; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=4r3UtM1XKlFmFCH+8UIRoVcR9f7rePYbLL2AN8Da5J4=;
 b=KCMzc5VNzzOtSqydEPoD91vgtoWQFSc4WrB2zrxEOS18/fZTRhsN4AaC+jX4N0DPAr
 t9XbGPi0p7hu16+0zxlNgi3A/1I8n2szAQlV0qshtHhcC9x/Gis82Jt3wIe8bdeOR86D
 rR+uhk12XksSAlXSyqyFL34MJaoUmNG0MQJK/i3qNT3bBTFxhuFRljgnfHf5j5bic2zT
 XBtr3EdJMBIJ1zAN5chULWEi/cMzYI/U1ik8Yx0SGYOwsd3gTu1zYFdBkaHgqynxertj
 7DZ6HQB9kauBLLCHb4rXQkY2B1LB6cZrcpWvTRwZeFl05XuxhKeJOdfCGsh55p+xBL7g
 Cttg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=KCMzc5VN
Subject: Re: [Buildroot] Buildroot 2025.02 released
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
Content-Type: multipart/mixed; boundary="===============5104152550467597421=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5104152550467597421==
Content-Type: multipart/alternative; boundary="0000000000004436c2063243d003"

--0000000000004436c2063243d003
Content-Type: text/plain; charset="UTF-8"

Hi Buildroot team

I run a small open source project that also supports CycloneDX SBOM
generation for Buildroot. I am a contributing member of the
CylconeDX organization.

Glad to rejoin this group so I can offer support. The project I participate
with is
https://github.com/CycloneDX/cyclonedx-buildroot/ and would like to
coordinate with the Buildroot organization.

-- 
Robert Smigielski

--0000000000004436c2063243d003
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Buildroot team<br><br>I run a small open source project=
 that also supports CycloneDX SBOM<br>generation for Buildroot. I am a cont=
ributing member of the CylconeDX=C2=A0organization.<div><br><div>Glad to re=
join this group so I can offer support. The project I participate with is<b=
r><a href=3D"https://github.com/CycloneDX/cyclonedx-buildroot/">https://git=
hub.com/CycloneDX/cyclonedx-buildroot/</a> and would like to coordinate wit=
h the Buildroot organization.</div><div><br>-- <br>Robert Smigielski</div><=
/div></div>

--0000000000004436c2063243d003--

--===============5104152550467597421==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5104152550467597421==--
