Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8E46C3DA60
	for <buildroot@archiver.kernel.org>; Wed, 17 Jul 2024 21:34:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 81DFB40C0E;
	Wed, 17 Jul 2024 21:34:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xfC5JPYkLurD; Wed, 17 Jul 2024 21:34:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3829940E85
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3829940E85;
	Wed, 17 Jul 2024 21:34:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 08F3C1BF385
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 21:34:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E87A6401F4
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 21:34:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lxQ5DYj0PPgP for <buildroot@lists.busybox.net>;
 Wed, 17 Jul 2024 21:34:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 79E1440152
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79E1440152
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 79E1440152
 for <buildroot@buildroot.org>; Wed, 17 Jul 2024 21:34:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DD5B360002;
 Wed, 17 Jul 2024 21:34:49 +0000 (UTC)
Date: Wed, 17 Jul 2024 23:34:48 +0200
To: Torben Voltmer <mail@t-voltmer.net>
Message-ID: <20240717233448.6335a9f1@windsurf>
In-Reply-To: <20240715194635.949193-1-mail@t-voltmer.net>
References: <20240715194635.949193-1-mail@t-voltmer.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721252090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dgwhBh4YAVnE87I8VI3g1ajY5ZK3OS6/5CG2nxJrx1g=;
 b=WOE1fnKH0HL2ldvuh1VeH0vsL9+gGGdM0PO+cehAfF5siNz/zGyuSONk3u5e/P2CdQoKQg
 lHncgQr/4mhWj6b8icvFgqstkkKrtI1SV1Mc5WtWQLz7l2936mK6x1xrnUXpkxh3Hb95w2
 P48D72fFq0kefsWCmqvRXb29XVeOYdQqN7+Y5jDHPQr6b/o2ALRMrFmmPd1rPjcBYNJP2Z
 G5SBS4iFRzk+wST5yTnxkIGY9RML2/vXImvNu8Aqec9T3zHFV1JiANgOsI/XSYY+eE3lj4
 dWXeirtIkGGVzWQ8DSC7omRz6WPoBJ6ToQJIh95OkVRRyLQH9RpqYBFEPXhnsw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WOE1fnKH
Subject: Re: [Buildroot] [PATCH 1/1] package/espflash: new package
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

On Mon, 15 Jul 2024 21:46:35 +0200
Torben Voltmer <mail@t-voltmer.net> wrote:

> This package provides espflash. A serial flasher utilities for
> Espressif devices, based loosely on esptool.py. Supports the
> ESP32, ESP32-C2/C3/C6, ESP32-H2, ESP32-P4, and ESP32-S2/S3.
> 
> Signed-off-by: Torben Voltmer <mail@t-voltmer.net>
> ---
>  package/Config.in              |  1 +
>  package/espflash/Config.in     | 10 ++++++++++
>  package/espflash/espflash.hash |  4 ++++
>  package/espflash/espflash.mk   | 13 +++++++++++++
>  4 files changed, 28 insertions(+)
>  create mode 100644 package/espflash/Config.in
>  create mode 100644 package/espflash/espflash.hash
>  create mode 100644 package/espflash/espflash.mk

Thanks a lot for your contribution! I applied your patch, after adding
an entry to the DEVELOPERS file. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
