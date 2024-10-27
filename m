Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45133D13579
	for <buildroot@archiver.kernel.org>; Sun, 27 Oct 2024 18:44:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10829607BC;
	Sun, 27 Oct 2024 18:44:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VrgrP5woxB55; Sun, 27 Oct 2024 18:44:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AA1060877
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AA1060877;
	Sun, 27 Oct 2024 18:44:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 96A86AEE
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:44:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5499380F71
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:44:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IzsRG6FR2iiP for <buildroot@buildroot.org>;
 Sun, 27 Oct 2024 18:44:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2DDB280E18
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DDB280E18
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2DDB280E18
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:44:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 78DB6FF805;
 Sun, 27 Oct 2024 18:44:33 +0000 (UTC)
Date: Sun, 27 Oct 2024 19:42:57 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <20241027194257.3ac26545@windsurf>
In-Reply-To: <20241026210033.2667139-1-bernd@kuhls.net>
References: <20241026210033.2667139-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730054673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qRHaSzM5zLYHKynfqNt+KtRBYGn1Leq5lJLCudWQOco=;
 b=badKUvRQUMToRyE3vN0bctaHcYABOFKPmzVlHrHceC2nPDRSNZ0/g/HQTTg7F0dgvs0tYi
 g4tiuXdk3T1tIduuQQrgzaT9aJZ+OrNZL9KH40CbKf6Ggq+1IY/3hhmZe++ZQmUdRcYbiG
 B+8H15WcJew1Ta8RyCyihZc2gPeqYF/lfG3ZGxBwo4ZTxmeMuVI13cQ34irG9qbj/tzqMq
 XMLqmqKnNjT5ugSWXDin5nUgxOsunHpdBTa0FLMWL0DlfjNsn32Ltkp4sbTMg438d1g78h
 npnktFuVbfmJ/VNOHy3FMMY/Mkd8hAnpJHZ1jYbw8eWyWrqOXDs+7GW4tee2Og==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=badKUvRQ
Subject: Re: [Buildroot] [PATCH 1/1] package/libopenh264: bump version to
 2.4.1
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

On Sat, 26 Oct 2024 23:00:33 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes:
> https://github.com/cisco/openh264/releases/tag/v2.4.1
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/libopenh264/libopenh264.hash | 2 +-
>  package/libopenh264/libopenh264.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
