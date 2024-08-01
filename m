Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FCCEC3DA64
	for <buildroot@archiver.kernel.org>; Thu,  1 Aug 2024 20:57:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4F7182109;
	Thu,  1 Aug 2024 20:57:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n_MSW0THsp5Z; Thu,  1 Aug 2024 20:57:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF931844EB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF931844EB;
	Thu,  1 Aug 2024 20:57:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E80B11BF408
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 20:57:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CEC9C81E57
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 20:57:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0z-sOxGGXq57 for <buildroot@lists.busybox.net>;
 Thu,  1 Aug 2024 20:57:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 92A3B844E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92A3B844E3
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 92A3B844E3
 for <buildroot@buildroot.org>; Thu,  1 Aug 2024 20:57:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 12FD060003;
 Thu,  1 Aug 2024 20:56:58 +0000 (UTC)
Date: Thu, 1 Aug 2024 22:56:58 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240801225658.2c790990@windsurf>
In-Reply-To: <20240719063235.3823015-1-james.hilliard1@gmail.com>
References: <20240719063235.3823015-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722545819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+zZPPLehjXD9AxUthKbv8Qhzpr/OVJ4k+FVaaT+Ugew=;
 b=Y3mINnlxoTl1lPOeR+chPtLTfzqk0m4Hb2iYRx+5BLk4UcZFvYm9cyxiZq379tn7rwSfMA
 hyPMnHrjkwQgbZzqZRZUK1H5SjoPWOisAzkPz5rVjfMxP8UzFOwwJLP3zY5Kv9qC8x0ifX
 Z7WLxsgppJaxn1Cod4w8WdgIbY0x6MiZh10C5gb4fLlnxKb8582ijhi4csod4yns3Vhyru
 lcSkIpGWboIwIQrEi7M33ZHtE2jD2xhgr5iwOjQQuoGC0KG51oriA7gwnwiz3Cxe981JXf
 3qAZlnMfJGqOmgLWBK+spDwT4PaYr+7oO3g9LRQKf08dYxYfd+6B1qaoNopc9g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Y3mINnlx
Subject: Re: [Buildroot] [PATCH v4 1/6] package/python-pefile: new host
 package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 19 Jul 2024 00:32:30 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-pefile/python-pefile.hash |  5 +++++
>  package/python-pefile/python-pefile.mk   | 14 ++++++++++++++
>  2 files changed, 19 insertions(+)
>  create mode 100644 package/python-pefile/python-pefile.hash
>  create mode 100644 package/python-pefile/python-pefile.mk

Thanks a lot, series applied!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
