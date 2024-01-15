Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA3CC3DA79
	for <buildroot@archiver.kernel.org>; Mon, 15 Jan 2024 21:44:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 251CC83EC2;
	Mon, 15 Jan 2024 21:44:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 251CC83EC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ifK9-E1ytGyZ; Mon, 15 Jan 2024 21:44:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 868F483E9A;
	Mon, 15 Jan 2024 21:44:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 868F483E9A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D7AC71BF383
 for <buildroot@lists.busybox.net>; Mon, 15 Jan 2024 21:44:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE10B424A4
 for <buildroot@lists.busybox.net>; Mon, 15 Jan 2024 21:44:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE10B424A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RDElPdjyzoNM for <buildroot@lists.busybox.net>;
 Mon, 15 Jan 2024 21:44:40 +0000 (UTC)
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9B10A41A61
 for <buildroot@buildroot.org>; Mon, 15 Jan 2024 21:44:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B10A41A61
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2ccbc328744so110641921fa.3
 for <buildroot@buildroot.org>; Mon, 15 Jan 2024 13:44:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705355077; x=1705959877;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7Jm1fQA/ynEXmug9z5QMci4Snn2JbmmFeZSsdyZ3yvc=;
 b=i/pHICH5NyBLjkPRceodeuAr1afDnZyqvqQ5LqLn+lFfyiFmy/4fgdYI0ZkCGmbkUj
 o66NfbAiuJHb8EoUvYgGeMGLvfRHXS6eevpQMOG0NU1p4gdQSFx4lGNRts/KCknV6aZz
 O3PppG8ecbgCtRCQuuh6SGR3rvWaZmTng9gYqaQ8ZKslSan+4g6teLllfBgx0uxSgmOf
 2n0hpSBi9yeSg2SvJ/DzxFblZmvTYI6vEnxcIdxQng2g4e+eoSxNspcd1FX8pIyaSdDw
 sDrxWsY57jbyXuRrBMy3Zr/8Xsu+ghncXeCk9aEt/IK3MV/kiDCDAxL1JXQuVAjoxT5a
 G4xA==
X-Gm-Message-State: AOJu0Yyy5UvdRzTNd1nUAJVTAYr4fsdPpKtKM4xTVoO9YvjbW1dRds3e
 eRSeJFuKRIQDkU6PMqRmfRSoDxochOY=
X-Google-Smtp-Source: AGHT+IFbL698D3RBLC1367Z776eOEtutscPIJK9H8wqaGwP6CI7SvvXdelX+4Gjwlqbz6ci0Z+5Avw==
X-Received: by 2002:a05:6512:32c8:b0:50b:e810:3206 with SMTP id
 f8-20020a05651232c800b0050be8103206mr3264504lfg.110.1705355077011; 
 Mon, 15 Jan 2024 13:44:37 -0800 (PST)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 z19-20020a170906271300b00a2ae0aa9002sm5703879ejc.40.2024.01.15.13.44.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jan 2024 13:44:36 -0800 (PST)
Date: Mon, 15 Jan 2024 22:44:34 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Message-ID: <20240115214434.GA2351444@pevik>
References: <20240115210821.2175974-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240115210821.2175974-1-petr.vorel@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705355077; x=1705959877; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7Jm1fQA/ynEXmug9z5QMci4Snn2JbmmFeZSsdyZ3yvc=;
 b=Y6LbxAjVTtfxgLopPxa7OcMqnrrjWNuJpULHDvh42kUnJT4MP5+erHglJLJx5Mp+L9
 /NrCNL0PhOssL2Umy7oyUtkeNEY3+22tgaQl2d6wrEqobXbRyxNmuPfIeeKf+EoRtcO8
 q47GyFTH4Bd+hw9CMPwS0QPVH2hiXXjIu4owPbnOsC7ntZafT6Ijx89d7d7rWHl9YxRU
 4OKlXFY6pn9E/+tpzJizIZAKkDnxyPda4yhHpB8jtRajv35traONjUi+FzXfpXVkmTHT
 h74+LbkXrycpNHoF3lLB2S/r3903nI81cCW/XeV2wFepNLPYs+VbCFhYH14AcNnnxPuS
 xIGw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Y6LbxAjV
Subject: Re: [Buildroot] [PATCH 1/1] package/iproute2: bump version to 6.7.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Francois Perrad <fperrad@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

build tested:

                    bootlin-armv5-uclibc [1/6]: OK
                     bootlin-armv7-glibc [2/6]: OK
                   bootlin-armv7m-uclibc [3/6]: SKIPPED
                     bootlin-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: OK
                            sourcery-arm [6/6]: OK

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
