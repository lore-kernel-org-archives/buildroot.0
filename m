Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C9EC25B74
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 21:29:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A50FD42C0C;
	Fri, 10 May 2024 21:29:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2ff3zK0HqHGl; Fri, 10 May 2024 21:29:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9B5142C2F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B9B5142C2F;
	Fri, 10 May 2024 21:29:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3559E1BF36A
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 21:29:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 210D642C2F
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 21:29:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FPKt_bvsM9bh for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 21:29:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1D32842C0C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D32842C0C
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1D32842C0C
 for <buildroot@buildroot.org>; Fri, 10 May 2024 21:29:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 69F00FF804;
 Fri, 10 May 2024 21:29:14 +0000 (UTC)
Date: Fri, 10 May 2024 23:29:13 +0200
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Message-ID: <20240510232913.0a09381b@windsurf>
In-Reply-To: <7e7799e4-a1b5-4c69-8db7-65ae192753a6@bubu1.eu>
References: <20240325115114.140028-1-buildroot@bubu1.eu>
 <7e7799e4-a1b5-4c69-8db7-65ae192753a6@bubu1.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715376554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VIq0KIByza+XMKS16bsWvx8dIGth4cJlfFyizriSEqg=;
 b=J74wDMqU3SHznHAVmzshrRe4Q00bc4T1O8JoK9DzF5Ri091GpM5j7dDGgL+mM4Cjj2D9Wf
 LSLOj5DW5oyOFSAyraM0NVe30E+s91cEUd1cPseFwpBh61bd/QO0bZ6RRbLKitQkStKTf5
 mqH72ln4GkAGt32qdZva4ux0xywp8iD4efsR++10X8KwcMTH+IARsjrBvWJZuOl71+Z8TH
 VRKyIugo2G7upLRXc7NsSTJhcq9hiIZhcgNZi8iiJFENoWXaPiGyDp5K5KXLqBv+KBiImd
 bxGcFKmyg9kaf5v2s/ZLpq5nEajptki3vjCQRzjF2WfiJK9R+fCCDfs6ULTYmw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=J74wDMqU
Subject: Re: [Buildroot] [PATCH] package/python-hatchling: bump to version
 1.22.4
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
Cc: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 25 Mar 2024 12:52:51 +0100
Marcus Hoffmann via buildroot <buildroot@buildroot.org> wrote:

> I wonder if the host-python-editables package should be dropped now? It 
> has no other users expect host-python-hatchling.

Sure. It is an orphan host package now, so it can be dropped.

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
