Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC528C021BE
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 21:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FB0F41E0B;
	Sat, 14 Sep 2024 21:54:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iuRkJQLhxUob; Sat, 14 Sep 2024 21:54:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0C9041E64
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0C9041E64;
	Sat, 14 Sep 2024 21:54:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9C5F81BF470
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 21:54:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D4F4340190
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 21:54:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WIqt_dz32MoZ for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 21:54:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9794B401DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9794B401DF
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9794B401DF
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 21:54:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A848820002;
 Sat, 14 Sep 2024 21:54:03 +0000 (UTC)
Date: Sat, 14 Sep 2024 23:54:02 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240914235402.6d4831f9@windsurf>
In-Reply-To: <20240914214650.1324058-1-james.hilliard1@gmail.com>
References: <20240914214650.1324058-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726350844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dFdmJav6hTwqo1X/1GOyhA/GoiapeMxjbh+TReuqDTg=;
 b=mlJxy5tLVx7kvpR97nbwhCgeTEwVmhLOZ9NjjZADR8Z3B+xT0HCIpwswb1pvSxyGSaP4gH
 wmw4J5M8wD1oFS6CjcILbUIlOIsr4hZ0xgV+Ka4pPWr8o7rG9Y2BwihppJmORJYW9Ac2Bl
 CVYTZBHQGXOoh8Fp7Rb/BJWnL83XzlRLIcCvnGMyfW//9IXG5kLnd3N//dMt2+ItDV4KmS
 efLqDET5/AAIbXTakAqev01Uh7lMbDPnrCue2YIWzwgtTBumYYW5FQncO5RayfA3D69nmK
 OoqYiTWvoYKsaoilfcoXaM6oa99ap0HjiVxInvdTg7rH7YE+BAW/vHOJ3Zk4jw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mlJxy5tL
Subject: Re: [Buildroot] [PATCH 1/1] package/python-autobahn: bump to
 version 24.4.2
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
Cc: Mauro Condarelli <mc5686@mclink.it>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 14 Sep 2024 15:46:50 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> License hash changed due to adding contributors:
> https://github.com/crossbario/autobahn-python/commit/75f3758127d1cf0ddb4450f80e30931353b3adca
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-autobahn/python-autobahn.hash | 6 +++---
>  package/python-autobahn/python-autobahn.mk   | 4 ++--
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
