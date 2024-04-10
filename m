Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01E1BCD11C2
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 21:35:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DA7860EC0;
	Wed, 10 Apr 2024 21:35:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KrPMvGTE43v8; Wed, 10 Apr 2024 21:35:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF79660C2D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF79660C2D;
	Wed, 10 Apr 2024 21:35:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AAFF91BF4D6
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 21:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A4CC260E8D
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 21:35:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oTwcs_tUmcvY for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 21:35:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8E98460EB6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E98460EB6
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8E98460EB6
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 21:35:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 949B2E0004;
 Wed, 10 Apr 2024 21:35:05 +0000 (UTC)
Date: Wed, 10 Apr 2024 23:35:04 +0200
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20240410233504.40c8ca75@windsurf>
In-Reply-To: <20240329185246.387792-1-adam.duskett@amarulasolutions.com>
References: <20240329185246.387792-1-adam.duskett@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1712784905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KcCT2ZR8uYTKkl8YICypX/9BBDMMn/5ftkAsnYSrlCU=;
 b=g7b+O60nJZp2+BJDD4Cqciqtzy53kfoJQC42Ut2zBqSUS+n0pgodAEpuIgOT7iHAaTE+Ri
 Ig5pO6asGRQ4NTw5GYBr39aVQ8MNyYpZj1/A0vtd3DdY+8Kw/5ckcT6f0hhph/AaPWVE1v
 ixIogPWhrpejAOMNjKRfE8iZ5CZTtvcNUpo6D7S9n4jkMMHpxAyyOCtZLJsNwsREGRxtMH
 Eh+GiniUEtqkM/JvZOiTIXhZfTzzvga1laUfcTxgbxXxfFoC7mCuHuLjTT9nInsu/n64qa
 tDGo5VkFydIdFpSfNOoT2Tqmc6fVNpWGukmV+qAZdIAfmzGirY1S9PIDedGe6A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=g7b+O60n
Subject: Re: [Buildroot] [PATCH 1/2] package/flutter-sdk-bin: bump version
 to 3.19.5
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

On Fri, 29 Mar 2024 12:52:45 -0600
Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>  package/flutter-sdk-bin/flutter-sdk-bin.hash | 2 +-
>  package/flutter-sdk-bin/flutter-sdk-bin.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Series applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
