Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4266CC02182
	for <buildroot@archiver.kernel.org>; Tue, 21 Jan 2025 15:36:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4A35408AC;
	Tue, 21 Jan 2025 15:36:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4gbhPrtcHXYk; Tue, 21 Jan 2025 15:36:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDE7541271
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDE7541271;
	Tue, 21 Jan 2025 15:36:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D25369
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 15:36:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B519400F2
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 15:36:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K5LHAzyjcDHT for <buildroot@buildroot.org>;
 Tue, 21 Jan 2025 15:36:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C6DE040462
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6DE040462
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C6DE040462
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 15:36:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 47B261C000C;
 Tue, 21 Jan 2025 15:36:23 +0000 (UTC)
Date: Tue, 21 Jan 2025 16:36:22 +0100
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20250121163622.6936547d@booty>
In-Reply-To: <20250121102222.1335874-3-neal.frager@amd.com>
References: <20250121102222.1335874-1-neal.frager@amd.com>
 <20250121102222.1335874-3-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1737473784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RXEUC+MG0KcMRlbi8FuTNu6tHJ4wf6C98ctMhskF/1Q=;
 b=kOkTjbJJFeQA+k4Wf6Sfz6PQ1SOqnExIDSXBg3f44V8FQv65+JbKg10y8OpNZQNCxDCYWz
 m0ydxyIXO1zS3YafMXGtOu8HrotpkFpVHWCW7O7xlrl5jluUuE6kVO232cAsnglfu1waiW
 eubUx53WzLdQpmRnt8meNOsiF8nBGjJc6riqATuRYcOrDyyrTQ+h6OWWMGrk1cLc24bYe1
 EakCZH4SiaQ+NqU/NSY1AEzWqHZAqn7AuPxiBA25p5A9o7SZ/MEcod+6Of2vzmXbOSJg6w
 sO10ALOY5dh2ik7SGJB5hEVskllQjIQwIiESjHI9Llxts3xZRq+VtIglz2ZRow==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kOkTjbJJ
Subject: Re: [Buildroot] [PATCH v3 3/4] configs/zynqmp_*: migrate to
 xilinx-embeddedsw
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: ibai.erkiaga-elorza@amd.com, brandon.maier@collins.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org, romain.naour@smile.fr,
 michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 21 Jan 2025 10:22:21 +0000
Neal Frager <neal.frager@amd.com> wrote:

> Migrate zynqmp defconfigs to xilinx-embeddedsw package for building
> zynqmp pmufw.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

[Tested on Kria KV260 starter kit]
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
