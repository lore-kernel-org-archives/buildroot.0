Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D6FDC0218B
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 09:20:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 543D98115F;
	Sat, 14 Sep 2024 09:20:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i4O-Gs5o0VBf; Sat, 14 Sep 2024 09:20:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56D12846E9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56D12846E9;
	Sat, 14 Sep 2024 09:20:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5A7AD1BF280
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 09:20:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 486D7846EB
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 09:20:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cboaoiUSW-aN for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 09:20:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7518D81463
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7518D81463
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7518D81463
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 09:20:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 838D31C0004;
 Sat, 14 Sep 2024 09:20:31 +0000 (UTC)
Date: Sat, 14 Sep 2024 11:20:30 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240914112030.7369d08b@windsurf>
In-Reply-To: <20240907211638.945542-1-james.hilliard1@gmail.com>
References: <20240907211638.945542-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726305631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dxsIoZR7Knxv7hM5tz1vG3vTSS1HfCg2wjNde79N4nc=;
 b=RIJ/g/fnpJRNieQzzTrcj0F+N5j7lNBU2w6SUo04KRSaDeoH6nkEW4q81Qxa3NZhW674gl
 xZ9XuL4jLArqXjqb3vRDBVRhQk8Ukt8ubuadQ0Tt2f35VKjfUgyjZ3CvXWwE0niuzXDgRZ
 +nk5FbUdsALEdfa3YIQPe8WXHBKtpzjisQIftSZ8i6FPq5pqZB5/0ZMsO00+mY4wsJUw2v
 PrRS3Kh50jnwCaPALN7MQgrRTXXd+18Khj9/SOnpsEm7qLXNDUFFeE+vy1mPMQUspoyJ3c
 0i8R9rJJcl5Uunebnnh4KedUr/kr2rTInaQ0nsnRX6/z6VblzKwP0dNN3wBF8g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RIJ/g/fn
Subject: Re: [Buildroot] [PATCH 1/1] package/python-maturin: bump to version
 1.7.1
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James,

On Sat,  7 Sep 2024 15:16:38 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Restore cargo2 archive suffix format as well.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-maturin/python-maturin.hash | 2 +-
>  package/python-maturin/python-maturin.mk   | 7 ++++---
>  2 files changed, 5 insertions(+), 4 deletions(-)

Thanks, but it doesn't work for me:

ERROR: while checking hashes from package/python-maturin/python-maturin.hash
ERROR: python-maturin-1.7.1-cargo2.tar.gz has wrong sha256 hash:
ERROR: expected: 92c5fc2a24f32623a6994334b523a587dca63ebb5b46ae14a255a2ebc25fd3f7
ERROR: got     : 9b25e8232b67e7ad8652adfe95e890868f56adfb65a93ad4c2a2cb6a7236a94f
ERROR: Incomplete download, or man-in-the-middle (MITM) attack

Could you have a look?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
