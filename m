Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16BBDC27C54
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 11:03:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF67260604;
	Thu,  6 Jun 2024 11:03:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rVE7-cd9FNVK; Thu,  6 Jun 2024 11:03:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF5FE60780
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF5FE60780;
	Thu,  6 Jun 2024 11:03:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 83EB21BF5E0
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 11:03:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C91E401E4
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 11:03:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FaxniDGR26el for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 11:03:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 38B3A401DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38B3A401DC
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 38B3A401DC
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 11:03:47 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 9643813F88D;
 Thu,  6 Jun 2024 13:03:38 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 06 Jun 2024 13:03:38 +0200
Date: Thu, 6 Jun 2024 13:03:38 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Jarkko Sakkinen <jarkko@kernel.org>
Message-ID: <ZmGXisKDjGBFJNFV@landeda>
References: <20240606104813.1514-1-jarkko@kernel.org>
 <20240606104813.1514-4-jarkko@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240606104813.1514-4-jarkko@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717671825;
 bh=fa/M66m8VK6wARBO8IUljjRcVoy5+o3EBCSOJW3IKHs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aCm+Nu8qxMNdzdeXL8p6i/sLWlwfw8iP0vkWws3+At/GDsJ7/9Iy22RcfLEQhIQgY
 xHb56bW15yWPkEMfZ1+b0EBSCwU7mfs7522MjIqMq8KLr9v0jWHSgUjkJ81t2T8Ao9
 xxJ5ixsPp/tnbQ525Mv9+Q9fxIkHe10TxormwTgaNpQz25r+Y9FhfaXwgAYR+dZ7LH
 EcOM3faL/JA7LDUzmGfmxFV49mHCw5K2Sajyjbyw1bL6geW6RyZcWax5juPiHvUJJ2
 2m8hAsFBs4BC23vwbLpQAT/B2X35q6Vi0TkWthgP13bStjHee5vkcAcxhtasvycWnr
 m5Hl0JtgevwjA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=aCm+Nu8q
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

On 2024-06-06 13:48 +0300, Jarkko Sakkinen spake thusly:
> The following superblock identifiers are missing:
> 1. BCACHEFS_SUPER_MAGIC
> 2. PID_FS_MAGIC

Does that already happen with systemd 254?

  - if yes, then this change should be sent before the version bump:
    first, bug fixes, then new features;
  - if not, then this patch should be included in the patch that does
    the version bump, otherwise the version bump by itself is broken.

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
