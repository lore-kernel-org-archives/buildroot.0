Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A475AE7718B
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 21:21:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75026813ED;
	Sun, 29 Dec 2024 21:21:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ER0_WzVjJRmR; Sun, 29 Dec 2024 21:21:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96955813EA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96955813EA;
	Sun, 29 Dec 2024 21:21:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B23572
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 21:21:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3BE3040232
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 21:21:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V9LFfe7vavc1 for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 21:21:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 189D340231
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 189D340231
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 189D340231
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 21:21:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 349F41BF203;
 Sun, 29 Dec 2024 21:21:19 +0000 (UTC)
Date: Sun, 29 Dec 2024 22:21:18 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Petr Vorel <petr.vorel@gmail.com>
Message-ID: <20241229222118.052d8d19@windsurf>
In-Reply-To: <20241211210934.179268-1-giulio.benetti@benettiengineering.com>
References: <20241211210934.179268-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735507279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WCBkg4u2F4qRZfl3KgcAPy6Ie4r+XKB9gKeYPNErwVI=;
 b=BvzA7pQQ5lMVsn17PrfS69m8pRhObjjAbwy05FLoqmMh/lHnZc49iqek+PXSZnO0P6j5Ey
 sGSeMcDzaU0i1sO/3DMVOFGjh/26BS/WLfbYH9jS8Uy40htyVVTcwl2p09MFU16sCgDi8C
 7/36Ots63zwUjVtWU81uqsgV8VdMVYnE4Qc8RMzIYfk/Bfm/GUhhHrxtRadVms/moLcccZ
 9yTLLZxycC2XilAojLDvWQc1+qCAcsIOEyIcssXpU+964N+Zl+ntacX4hGcWp66c3F1ELH
 Myss0n6e/SfFO372IPgDMbLXctlxhRbFMqtR2KiaZtnAvpO/HyWnG9XS6Iz5sg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BvzA7pQQ
Subject: Re: [Buildroot] [PATCH] package/nfs-utils: bump version to 2.8.2
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

On Wed, 11 Dec 2024 22:09:34 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/nfs-utils/nfs-utils.hash | 4 ++--
>  package/nfs-utils/nfs-utils.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks. However, this was extremely confusing as
this patch was not based on master, but on your previous bump, which
hadn't been merged yet. Please try to avoid this: if a previous patch
has not been merged, the new patch should replace the previous one, not
come on top of it.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
