Return-Path: <SRS0=drHZ=PV=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 349E7C433EF
	for <buildroot@archiver.kernel.org>; Tue,  2 Nov 2021 05:46:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2686460EE9
	for <buildroot@archiver.kernel.org>; Tue,  2 Nov 2021 05:46:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2686460EE9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB5D1606E7;
	Tue,  2 Nov 2021 05:46:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y8eotdxYls4Z; Tue,  2 Nov 2021 05:46:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A921606F1;
	Tue,  2 Nov 2021 05:46:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 704101BF2A0
 for <buildroot@lists.busybox.net>; Tue,  2 Nov 2021 05:46:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D746401CA
 for <buildroot@lists.busybox.net>; Tue,  2 Nov 2021 05:46:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=paral.in
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kS9mtcUIBRi2 for <buildroot@lists.busybox.net>;
 Tue,  2 Nov 2021 05:46:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ua1-x934.google.com (mail-ua1-x934.google.com
 [IPv6:2607:f8b0:4864:20::934])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DEEB2400C7
 for <buildroot@buildroot.org>; Tue,  2 Nov 2021 05:46:07 +0000 (UTC)
Received: by mail-ua1-x934.google.com with SMTP id ay21so15414402uab.12
 for <buildroot@buildroot.org>; Mon, 01 Nov 2021 22:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=paral.in; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=JP9UFd28n8zmfHAIFh1ToLmDmMvtEHeCbgtv0gHy/NY=;
 b=YeKe61bKpYnNkSWS0Omnf/7T1drw9VEMOw9MruXC/jxs6C4gahWUCbOxzM0A5TZ0SL
 Rnb7znd80/n77F15g/eEUqarBePRzt6RQ8gopaVOBge1rX38J1prGeFSrOuhCW3vY1Bk
 GyumkJOa/8IDl3M0cLsaB5dEtfP6X4x4RuCUnGmsU5ajg4CvZVEfhHTfcqN2WhxdUUnq
 eSwI3a0oSmg3rGlo4+Q2hx2oiw0rFCp0iBqPHgXUoUnm0gdCu/xovMz43rWx6LoP5saU
 GxX0XC2rAsSC1cUhRbmdcnjxOQ36Po5kc0OaGeg1lYXwYESbIICsg0g/05WMW9HYWeA0
 vLsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=JP9UFd28n8zmfHAIFh1ToLmDmMvtEHeCbgtv0gHy/NY=;
 b=IWsqCnEWIUftXLwVswp+/wrCC/RhQPX7kIyreDkY6zwgK7yKthGK/vWrvehcSIHDXp
 SUaszOIwgsuuthOgZckmZS/h6X014woyI+FIrBGu8BkqEaWwaaSvfKbsHKpOnD0zSYLG
 ElJvHVUy7IxzDS4eInz16oTMKZy+AN/SQhMfakwTDBDCinIi2WKRPvyNAboLcVSqHd6i
 53LggNeFgSn099SBmSjX2bPzzKSU3Vloh1975qJLlj4AG9mtmHcEWiCiuSAjiuHgkehe
 NWsJdYucpMv0JbhqXXcLzDszhWXor/gSFfawdUj0cRIs7UyczMby9dJ51QCVPa063MZ+
 dWGA==
X-Gm-Message-State: AOAM530YvY5X9D3KZFPURasGH4tSP34Oze15M9eUQZccL1+OZoKYRXcl
 Q1y28YXW0y4CLI9Pqh+yMtMJpHkK4ka1Jw==
X-Google-Smtp-Source: ABdhPJzglcKbDTw4nkbJ26PxHXFHYgQlD+0seDIqXjX8ni0ATRU6xnLcfCT+D8w+ItnZBo42XL/uOA==
X-Received: by 2002:a67:2cc6:: with SMTP id s189mr10440650vss.3.1635831966474; 
 Mon, 01 Nov 2021 22:46:06 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com.
 [209.85.222.52])
 by smtp.gmail.com with ESMTPSA id z6sm1686503vsi.5.2021.11.01.22.46.05
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 22:46:05 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id b3so12199714uam.1
 for <buildroot@buildroot.org>; Mon, 01 Nov 2021 22:46:05 -0700 (PDT)
X-Received: by 2002:ab0:5b59:: with SMTP id v25mr33812547uae.57.1635831965223; 
 Mon, 01 Nov 2021 22:46:05 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 1 Nov 2021 22:45:54 -0700
X-Gmail-Original-Message-ID: <CA+h8R2rzoKOTwyJXQSWHDbFPr3w1Uxu6D=-qQrYvv0UsuA_obw@mail.gmail.com>
Message-ID: <CA+h8R2rzoKOTwyJXQSWHDbFPr3w1Uxu6D=-qQrYvv0UsuA_obw@mail.gmail.com>
To: Buildroot Mailing List <buildroot@buildroot.org>
Subject: [Buildroot] containerd: hash changed for download
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Content-Type: multipart/mixed; boundary="===============6473699840243419947=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6473699840243419947==
Content-Type: multipart/alternative; boundary="00000000000033102205cfc7cfe1"

--00000000000033102205cfc7cfe1
Content-Type: text/plain; charset="UTF-8"

Hi all,

It appears that for some reason the containerd v1.5.7 download from GitHub
is returning an incorrect hash:

containerd-1.5.7.tar.gz has wrong sha256 hash:
expected: 7d8f7014a74b063da9cdf7fe8673db8dc338747efdbb9b6a6a919d5137b1987e
got: 09be0cedea77568029aa0c7be9a323b89fa6886b402b5d223780a05b8c7cd45a

The file matching the correct hash currently in Buildroot today can be
fetched from the void linux archives:

https://sources.voidlinux-ppc.org/containerd-1.5.7/v1.5.7.tar.gz

It's probably best to add this file to the sources.buildroot.net archive
for backwards compat.

Best regards,
Christian Stewart

--00000000000033102205cfc7cfe1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi all,</div><div><br></div><div>It appears that for =
some reason the containerd v1.5.7 download from GitHub is returning an inco=
rrect hash:</div><div><br></div><div>containerd-1.5.7.tar.gz has wrong sha2=
56 hash:<br>expected: 7d8f7014a74b063da9cdf7fe8673db8dc338747efdbb9b6a6a919=
d5137b1987e<br>got: 09be0cedea77568029aa0c7be9a323b89fa6886b402b5d223780a05=
b8c7cd45a<br></div><div><br></div><div>The file matching the correct hash c=
urrently in Buildroot today can be fetched from the void linux archives:</d=
iv><div><br></div><div><a href=3D"https://sources.voidlinux-ppc.org/contain=
erd-1.5.7/v1.5.7.tar.gz">https://sources.voidlinux-ppc.org/containerd-1.5.7=
/v1.5.7.tar.gz</a></div><div><br></div><div>It&#39;s probably best to add t=
his file to the <a href=3D"http://sources.buildroot.net">sources.buildroot.=
net</a> archive for backwards compat.</div><div><br></div><div>Best regards=
,</div><div>Christian Stewart<br></div></div>

--00000000000033102205cfc7cfe1--

--===============6473699840243419947==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6473699840243419947==--
