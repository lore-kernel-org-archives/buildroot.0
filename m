Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB733C021BE
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 21:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DD80406C2;
	Sat, 14 Sep 2024 21:50:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AciUc9frKutB; Sat, 14 Sep 2024 21:50:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71FB4406C3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71FB4406C3;
	Sat, 14 Sep 2024 21:50:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A64911BF470
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 21:50:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 93E81406C3
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 21:50:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OVGuwd4iD9iU for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 21:50:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 43724406C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43724406C2
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 43724406C2
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 21:50:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2CB4C1BF203;
 Sat, 14 Sep 2024 21:50:39 +0000 (UTC)
Date: Sat, 14 Sep 2024 23:50:37 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20240914235037.7dbfc580@windsurf>
In-Reply-To: <20240907173123.649023-1-yann.morin.1998@free.fr>
References: <20240907173123.649023-1-yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726350639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h+0QOyhnMkAwbTsDLji++01r3fdLQphNZwP088l9VaE=;
 b=SV7GRyv4nXHWm5tpC8ZS2c+8D/yG25U4uVv1sd3TZdyeEv8M0z9PBhQZw3WHxigv9Vad7b
 ipibVdvNbQgIX5/dCGrB2Quh2D/HJgPVgHMBoZi8yd5jPnifuEFduWR+rwK2gTsbYDAkFr
 3Q+XvGCIuEQtkQWHX0JjHhzti6i4O60/gDv1lXy4x1DBM/hT9umKHot7dp7OaeOlS5h+uk
 zzFZoCw5TOjNYOKS2JY8VStnBNpLH8MYB36f3W3W7Ni9u15D8UsYORTFaxL/jZpYHdRYI+
 hJz1W5OZXmuJN3xenNWmRlADi84vqtaqI9JJ64L4mx08VSSj1Qtgv4fYJFN9Jw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SV7GRyv4
Subject: Re: [Buildroot] [PATCH] utils/check-package: require exactly 1 TAB
 and 2 SP on help text 1st line
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
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  7 Sep 2024 19:31:23 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Test that the first line starts exactly with one TAB and exactly two
> spaces before the text.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
> ---
>  utils/checkpackagelib/lib_config.py | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)

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
