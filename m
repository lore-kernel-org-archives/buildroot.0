Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB6B2D5AE72
	for <buildroot@archiver.kernel.org>; Thu,  7 Nov 2024 08:03:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FD714198D;
	Thu,  7 Nov 2024 08:03:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yKq14d3h9OLI; Thu,  7 Nov 2024 08:03:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F83641A76
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F83641A76;
	Thu,  7 Nov 2024 08:03:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BAFEFC1
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 08:03:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A471941CA6
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 08:03:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mlO4JBII0ljH for <buildroot@buildroot.org>;
 Thu,  7 Nov 2024 08:03:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7101E41CA4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7101E41CA4
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7101E41CA4
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 08:03:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5A1D560002;
 Thu,  7 Nov 2024 08:03:40 +0000 (UTC)
Date: Thu, 7 Nov 2024 09:03:20 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>, Asaf
 Kahlon <asafka7@gmail.com>
Message-ID: <20241107090320.6ad73f0b@windsurf>
In-Reply-To: <20241105191047.1578445-1-james.hilliard1@gmail.com>
References: <20241105191047.1578445-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730966620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nsi5xFBAaXBP+qnJV/0wiA21uH6TJXdZuqMH4tLR2Xw=;
 b=PXGMwuYxq5OG2atODit4dBnxlybx3gvzIqYN5FfVqz0uRkHtIHOdDKFbsNZCqBwFIVKC/X
 IvQM9mFzKS+ntZ26Lh7bT6JZ3Aj3s2ZsCkd2G97FJjGgceT57Mv+8uGoWGd7MeQNOh876K
 F61Noagl7yf+/X4Ods4vIsVVHd/O0Z8bl5SK41nLPUhnZVgpSW5KJeWTTFjCSotMioEFxm
 kUt7ul4wpiGUn7VL+5x5HDLXpmiYmts76pfDh3tB2Kmg5ul2hNSQzz9zoo9IE3HlbhkLMe
 S3GpRQ0koXS+61WNO0aAhmSkXt6oc9wJrIXnRryfzgSm+k5rCrIXMvj2GhMYiA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PXGMwuYx
Subject: Re: [Buildroot] [PATCH 1/1] package/python-sentry-sdk: bump to
 version 2.18.0
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

On Tue,  5 Nov 2024 12:10:47 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-sentry-sdk/python-sentry-sdk.hash | 4 ++--
>  package/python-sentry-sdk/python-sentry-sdk.mk   | 4 ++--
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
