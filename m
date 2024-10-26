Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68264D10BFD
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 14:48:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39035606A2;
	Sat, 26 Oct 2024 14:48:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Jv0tzJe93K2; Sat, 26 Oct 2024 14:48:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67C7260732
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67C7260732;
	Sat, 26 Oct 2024 14:48:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B9E25C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:48:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9621860716
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:48:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hmnYf6YGpHj0 for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 14:48:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7472060BA6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7472060BA6
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7472060BA6
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:48:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9AA5AFF804;
 Sat, 26 Oct 2024 14:48:46 +0000 (UTC)
Date: Sat, 26 Oct 2024 16:48:45 +0200
To: Brandon Maier via buildroot <buildroot@buildroot.org>
Cc: Brandon Maier <brandon.maier@collins.com>
Message-ID: <20241026164845.21f7ac49@windsurf>
In-Reply-To: <20240918-ls1046a-frwy-linux-6-6-v1-0-941f6224e052@collins.com>
References: <20240918-ls1046a-frwy-linux-6-6-v1-0-941f6224e052@collins.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729954126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U0t4utLfHQByvi9wDHkGWbHfWbMElUZ5bgybYoHLGdQ=;
 b=nj/x0ZNbXhcoA/3+hknyRc7mIQPVDOAX/5ecPqvCZl5khfop+DvdG3wfqJw67mkOobjEo9
 7RB6qMqrpUf+xiV/2MTOKzKEUJXgFa36ugvxSvoAq96egkc9snj9VU0/Zj6p/pRUOZEKpt
 Y06xL7PgeeqTooV1diu2cYXjyH7PHy/wgHv3+cAP4On0hiayyxbisT5CPSIJXGooiXY6Xx
 gX2cR9fORF2auzFVPkdnp3jGF4OAnNrENvkuc/7syLQv0CjO+5Um/Q8QJa2ReNBCd7mRBK
 TltxUX2V21Td1PGaFe5rgYKABgVBrwiXP16GY1NWGC6ABtebODhIA/EXXjkTqA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nj/x0ZNb
Subject: Re: [Buildroot] [PATCH 0/5] configs/ls10*: update ls1046 and ls1028
 to Linux 6.6
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Brandon,

On Wed, 18 Sep 2024 20:12:34 +0000
Brandon Maier via buildroot <buildroot@buildroot.org> wrote:

> Brandon Maier (5):
>       configs/ls1046a-frwy: add hashes
>       configs/ls1046a-frwy: update to Linux 6.6
>       configs/ls1028ardb: update to Linux 6.6
>       package/qoriq-fm-ucode: bump to version lf-6.6.23-2.0.0
>       package/qoriq-rcw: bump to version lf-6.6.23-2.0.0

Thanks, series applied!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
