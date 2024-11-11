Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E92E6781D
	for <buildroot@archiver.kernel.org>; Mon, 11 Nov 2024 15:56:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B1E4606CB;
	Mon, 11 Nov 2024 15:56:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zC-TB-QHzktZ; Mon, 11 Nov 2024 15:56:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75602606E0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75602606E0;
	Mon, 11 Nov 2024 15:56:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E31DE6C
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 15:56:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C4AA740147
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 15:56:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V_kc96jRlgW3 for <buildroot@buildroot.org>;
 Mon, 11 Nov 2024 15:56:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8584040089
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8584040089
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8584040089
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 15:56:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D042420007;
 Mon, 11 Nov 2024 15:56:26 +0000 (UTC)
Date: Mon, 11 Nov 2024 16:56:25 +0100
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <20241111165625.7e8dde39@windsurf>
In-Reply-To: <20241111162809.03a02ac0@windsurf>
References: <20241108184356.2519527-1-ju.o@free.fr>
 <20241111162809.03a02ac0@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1731340587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4FBY/0fzb9gPctTNoRTNK4Fa3sthUIayWgO+sWBvfmA=;
 b=aD6JWG/w74Rj0+KX2hLGu3AkqzQjFy5557UpCJKaLtFLsbOGf9dRQgiAvfv2ceF4xJ/01y
 AWuY6xo2h60DSfUms0g4Tl+cmpQj94ejFrCCgTbdytwl9/PTcDfvZKDnoo7MrW0wZ7HhhL
 6V0DUMOe0JuC4ovn3IXeWDLne+ZXjH18Ra3o1dNRE0qPmCKtrRF1d634OIfVBcnPJqpJQs
 L0EONo7sCgzJIHJhUgOjlHhA3PcCcY6MZFD/bIGpyP9XffiZhXv/0Ze8a72WlnR3pUBHPC
 MFYyqF5foDhA3XeyGQ5NB3Q9WcbdxgQB4XtNXYhJGxXPjvUqTWiO0eltLB3QGA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aD6JWG/w
Subject: Re: [Buildroot] [PATCH 1/1] package/uhubctl: bump to version 2.6.0
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

On Mon, 11 Nov 2024 16:28:09 +0100
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Applied to next, thanks.

Applied to master of course, I used the wrong key shortcut.

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
