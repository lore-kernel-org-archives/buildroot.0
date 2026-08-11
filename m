Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6008C5CFCF
	for <buildroot@archiver.kernel.org>; Tue, 11 Aug 2026 11:42:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F21180F97;
	Tue, 11 Aug 2026 11:42:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bw0c6YiCV2k7; Tue, 11 Aug 2026 11:42:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3CA280F9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786448570;
	bh=HI4uUun78+K/R/XMyep4oCNKsjn4Ws8fqhHn82ydGaM=;
	h=Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=d3FBYoHJ7fTCKXEh5PJE9FdzKZTAvanpws//9c3W2B2hcUiSDSibXFTv/xbOCCv6D
	 uptc1cn2UjqqiI1UY+zt776/eJ6ttYeBv1YZsO9DSKSP/OHHIrFab2s1i5RmuFb+12
	 BrayjqiDx6V9Hq3XGxZtc3UP0BZIteusQHxX7o1LfBdHnSxhaSRSXgtdjCe/6vViO0
	 S5V6pUxMRfqONW71bQyT01Ou8ZhEqrOXWQ1/XXEWXc3uwTLqD8FwH6xrVT2GEbfkdg
	 JEd3ZTTD2gpdrVlwKatYyQb+NgNSNCViiZXP04awafpDBaA/IBv3oudzh9Wd5mnC9K
	 H3Rk6U8n7jKXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3CA280F9F;
	Tue, 11 Aug 2026 11:42:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AE9E0345
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 11:42:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 94CFA606AE
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 11:42:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d73rGrc4BqXs for <buildroot@buildroot.org>;
 Tue, 11 Aug 2026 11:42:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A63066063A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A63066063A
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A63066063A
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 11:42:47 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 792574E4119A;
 Tue, 11 Aug 2026 11:42:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4BF926033C;
 Tue, 11 Aug 2026 11:42:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6B3E011C4842C; 
 Tue, 11 Aug 2026 13:42:39 +0200 (CEST)
Date: Tue, 11 Aug 2026 13:42:39 +0200
To: Alexander Egorenkov <egorenar@linux.ibm.com>
Cc: buildroot@buildroot.org
Message-ID: <ansJ5dXXblvYeMLB@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1786448560; h=from:subject:date:message-id:to:cc:mime-version:content-type; 
 bh=A3K8a4C14ULeof1TKqu8+NdiMEpJNNdetcOxGG6Ce78=;
 b=gTiRVFeeNeJi9DDixtE1KekC9IeySDPdG//cUIsJ3op0LdCqGbIkzWtqCQXixcAwOzyPZ6
 XxgdntvYDEOc0yyfQkPqD3xAIAX6/3LxNNCSBGSxYopgZZAPRsWCp5HusL39D4N8jeG+wf
 v/kRui5YUmefnbdhppZkWQ5R+rz7ezmegd1Kdl/vZ8GRJbJspACqP8n9tLpRlN1yaLo98J
 YN/BVlL9JaYNuhMKWBCFlWSveulwZPPBcYPulk6sOBwUm3C0MYfGnI+b3wswo3tEhP1xnW
 DPdJ7zoy4CytarP3yuWeRGj6L4Z7/u/fgGRhJ3vAtxDJgLRO/xueUUOPYTE/eA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=gTiRVFee
Subject: [Buildroot] S390 Buildroot/gcc build issue
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

Alexander,

I am contacting you regarding a build issue I'm seeing with the S390
architecture in Buildroot.

With the following defconfig:

BR2_s390x=y
BR2_KERNEL_HEADERS_6_12=y
BR2_PACKAGE_GLIBC_KERNEL_COMPAT=y
BR2_BINUTILS_VERSION_2_46_X=y
BR2_BINUTILS_GPROFNG=y
BR2_GCC_VERSION_16_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_TOOLCHAIN_BUILDROOT_FORTRAN=y
BR2_GCC_ENABLE_OPENMP=y
BR2_PACKAGE_HOST_GDB=y
BR2_PACKAGE_HOST_GDB_TUI=y
BR2_PACKAGE_HOST_GDB_PYTHON3=y
BR2_GDB_VERSION_17=y
BR2_GNU_MIRROR="https://mirrors.kernel.org/gnu/"
BR2_PACKAGE_GDB=y

gcc 16.2.0 fails to build with:

../../../libgcc/config/s390/_dpd_sd_to_hf.c:27:25: error: decimal floating-point not supported for this target
   27 | HFtype __dpd_truncsdhf (_Decimal32);
      |                         ^~~~~~~~~~
../../../libgcc/config/s390/_dpd_sd_to_hf.c:31:16: error: decimal floating-point not supported for this target
   31 | force_convert (_Decimal32 x)
      |                ^~~~~~~~~~
../../../libgcc/config/s390/_dpd_hf_to_td.c:34:1: error: decimal floating-point not supported for this target
   34 | _Decimal128
      | ^~~~~~~~~~~
../../../libgcc/config/s390/_dpd_sd_to_hf.c:35:18: error: decimal floating-point not supported for this target
   35 | __dpd_truncsdhf (_Decimal32 x)
      |                  ^~~~~~~~~~

I haven't checked whether this is new with gcc 16.x or not, and I'm
not familiar with floating point support on S390.

Are you familiar with this issue?

I see the same issue with gcc 16.1.0 in the autobuilders:

  https://autobuild.buildroot.net/results/f88/f88565af0f653df831a7fa43d2507d167fdb9d36/build-end.log

But I don't seem to see any issue with gcc 15.x, so my guess is that
this is a new issue with gcc 16.x.

Any idea?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
