Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B806ECD11C2
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 09:30:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AAF181FFC;
	Wed, 10 Apr 2024 09:30:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dMuTDXX_WBcE; Wed, 10 Apr 2024 09:30:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81C6D81FF0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81C6D81FF0;
	Wed, 10 Apr 2024 09:30:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EE6E61BF2F9
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 09:30:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E8A7960645
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 09:30:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uqT8McHeruk3 for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 09:30:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2D99E60635
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D99E60635
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2D99E60635
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 09:30:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 00DB220007;
 Wed, 10 Apr 2024 09:30:44 +0000 (UTC)
Date: Wed, 10 Apr 2024 11:30:43 +0200
To: "Matt Staveley-Taylor" <matt.stav.taylor@gmail.com>
Message-ID: <20240410113043.419ef54b@windsurf>
In-Reply-To: <D0FYEL09CD80.1UJQPUQZNKEPS@gmail.com>
References: <20240408013859.732937-1-matt.stav.taylor@gmail.com>
 <20240408225410.6a8ba988@windsurf>
 <D0FYEL09CD80.1UJQPUQZNKEPS@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1712741445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BUWAFjSMbZlYu+2LWyTOnAtqbDLeQc2f/ZA3eohTP+0=;
 b=DZsaaQIjhZivz4fA2JENpRn00PsdDg+l98KTZemLGSxKPc4YSNYjdH3JMcJaUV8Et/N3td
 tWU75SFvYnE0hYqyg/1GeQqtI4XAaQ2WiK4muarta0rNs6F1PmuHgnJFcQ0JKbyAOZ5AtM
 SAGQL9Ny/UyY8tH7TA+K4KKVZQvicvW5fc/qaMR093KcLKCChCQA2XmqNNH+SF98m0NqRq
 Bg1xyvevxfvay0HbSd6DWK1RRG7xhRLLDnX14hWISTQR5lKag84Tri3ajr7oIhb8BK9wUy
 bZC0iuTk7xG6jdcBqSz5fUxdyROB2CX8ms1gp68oIo9d2KtFGlAW/hTEhpRmpQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DZsaaQIj
Subject: Re: [Buildroot] [PATCH 0/2] Add bcachefs-tools package
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

Hello Matt,

On Tue, 09 Apr 2024 23:43:29 +0100
"Matt Staveley-Taylor" <matt.stav.taylor@gmail.com> wrote:

> The main binary and some of the subcommands are written in Rust, but
> most of them are written in C. The Rust main calls into the C
> subcommands using a tool called bindgen which generates Rust glue to
> interface with the C code.
> 
> So unfortunately I don't see a good way to avoid building host-clang
> here.

Indeed, not much we can do then. Thing is that host-clang is extremely
long to build, obviously...

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
