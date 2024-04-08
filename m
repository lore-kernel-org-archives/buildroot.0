Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CCDBC67861
	for <buildroot@archiver.kernel.org>; Mon,  8 Apr 2024 20:51:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5992B40490;
	Mon,  8 Apr 2024 20:51:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HllrfDNyZ1Es; Mon,  8 Apr 2024 20:51:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6AF3640CA1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6AF3640CA1;
	Mon,  8 Apr 2024 20:51:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DFB361BF2A7
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 20:50:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C8EC481DE9
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 20:50:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tY_UjxCuv4c6 for <buildroot@lists.busybox.net>;
 Mon,  8 Apr 2024 20:50:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B7AE581B6D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7AE581B6D
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B7AE581B6D
 for <buildroot@busybox.net>; Mon,  8 Apr 2024 20:50:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 614EBE0002;
 Mon,  8 Apr 2024 20:50:14 +0000 (UTC)
Date: Mon, 8 Apr 2024 22:50:10 +0200
To: Francois Perrad <francois.perrad@gadz.org>
Message-ID: <20240408225010.4228a5fe@windsurf>
In-Reply-To: <20240403084316.512333-1-francois.perrad@gadz.org>
References: <20240403084316.512333-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1712609414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FN++dLHEKcthBTsxt8fbf/FulIZAQaVyAjka/fHNceM=;
 b=ZGk82vcrO7S3PxQwx2RMHY+KaThPhIhPBqPgZnYF5vnVQsvoSW33ytX/zUImIbo7xBzGwc
 wlMgWUwSc//Hqs7Up6hqQDONN75CEKIalPYpitcpQCeiENKKf8HaN1JnEc82neNldCX3VM
 oT9jHjKV8hHxMobVQJC9asZwNrzLqY9AfYtHuZmoQijMkxJRLIkTpUCTWxxGmy6QN0kCGD
 /YVdSBeZoakVLG1i9TtoTx6eTMGicpTFwnUnw4Tz+AVl4APHGORFIbwARdAVaQtdtTNCD0
 EYiWvsC0Lq21Oaz/N7nL5E+KmcY475ctMZy/dbcQ/XvPd3+AFWi/DcWa5XG4mA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZGk82vcr
Subject: Re: [Buildroot] [PATCH] package/libtommath: bump to version 1.3.0
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

On Wed,  3 Apr 2024 10:43:16 +0200
Francois Perrad <francois.perrad@gadz.org> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/libtommath/Config.in       | 2 +-
>  package/libtommath/libtommath.hash | 2 +-
>  package/libtommath/libtommath.mk   | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

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
