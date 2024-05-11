Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05CCBC04FFE
	for <buildroot@archiver.kernel.org>; Sat, 11 May 2024 10:44:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7FD0820FD;
	Sat, 11 May 2024 10:44:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v29r39ppliRC; Sat, 11 May 2024 10:44:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA1D98127D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA1D98127D;
	Sat, 11 May 2024 10:44:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 228C91BF2F1
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 10:44:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9BC2682045
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 10:44:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dETep-1wssN7 for <buildroot@lists.busybox.net>;
 Sat, 11 May 2024 10:43:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 801448201D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 801448201D
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 801448201D
 for <buildroot@buildroot.org>; Sat, 11 May 2024 10:43:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6A8CEFF804;
 Sat, 11 May 2024 10:43:56 +0000 (UTC)
Date: Sat, 11 May 2024 12:43:55 +0200
To: Kadambini Nema <kadambini.nema@gmail.com>
Message-ID: <20240511124355.751d6cd8@windsurf>
In-Reply-To: <20240219195911.43452-1-kadambini.nema@gmail.com>
References: <ba5719b0-9b18-4148-bdfe-8a16ef06c4ee@benettiengineering.com>
 <20240219195911.43452-1-kadambini.nema@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715424236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W5OJY5yoE+NWITS8q8eJhnoN8xXFJ1cKdfjg2WRZkeU=;
 b=eDRu4DpHZSXXrWCZ7kGb/7K7Zu3Qh2i+YoQ3Izd2cNEwjHgF0PEfe3jDBJdsmvnkzbI7PS
 Z+WoYNvR6Rrv9Ty3DAeoGgfSjxRW6Q/dFfVc1iETSRf69JQ3KpGCbwZ0Izl2Qt5K64ZD2R
 Ly15KcamZHzxnlxd0NFGvPHMv34gJcDLLhDcaut2FCoVVPb3DnNoixyjMMajerz0m6kAe6
 m+oGQqCrB2TvKUafdI2ManC5J7MZMtbUywkhyGPNI8DCZEhrVJl4yloxJydCd2svTRFLBX
 hFuBiUMeudL/mws3setFkfPYetaEdr1JjDMhN56nXI1cz4FxiWvmK8mbUJEODA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eDRu4DpH
Subject: Re: [Buildroot] [PATCH 1/2] package/libyang: bump version to 2.1.148
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
Cc: giulio.benetti@benettiengineering.com,
 Jan =?UTF-8?B?S3VuZHLDoXQ=?= <jan.kundrat@cesnet.cz>,
 Heiko Thiery <heiko.thiery@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 19 Feb 2024 11:59:10 -0800
Kadambini Nema <kadambini.nema@gmail.com> wrote:

> Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
> ---
>  package/libyang/libyang.hash | 2 +-
>  package/libyang/libyang.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Both applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
