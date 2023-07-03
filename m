Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 981CAC001DD
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 20:00:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D9C281EF9;
	Mon,  3 Jul 2023 20:00:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D9C281EF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OErPPEP9cgQa; Mon,  3 Jul 2023 20:00:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8678181F2F;
	Mon,  3 Jul 2023 20:00:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8678181F2F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9611B1BF34B
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 20:00:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6FF9A81B8A
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 20:00:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FF9A81B8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2509_yKOubSe for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 20:00:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F59B81F47
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7F59B81F47
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 20:00:06 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 13399240009;
 Mon,  3 Jul 2023 20:00:03 +0000 (UTC)
Date: Mon, 3 Jul 2023 21:59:26 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230703215926.69c0f67e@windsurf>
In-Reply-To: <20230703191617.1338283-1-giulio.benetti@benettiengineering.com>
References: <20230703191617.1338283-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1688414405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eXNYB4Ug8kUm+JwzrvfOl0loO6liuBUEoevmvFP6Cyo=;
 b=US2npviA6ir9oemrqzC5D2o+WwWX6bwaCRgjPG0pxlsvRxtAsRkGN5BABSARJAA+XhHczG
 xU/riMDjvyRvszbLdQi5VlUqmOe+2aKrDgEXOI2slgZjSWZHUkTlIZ7bYST3GnNs6WGf3p
 h96BjaLhacPeMdci5OPZctzPl90gCjjsU/a2Oa2ynSfKCqBH6I7sm55BPOxAKWt+9D10Pl
 hM+SZiI7Uu9laGhwJgOPyWx/8+ApJCYqad9EhtYvs4AvtSY8cGxA62wgPhEaCVMb7w4z/5
 Vu1/aORxiAo1W7pUpn8NSN0sMn26Ddg+f860aoKmT/XjfdgprexJeXov24LULA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=US2npviA
Subject: Re: [Buildroot] [PATCH] package/rtl8192eu: bump to version
 2023-06-23
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  3 Jul 2023 21:16:15 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> It now supports building with Linux version > 6.1
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/rtl8192eu/rtl8192eu.hash | 2 +-
>  package/rtl8192eu/rtl8192eu.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

This patch doesn't apply cleanly on the current master. Are you sure
it's based on master?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
