Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F385D10BFA
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 14:00:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F5CC81E8F;
	Sat, 26 Oct 2024 14:00:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ltTJrptmmRjO; Sat, 26 Oct 2024 14:00:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D5F081EA1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D5F081EA1;
	Sat, 26 Oct 2024 14:00:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CC75C5C52
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:00:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A8189410A9
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:00:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T4BJeq1xDvBa for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 14:00:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5B35C40EC5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B35C40EC5
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5B35C40EC5
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:00:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3CF94FF802;
 Sat, 26 Oct 2024 14:00:16 +0000 (UTC)
Date: Sat, 26 Oct 2024 16:00:15 +0200
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Cc: Christian Stewart <christian@aperture.us>, "Yann E . MORIN"
 <yann.morin.1998@free.fr>
Message-ID: <20241026160015.53632c93@windsurf>
In-Reply-To: <20241026052753.59191-1-christian@aperture.us>
References: <20241026052753.59191-1-christian@aperture.us>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729951216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0CUBkZ7wF8aUlrjrlNIvj34zjUh0QFZ6s9QJYxrvzJQ=;
 b=AvpNe2Qb4KFURc1+JNLnhPo2rinrtyDCMwydZd4pCXJf8BXIeaAEDr6qD6XUHwOE+U+Epe
 6WCC6R/1iFEtYA7z9TZItpRli85nPl2lm6Fympt9hMnR5GaKU+mU+b0tMjWL1qHwzk+erH
 JPacS0RfZKnu9tzkiZaz8TmaMFwmVp/4/TQKPFAJx4tuz4GxsZvdO9XwufF6ZjilDUjEvb
 qUcfbdK+6wC9aVqqRqjHuZNhUJQsUEV4YBRI3pEBe6B9d8wyOl0Rg2SGkY01USTfB2kL0K
 xMqsVpaYRuwttiGpHDxU8e4Ov20JBtY4gFYX7FaBI6ZllaT+3m+1y5UTdR5cBA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AvpNe2Qb
Subject: Re: [Buildroot] [PATCH v1 1/1] package/docker-compose: bump version
 to v2.29.7
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

On Fri, 25 Oct 2024 22:27:53 -0700
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> https://github.com/docker/compose/releases/tag/v2.29.7
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>
> ---
>  package/docker-compose/docker-compose.hash | 2 +-
>  package/docker-compose/docker-compose.mk   | 2 +-
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
