Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C358BCA0ED3
	for <buildroot@archiver.kernel.org>; Wed,  4 Sep 2024 07:16:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6489940183;
	Wed,  4 Sep 2024 07:16:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NwuDiIgJsToS; Wed,  4 Sep 2024 07:16:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B09E4018C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B09E4018C;
	Wed,  4 Sep 2024 07:16:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D9BCB1BF356
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 07:16:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C3ED06084B
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 07:16:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Aoi0BwgWJ73R for <buildroot@lists.busybox.net>;
 Wed,  4 Sep 2024 07:16:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A87026084A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A87026084A
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A87026084A
 for <buildroot@buildroot.org>; Wed,  4 Sep 2024 07:16:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9FD9F240004;
 Wed,  4 Sep 2024 07:16:49 +0000 (UTC)
Date: Wed, 4 Sep 2024 09:16:48 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20240904091648.5819f5d3@windsurf>
In-Reply-To: <ZtdmT5wnGlYoBpkU@landeda>
References: <20240902210055.239859-1-dario.binacchi@amarulasolutions.com>
 <20240903213320.35490d86@windsurf> <ZtdmT5wnGlYoBpkU@landeda>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1725434210;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rYDeiOB3o5yexUi99eWHsiikag5YZReH7lncadoVqfU=;
 b=ghYmhmFIzStAghjns0TTjM27PJr0BdqX6fIE03+cnOxYfzwrIR0LbyBV+ar5dcPjnaQxAY
 oPd1/WHHBVnobHjG31UQEMab5xknIQQdaG+JcEPjmXU9Z7qdVXz9yxSkWApQqxHGfj79dL
 GAlY3LW/P0TNxJIbSH30HFDviqYNq7W8tYJxuOt0jsMwcTxIbgQkpagMSKDExuJBsv5vGU
 RWd/x/uhABOOEqN3Kl/RY0OcqgGRKzcUgl9cNBYVZKvlCZBs8AOw3NesnN82OxP2itI+fL
 SMnOuSX9EpKgmk2d92aiy+ccmT8aoBi2B1xkzIUp20J195gWraWXxWLJt8aZnw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ghYmhmFI
Subject: Re: [Buildroot] [PATCH 1/1] package/ipmitool: only accept local PEN
 registry
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
Cc: Floris Bos <bos@je-eigen-domein.nl>, Heiko Thiery <heiko.thiery@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Tue, 3 Sep 2024 21:41:03 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Damned, I looked but could not find it something like that... How did
> you find that?

I've used this thing called G-o-o-g-l-e :-)

> But should it be a separate package, that installs a subset of the data
> files, or should it be an IPMITOOL_EXTRA_DOWNLOAD?

I don't have a super strong opinion. I think a separate package would
make sense if multiple packages needed this IANA data. If that's not
the case, I would handle it with an EXTRA_DOWNLOADS in ipmitool (and we
can always change it to a separate package later on).

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
