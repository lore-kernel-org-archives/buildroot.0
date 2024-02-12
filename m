Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E25C4829D
	for <buildroot@archiver.kernel.org>; Mon, 12 Feb 2024 21:54:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5B03400D9;
	Mon, 12 Feb 2024 21:54:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lhpYEDnSzE-9; Mon, 12 Feb 2024 21:54:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0D57400DA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0D57400DA;
	Mon, 12 Feb 2024 21:54:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EAB371BF853
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 21:54:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D7E7A60597
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 21:54:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jYz1OsayxCjS for <buildroot@lists.busybox.net>;
 Mon, 12 Feb 2024 21:54:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B2DD360087
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2DD360087
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B2DD360087
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 21:54:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 19E1E60002;
 Mon, 12 Feb 2024 21:54:26 +0000 (UTC)
Date: Mon, 12 Feb 2024 22:54:26 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20240212225426.25d80a95@windsurf>
In-Reply-To: <20240212202708.3514522-1-giulio.benetti@benettiengineering.com>
References: <20240212202708.3514522-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707774867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q5tQKDHM6XEfGTgT/hQT4lWtUEayK8D0sxE1cJaUATc=;
 b=E7WO4BE2HA/42xpj8CW+6tG0919sfZF6x+lTSFDORf3KYsTJZEHD27gsf4YmGOR51PLu29
 WzBGKiKsSFPYUQmTXHHTQFJNYrA+H479ks/RH1AQk7Psa3/NoORCKyzXjJWzPVSAyhKmQ2
 yJDPLL9OYU9NrVPnj0sWZHPIDqql///zVD9rgHxaLCjf/tCWFx5aouWt4krb8YHmCBOfTt
 xDesUjSikkkuCaZoG65Ob03TANOVoKZNuKvDUHSfn+DWFukUAPpijINR9V1wvBWhXNmTLz
 QoW14RMcuAIG6Z42hvTNRgaHNE/Ey4H121NVaCoyNKbndqSt0N7hrA4acOf+xw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=E7WO4BE2
Subject: Re: [Buildroot] [PATCH] package/rtl8192eu: bump to version
 2024-02-09 on branch 5.11.2.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 12 Feb 2024 21:27:08 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> It supports up to Linux 6.8.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/rtl8192eu/rtl8192eu.hash | 2 +-
>  package/rtl8192eu/rtl8192eu.mk   | 2 +-
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
