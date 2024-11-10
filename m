Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCD6CD12D4A
	for <buildroot@archiver.kernel.org>; Sun, 10 Nov 2024 16:48:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9EA216078B;
	Sun, 10 Nov 2024 16:48:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qszvFhRe2sXy; Sun, 10 Nov 2024 16:48:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACDA2607A1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACDA2607A1;
	Sun, 10 Nov 2024 16:48:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BE212DAC
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 16:47:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA425403D4
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 16:47:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gyAIQ6pdGJ4T for <buildroot@buildroot.org>;
 Sun, 10 Nov 2024 16:47:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AC6704031C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC6704031C
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AC6704031C
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 16:47:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 10882FF805;
 Sun, 10 Nov 2024 16:47:52 +0000 (UTC)
Date: Sun, 10 Nov 2024 17:46:49 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Asaf Kahlon <asafka7@gmail.com>
Message-ID: <20241110174649.7aa6df97@windsurf>
In-Reply-To: <20241109165339.561735-1-james.hilliard1@gmail.com>
References: <20241109165339.561735-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1731257272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8f4uDt3YoDJ3cgD4kFEKiaY9o36JR0GGKa/fho0QcHo=;
 b=dLq/0UO4cOrKi7ufF1bNGOAaAT2SOCEVDXnA584zrzeHux2ZfZ00CCnpE+JuxaKpAf+k+T
 WeM1tUttL/CpRrI+j9li0g+7QuWj/fGr32fvSKidPVec7w/voqpEm25Wu0G3zj8mYa53iz
 hNgNxVEBDoZS1eKBimO0xywqjHKqwMeXyixf0JaWNsG3/Q901xQvAGXPT8PhrP5OxWvdDZ
 QBx7KP6QCaDTa/w95fj9+lCfzcDA8MUBgvIi/+o3h7OiG6Awmq9ntcjsnCCNrO5SLY5fnV
 pJoh4rNJOP/QEsfw370Z1eWufd4qSokmMcfUqTgJj4w9LqBMDtGs3vfuQdIP5g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dLq/0UO4
Subject: Re: [Buildroot] [PATCH 1/1] package/python-async-timeout: bump to
 version 5.0.1
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

On Sat,  9 Nov 2024 09:53:39 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-async-timeout/python-async-timeout.hash | 4 ++--
>  package/python-async-timeout/python-async-timeout.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
