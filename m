Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8873FC6182
	for <buildroot@archiver.kernel.org>; Fri, 13 Sep 2024 22:17:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69A1E4245F;
	Fri, 13 Sep 2024 22:17:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FxnMi-Z-IlbG; Fri, 13 Sep 2024 22:17:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65F334027D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65F334027D;
	Fri, 13 Sep 2024 22:17:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1C8201BF2BE
 for <buildroot@lists.busybox.net>; Fri, 13 Sep 2024 22:17:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 06CB441E0B
 for <buildroot@lists.busybox.net>; Fri, 13 Sep 2024 22:17:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id suoE3Bd1f4yq for <buildroot@lists.busybox.net>;
 Fri, 13 Sep 2024 22:17:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 93A1041A4F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93A1041A4F
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 93A1041A4F
 for <buildroot@buildroot.org>; Fri, 13 Sep 2024 22:17:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 54C36FF802;
 Fri, 13 Sep 2024 22:17:44 +0000 (UTC)
Date: Sat, 14 Sep 2024 00:17:43 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240914001743.6af877c7@windsurf>
In-Reply-To: <20240911202439.652700-1-james.hilliard1@gmail.com>
References: <20240911202439.652700-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726265864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kPYDBk09zoAL1uSpbj8X9SNmaKIvlwNf+V5XuaoVF0Y=;
 b=oI/2QI8K08tBoOGvR150cnAOxEzJDEUjjKkNRU/SJBdSY1elEefokojUpkYj6pK3SoAvCy
 195+yjWaN9NjTitzWnTtd8Chvu+CW9ZtSCOKoVbCeWe0hKAVCpqP8iehL9/Wn78Ecjo+Wu
 ETje53xObybyvdWpInOgq1uDxJ18Ff4DDTsyIhNdvvLDgLt81V1yXtMXCQsrQ2bp6Qa9HW
 jNB6B3+DHA+3+I7i4QGRnRihkA4jJ4ayfNsF5+I5w2cyVnuFmQ4NTZbnrABKnAWwVH2kPV
 VcrkKwz2iXpJkZZ0wh0jWxZBYVW5pZtFMFfV5QkHUFn+yDEQm/97XVkbGe1hVg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oI/2QI8K
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aiocoap: bump to version
 0.4.11
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 11 Sep 2024 14:24:39 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> doc/LICENSE.rst hash changed due to additional details added:
> https://github.com/chrysn/aiocoap/commit/cbd0d1feb74b0905b517f0e51d1eb258668bfeb0
> 
> Add additional license files as well.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-aiocoap/python-aiocoap.hash | 8 +++++---
>  package/python-aiocoap/python-aiocoap.mk   | 8 ++++----
>  2 files changed, 9 insertions(+), 7 deletions(-)

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
