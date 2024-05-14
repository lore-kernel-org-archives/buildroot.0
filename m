Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD59C04FFE
	for <buildroot@archiver.kernel.org>; Tue, 14 May 2024 07:59:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 353BA40510;
	Tue, 14 May 2024 07:59:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CvR08mXYPFWp; Tue, 14 May 2024 07:59:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5A944052C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5A944052C;
	Tue, 14 May 2024 07:59:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A5B4D1BF309
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 07:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 90F1340510
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 07:59:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4rozI8yUSGB2 for <buildroot@lists.busybox.net>;
 Tue, 14 May 2024 07:59:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 43B6D404CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43B6D404CC
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 43B6D404CC
 for <buildroot@buildroot.org>; Tue, 14 May 2024 07:59:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id ADFCE1C000B;
 Tue, 14 May 2024 07:59:17 +0000 (UTC)
Date: Tue, 14 May 2024 09:59:17 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240514095917.4df6491b@windsurf>
In-Reply-To: <ZkMEagMTXYIsMqtu@waldemar-brodkorb.de>
References: <ZkMEagMTXYIsMqtu@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715673557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ahpYMLrwDiYzsX9INaE121DZVj11nRQ1Z5IFFe6Wg08=;
 b=UrX4w/P+2vPMujoPwWDwtb8rJJ20ORBWgBn1wK1S7EEJgl+FltrLqFar0EjsszxBWW2E5N
 SGg5L/h9ovLwG4TpJdxxQ5GpVKV6XGeufqu08xPC51r/5gBbrSbRcJUru/oXrgajMqWP5Y
 iZvNHt0NrWCzY3FgvQS+gExu0BEln8uBHqoW675Sva+ZD8Jk5NRTyF6l8n+Ku0mlG4UiXj
 vR84ygfIZ9ed8pnx/HjuO5bojYszOq6l+06UyQHO7NQ9PvmHLGuECV4HP9WqKeEajI7M10
 kIaV66UtWEe9GMOxO0RKs1eHvOEni+pG0PP4uMx514fQywlqzeJu2wcyS5CVlw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UrX4w/P+
Subject: Re: [Buildroot] [PATCH 3/3] configs/qemu_loongarch64: new defconfig
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

Hello,

On Tue, 14 May 2024 08:27:54 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  .../patches/linux-headers/linux-headers.hash  |  2 ++
>  .../qemu/loongarch64/patches/linux/linux.hash |  2 ++
>  configs/qemu_loongarch64_defconfig            | 27 +++++++++++++++++++
>  3 files changed, 31 insertions(+)

This needs a readme.txt in board/qemu/, with the proper formatting so
that our CI testing can pick up the qemu command line (see other qemu
readme.txt).

This also needs a DEVELOPERS entry added.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
