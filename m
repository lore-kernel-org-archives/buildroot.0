Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2196EC3DA79
	for <buildroot@archiver.kernel.org>; Mon, 15 Jan 2024 21:58:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C80AB843B2;
	Mon, 15 Jan 2024 21:58:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C80AB843B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 07t1-0KNKZsR; Mon, 15 Jan 2024 21:58:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 376FC8437F;
	Mon, 15 Jan 2024 21:58:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 376FC8437F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 521D61BF383
 for <buildroot@lists.busybox.net>; Mon, 15 Jan 2024 21:58:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2935242DB0
 for <buildroot@lists.busybox.net>; Mon, 15 Jan 2024 21:58:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2935242DB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zH-aOY05nNSs for <buildroot@lists.busybox.net>;
 Mon, 15 Jan 2024 21:58:09 +0000 (UTC)
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C995442DA9
 for <buildroot@buildroot.org>; Mon, 15 Jan 2024 21:58:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C995442DA9
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a2dbc61fe89so161790466b.0
 for <buildroot@buildroot.org>; Mon, 15 Jan 2024 13:58:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705355886; x=1705960686;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VOblvCLcNb55BUW/x+tJYzxp5tpLLIYTe059gTr0zsQ=;
 b=p6DrPWC+59k/2vsHSflN/42uQ1CbWD77b+Ak+/cLds5J5V0k/fHtcFx1bGztoEmw6x
 U+L7nECsielQ3YzqHoC8tzvBRWvZbB8Cswf5hdNKoA2FsgiNyeUn+u1Gm+1VQHf/VJVV
 mp+7X3kwz+FGt7SascNGKE+f9NtHz95s1gqiEkwBOJVL3uUAttdLPQVtYoKNpXO9yHC4
 bCraKRnhG8B7QJ8YlcCs0RFTHBkTPbMZDqny9BWnxx0On/h2+TxV3C0WdJEWbh2QlXBF
 40CM6lUhfJS+gZDqzLVS873jaR/08J9bMEd8XMsT5ffg0AZx10nGvROWfbtU2/Kjtyfg
 +eiQ==
X-Gm-Message-State: AOJu0YxjiHeN8zYfrYj1TLCbYVd2kJYXqU0xN0Ng2UBiTL485aJvaqzt
 0kWwR2HdnapRW5tKfZgKc7uWuXkVpsM=
X-Google-Smtp-Source: AGHT+IFSL2/TLOAoXx2Cuwx/Y4CKghxdVN2Xwkg5LDzFoWus+2n6DE2mgFqMR+ZG+3OTfeNcl0vcIA==
X-Received: by 2002:a17:907:d40f:b0:a2d:ad14:a2a6 with SMTP id
 vi15-20020a170907d40f00b00a2dad14a2a6mr1583877ejc.23.1705355886238; 
 Mon, 15 Jan 2024 13:58:06 -0800 (PST)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 z9-20020a1709060be900b00a28148beabdsm5705116ejg.102.2024.01.15.13.58.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jan 2024 13:58:05 -0800 (PST)
Date: Mon, 15 Jan 2024 22:58:03 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Message-ID: <20240115215803.GB2351444@pevik>
References: <20240115214809.2352232-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240115214809.2352232-1-petr.vorel@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705355886; x=1705960686; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VOblvCLcNb55BUW/x+tJYzxp5tpLLIYTe059gTr0zsQ=;
 b=kEYQyOPWa9tAfTAS9Iih5/ZUnX49KDzuWT1pNJgSCZk9tkC4ApNC216jjRGDqQEptB
 Ro+1Zcx6DmPi20jdkQbDUfN0Ilte4ntPJRdoC9zifWPsYPh3pJKc5KgfhN8ps3Rrtvv1
 p3BLAaeSeQln9/kysg8V0QwZQO0H68w3Gq/9iPGMuJCReBJPDwpt6MgMLQIetlRNeYfm
 QUmgShyit5OFv07y8KNEZcY4ulrg2Db9E1YF4R4dI/vQlJL/3affuZQSqWo8KMaTrLFv
 SkoHAceUoHla1JTna9U+7KA9JXLLnHQ1d/8zRDEa7nmGl9KIT9R3wPZ5a8eOSIIRPMbT
 RPRA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kEYQyOPW
Subject: Re: [Buildroot] [PATCH 1/1] package/libtirpc: bump version to 1.3.4
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
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

build tested:

                    bootlin-armv5-uclibc [1/6]: OK
                     bootlin-armv7-glibc [2/6]: OK
                   bootlin-armv7m-uclibc [3/6]: OK
                     bootlin-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: OK
                            sourcery-arm [6/6]: OK

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
