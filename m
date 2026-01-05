Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C1BC2A072
	for <buildroot@archiver.kernel.org>; Mon,  5 Jan 2026 08:32:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15E1A405F3;
	Mon,  5 Jan 2026 08:32:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PZtRUB3jJ6xf; Mon,  5 Jan 2026 08:32:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DCF0405BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767601942;
	bh=CmgVl/P9Qw2a5bATdGUf7DRS+3mkkzLjc1X14Uqp5Ng=;
	h=Date:To:CC:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AbtXyF8WVrIpD0xFvUPLOV6r8aOiOD1sJLhUjVw4ROX1kSH6rWrBy10MTce8szGlC
	 M9Vrg2czYZscr2VXvcm4pQujnRZu3hXKUsshytzn2PXpnf9UPOlI46sJxcEpb1ZNPI
	 eLYRQubChe6bTsWSwlRlqFc2AauiUeOvEEtDBnDm9yuFrK623AdDDQLoA6GDYQKyg2
	 OLIK8IZdUaqsYYc6H+RI4moWrPk6Hz7E3dSGcyU0zgGKIAV+NwdPE0WCl2xJbgmfa/
	 N20GXgTmqDXZPyyWKvNxUvjtZze2+UI8CYRGEuFSarf6g5rCO8dWYQEcPhaLZzW7bh
	 SyqP5OUYTINgg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DCF0405BA;
	Mon,  5 Jan 2026 08:32:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 308A4E7
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 08:32:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D3EA402A4
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 08:32:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LmIxJ3P2sL5J for <buildroot@buildroot.org>;
 Mon,  5 Jan 2026 08:32:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.154.123;
 helo=esa.microchip.iphmx.com;
 envelope-from=prvs=458dbad6e=horatiu.vultur@microchip.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D3101401F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3101401F2
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D3101401F2
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 08:32:19 +0000 (UTC)
X-CSE-ConnectionGUID: ccdzT2c4RtSgzqhnFLRPnA==
X-CSE-MsgGUID: iUIWD61FQy2Ids4cNScsJg==
X-IronPort-AV: E=Sophos;i="6.21,203,1763449200"; d="scan'208";a="51818095"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 01:25:07 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Mon, 5 Jan 2026 01:24:51 -0700
Received: from localhost (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 5 Jan 2026 01:24:51 -0700
Date: Mon, 5 Jan 2026 09:23:59 +0100
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
CC: buildroot <buildroot@buildroot.org>, Samuel Martin <s.martin49@gmail.com>, 
 Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20260105082359.whvlxgcxrqvjnrpd@DEN-DL-M31836.microchip.com>
References: <20211212130745.2240973-1-horatiu.vultur@microchip.com>
 <20251216093901.3a425563@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251216093901.3a425563@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1767601940; x=1799137940;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=bTmkzrgn675T9Jgo04kIzMYxHVanp9WoilpuCvtkgmg=;
 b=qkHsJIamB5jmhOdpsy81TBVKWv5FJHG/GUQ6Ktr+ingl7v+BPCR1Sv3A
 wUvpi/EnKEcz6hK6/J7RAFsdhCo03W0btYXANsHpMSsKgA9mDrHLmBFT6
 4pmF6AQFDWCV9expeSI2+leo0iq+nv506RICbSLIU2Od/BKCog5AW84Qt
 jznlsNXjqvIo88QlpqPzvZxTCxnRJ5l30NuhSgmtO/PRabvx1pSx+7iX3
 uh41C/s7ocs0IjHVlxRxSRSb+Yp8b2sh75kywVbEH5EHTlv46QCgjcWen
 njK9jZ15ejGO/nzMf645Z3Gkl8VnTI47vvaK0E8WhzKf608LpIkwUTCKN
 A==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=microchip.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=qkHsJIam
Subject: Re: [Buildroot] [PATCH] package/cfm: new package
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
From: Horatiu Vultur via buildroot <buildroot@buildroot.org>
Reply-To: Horatiu Vultur <horatiu.vultur@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The 12/16/2025 09:39, Thomas Petazzoni wrote:
> 
> Hello Horatiu,

Hi Thomas,

> 
> On Sun, 12 Dec 2021 14:07:45 +0100
> Horatiu Vultur via buildroot <buildroot@buildroot.org> wrote:
> 
> > Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
> 
> I am getting back to after several years, as this package is no longer
> building after the update to CMake 4:
> 
> CMake Error at CMakeLists.txt:6 (cmake_minimum_required):
>   Compatibility with CMake < 3.5 has been removed from CMake.
> 
>   Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
>   to tell CMake that the project requires at least <min> but has been updated
>   to work with policies introduced by <max> or earlier.
> 
>   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
> 
> See also:
> 
>   https://autobuild.buildroot.net/results/dff/dff5fd392a4d35ee54ac8f1e7d44a04a1f1323b6/build-end.log
> 
> Most likely it is just a matter of updating:
> 
>   cmake_minimum_required(VERSION 2.6)
> 
> to:
> 
>   cmake_minimum_required(VERSION 3.5)
> 
> Could you have a look and provide a fix?

Sorry for late reply. Somehow I have missed this email.
I can see that Bernd has already send a patch for fixing this.

> 
> Thanks a lot!
> 
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com

-- 
/Horatiu
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
