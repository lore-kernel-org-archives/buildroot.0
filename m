Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C18E784BE
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 22:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5A1540675;
	Sun, 28 Dec 2025 22:18:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nAlPuTabBlwx; Sun, 28 Dec 2025 22:18:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABE2A40565
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766960292;
	bh=TR4uVDCpl7wytDYvPhqaOy6LaalWjc8aveDdOjxlo0M=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oA/iPgBZJg364HXVS923mCpJ8Fey1DeIogyeq6LM4Ibg64Skv7jysBMzbjuCwKUWX
	 odNFOM8rFu+9ZaDgFn/d7IvO+emANnCmuVwDQPBTP+XKRo5Xco6s6L3IyKjf5UO+zR
	 MW5fi6wXJOlzV66VuMbiJ6Z4WsgacEO8nW+MeHRkGUo1vqvVaJIodXIqefX/ZAMaDk
	 XO2/iVURU/cQvAWQjEFAnmgNPj6nBedDuQZzBbA73TxZN0VJ+N6+usiArNYdYV7kAo
	 knyWaEUnAOiMjklkM71nSmvEFV71QyvKhAxirzngN5yCU3uTrVwJnMzSqITnayvNj9
	 s1RoN2tBCc3uw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABE2A40565;
	Sun, 28 Dec 2025 22:18:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F237D8
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1508060A5C
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:18:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eocbmg2zYOSN for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 22:18:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 18C0860A59
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18C0860A59
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 18C0860A59
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:18:09 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id CE6B84E41E2A;
 Sun, 28 Dec 2025 22:18:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A285460725;
 Sun, 28 Dec 2025 22:18:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 847D511979262; Sun, 28 Dec 2025 23:18:06 +0100 (CET)
Date: Sun, 28 Dec 2025 23:18:05 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Andreas Ziegler <br025@umbiko.net>
Message-ID: <20251228231805.26edf574@windsurf>
In-Reply-To: <20251217220525.3815471-1-bernd@kuhls.net>
References: <20251217220525.3815471-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766960287; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=wjtTdYUbB3j8lTVSHCT3rVdc0ULB2JMbCWKjR/GzZjI=;
 b=ckAnRPfF7btmdjuc0HydJh/JRoTGVq+dJTaS1S99hHcM2V/sJAxVq+sb9MUMQvJsq6Bo8k
 z2KXZZrk48yiHQg/Lyn8/XwONNfVpi7QGs6PjLMwWupqwJ1KyXztwTHvQOyYLanDgRhf37
 dkzm8cF6sUxDPtxUyADLBKLp/Ylkgn43/pj+mVUnJpl/PbQLWmutsH3mdVF5Zspc4+7w+k
 htFeN59lYHvMAhdNalNxr+8uqixahac8wzYI/f/euVoVRjCesjJEYQ6LafEEIM5IVf+m8I
 Err+TKRgbITNO0Ai/nEYoNDZaPIaMxLRDFB9Wum1QRlIwK+QVZvJdvMuktPUcA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=ckAnRPfF
Subject: Re: [Buildroot] [PATCH v3 1/2] package/libid3tag: bump version to
 0.16.3
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 17 Dec 2025 23:05:24 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Switched to maintained fork also used by Debian:
> https://codeberg.org/tenacityteam/libid3tag/commit/7dce7b492406becd08c2691bf949e086b127fb58
> https://tracker.debian.org/news/1573712/accepted-libid3tag-0163-1-source-into-unstable/
> 
> Removed Debian patchset which is included in this release and contains
> fixes for CVEs mentioned in LIBID3TAG_IGNORE_CVES:
> 
> - 10_utf16.dpatch
>   https://codeberg.org/tenacityteam/libid3tag/commit/2a0f4df1544e3e124622e2e87a117395d40a1d57
> 
> - 11_unknown_encoding.patch
>   https://codeberg.org/tenacityteam/libid3tag/commit/68777efc16d05aa5bb25fa50ff796c2e23e42054
> 
> Switched build system to CMake:
> https://codeberg.org/tenacityteam/libid3tag/commit/cb746b9f216d3016825715df473bfa8807e007f5
> due to autoconf removal:
> https://codeberg.org/tenacityteam/libid3tag/commit/2ceebdf3b82f149125b679b0002348426f51dc43
> and added upstream commit to fix build with CMake 4.x.
> 
> Removed id3tag.pc which is now provided by the build system.
> 
> Also removed the host-gperf dependency which was needed by autoreconf,
> see buildroot commit 7ecd0e4edf9f42795ef70097a8f205b2aaa67a6d for
> details.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> Reviewed-by: Andreas Ziegler <br025@umbiko.net>
> Tested-by : Andreas Ziegler <br025@umbiko.net>
> ---
> v2: added upstream commit to fix build with CMake 4.x
> v3: removed id3tag.pc (Andreas Ziegler)

Thanks, both applied!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
