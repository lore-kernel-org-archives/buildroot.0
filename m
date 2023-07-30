Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F66FC001DE
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 10:13:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF52560ADE;
	Sun, 30 Jul 2023 10:13:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF52560ADE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EPY3yd-nInuT; Sun, 30 Jul 2023 10:13:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44D4C60BB9;
	Sun, 30 Jul 2023 10:13:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44D4C60BB9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C985E1BF41B
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:12:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AFE2340138
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:12:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AFE2340138
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7H8fFA5McSYP for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 10:12:27 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 98D734010D
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 10:12:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98D734010D
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7DB31E0004;
 Sun, 30 Jul 2023 10:12:23 +0000 (UTC)
Date: Sun, 30 Jul 2023 12:12:22 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230730121222.672ed2e3@windsurf>
In-Reply-To: <20230730062226.6015-1-bernd@kuhls.net>
References: <20230730062226.6015-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690711943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2eGMLdrQTMmbz3Decr0H3msxdfqou9JjIxQM9wIK4WM=;
 b=Tz5Z5M4huQA3IHhg5wugmm0X0cA3v1SjxVefNb/E8VYn+pBwC2P6uJGDq8/9AUN3mkybKY
 /uv9t4cARXIQjV1+3201qJbdDjZY2RNc3ao31pGTS8W1wuXhm1RQvrOBdErZo/RpLRan7+
 vTWDGosGPUjeWcB59WH5i1SG72Mi50DPCVEeOP02vXeLVsTwjWWYHcS+tAg6dSvq+9K9Xl
 FAHkXzf+jQYkAFFPZ2stfBg2q9kLLfe4x4Zlr/NwDN8fPSElAEbK2zlLoD55T1y/9eNUVe
 A9kosHANFjXW+UWiJyP20bK4L/pKKcQulCzrmulwhIRDbUpsZvLa5cIPkjr+ww==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Tz5Z5M4h
Subject: Re: [Buildroot] [PATCH 1/1] package/waylandpp: fix build with gcc-13
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

On Sun, 30 Jul 2023 08:22:26 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  .../0001-add-missing-cstdint-include.patch    | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 package/waylandpp/0001-add-missing-cstdint-include.patch

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
