Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 668A3D0D150
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:49:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B11C40A1C;
	Wed,  7 Jan 2026 17:49:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uG0wP9oz-CCc; Wed,  7 Jan 2026 17:49:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D17540D64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808184;
	bh=R9rNidgGtbnzx1B9nwecQDlXECS0w7sDiNkRlvBvWig=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CiuEbCZeDiW2uDCInXPb4Heiz0XLZj3FsVxmkCfulyRtHLe3Hp5UNRS8ldWyi5Pgk
	 LxNxm2QmqoY2yP0RaRA4wChNGPOGwy/UWQnlpOpIgSVFx/GRNfRE3EPxR3YsdZOjVg
	 AVfW6cTNDbwvm/H4PNFjHDsIJ75+6eJ4yaO8qVbHFpRdOEZoJGH4dcas3hDHFm77jA
	 7vmDrIv5OeRocZRpMHLS+thlRCvit69ZHdHa1iLPsyti7aycuNbDoUkm7ylIMcwjcp
	 ju9ngkUT57AEHdoRDDL3QSTQp7D00fFZy0UAH/DJcJ3hBnEUAFX1jBy66WVwQCDxGL
	 mbk86DseGkYHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D17540D64;
	Wed,  7 Jan 2026 17:49:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DC9C625B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:49:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CEA2F40ACA
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:49:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rcAy-kB5zYFQ for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:49:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B89714093B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B89714093B
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B89714093B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:49:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D3448B97A70C; Wed,  7 Jan 2026 18:49:39 +0100 (CET)
To: Julien Olivain <ju.o@free.fr>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:49:37 +0100
Message-ID: <20260107174937.225414-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251219210957.556930-1-ju.o@free.fr>
References: <20251219210957.556930-1-ju.o@free.fr>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808180; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=4O1FXhAAZ9f2zqIpwCxd6zQ9mNcIZAkMNWCIb6LyXn4=;
 b=nUEurNZzdT81Bk9MzdwVeEE623rlIwpnCZ1YKBUAaqhF93XiU8O34jNbflN2BubE0iRfVW
 DZ2n4uTPki3SljVoiJWAVHE302KMYnHxJmD4DIwsQt4wWz+WFZmGwjDzJiL+Me8gJ+PGTg
 gYX1ubGilzzHjLWT8sCPwZKBTUXKenRhj0Thb6eMSaG5Rs54tNV1U2sL6kQTrfO7aC427L
 AGpxptj3IiVbmxdtJzj89ZuCxaTUB04RqmUv+INYPYvR0VPqBesRBrWNtsDluiwd1y3joc
 kjhEq814rhI0clVbQxzmI1PAD25ovXznU8agVDu24AMeqjwxXBZCk8e1TaypPg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=nUEurNZz
Subject: Re: [Buildroot] [PATCH 1/4] support/testing: ddrescue: use dmsetup
 from lvm2
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> The ddresue runtime test is using the `dmsetup` command provided by the
> dmraid package. This package is outdated and will be removed. This
> command is also provided by the lvm2 package, which is still maintained.
> 
> This commit replaces the dmraid package by lvm2 in the test config.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  support/testing/tests/package/test_ddrescue.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/support/testing/tests/package/test_ddrescue.py b/support/testing/tests/package/test_ddrescue.py
> index 989abc8f01..042431eb7b 100644
> --- a/support/testing/tests/package/test_ddrescue.py
> +++ b/support/testing/tests/package/test_ddrescue.py
> @@ -9,7 +9,7 @@ class TestDdrescue(infra.basetest.BRTest):
>      # - A kernel config fragment enables loop blk dev and device
>      #   mapper dm-dust, which are used to simulate a failing storage
>      #   block device.
> -    # - dmraid user space package is needed to configure dm-dust
> +    # - lvm2 user space package is needed to configure dm-dust with dmsetup
>      config = \
>          """
>          BR2_aarch64=y
> @@ -23,7 +23,7 @@ class TestDdrescue(infra.basetest.BRTest):
>          BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
>          BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
>          BR2_PACKAGE_DDRESCUE=y
> -        BR2_PACKAGE_DMRAID=y
> +        BR2_PACKAGE_LVM2=y
>          BR2_TARGET_ROOTFS_CPIO=y
>          BR2_TARGET_ROOTFS_CPIO_GZIP=y
>          # BR2_TARGET_ROOTFS_TAR is not set
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
