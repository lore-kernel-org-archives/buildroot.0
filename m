Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 860EDC3DA64
	for <buildroot@archiver.kernel.org>; Thu,  1 Aug 2024 20:59:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29E6F80A5C;
	Thu,  1 Aug 2024 20:59:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hXqeF5MRYuU5; Thu,  1 Aug 2024 20:59:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2800880B27
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2800880B27;
	Thu,  1 Aug 2024 20:59:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 065691BF232
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 20:59:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7D12409F2
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 20:59:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Y-EEY5TiqXY for <buildroot@lists.busybox.net>;
 Thu,  1 Aug 2024 20:59:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A04EA40997
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A04EA40997
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A04EA40997
 for <buildroot@buildroot.org>; Thu,  1 Aug 2024 20:59:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A451760004;
 Thu,  1 Aug 2024 20:59:26 +0000 (UTC)
Date: Thu, 1 Aug 2024 22:59:25 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240801225925.405d1743@windsurf>
In-Reply-To: <20240731203143.318400-1-ju.o@free.fr>
References: <20240731203143.318400-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722545966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+xUroh7Qf6pJZIlGOjy04uShjkSKNhXG1o7YE2Lysw8=;
 b=j4Ize8fjeyLYNjFczaET/mDPNx3mSKum12FJmyM8qpDA+51nH/ggNZDE6vL76Kn4MnyF2U
 hizw6TPBFsasqVesbbd18bW5PtHuQ84nStULBxPMCmiAaWEUH5Mnl6mSsvg+S5j+HOVrHS
 d2Zo7pCjdFpo6DP6BIco4y4Pr/He2Iy68SKwESeMaHpvxCz8KVVjqw5k7RggUL1g69AkSC
 EdWTPulx28nSZo+tdtA9JY/vmucyKCNTnwjqk8fzCbOk3vENEGEGkndnCIOJv0PtRbcHsC
 knz9xMvctiRScJbETGclABMCDf1flYlCn1oPKCw+T0LwUeMFaghx8IkECL0jMw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=j4Ize8fj
Subject: Re: [Buildroot] [PATCH 1/1] package/btrfs-progs: bump version to
 6.10
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 31 Jul 2024 22:31:43 +0200
Julien Olivain <ju.o@free.fr> wrote:

> For change log since v6.9.2, see:
> https://github.com/kdave/btrfs-progs/blob/v6.10/CHANGES
> 
> This commit also drops the two package patches, which are now
> included in this release.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  ...compat-fix-fallthrough-definition-fo.patch | 63 --------------
>  ...uClibc-ng-compatibility-for-printf-f.patch | 85 -------------------
>  package/btrfs-progs/btrfs-progs.hash          |  2 +-
>  package/btrfs-progs/btrfs-progs.mk            |  2 +-
>  4 files changed, 2 insertions(+), 150 deletions(-)
>  delete mode 100644 package/btrfs-progs/0001-btrfs-progs-kerncompat-fix-fallthrough-definition-fo.patch
>  delete mode 100644 package/btrfs-progs/0002-btrfs-progs-add-uClibc-ng-compatibility-for-printf-f.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
