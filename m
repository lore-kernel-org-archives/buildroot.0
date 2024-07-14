Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F2F8C3DA49
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 20:28:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24FF740054;
	Sun, 14 Jul 2024 20:28:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zO6Tw6Pg43pg; Sun, 14 Jul 2024 20:28:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E938F4005E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E938F4005E;
	Sun, 14 Jul 2024 20:28:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AE1C71BF592
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 20:28:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B9DB60638
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 20:28:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rJ9PebKhjO6H for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 20:28:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6331360631
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6331360631
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6331360631
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 20:28:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E20D21C0002;
 Sun, 14 Jul 2024 20:28:07 +0000 (UTC)
Date: Sun, 14 Jul 2024 22:28:06 +0200
To: Fiona Klute via buildroot <buildroot@buildroot.org>
Message-ID: <20240714222806.5f5cb84a@windsurf>
In-Reply-To: <20240712124956.3925574-2-fiona.klute@gmx.de>
References: <20240712124956.3925574-1-fiona.klute@gmx.de>
 <20240712124956.3925574-2-fiona.klute@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720988888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FrQDkBuh2bhbNfu9o1iiK2NS970WTIyzOfpMiN3RBkk=;
 b=BCW93C8wYGs6yPdHVRDW1odnVtBKGnz/tQj3mfoaraXBINpdznFIsgFosCwoqJF45Ddwa5
 tYZeQqsNxQd1QdUH6RG+eZ3iR9+5l4iRz6DmOOK9Hm40Ev9+PWdqmWs0rM6Fg7TCzC6TNZ
 /13aTf/DUlbyLDXVPDVHO/8oovwYy27QthtF3r7lslRS4QuyaGKFlOcTN0JRK38cLNUjuq
 WYo/ZUopPQHiRF1ls+UVtYuPDpbFF8MI0Io2g+KdrsBzO7eD4X/hS/byeU4tb9HK03Oj9A
 m1LS/tJTE0tHiaTZVh/7apUCQGTY3Z1/0yjEVc5jXED92Q9OGW0F3wYaVwzCzg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BCW93C8w
Subject: Re: [Buildroot] [PATCH v2 1/6] docs/manual: describe relying on
 default options
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fiona,

On Fri, 12 Jul 2024 14:49:51 +0200
Fiona Klute via buildroot <buildroot@buildroot.org> wrote:

> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> People can assume that e.g. Busybox options enabled in the package are
> enabled when writing code for Buildroot. Anyone who uses custom
> configurations that disable default options needs to make sure
> relevant scripts etc. still work for themselves.
> 
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>

Thanks a lot for this work. I applied your patch, with one change.

> +[[integration-principles]]
> +=== Integration Principles

I wasn't happy with the name "Integration Principles", which was too
vague, while the other sections in this chapter are more specific. So
instead I named this "Configurable packages". Of course, I renamed the
file to match that title change.

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
