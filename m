Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 654D7C3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 20:30:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D524405AD;
	Sun, 14 Jul 2024 20:30:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A7s5AD-WYxGd; Sun, 14 Jul 2024 20:30:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3E8A405D9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3E8A405D9;
	Sun, 14 Jul 2024 20:30:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A3DC31BF592
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 20:30:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E30A8110E
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 20:30:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UyankjVe8A7d for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 20:30:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8D1558110D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D1558110D
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8D1558110D
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 20:30:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AB8EEE0002;
 Sun, 14 Jul 2024 20:30:14 +0000 (UTC)
Date: Sun, 14 Jul 2024 22:30:13 +0200
To: Fiona Klute via buildroot <buildroot@buildroot.org>
Message-ID: <20240714223013.30c53426@windsurf>
In-Reply-To: <20240712124956.3925574-6-fiona.klute@gmx.de>
References: <20240712124956.3925574-1-fiona.klute@gmx.de>
 <20240712124956.3925574-6-fiona.klute@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720989015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bMzW3hIXOFvyf9zPQm5nQbsgMMBxWsgG/zfbpAFlGKc=;
 b=mpsCJhS1wFaDEMMVct+gvVJhhe7WJoyhiis+m3hcJgHnwPIXi5i6qTI7h6+9Vle/esCpLl
 6L1p2BPgbber1ex6nqQanpPZAEE2M30MEYmf+zE+XSd+9kchR5RlSdbZy6dO2xbRx15Ozj
 dbVXST58iuBH2bWMwcr+/JoqzAW5G0UYPSnwavFqSsKpn4LRjKT6F1cL9sSNG6pNQR2sDN
 C2Q5RT5hqFSq49KjNsF/+E0il0QD8Iq3gPAqOqQlMuMDz+BOC/scdiLRauuTCZm1f8fdTx
 1qG6HgRUEW024pv99clQkdQrBySTA4gVs8WyT0udo1qDR+P0Nrgu5MAckC9ytw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mpsCJhS1
Subject: Re: [Buildroot] [PATCH v2 5/6] package/dnsmasq: tidy up init script
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

On Fri, 12 Jul 2024 14:49:55 +0200
Fiona Klute via buildroot <buildroot@buildroot.org> wrote:

> +	# Wait for process to be gone, using a loop and --stop --test
> +	# because Busybox' start-stop-daemon does not support --retry
> +	# (as of 1.36.1).

Applied after dropping this comment, for consistency.

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
