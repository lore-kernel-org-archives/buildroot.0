Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACDAAC04FFE
	for <buildroot@archiver.kernel.org>; Sat, 11 May 2024 20:15:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7913942343;
	Sat, 11 May 2024 20:15:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8N_ZicosRG5k; Sat, 11 May 2024 20:15:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58341423B5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58341423B5;
	Sat, 11 May 2024 20:15:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 971CB1BF57C
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 20:15:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 83542423E8
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 20:15:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 65fEDrTSVXN3 for <buildroot@lists.busybox.net>;
 Sat, 11 May 2024 20:15:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 29366423DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29366423DC
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 29366423DC
 for <buildroot@buildroot.org>; Sat, 11 May 2024 20:15:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F354A60004;
 Sat, 11 May 2024 20:15:29 +0000 (UTC)
Date: Sat, 11 May 2024 22:15:28 +0200
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Message-ID: <20240511221528.107deaa0@windsurf>
In-Reply-To: <20240511080612.2602362-1-mika.westerberg@linux.intel.com>
References: <20240511080612.2602362-1-mika.westerberg@linux.intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715458530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cZt0lyFz1qU4IBtdYUTel1fL7Bq7jBiJNzAO6wdTTMw=;
 b=HuUa5bCJGIJY+o9iivg1X1AkgpGO8sPYVo6/quD3I3A0WneMLONKWDSjdBK6+WDa2eEIvE
 O7jgiT/WsT+sgL8CmniXLZQjpwlGqSls44f6tj5YinWRQjoSQni4PUCV3H/wDnRcanIGJ2
 feyJlyJ0wRDg6Isvo64MjByR6DM6ADH4G7Hqvznw3bdGJkG5OyCS5CthM67DI9hTf2n4/x
 iNMouYlquUbZvwUZr5gPXr/v71N0kc31emgmdjajaByvffReUsaftfpW1nRcAjVn4tD69V
 Y8Lc9nnWi49wKnHWI/miQ62P7m896NZFas6pL2qA+d1B9bxGCQtaJo6pW6UL6w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HuUa5bCJ
Subject: Re: [Buildroot] [PATCH v3] package/tbtools: new package
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
Cc: Aapo Vienamo <aapo.vienamo@linux.intel.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 11 May 2024 11:06:12 +0300
Mika Westerberg <mika.westerberg@linux.intel.com> wrote:

> This is a collection of tools for Linux Thunderbolt/USB4 development,
> debugging and validation.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Reviewed-by: Aapo Vienamo <aapo.vienamo@linux.intel.com>
> ---
> Changes from v2:

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
