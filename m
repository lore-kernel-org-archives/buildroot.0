Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06C2FCD343F
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 21:32:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D755607A7;
	Tue,  3 Sep 2024 21:32:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FrZDctAlgmd0; Tue,  3 Sep 2024 21:32:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C73B8607ED
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C73B8607ED;
	Tue,  3 Sep 2024 21:32:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CF8C61BF421
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 21:32:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB3F4607B2
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 21:32:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zhn0fXfV62om for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 21:32:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BAE42605FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BAE42605FF
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BAE42605FF
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 21:32:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0CF55E0003;
 Tue,  3 Sep 2024 21:32:28 +0000 (UTC)
Date: Tue, 3 Sep 2024 23:32:28 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240903233228.18825b7f@windsurf>
In-Reply-To: <Zs8U6aFlyfvfLg7c@waldemar-brodkorb.de>
References: <Zs8U6aFlyfvfLg7c@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1725399149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vBIEJ3X+I6OIgfv0h9Z6uihi1SSfUsyY2nPwcVGuOu0=;
 b=dKI34o8rJu0jeMmN0JFWiCByB0Ap7MNl2kSaqf9ZsmtNbJ9srkrwvODVC+0E/wkaDeic6Q
 qpl58IQ+7Wz9wUbJNvLdN25XiGBHQoFDzxYBk/YM9bStIWFxyJoa6ml9nEDbHitIQ12Kwa
 B+lMcEyRGTWoRtzzhc7xxtq2l6Xcicz5EnPuJwdAC5Pc20K1dnQAChGt2hROTlTJ/S3I2P
 8YV4GWv1Z5wZWcu1jgmdnsZ8XGH+Z9OHEr1e3uQnsoIE9qD5wvHh7bHkK5scIrkxhv50HH
 PGBS7rBcX1q1wNS7mYxvENZByfCdKaE5LRt2RGBckFi4u/+ZaN9Ccs7AvOdpMw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dKI34o8r
Subject: Re: [Buildroot] [PATCH] package/p910nd: update download URL
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

On Wed, 28 Aug 2024 14:15:37 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Project moved to Github. Update download URL and hash.
> License file got renamed, but it is still GPLv2.
> 
> Fixes:
> 
>  http://autobuild.buildroot.org/results/6e0/6e0e34c342fe712d5314de80488a2d034a2f5983/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/p910nd/p910nd.hash | 4 ++--
>  package/p910nd/p910nd.mk   | 5 ++---
>  2 files changed, 4 insertions(+), 5 deletions(-)

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
