Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14A8DC3DA4A
	for <buildroot@archiver.kernel.org>; Fri,  2 Aug 2024 16:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C860060618;
	Fri,  2 Aug 2024 16:35:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IZ4dmPvH7Z32; Fri,  2 Aug 2024 16:35:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8DC9606B1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8DC9606B1;
	Fri,  2 Aug 2024 16:35:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 886931BF3EF
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 16:35:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7603E606B1
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 16:35:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KvTJcwN-u-xq for <buildroot@lists.busybox.net>;
 Fri,  2 Aug 2024 16:35:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 28A3560618
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28A3560618
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 28A3560618
 for <buildroot@buildroot.org>; Fri,  2 Aug 2024 16:35:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0E96AFF806;
 Fri,  2 Aug 2024 16:35:49 +0000 (UTC)
Date: Fri, 2 Aug 2024 18:35:49 +0200
To: Robert Marko <robimarko@gmail.com>
Message-ID: <20240802183549.170a5c4e@windsurf>
In-Reply-To: <20240802104437.488091-1-robimarko@gmail.com>
References: <20240802104437.488091-1-robimarko@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722616550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EDMuTMmJYuhHMbedQCjoHO47a7U/sajNJ19GL2jru7g=;
 b=eXVJ8K4pOedsXpxdJihFNydu0naefJRmlFtA4IDUjY6K9UP7EIyv14XKWx209+dv34vJ64
 uNfhRGjeSkOgHslK6VXHFqw/G7hqtY1jl/dWGJ6T6ApieLURGMv3CVhD30kim/EWAgEolT
 VskHP0DW1GGvCgHZli4NN86C356E11Xea7av5jsL9LiOiZ5vq67rtxkplTkZ/OYFZzdeWh
 NVf1GMDbO64kmXE/fi2tdd4+qem3b55TDRRUzV/8Wm/hBswAgqVfqycEU7dKlWswJjCzar
 fbZhEoOZqqbGpXVCfl9dpcbJR4TcoVFS3CZ4X57/HH8VwBCTHXkxFfCC/3U75w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eXVJ8K4p
Subject: Re: [Buildroot] [PATCH 1/1] package/mdio-tools: enable
 CONFIG_NETDEVICES
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

On Fri,  2 Aug 2024 12:44:37 +0200
Robert Marko <robimarko@gmail.com> wrote:

> mdio-tools depends on CONFIG_MDIO_DEVICE in order for mdiobus driver to
> be built, but CONFIG_MDIO_DEVICE depends on CONFIG_NETDEVICES which we
> are not enabling so on platforms without it enabled in kernel config
> building mdio-tools will fail with:
> 
> ERROR: modpost: "mdio_find_bus" [output-1/build/mdio-tools-1.3.1/kernel/mdio-netlink.ko] undefined!
> ERROR: modpost: "__mdiobus_c45_read" [output-1/build/mdio-tools-1.3.1/kernel/mdio-netlink.ko] undefined!
> ERROR: modpost: "__mdiobus_read" [output-1/build/mdio-tools-1.3.1/kernel/mdio-netlink.ko] undefined!
> ERROR: modpost: "__mdiobus_c45_write" [output-1/build/mdio-tools-1.3.1/kernel/mdio-netlink.ko] undefined!
> ERROR: modpost: "__mdiobus_write" [output-1/build/mdio-tools-1.3.1/kernel/mdio-netlink.ko] undefined!
> 
> So enable CONFIG_NETDEVICES as well to make sure CONFIG_MDIO_DEVICE can be enabled.
> 
> Fixes: http://autobuild.buildroot.net/results/edf47df96cde6094c890c0b74034cced90335a39/
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---
>  package/mdio-tools/mdio-tools.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks a lot for this fix!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
