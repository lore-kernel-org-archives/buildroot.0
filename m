Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D93CC02196
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 12:42:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C3BE60BE7;
	Tue,  4 Feb 2025 12:42:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 67IQTCfpThKf; Tue,  4 Feb 2025 12:42:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B56260C01
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B56260C01;
	Tue,  4 Feb 2025 12:42:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 49B5612A
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 12:42:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4536660BE7
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 12:42:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3D5dkSOV1RuE for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 12:42:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.167.49;
 helo=mail-lf1-f49.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 21EA660606
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21EA660606
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 21EA660606
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 12:42:09 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-5439a6179a7so5745655e87.1
 for <buildroot@buildroot.org>; Tue, 04 Feb 2025 04:42:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738672926; x=1739277726;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yCYliKrRI6ytQUT0LHRXJeQEmc1sjNmmBPclzdGGsg0=;
 b=pE8hSWaGr5AEsrJD41z7IhwgFPQiocb9cUnX+6VHzCVvLak1uBaofRNGesMuKUxfNM
 3jg3MgF1EWd0vSXfdi+VAQYUXwkg5rEZtTzGcZd/eKTXb4m6s8iAGM4Cj1qiofrDNbkA
 KOeEXEUTg2SuhcUV9j7up+iwWxXp5w4PF5e7Sd+QZlzoOBkdMDX/dlL8D9WDSczqqFX6
 biGW9avWdsrPqyeW7JynSaD5wjzIwnHdk8GbC2pejxXxeP31QytXYxqotvc93/xlChHw
 fsP5yi2zN2pIaLvfvo0G4y2QT9PeuFRPwX1EvMl1QYulC5QwLrcrjfQ6oISjnjvT1ZkM
 24Tw==
X-Gm-Message-State: AOJu0YxTVcZKCnzGbw+RnclD3ryg2BlgIWiakP/bdZ5JncQkJPgCdDmm
 W7yp2PKagF8SdJNGGhvjUPMxVgoE9kzHOjSpK/Q2TbvWFdMtfkdOv08yF8TPMas=
X-Gm-Gg: ASbGncuT4R4BS+Dan5ewwTBe/TlXEeArMAwaVH4GN+GOhl1VejWzhi0YtulMydLwOWc
 GDxt0c4z9C4XvzS0lKgFi1Q+BG83I9Zz1ixuM8rM8aPvB9qagvpdBFxOYLmYSGmB54kpuoAIKvt
 5hkYdMszQFnRoPILS/LPKtpNyVdOm/yqJE9lIES15ytrYpKI+hgHgypvY6tAZMRiYyqMg3EKBb/
 gbaf9hOmzidn+FJ4loPSTze8AlqL4qy++l0SCo5mLOVIDqByEd7uCz8V14c+hvfPr3b68pLI1UL
 ZCym9Rfq5SqReZ/jFOb8OpmfEaxXtromeoVQQkY5ukmUk7LyNgyP
X-Google-Smtp-Source: AGHT+IEZjsYb/ypy36Sl+iWC7h5OSJXtgjgvcWOvWgvfDajm+xbKVpZPIACXB0tjyYPieJDdH+MSTQ==
X-Received: by 2002:a19:ee1a:0:b0:540:2223:9b1c with SMTP id
 2adb3069b0e04-543ffb49867mr868806e87.25.1738672926095; 
 Tue, 04 Feb 2025 04:42:06 -0800 (PST)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com.
 [209.85.167.45]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543ebebecadsm1557829e87.244.2025.02.04.04.42.05
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 04:42:05 -0800 (PST)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-54287a3ba3cso5883933e87.0
 for <buildroot@buildroot.org>; Tue, 04 Feb 2025 04:42:05 -0800 (PST)
X-Received: by 2002:a05:6512:2245:b0:543:e485:815 with SMTP id
 2adb3069b0e04-543ffb1dceamr990177e87.10.1738672925589; Tue, 04 Feb 2025
 04:42:05 -0800 (PST)
MIME-Version: 1.0
References: <CACXRmJi-K=k+bwwhtVEjAOc6wEJaS1rg_5cDFwMY2nZmR24KVQ@mail.gmail.com>
 <20241218084337.3775491-1-thomas@devoogdt.com>
In-Reply-To: <20241218084337.3775491-1-thomas@devoogdt.com>
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Tue, 4 Feb 2025 13:41:54 +0100
X-Gmail-Original-Message-ID: <CACXRmJgqM79t8Q1u_e89MT5uxNNFRdn2qRRmUMeoXySV5XXmGA@mail.gmail.com>
X-Gm-Features: AWEUYZkstwbmfr9kYczzmeji-zxVLHRNd-i7xbF0YA2T4MY6EURV3uAVReYYyIg
Message-ID: <CACXRmJgqM79t8Q1u_e89MT5uxNNFRdn2qRRmUMeoXySV5XXmGA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: Re: [Buildroot] [PATCH v1] package/pkgconf: fix sysroot being
 prepended twice to the pkgdatadir path
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
Cc: aperez@igalia.com, james.hilliard1@gmail.com, thomas.devoogdt@barco.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,


There was some discussion about this patch in
https://patchwork.ozlabs.org/project/buildroot/patch/20241216181719.770389-2-thomas@devoogdt.com/.
What is the outcome now, any reason to not take it along? It also
would be nice if the WebKitGTK 2.46 series gets merged with the
upcoming buildroot 2025.02 release. Because WebKitGTK will most
probably also release 2.48 in the near future.


With kind regards,

Thomas Devoogdt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
