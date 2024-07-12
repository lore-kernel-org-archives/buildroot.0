Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ECFDC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 10:57:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6606241963;
	Fri, 12 Jul 2024 10:57:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WBuB7X7w_1kV; Fri, 12 Jul 2024 10:57:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47E1C41964
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47E1C41964;
	Fri, 12 Jul 2024 10:57:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0C3B21BF47F
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 10:57:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04B3841964
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 10:57:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id upBAWZ8YlJ-V for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 10:57:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8AE3241963
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AE3241963
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8AE3241963
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 10:57:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 85D3B60004;
 Fri, 12 Jul 2024 10:57:05 +0000 (UTC)
Date: Fri, 12 Jul 2024 12:57:04 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20240712125704.3b23486f@windsurf>
In-Reply-To: <20240618092329.800791-1-giulio.benetti@benettiengineering.com>
References: <20240618092329.800791-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720781825;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9392OmgDJep8XT7drZdLzlz3gFRyljoYsbTMjY8SMek=;
 b=lDx+pjEg3qUikAA50K01PnpEHjpfp05smuzupGV/mTZoKJEOhYWvBycq2koEEaFu0TZHlA
 d/JVJ3KDtbfmozX9j1iivK7nxHZts6gXyg59aU42XRLDXupHOCSendCpGQNGmIwUC5Yjg7
 mTYN8DyVtdPIXU+AlLt4CUuiNBKntHul6k7msPla26t3lichdpwv21Ohi6TWXOh3421IGA
 STWS7ZPEvHWVYQPSNqGxcVGeMm9BpuF+OQnJCrbKsM2oKuNQl5oDZmyWII71Tf0RHHZWFL
 uRjVwMN+b9AIYdE1oqvRoQlKtLHRa7Vt8dZ+FyhQb7FkmYcsw8xLNmq70l/xfQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lDx+pjEg
Subject: Re: [Buildroot] [PATCH] package/cryptsetup: bump version to 2.7.3
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

On Tue, 18 Jun 2024 11:23:29 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/cryptsetup/cryptsetup.hash | 2 +-
>  package/cryptsetup/cryptsetup.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
