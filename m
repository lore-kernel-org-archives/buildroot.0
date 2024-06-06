Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC2A2C25B75
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 11:14:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 750A0605FA;
	Thu,  6 Jun 2024 11:14:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6xf1FN6UzOCw; Thu,  6 Jun 2024 11:14:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E0AD60752
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E0AD60752;
	Thu,  6 Jun 2024 11:14:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 627A01BF591
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 11:14:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52F3581F3C
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 11:14:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0CDByPXPG9H0 for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 11:14:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2901B81F01
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2901B81F01
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2901B81F01
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 11:14:33 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 25D9F13F89A;
 Thu,  6 Jun 2024 13:14:25 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 06 Jun 2024 13:14:24 +0200
Date: Thu, 6 Jun 2024 13:14:24 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Jarkko Sakkinen <jarkko@kernel.org>
Message-ID: <ZmGaEE7E0c2FzWpN@landeda>
References: <20240606104813.1514-1-jarkko@kernel.org>
 <20240606104813.1514-4-jarkko@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240606104813.1514-4-jarkko@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717672471;
 bh=nzfNW/zqjFswpX9bZX0QL01Dj1TSCFYblMTvp8Vja4s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qJMI65gouHZdqIFAdQCax3muT55ZGp93DlaO4xt7YnvPAQ/h6wA9m17uXYu3NyGdF
 pAFiFC/fE5CBgvv818v4MT8Ksyq2OUzdcAcxC8d/oj4eYfOOdVC4KmVcGwQ/MWIOQy
 CVNqPMSkCZ2iS2TApTVBVPYDeVNM8uHHrlD/eg44jCefh9xXFHVYQqwm7qcYdu/0NS
 hY/8GZn2Cc8My7w9+STuvp4XR8AQfoCkF4xKlvO//yHyUo7w9TeQN78Ob2QDDkmtTi
 yMvczIsPcUDlIUwnpRkYHUNjGPHgP0mrZutwhs8fQDqLD4lKQVdXptpnEVs47Scq3r
 pg58w5BXsPR+g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qJMI65go
Subject: Re: [Buildroot] [PATCH v2 3/3] package/systemd: add the missing
 superblock identifiers
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
Cc: Stefan Berger <stefanb@linux.ibm.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Erik Larsson <karl.erik.larsson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Jarkko, All,

Sorry, I forgot something in the previous review...

On 2024-06-06 13:48 +0300, Jarkko Sakkinen spake thusly:
> The following superblock identifiers are missing:
> 1. BCACHEFS_SUPER_MAGIC
> 2. PID_FS_MAGIC
[--SNIP--]
> diff --git a/package/systemd/0001-basic-add-pidfs-magic-31709.patch b/package/systemd/0001-basic-add-pidfs-magic-31709.patch
> new file mode 100644
> index 0000000000..683f91dbb7
> --- /dev/null
> +++ b/package/systemd/0001-basic-add-pidfs-magic-31709.patch
> @@ -0,0 +1,50 @@
> +From 5cffe2484bbc6ec4b5b721094936f510a81c5167 Mon Sep 17 00:00:00 2001
> +From: cpackham-atlnz <85916201+cpackham-atlnz@users.noreply.github.com>
> +Date: Tue, 12 Mar 2024 00:55:36 +1300
> +Subject: [PATCH 1/2] basic: add PIDFS magic (#31709)
> +
> +Kernel commit cb12fd8e0dabb9a1c8aef55a6a41e2c255fcdf4b added pidfs.
> +Update filesystems-gperf.gperf and missing_magic.h accordingly.
> +
> +This fixes the following error building against a bleeding edge kernel.
> +```
> +../src/basic/meson.build:234:8: ERROR: Problem encountered: Unknown filesystems defined in kernel headers:
> +
> +Filesystem found in kernel header but not in filesystems-gperf.gperf: PID_FS_MAGIC
> +```

You forgot to add an "Upstream:" tag:

    https://buildroot.org/downloads/manual/manual.html#_additional_patch_documentation

Applicalble to both bundled patches.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
