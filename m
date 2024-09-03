Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BAA5CD37AB
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 19:24:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4497D40A1D;
	Tue,  3 Sep 2024 19:24:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D1qe9WGoopKl; Tue,  3 Sep 2024 19:24:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1DD2840A1F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1DD2840A1F;
	Tue,  3 Sep 2024 19:24:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F277D1BF344
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 19:24:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E065960679
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 19:24:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rPIB3J06QrFK for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 19:24:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B37E36059D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B37E36059D
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B37E36059D
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 19:24:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E6D4C240007;
 Tue,  3 Sep 2024 19:24:11 +0000 (UTC)
Date: Tue, 3 Sep 2024 21:24:10 +0200
To: Niklas Cassel via buildroot <buildroot@buildroot.org>
Message-ID: <20240903212410.3d0f92db@windsurf>
In-Reply-To: <20240902104433.2561797-1-niklas.cassel@wdc.com>
References: <20240902104433.2561797-1-niklas.cassel@wdc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1725391452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=inLy8XjOgf/6hKAh7+wGi1WQ/Mym920hUnK7VireLQI=;
 b=pKazFHPSnAuM9VUaSnWCj8nYqNPv3oe8/MivuHZVb2ExlapjDHWU2qT0mSh6QFIXb5eF0i
 cuRGgyPHveH+0eDrLqQ5ZpbjsxylXkL83Q+qY3RkF+FSXPsHo4hKWGZ+QoMUrSIyX9+ox5
 Ey1AO+RXtmYssBAII45KtIVeCWzLBsLrzwfbGSyDmjSTE4uxZIBlj1zXuqIXVUcmpjrl97
 a7y4qletXdsx0FCXvAyhvmxm/Rgc7V9U3OR4SAY4sUNxZkQ6enU6cREynAu9Skij5b3nHq
 TQrr1kR9oV4BD7ZE29q8J1k9qB99YHKVonjKyAaEK2nv6nFhQOkh6ZZxmDHXOQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pKazFHPS
Subject: Re: [Buildroot] [PATCH 0/5] rock5b additional improvements
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>, Damien Le Moal <dlemoal@kernel.org>,
 Kilian Zinnecker <kilian.zinnecker@mail.de>, Niklas Cassel <cassel@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  2 Sep 2024 12:44:28 +0200
Niklas Cassel via buildroot <buildroot@buildroot.org> wrote:

> Niklas Cassel (5):
>   board/radxa/rock5b: use gpt partition table instead of hybrid
>   board/radxa/rock5b: use PARTLABEL to specify rootfs
>   configs/rock5b: enable eudev to enable automatic module loading
>   board/radxa/rock5b: do not use udev predictable NIC names
>   configs/rock5b: enable DHCP for eth0

I have applied to our next branch patches 1/5, 2/5 and 5/5, but not 3/5
and 4/5. I'll reply separately to them.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
