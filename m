Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 745E2C25B10
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 20:32:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34FAF612F4;
	Thu,  9 May 2024 20:32:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ARpmz-RRh45d; Thu,  9 May 2024 20:32:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44DC26131A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44DC26131A;
	Thu,  9 May 2024 20:32:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E0FA81BF31C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:32:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C8A8D61314
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:32:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SaD--YGSPBOg for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 20:32:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 96DB3612CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96DB3612CE
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 96DB3612CE
 for <buildroot@buildroot.org>; Thu,  9 May 2024 20:32:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8360760004;
 Thu,  9 May 2024 20:32:02 +0000 (UTC)
Date: Thu, 9 May 2024 22:32:01 +0200
To: Alexander Egorenkov <egorenar@linux.ibm.com>
Message-ID: <20240509223201.2835ced1@windsurf>
In-Reply-To: <20240429053410.57334-1-egorenar@linux.ibm.com>
References: <20240429053410.57334-1-egorenar@linux.ibm.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715286722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CMG2hQUAmNAp0aI/LtjFInYrFn/eo/iCESVukARe9F0=;
 b=IPbB9jnj8UR6iTaI96Yln3xXLoiQsMbIWx9rttKGMQhD6xQNDayG6XvYMMA3padg1E2Pug
 /3z3lZ2MFINaSIxvp+h4uEc6peBY6zrafGtSPvsANFqb3qWnL9V4w6bI6jXQowFtOePIUZ
 fqJUhB2LzVVBp/nb2nPgSU8LRgzqzcp+x1PFLTRHIwhw/tH8gi54+HOvrFC3fZbnzhbbyy
 PbZPHKJHxKozluy8rR/9Cj4X1PGALAoEr4fZ70j+WccyLnA2T9VrcF9z6yE4KzhtrjY0mV
 NDto6/1DCULQVvZ6QjMvL0i1hsA7sVHDzp7/6bLbUVR0l6bShU4GVB9nAsZc0Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IPbB9jnj
Subject: Re: [Buildroot] [PATCH 1/1] package/s390-tools: bump version to
 2.32.0
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

On Mon, 29 Apr 2024 07:34:10 +0200
Alexander Egorenkov <egorenar@linux.ibm.com> wrote:

> Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
> ---
>  package/s390-tools/s390-tools.hash | 2 +-
>  package/s390-tools/s390-tools.mk   | 2 +-
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
