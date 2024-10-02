Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9671ACF8542
	for <buildroot@archiver.kernel.org>; Wed,  2 Oct 2024 21:03:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 583CA41C73;
	Wed,  2 Oct 2024 21:03:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n7N5xa9g9-V7; Wed,  2 Oct 2024 21:03:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4194B4140E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4194B4140E;
	Wed,  2 Oct 2024 21:03:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0268F1BF30E
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 21:02:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 63A2440659
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 21:02:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 50vLOZl7gJ2n for <buildroot@lists.busybox.net>;
 Wed,  2 Oct 2024 21:02:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 147F0405C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 147F0405C1
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 147F0405C1
 for <buildroot@buildroot.org>; Wed,  2 Oct 2024 21:02:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A9A7440002;
 Wed,  2 Oct 2024 21:02:28 +0000 (UTC)
Date: Wed, 2 Oct 2024 23:02:27 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20241002230227.0dac2026@windsurf>
In-Reply-To: <20240926151542.7988-1-james.hilliard1@gmail.com>
References: <20240926151542.7988-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1727902949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LMBzJkzx37nyEewxApqYdyuTqSE1AjwBExaZDheJrDs=;
 b=YC+ucaKTLlIgVhvSBzxBT5yhVXQCxScPm3sJv/Y7G50xzHZjx1Zm0ZFRHDJj83KHdDjC4y
 TWwknDQUWG+RNEz1gJUQhHdZLy6FIj36Egb3L5fkH6bOR5gdWAgWUN6Tz2uw/co5O/kVEG
 beL0LB0eHVBflgkZFIJX34w4Uyfah4L7elfdK5EUu7a1a8l8RRjwBDD2ZdHbt+oc0pHQKa
 NwSfV/oV1+AbQFZI/v4/ChFU9nxNgor1/G3fQsvMbFStpbWyOMjPEglRW/vRDxzg5XgDFs
 dZe9s5T1MaiJAXGCdHkux5RYe3vRP4FGzs96kEHrWBwB9uY+qldnplftAK0w5g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YC+ucaKT
Subject: Re: [Buildroot] [PATCH v2 1/1] package/python-aiohttp-session: bump
 to version 2.12.1
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

On Thu, 26 Sep 2024 09:15:42 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes v1 -> v2:
>   - fix typo
> ---
>  package/python-aiohttp-session/python-aiohttp-session.hash | 4 ++--
>  package/python-aiohttp-session/python-aiohttp-session.mk   | 6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)

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
