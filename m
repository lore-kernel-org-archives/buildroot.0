Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AD5FEE49AB
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 20:10:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FDD340965;
	Tue, 22 Aug 2023 20:10:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FDD340965
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i0KkNqubvdgp; Tue, 22 Aug 2023 20:10:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 603AE41684;
	Tue, 22 Aug 2023 20:10:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 603AE41684
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E48BD1BF33D
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 20:10:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BDAC860A93
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 20:10:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDAC860A93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WNO6FRBvhFpn for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 20:10:24 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AA95A60A8C
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 20:10:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA95A60A8C
Received: by mail.gandi.net (Postfix) with ESMTPSA id E1285E0008;
 Tue, 22 Aug 2023 20:10:21 +0000 (UTC)
Date: Tue, 22 Aug 2023 22:10:21 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230822221021.137dbf47@windsurf>
In-Reply-To: <20230812212032.349673-1-giulio.benetti@benettiengineering.com>
References: <20230812212032.349673-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692735022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b4pMoW9N6bsCRIuhai72/r/ToXkNodLKkXVapY4P3TQ=;
 b=DkY7803DbZ0faxv0iUOorq6NVkEBHkDkfpujYla5mA4rtTu0/4aP3GEpXLbrVjplznkDBj
 Ud4HPOE8K/51DVVX30+tnpumgboUKyqXBbCpgmeYIqDAgnIIEy2GCmV6R2cCxWEB+57ZNJ
 wmrPEGk9e8JrBqmse4alHrsZGGO5j/ag+NQPRgIdyzwuZTAi0x5w/Au603AwzcNhuAXEd2
 fEM8KiDqLT/fkoTdxHsxZdPND3xnxQboSDwGeC8bPLkH4z3aMBMFumxQd93OEy+eVGiubv
 L7hko3F0MC+kwMZzLHijFikrWSfdqVpiPS7d5VPL4NDrZX9m3aiXbZ6/7lk1Gg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DkY7803D
Subject: Re: [Buildroot] [PATCH] package/esp-hosted: fix build failure with
 missing CONFIG_SPI/MMC
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

On Sat, 12 Aug 2023 23:20:32 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Depending on the interface chosen we need to enable Linux CONFIG_SPI or
> CONFIG_MMC, so let's do that according to BR2_PACKAGE_ESP_HOSTED_SPI.
> 
> Fixes:
> http://autobuild.buildroot.net/results/cdf65ad07aba1d86f195576a2317c83aeb3dfce2
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/esp-hosted/esp-hosted.mk | 3 +++
>  1 file changed, 3 insertions(+)

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
