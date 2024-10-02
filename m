Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20011CF31BA
	for <buildroot@archiver.kernel.org>; Wed,  2 Oct 2024 20:51:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B31B580D48;
	Wed,  2 Oct 2024 20:51:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4jqynSR6BTcb; Wed,  2 Oct 2024 20:51:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1F3680D9D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1F3680D9D;
	Wed,  2 Oct 2024 20:51:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ADE6D1BF47D
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 20:51:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A9764410CA
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 20:51:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BD0bYJ7S4m12 for <buildroot@lists.busybox.net>;
 Wed,  2 Oct 2024 20:51:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 40FA8410C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40FA8410C8
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 40FA8410C8
 for <buildroot@buildroot.org>; Wed,  2 Oct 2024 20:51:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 77B46FF802;
 Wed,  2 Oct 2024 20:51:27 +0000 (UTC)
Date: Wed, 2 Oct 2024 22:51:26 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20241002225126.734e5930@windsurf>
In-Reply-To: <20240928215050.3358893-1-james.hilliard1@gmail.com>
References: <20240928215050.3358893-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1727902287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1Qdp5ZSsUwvr0ULolW3z6q+ihHioSVckeMIZAn0+aA0=;
 b=EcKR3ufbqfKzexhnJSs2vBElYOMqIVehg+fOe4+ciRSf2pK9QJvQKHoYV4JbdBAUlKlD6K
 H8S/92N40pL4XyhKHxN9YiNfUz+TvPft3NaICFa5it183HNkKU/0vignbunMMZrvIaNQy2
 BXmEEieRs32h0AvAtjyGXLK6gYh9QTaOcJcjnOrp+V9M7XON9meTn6Xif2AU9FrtfOGMXU
 om5ouiwIm1QxcKI5XO8bPaHizgMTqJINh2AJIo+OTG1ZfC/sV+Iuuh0gaHIpXlBF/9xwV/
 3lQ4+vv9rG2HSiwmAYbdlgIhaVHdjuvutY00eeZVaVzS3OZGOCL2N5oeWIz/TQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EcKR3ufb
Subject: Re: [Buildroot] [PATCH 1/1] package/{bluez5_utils,
 bluez5_utils-headers}: bump to version 5.78
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
Cc: Grzegorz Blach <grzegorz@blach.pl>, Marcin Bis <marcin@bis.org.pl>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 28 Sep 2024 15:50:50 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/bluez5_utils-headers/bluez5_utils-headers.mk | 2 +-
>  package/bluez5_utils/bluez5_utils.hash               | 2 +-
>  package/bluez5_utils/bluez5_utils.mk                 | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

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
