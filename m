Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E830C52D7D
	for <buildroot@archiver.kernel.org>; Sat, 17 Aug 2024 10:17:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 417B8404A8;
	Sat, 17 Aug 2024 10:17:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zZyG8YtV7wj7; Sat, 17 Aug 2024 10:17:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B960403EF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B960403EF;
	Sat, 17 Aug 2024 10:17:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3C85B1BF57C
 for <buildroot@lists.busybox.net>; Sat, 17 Aug 2024 10:17:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 37812813B5
 for <buildroot@lists.busybox.net>; Sat, 17 Aug 2024 10:17:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bBDe7_Oudeu3 for <buildroot@lists.busybox.net>;
 Sat, 17 Aug 2024 10:17:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DF112813B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF112813B0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DF112813B0
 for <buildroot@busybox.net>; Sat, 17 Aug 2024 10:17:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 49CD560003;
 Sat, 17 Aug 2024 10:17:10 +0000 (UTC)
Date: Sat, 17 Aug 2024 12:17:09 +0200
To: Michael Vetter <jubalh@iodoru.org>
Message-ID: <20240817121709.70c1d4d1@windsurf>
In-Reply-To: <20240816172344.13041-1-jubalh@iodoru.org>
References: <20240816172344.13041-1-jubalh@iodoru.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723889831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rL692BTsP9ABPcVXAY4wnKTmhzSoLaOy9YNKBt/o76U=;
 b=nEiDZKxT6rLfYan6YHL8yDhgR1i69D446SzXCVAtzO43B4TicGBXAa+ZCNPjp2YP0BemQs
 eqEBJnuZs4CB5HYhe4FZgHcYuoD4jE3XVzYdb62HVMy2lVaa76fOB3pUyWCtTf0BKfIMNL
 uKKVBffCi8H+XXm5UMKIDuXFfzUwaLw4OrN00p0NIN8tEkv0iwsF7Nd8LM5x/72c7TEM+r
 KPxQlUwsCUyUWGwPec2aKjJ5hr2C5okSwhkWRQQiA4KNrM1aqRxJVClnl7elWVXHm2RvG3
 unjXaj7nRC9Mwo8g5ytFIpGSu/0JMC9ekE0s97Ryn9Ty+Yrii0n3KmlNfr7aBQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nEiDZKxT
Subject: Re: [Buildroot] [PATCH 1/1] package/shadow: bump to version 4.16.0
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 16 Aug 2024 19:23:44 +0200
Michael Vetter <jubalh@iodoru.org> wrote:

> Signed-off-by: Michael Vetter <jubalh@iodoru.org>
> ---
>  package/shadow/shadow.hash | 2 +-
>  package/shadow/shadow.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
