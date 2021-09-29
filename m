Return-Path: <SRS0=V5PJ=OT=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AA7EC433EF
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 19:37:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C70DE6142A
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 19:37:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C70DE6142A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 884D04251A;
	Wed, 29 Sep 2021 19:37:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id obGgCG9ksbp3; Wed, 29 Sep 2021 19:37:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE8F142517;
	Wed, 29 Sep 2021 19:37:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 594711BF388
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 19:37:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 55D346133C
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 19:37:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XSuYjN9-DYp7 for <buildroot@lists.busybox.net>;
 Wed, 29 Sep 2021 19:37:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4884D60E8B
 for <buildroot@buildroot.org>; Wed, 29 Sep 2021 19:37:48 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id l6so2258434plh.9
 for <buildroot@buildroot.org>; Wed, 29 Sep 2021 12:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bf2nCiNuQ973N9lBiOHiByzIwbI3Vr477sVkWKY+ytA=;
 b=amye1SCLCnNtfg+Uhn9zPrg9m7ayfi6xYfYkynjDssfuJC0YDVWd+e85tZrx3BM1Ol
 eXapNVGALNAjiONy28qqTrao+aCA8yrMqoUwY70GeBJx8PaWO9B5n20bi5H1KIqINy53
 dY5c2PIQrriUMwl9g+xQGgfgs87cAouku1vcTP6uGVmo62BAlQyE581f3McM9gqResRM
 focohPaBT1XSOJTL7TtpJI5CpaOngQ0LcBiWNczz1wclJziJeMEEiCGWRFlZ2HZK14bE
 uDMb/KpH3xquOGV2q4ehP7jQuskl7PwoZJtnpF9ekHOPpHxCEjxhBFIxtMpc4XI2POeU
 GUAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bf2nCiNuQ973N9lBiOHiByzIwbI3Vr477sVkWKY+ytA=;
 b=Ivm0QU67MxEk3mL/4G/rFvwS2CgKeWTUHCl7JQyAfeG6RsfWriq4uup/56ETgII7Xl
 G4hQRh98liHpqzl36DPmcSW1K1ilUj3BJ86NrV6YD5Kfb0p7fah6YcdxklvgRFQJuYk9
 BanPmnE+JcZ+aXZaaoqVIkrYwfNxxOR+qnAmVHMnqt2ojofPhR+scjjQV3f7blV3j9ew
 OrP8gAcuvou34r8DDAjS5JIeLmfV15iTchR942hneu575p2I9ei1Pv5RcMDJNenHu7NG
 x/9wdsEdzvkyaluvt2aMsNWX5NPqbtAOQPApZcf2vV/+HGX0NH/A1gx8+YvK7UkKSm2T
 dFNg==
X-Gm-Message-State: AOAM533uRz+8ZQMt2RzQFmmrCC2W6++++8t0dCKJzhiX6kAMVzqPM4OI
 0nKZ9qpdCguhvMceUOWz+VR67cYW5Gw=
X-Google-Smtp-Source: ABdhPJy1pb42zASFn+KHmlbUzPLs3XO6UA+Z+QEM+AFB7RpIVxESyvQerg7K+5VgwOoANVn1X4oC2A==
X-Received: by 2002:a17:902:650c:b0:13d:baac:1da5 with SMTP id
 b12-20020a170902650c00b0013dbaac1da5mr414252plk.20.1632944267534; 
 Wed, 29 Sep 2021 12:37:47 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id q12sm440211pgv.26.2021.09.29.12.37.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 12:37:45 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 29 Sep 2021 12:37:40 -0700
Message-Id: <20210929193742.1410522-1-aduskett@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH/RFC 0/2] package/nodejs: bump version to 14.17.6
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
Cc: Daniel Price <daniel.price@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Martin Bark <martin@barkynet.com>, Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


Sending this again as patchwork didn't pick up on the last email chain.

Here's another hefty package that needs to be updated in order to get closer to
the goal of removing Python2 from Buildroot.

A huge thanks to Yann for the help with the qemu wrapper patch!

Adam Duskett (2):
  package/python3: Add bzip2 option to host variant
  package/nodejs: bump version to 14.17.6

 .../0001-add-qemu-wrapper-support.patch       | 76 ++++++++++++++++++
 package/nodejs/Config.in                      | 15 +++-
 package/nodejs/nodejs.hash                    |  6 +-
 package/nodejs/nodejs.mk                      | 78 +++++++++++--------
 package/nodejs/v8-qemu-wrapper.in             | 12 +++
 package/python3/Config.in.host                |  6 ++
 package/python3/python3.mk                    |  6 ++
 7 files changed, 158 insertions(+), 41 deletions(-)
 create mode 100644 package/nodejs/0001-add-qemu-wrapper-support.patch
 create mode 100644 package/nodejs/v8-qemu-wrapper.in

-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
