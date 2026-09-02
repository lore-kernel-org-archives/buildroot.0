Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FBDEC624D4
	for <buildroot@archiver.kernel.org>; Wed,  2 Sep 2026 19:57:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EC7180F85;
	Wed,  2 Sep 2026 19:57:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Se00TfBKuVVT; Wed,  2 Sep 2026 19:57:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 353C480F4F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788379043;
	b=UDseEMmK3S3yb9B2SI+UEp96d9KQUUqdAonwpXE3Efz4EXDQx0FPGQytZ4w9rpLz63WC
	 W4kGg6Hr9vk/Pk0Zl9mrhqVwf2ewWwMC8YkTGzF13T/GrOyzr4xDAtxtmkccJ1a8RzLbD
	 minojKHKUVNUkBhV1kmav4iDOWnm8TywEsR6PGIbKZxRXAR8NKqntidmzde0dmcbZZIZ5
	 mSFkXqECgUXHs36LpAORFt3TBFmYvFP18HX0hrghJRpaOpV5rnaoOSQFzOsU7y7fOYmXL
	 qE9us/Ake1ir8QBTl4NOVXpDVulyVOHSoPGsmpRYLrizGkNX3SzzuBgApYrCKN9VfRA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788379043;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=7iogFnzq7BK2Ss8mu1IeEcedkP3zYsy7p++52e7qTGU=;
	b=tLY055PDDTw0xXAoriB7TRHZcoDhZNM+ESMApdauD2TTgq2otwGGi60DVZJxF08rataX
	 rK127GJ1+eWiuksseeA4hEWaXaJdP++egBADY08qW6593FEOWv6qCxpa1GwRBrebCN5E7
	 LIQ7SY8KPAHBPTCSEr+yT4FhA/a0mJZ7oS+O23AfSbAhF9wEODwr7JA0kZ+mRikiUyO6u
	 +9d43Qr4nlWVm7qDxhr3lcph+GRf6ZiHt2I9QNc8AbJ8m1r/BfYtNQVN6lemyhe/VTPgJ
	 cng97pzVie0UiAGHIoAHLWnc14ZYVnmoZmltnnquBlcwHfgGvFBXbjB4xjOS1dSil7A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=none header.from=j-ernberg.se;
	dkim=pass header.d=j-ernberg-se.20251104.gappssmtp.com header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=TKzoPHyQ;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788379043;
	bh=7iogFnzq7BK2Ss8mu1IeEcedkP3zYsy7p++52e7qTGU=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oQZsiK1AQbcM/2FVMhLG8C7uX2aip/mw5Wh7Kf+Ck0ArFibJlLJ2hPNf4E24UbnIi
	 f3VVw2dkL5gL55AmBn0jab4+fIAQbHlH9GE6HyyFKqY4AH26XYBL2qCmIkQps/Z6jq
	 eZcPvJbgGWyR0byQlOQqvAUDdSkOMeTocRolRZzHRhBAOb7IaCqy0pHlZOFRMpWuML
	 0ZEwkpCKQk02w5Mu+2hDh6WGDz7OauFHpTm4qASD5IClFJlJ2RPhulfT1VGmavJuFl
	 pFQXe9fwAHYeCDrR+21PoeXbPaoFcilBFork5qUwh60vvTbtbvkKLHFyzWShcaoR9s
	 ojdjmPymUF/ig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 353C480F4F;
	Wed,  2 Sep 2026 19:57:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 888C5363
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 19:57:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 79D4880F18
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 19:57:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XKu5JsQaIJUC for <buildroot@buildroot.org>;
 Wed,  2 Sep 2026 19:57:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 3151F80EE4
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::133"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788379040;
 b=E2Bfigb1RlwNAQP8t7QhHFNcdHuE1BIQRfMLQhMBH9mvy4bzP2dUEv19dCxL3jnO8lqb
 dHIV9A7TFxqmSIYMXFKnMH5mgQj3AVPZlFeUkkqFh3Y5Kc+5SQ4AEmX/rhPvzWOmITNSB
 ett0BnafsMLxp3iCtRSYQogHjpCBnVi20ohiWqHZk7/fi9Pyq7uZH6E4t0JcL6KSB6Kwd
 vZMrkkGc8BD8JnGNUsnQz/MlA3dehB4lLC66nsjEmHCVPTTLWkjrmKTavoD3v+YOCNucD
 23165NXOxVYoP0EpxGDnjhLOEWbKdj9OlgXmEfhfQwfg5/iGILUEUksQyLh9IYCEVEg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788379040;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=8pHT74aSmrsNZ7QayDuFWDhFvnTS9qcixidj++f39z0=;
 b=rcscE0vHUiueKM/V2uxEFJhj5shHplT9bY5h9EW254KMeIOiiH91VDhMZeub4VxwGaH9
 fCWWrxN9OmrmupCJ+83TYl+4RiheA196VFx+1OfiwTpuAp3wJEfWm5h7C8yZQNwba7qFH
 UEiSdhCdisR1jxGqzlWAHHbktq5qUseYsaHsFe6JRMzrctUe1y4Yb3p2SpOQhlkh3XpCO
 GQq92ybv1qAxYXrjFqbi8LJw9Tc+ilPAosXzguSctGkfUN6ur0PNikkNBGQx/soSbiVfQ
 mIWEsdMTDGIRKRCPKdbdlcd9B0zg0IuUZKsHe35Nk8WjMMA7hYeIQccQtjapsKDPi0Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=none header.from=j-ernberg.se; 
 dkim=pass header.d=j-ernberg-se.20251104.gappssmtp.com
 header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=TKzoPHyQ; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::133"
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::133; helo=mail-lf1-x133.google.com;
 envelope-from=j@j-ernberg.se; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=j-ernberg.se
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=j-ernberg-se.20251104.gappssmtp.com
 header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=TKzoPHyQ
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3151F80EE4
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 19:57:16 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-5b4a0e5aefeso1636423e87.3
 for <buildroot@buildroot.org>; Wed, 02 Sep 2026 12:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=j-ernberg-se.20251104.gappssmtp.com; s=20251104; t=1788379034; x=1788983834;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=8pHT74aSmrsNZ7QayDuFWDhFvnTS9qcixidj++f39z0=;
 b=TKzoPHyQRHxfJpeuDeTIlUyLp8p5JKlLu9xW55frW3zYYx0W41I8PXO/ooj2kG7ub8
 E/73rGfTmEMb7+59lS5cd7X3NjLAlUBVylIHAUieRzTUckL7rE0++2iQOAzcVQQUB2Dj
 56Nh1znS2OCD6jltscMya6EHPXyoYbcm2DG2lyZORLWDFBV+J5EHwCgCb61wspHmNKTF
 N59x1C8+ByqV5OYZh1j5C1nY3Gwrubu4aHhlQP3AnImsNQdLDGKQnGw3x1n1KYaRXJBW
 9Yg68pRXZIUeN5Ygjz44t1+A3ZfeFQySVPOzhZ8xJKacNY6CVp/LS8KG/dJCsCR1SJuL
 62Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788379034; x=1788983834;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=8pHT74aSmrsNZ7QayDuFWDhFvnTS9qcixidj++f39z0=;
 b=CFpAeWCTaYWsnCzVFp9Ed/InqlA05NP3XyselCsy9UiVJODi+wNsE+h6ukFmSWXKLM
 30zetYhqz+U3mApuqqSzQND66zg7MyEK7DRrX5s4O3PBab1X2WGa0oh8ppA+f5xrC7qy
 +UMW85zov4/PIYXwIPVdBdSpQha7NVgm8Angbb5Ep+yphoMldr+XP0H8BjDZ3Qcxxsm+
 x5Tqqo1XQ7TH5NIYCNGPDz6ccNNRccHLf5RR7jXcR2Hyb0ZsVyJ7KsnP3n2XH8mAZl+u
 JjyTa0MA7RfiaDJ2R53BNroJ0Pg/XxKe2aHyvtdjE794jwpGETMMaYyh4tP3XMAbrUqK
 52dw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzDD9EWHQoUSGBtyZ3dtB26W5oBzVeTUCjr0qWMAsW0V1rp/chhGbi2zcrtc/de1Wgp9ULyFm1Lj4c=@buildroot.org
X-Gm-Message-State: AFuF++nGQkj5H07EwNXkzznSUw8Ju37oIwpkpWim5H6bVkKU7nqN2Q9l
 HkEBDZzIwxrcfPBA7LBQovi29jzZB0iAbBvCRD7swSihF6+2kNkaM2M83/AifnMykoU=
X-Gm-Gg: AYBFou1NAhzZtTakUweB4i16ke6KryJMPfQGGr/B7RNtmff+evvqe7FMsqrXiVSxahl
 +g0hCkYiHc2d1/A/yZmi4GvmEpeRsZGl1V05J5LOG2Hg3tolCORWN/U9194SeLWIUXHnvahJgbe
 0x5WTJjXjGvZZMtdDgsC8h4BEhl6o6qSv41rKKWxNbGiiWB2ZhJpR2fwv2O95rDTqHwrieKSBaT
 QqeSmvzs5LG+tuolUPSg3K1aR+qfBJ3NFdmkCACehbGTErxweO7qS3R+R5GiN2x8CIWws1s8/aa
 40BKh5rrzK2yavNpKHSbb2d2ku9YzqfQ2ihuRF0sOI2jesEo7twr77tA0IxvtY1Rr9NSQM6cR6K
 XIU65gXot/9nLc2T8JhXhrzsPpcnWZyL1Ad6igBP30CVepaIwKpSRnvOsiCENNjwoDK9VaIxKIb
 dQkbs1vqqduIls1WAJSn04xaW1jxNj6pvyHYJzxxIBuk2vaxKTsgUO23CtTp59HvY63nfRVQMhm
 01lS7JEUIbs4Svy/D7nNkrTImMu2DcM3eDJJNl3Hc2Hjg38oZnuyFP84oaeEAYrp/gxKvGixdaf
 3A==
X-Received: by 2002:a05:6512:3d07:b0:5b3:e02:b3a0 with SMTP id
 2adb3069b0e04-5b60832cc8emr1955279e87.7.1788379034357; 
 Wed, 02 Sep 2026 12:57:14 -0700 (PDT)
Received: from localhost (78-68-185-168-no2360.tbcn.telia.com. [78.68.185.168])
 by smtp.gmail.com with UTF8SMTPSA id
 2adb3069b0e04-5b606b0ec48sm821554e87.4.2026.09.02.12.57.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2026 12:57:12 -0700 (PDT)
From: John Ernberg <j@j-ernberg.se>
To: John Koch <jkoch@outrider.ai>
Cc: John Ernberg <j@j-ernberg.se>, Adam Ford <aford173@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Vincent Fazio <vfazio@xes-inc.com>, Zach Vargas <zvargas@xes-inc.com>,
 buildroot@buildroot.org
Date: Wed,  2 Sep 2026 21:57:07 +0200
Message-ID: <20260902195708.2168193-1-j@j-ernberg.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: CAMQGCciOiowjjOXNJPpbZ-WaD=pSf0g_vsdVgXMVUx3jfrj2uA@mail.gmail.com
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] Updating nvidia-driver package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi John,

> For a while I have been locally modifying the nvidia-driver package to
> allow its use with more modern hardware architectures (e.g., Turing and
> above). Recently I also added support for the open-source driver which is
> required for the Blackwell architecture (and beyond). I believe I retained
> support for the older legacy architectures but I am unable to test those
> due to lack of supported hardware. Would there be any interest in reviewing
> and possibly merging these changes into the nvidia-driver package?

If you're using it and plan to maintain it, post the patches, the package
is currently orphaned, so adding yourself to DEVELOPERS as well could be an
idea.

I started looking at trying to compile the existing nvidia-driver package
after Adam ran into an xwayland compile issue with the LIB_GL providers
(which I also ran into earlier and didn't have time to figure out how to
properly fix - due to the nvidia driver not being buildable).

The last few days I have tried again to figure out how to build the current
nvidia-driver with a supported kernel (according to nvidia docs) and have not
been able to find a combination of internal toolchain and kernel version that
builds.

As far as I can tell all in-tree toolchains are too new, so when the kernel
versions compile the driver doesn't, and when the kernel doesn't compile ...
I don't know if the driver would compile either.

Do you or any of the others CC'd use the package as it is today? And if so,
have a defconfig that builds the current nvidia-driver package?
It needs a myriad of patches if it's going to build for any kernel besides
possibly the 5.10 CIP kernel (which is doesn't build for either... as far
as I can tell).
So maybe support for this version is not necessary to keep.

Best regards // John Ernberg
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
