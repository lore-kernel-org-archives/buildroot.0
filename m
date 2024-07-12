Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BDEBC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 19:01:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E848484784;
	Fri, 12 Jul 2024 19:01:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EE2Ue61Zr7b7; Fri, 12 Jul 2024 19:01:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F05F784786
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F05F784786;
	Fri, 12 Jul 2024 19:01:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 21CF01BF4D5
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 19:01:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1BE24400FF
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 19:01:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SC46UDt5I8Ew for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 19:01:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 027C04000B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 027C04000B
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 027C04000B
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 19:01:00 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a7527afa23cso314978566b.2
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 12:01:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720810859; x=1721415659;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N1DkYebvEOXUvUJLH4tqif9c+5WQ2OM8irfGlNbXX5o=;
 b=ICJfqcZtuIObInc+U/vCw6KT3tfS4LG+hvlsT/8EiRqgSc5fpDL2qMsEhdpyFZoJVY
 fXKG31Z8w0MGrDMHuv7fXts1Dh6XUcZtc8O/Ait9CtJ4L7J4nNHkdszEP0J6NkxKxIWc
 ZZHBKfFLOfPe3Y8vv+TZ3kq0r6RnDD5P3CZAPBA87F/fsqywAWNtEv8snU4yDiGwU0T7
 Btadur6ikZFkXW77n4uk3nDBw7eJqvJAV5CyPyvGI8z6rrhp+/REZCBGBAaiiO11IKrT
 Ho7/c9c1L/LT0/MoB/g8bqflVXoPgotJBfH2epUoTVPbCr85kv3JPJfE9P4hjfHZXxiY
 VIoQ==
X-Gm-Message-State: AOJu0Yw6658tp2ga6YiZlkqE0+BVlkZb3UvZx7tYet2v9K6rHRYuS8Pv
 RpFh3mhEMO+1/58wjbW/Br1+D8U6/aDj7eGc6dWa2w/AlRAnbSUtUTaIMA==
X-Google-Smtp-Source: AGHT+IE7dI0EDoRYMRkYz7jl4vDHxaocXj19QvzpiarR5tdRZqxXqEfVWUmHnkBLkTVjtaRNJCHzBQ==
X-Received: by 2002:a17:907:e90:b0:a6f:4e1f:e613 with SMTP id
 a640c23a62f3a-a780b6feffemr1168702366b.37.1720810858537; 
 Fri, 12 Jul 2024 12:00:58 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a6bcc97sm368695866b.35.2024.07.12.12.00.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jul 2024 12:00:58 -0700 (PDT)
Date: Fri, 12 Jul 2024 21:00:56 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Message-ID: <20240712190056.GA399792@pevik>
References: <20240712184241.256166-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240712184241.256166-1-petr.vorel@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720810859; x=1721415659; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N1DkYebvEOXUvUJLH4tqif9c+5WQ2OM8irfGlNbXX5o=;
 b=PUfoAG0VpYH0TtuNUIgAM8RxB65yDBPocyxsOfpCdVq/mn+AXas6Y+zIdacUQH5e8a
 2JCFmFb0yz/oAmKiOEjfcK09D4JUKKVjG4g9acFzcKVoNsWX6PrNhGjLe1eq+y+pLOEX
 6zEO9xrnqCe3uyuqjX2bVbBdN2MWulAUxHt9wdjELsX4+J3/KpmXVfOwxF47NqpRYb/Z
 DgczvChZxv6p0p2km3wHDRZFNVwK72O2//ZVZiiraDxY7afyjQ4K0SbYg82hxM1ukol8
 YiHmhJIlkvUJs+TS2VqbHwe7+lI4fnUw5wQt5gP/fPi/nM1CiT9HP/T+ZC4u2zy4sj38
 AhVg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=PUfoAG0V
Subject: Re: [Buildroot] [PATCH 1/1] package/ima-evm-utils: bump version to
 1.6
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

FYI tested:
                    bootlin-armv5-uclibc [1/6]: OK
                     bootlin-armv7-glibc [2/6]: OK
                   bootlin-armv7m-uclibc [3/6]: SKIPPED
                     bootlin-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: SKIPPED
                             arm-aarch64 [6/6]: OK
6 builds, 2 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
