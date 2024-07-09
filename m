Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 486E8C2BD09
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 20:30:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 176D981EA0;
	Tue,  9 Jul 2024 20:30:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DSbsLZqPP5vI; Tue,  9 Jul 2024 20:30:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E9DF81EC6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E9DF81EC6;
	Tue,  9 Jul 2024 20:30:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8306E1BF5DD
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 20:30:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7DF1B81EA6
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 20:30:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jk0riFByrH09 for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 20:30:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9D63D81EA5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D63D81EA5
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9D63D81EA5
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 20:30:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9580860002;
 Tue,  9 Jul 2024 20:30:36 +0000 (UTC)
Date: Tue, 9 Jul 2024 22:30:35 +0200
To: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
Message-ID: <20240709223035.06d08008@windsurf>
In-Reply-To: <20240426184732.1390508-1-aleksandr.o.makarov@gmail.com>
References: <20240426184732.1390508-1-aleksandr.o.makarov@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720557037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yBkZ2vADFAqRi8Axi/QcRsD9qi8cDhC4T/F/LeSzTFs=;
 b=gopsx7Buj+zGX5E/I8zy3P8EnuxU02YN6sGY8jt2vFVCWVuolAf/Yr/fi1vG/qk2mKegm8
 VH+XTLe4Wtwim8Hal9B4Hvcj0uXehx/AyUd8yGjgUTEXkumknD0eHmhdrfTUS62HWMASxP
 kiDVkCFTRLXu3uT1tnjkeqYTz8ydQw9AL01eBo1pnS9Tc0VyFfX6GkO9qcO4px0J6k2Fgj
 wAmp8EhF5HNueb1NVMENJN5RnJACW1/JIGCytCjTXzrW6wtWY2/DZDay8ol38jy1XIdlVF
 xJ9EY72sKxtyOLKOIKhTrFtdrMJ9mJyQoPNeqCJQu73lEfoLuGIR/eJkjc/UZQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gopsx7Bu
Subject: Re: [Buildroot] [PATCH 1/1] board/pine64/rockpro64/linux.fragment:
 integrate stmmac driver
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Suniel Mahesh <sunil@amarulasolutions.com>,
 Jagan Teki <jagan@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 26 Apr 2024 21:47:32 +0300
Aleksandr Makarov <aleksandr.o.makarov@gmail.com> wrote:

> Currently, the stmmac driver is configured as a module in the defconfig, which
> means that the network functionality is not available until the driver module
> is manually inserted.
> 
> Use extra config fragment to integrate it directly into the kernel, ensuring that network
> functionality is available immediately upon boot.
> 
> Signed-off-by: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
> ---
>  board/pine64/rockpro64/linux.fragment | 3 +++
>  configs/rockpro64_defconfig           | 1 +
>  2 files changed, 4 insertions(+)
>  create mode 100644 board/pine64/rockpro64/linux.fragment

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
