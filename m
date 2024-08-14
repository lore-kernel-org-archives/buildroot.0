Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11515C52D7F
	for <buildroot@archiver.kernel.org>; Wed, 14 Aug 2024 20:10:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB974605D7;
	Wed, 14 Aug 2024 20:10:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RrFUEoj6ma2G; Wed, 14 Aug 2024 20:10:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D72A608EA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D72A608EA;
	Wed, 14 Aug 2024 20:10:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CF8271BF471
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 20:09:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B9BB4608DD
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 20:09:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t-bTz7sVsupv for <buildroot@lists.busybox.net>;
 Wed, 14 Aug 2024 20:09:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A054E605D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A054E605D7
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A054E605D7
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 20:09:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D7414FF802;
 Wed, 14 Aug 2024 20:09:54 +0000 (UTC)
Date: Wed, 14 Aug 2024 22:09:54 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240814220954.5a33226a@windsurf>
In-Reply-To: <ZrtNtCb1TTpfQ7q6@waldemar-brodkorb.de>
References: <ZrtNtCb1TTpfQ7q6@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723666195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nMs5NuxuwZ5TgC4lTRQK9WEG/QrF0Lzw8YuNrrYMSUY=;
 b=ecKOyGOWfLQ3QbnU3aLT9ZKPcft9ecnpcFuTdLFKicSOKh2SFhthlYqaVljNAdVeTh4O7h
 q9RQrPANWRJWc/6sniSIF4V6JXr1/zCKabFg6uriu58//tmZx9UsTQR1IQqw/7qbgZqpGu
 1M0ard4T1TNCblyorIXgO53TTvvJXak6aKLjA8asLxT1kQ5nPPbAHASArr2Z4quwxTH+2D
 7B6BkUbE+gVJeQwA45eZJkcE2rvd4p6pE/N+xt23H15d0l50rKyfrG03ac7vI/+7gfHkfM
 qPPcQjDlIKOQh0yrYWSF7mUsaNlz5SL00//U+nPMMQuyIuVL4G1IE6KEBgRFpA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ecKOyGOW
Subject: Re: [Buildroot] [PATCH v3] configs/solidrun_clearfog: update U-Boot
 and Linux
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 13 Aug 2024 14:12:36 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Tested on Solidrun Clearfog.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> v1->v2:                                                                                                                                                               
>  - update .checkignorepatch requested by Baruch Siach

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
