Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF844C021BE
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 21:53:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5ABA40556;
	Sat, 14 Sep 2024 21:53:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id voOqg22l1N-x; Sat, 14 Sep 2024 21:53:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DAFA406C2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DAFA406C2;
	Sat, 14 Sep 2024 21:53:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D65511BF470
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 21:53:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C598D60645
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 21:53:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7RNuwt3jBEWc for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 21:53:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AB22260592
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB22260592
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AB22260592
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 21:53:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B0BAF40002;
 Sat, 14 Sep 2024 21:53:27 +0000 (UTC)
Date: Sat, 14 Sep 2024 23:53:26 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240914235326.6bd4a329@windsurf>
In-Reply-To: <20240914205550.1172984-1-james.hilliard1@gmail.com>
References: <20240914205550.1172984-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726350808;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hfCOYHqnxBq2GZvaX2kPeyX7btqNmNhkUzGLCCDwHPg=;
 b=ZqBFqBrGvnLZeRAY6xf5MYYYyI0qcvA1wmF9+Qo6TUzWmw6rBWEG5GQn3dBucKefj5A95s
 rt4MKBrRSFs1CzW8Nw+rE0s/uX9KRURwA41CeX7MSWlOZD0TP6UyzPDVzF7o6PYv0j0nhX
 gD+TYOILwv5dPlbI8RCcGAvY4csIwXsLYk/GJomLEBMgUASoCcZrfrEELSOiiky9VL+BzC
 TjZ9CrZD7/OvWC4v4Q4laOtnjXn0X2P3bzF3S7X0cX4bfhf1UyDQ+2tOcLvazlnm9sDAoE
 h2JC4gFoD+UgH5T91AjJhjfq5LJcu+7pAxUf+OyOCo+2r9OiRt95wW5k3roOAg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZqBFqBrG
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aiodns: bump to version
 3.2.0
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

On Sat, 14 Sep 2024 14:55:50 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-aiodns/python-aiodns.hash | 4 ++--
>  package/python-aiodns/python-aiodns.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
