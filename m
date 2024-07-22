Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3794C3DA59
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 20:36:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A53A80BC6;
	Mon, 22 Jul 2024 20:36:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id soVTazQEfC8d; Mon, 22 Jul 2024 20:36:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C9EC80BCA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C9EC80BCA;
	Mon, 22 Jul 2024 20:36:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C5A5E1BF296
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 20:36:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF0AE80BCA
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 20:36:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U2OyJ_QV9KXW for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 20:36:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9B0D480BC6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B0D480BC6
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9B0D480BC6
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 20:35:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8A6E0240003;
 Mon, 22 Jul 2024 20:35:56 +0000 (UTC)
Date: Mon, 22 Jul 2024 22:35:55 +0200
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Message-ID: <20240722223555.521df7be@windsurf>
In-Reply-To: <20240213123753.2471309-1-buildroot@bubu1.eu>
References: <20240213123753.2471309-1-buildroot@bubu1.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721680556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RnjeYPlFLP12cwNpeM/WmWKrw4qyNoxyqUHqeTgqplM=;
 b=hLQej2OlyORTUBWon2Xw9lNcWn4vDy4AbcSGrA2DDpvod83+dI2Gc0ZiqbEtX3zCuDj7z+
 18T7d//gzVcdAKX9hjikCCvPruVNPwj/FyGxxSdW5XOjNXc4xILK1ULlIQhIBmRY6GlkSR
 kHuJ9w4YOK62wloqFPXcCO4Jv9ie1ozOFg4o5RqTzqEZb27CXv5CUmjRgohHyZPnl3WTm9
 FI2fXmZgh5lerGaGyaZA3bCAB0KI9y/HidSi/sM3grwJNY/ldWizC+yIWqhyjlcIDi3y3A
 ayU05rcuBan8A/mC4Us0CrPeenuiG++xwQt1fzuNjzLEbN7PyzqwJ3IbZCNLKA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hLQej2Ol
Subject: Re: [Buildroot] [PATCH 1/2] package/python-can/Config.in: sort
 selects
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
Cc: Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 13 Feb 2024 13:37:52 +0100
Marcus Hoffmann via buildroot <buildroot@buildroot.org> wrote:

> Sort python builtin modules before external python libs.
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> ---
>  package/python-can/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

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
