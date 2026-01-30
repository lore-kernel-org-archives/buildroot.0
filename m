Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A0B0D49C91
	for <buildroot@archiver.kernel.org>; Fri, 30 Jan 2026 09:46:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4805360AA7;
	Fri, 30 Jan 2026 09:46:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VJBFdlkzJ58B; Fri, 30 Jan 2026 09:46:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 674D760AA8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769766371;
	bh=QOKa5kJZHicCEYJVx/rNZUMhhFc4SS0BA/pm5zrfha8=;
	h=Date:To:CC:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=levFxwS5Q3PhvYFxxjtGhCPc78VGrdEid6r9VDK4h5sLqj2wIHI9ini0iPPjxN9jR
	 rLlf8UxYSNuL5al2KQxhENtXieTmyQ5evb6l+u39fq0RRRE5KtKyzGc1x/4es4Fcgh
	 tv9dqKkbDgNXmq7mvg1JQiYviB5eV4FxFg6QGSuXo365NyZIZQnqXF2RpT+o0lE+6k
	 eOoRguNJYHgOo7nM0S19qJjTViaMqGCgJI8H9q1mk9TvmjnRiXTyAnNkedQtHU7z47
	 ES1lZ2t5ss47MAyvbzJ/GE8sIncN2WqEPTAzDMVQ23hQ8PR+7jejnXy87mSkbjLQDr
	 zRX/bhxc+dzOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 674D760AA8;
	Fri, 30 Jan 2026 09:46:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BB5FE69
 for <buildroot@buildroot.org>; Fri, 30 Jan 2026 09:46:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8ABBF40AE6
 for <buildroot@buildroot.org>; Fri, 30 Jan 2026 09:46:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ng84nGyNp5pE for <buildroot@buildroot.org>;
 Fri, 30 Jan 2026 09:46:00 +0000 (UTC)
X-Greylist: delayed 1144 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 30 Jan 2026 09:44:54 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5AE340D13
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=60.248.187.195;
 helo=atcsqr.andestech.com; envelope-from=ycliang@andestech.com;
 receiver=<UNKNOWN> 
Received: from Atcsqr.andestech.com (unknown [60.248.187.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E5AE340D13
 for <buildroot@buildroot.org>; Fri, 30 Jan 2026 09:44:46 +0000 (UTC)
Received: from Atcsqr.andestech.com (localhost [127.0.0.2] (may be forged))
 by Atcsqr.andestech.com with ESMTP id 60U9SCX1035715
 for <buildroot@buildroot.org>; Fri, 30 Jan 2026 17:28:12 +0800 (+08)
 (envelope-from ycliang@andestech.com)
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
 by Atcsqr.andestech.com with ESMTP id 60U9P8GC034026
 for <buildroot@buildroot.org>; Fri, 30 Jan 2026 17:25:08 +0800 (+08)
 (envelope-from ycliang@andestech.com)
Received: from swlinux02 (10.0.15.183) by ATCPCS34.andestech.com (10.0.1.134)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 30 Jan
 2026 17:25:07 +0800
Date: Fri, 30 Jan 2026 17:25:04 +0800
To: Che-Wei Chuang <cnoize@andestech.com>
CC: <buildroot@buildroot.org>
Message-ID: <aXx48LeLjk27F1EK@swlinux02>
References: <20260111164921.2087908-1-cnoize@andestech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260111164921.2087908-1-cnoize@andestech.com>
User-Agent: Mutt/2.2.10 (e0e92c31) (2023-03-25)
X-Originating-IP: [10.0.15.183]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 60U9SCX1035715
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org; dmarc=permerror
 header.from=andestech.com
Subject: Re: [Buildroot] [PATCH] board/andes/ae350: bump to AndeSight v5.4.x
 and add OP-TEE
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
From: Leo Liang via buildroot <buildroot@buildroot.org>
Reply-To: Leo Liang <ycliang@andestech.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Jan 12, 2026 at 12:49:21AM +0800, Che-Wei Chuang wrote:
> Update the Andes AE350 board support to align with the AndeSight v5.4.x
> software stack. This update includes the following changes:
> 
> - Bump Linux kernel to v6.6.49, and update U-Boot and OpenSBI to the
>   corresponding AndeSight v5.4.x custom tarballs for the QEMU Andes
>   AE350 machine.
> - Add optional support for OP-TEE (Open Portable Trusted Execution
>   Environment) via config fragments.
> - Update genimage_sdcard.cfg to align the final SD card image size to a
>   power of 2, which is required for correct QEMU emulation.
> - Modify post-build.sh to install all generated DTBs rather than a single
>   hardcoded DTB.
> - Add a patch for optee-test to disable fragmentation calculation, fixing
>   a build failure caused by struct mismatch between optee-test 4.6.0
>   and the older optee-os 4.3.0.
> 
> Signed-off-by: Che-Wei Chuang <cnoize@andestech.com>
> ---
>  board/andes/ae350/genimage_sdcard.cfg         |   8 +-
>  board/andes/ae350/linux.config.fragment       |   1 +
>  board/andes/ae350/patches/linux/linux.hash    |   3 +-
>  .../andes/ae350/patches/opensbi/opensbi.hash  |   3 +-
>  .../patches/optee-client/optee-client.hash    |   2 +
>  .../optee-examples/optee-examples.hash        |   2 +
>  .../ae350/patches/optee-os/optee-os.hash      |   2 +
>  ...ble-fragmentation-calculation-for-ol.patch |  44 ++++++
>  .../ae350/patches/optee-test/optee-test.hash  |   2 +
>  board/andes/ae350/patches/uboot/uboot.hash    |   3 +-
>  board/andes/ae350/post-build.sh               |  12 +-
>  board/andes/ae350/readme.txt                  | 126 +++++++++++++++++-
>  .../boot/extlinux/extlinux.conf               |   1 -
>  board/andes/ae350/uboot-optee.config.fragment |   5 +
>  board/andes/ae350/uboot.config.fragment       |   5 +
>  configs/andes_ae350_45_defconfig              |  17 ++-
>  16 files changed, 215 insertions(+), 21 deletions(-)
>  create mode 100644 board/andes/ae350/linux.config.fragment
>  create mode 100644 board/andes/ae350/patches/optee-client/optee-client.hash
>  create mode 100644 board/andes/ae350/patches/optee-examples/optee-examples.hash
>  create mode 100644 board/andes/ae350/patches/optee-os/optee-os.hash
>  create mode 100644 board/andes/ae350/patches/optee-test/4.6.0/0001-xtest-stats-Disable-fragmentation-calculation-for-ol.patch
>  create mode 100644 board/andes/ae350/patches/optee-test/optee-test.hash
>  create mode 100644 board/andes/ae350/uboot-optee.config.fragment

LGTM.
Reviewed-by: Leo Yu-Chi Liang <ycliang@andestech.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
