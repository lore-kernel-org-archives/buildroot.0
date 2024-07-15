Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 069CCC3DA59
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 14:27:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B9FD440650;
	Mon, 15 Jul 2024 14:27:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IEgAAPoxFRT6; Mon, 15 Jul 2024 14:27:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8DE0240734
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8DE0240734;
	Mon, 15 Jul 2024 14:27:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0E93F1BF3AD
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 14:27:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF7CE40650
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 14:27:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 956y0Dq2vniE for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 14:27:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A43E740608
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A43E740608
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A43E740608
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 14:27:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5D5781BF203;
 Mon, 15 Jul 2024 14:27:50 +0000 (UTC)
Date: Mon, 15 Jul 2024 16:27:48 +0200
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20240715162748.2bc8260c@windsurf>
In-Reply-To: <be4a74a6-981c-49c3-9d4e-e5f413cac1b7@mind.be>
References: <20240421095353.208034-1-dario.binacchi@amarulasolutions.com>
 <20240421095353.208034-2-dario.binacchi@amarulasolutions.com>
 <20240715160555.6e88961e@windsurf>
 <be4a74a6-981c-49c3-9d4e-e5f413cac1b7@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721053671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZJ44uMMjqulqAQ11VqoL+q6jNakZ3Cos0LyuoKADuLQ=;
 b=UK3VNpiEPvigEzXqsl+m5VfcsYbOyW7aLEnjEpE0cl+2DQaY+9llnoXPeuLrKXl9lPOGTI
 J43O61JMe/BV/ujp30t6A5H0S0+GBfngZNhIfC6f7lPlKOmLqbskhF5N/Pw6wA4vrbSzWB
 vUSFbdEOA+vAyXLbrgV3+1I19EFh1LOsOC2ThJ6TVtOk7qExpFMSflkZKETS2nd7KjfuUV
 TxSFqV5n0nUfE8cM1kbqHJRqKbdf45P5Pfoeiwvwt9DT8cVz5ceatNnaRGe9vHpVYa2AiY
 JfKeoR02qp/iMY0eFf6w+Ca35OSZjy2e8chelKZdOxWPV2CFHJABAPf52Kflxg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UK3VNpiE
Subject: Re: [Buildroot] [RFC PATCH 1/2] support/scripts/genimage.sh:
 support creating a bmap image
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
Cc: michael@amarulasolutions.com, Xuanhao Shi <X15000177@gmail.com>,
 buildroot@buildroot.org, Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 15 Jul 2024 16:23:53 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

> > (1) We don't add an option to script, but rather we look in the
> > Buildroot .config file is host-bmap-tools has been enabled. If it is
> > enabled, we assume the user wants bmap images  
> 
>   Instead of looking in the config, we could also look for it in PATH (with "if 
> which bmaptool >/dev/null 2>&1").

Yes, that was another option, but then for the same Buildroot
configuration and version, the build results would be different from
machine A (which has bmap-tools installed system-wide) and machine B
(which doesn't have bmap-tools installed system-wide). From my
perspective, this breaks the principle of least surprise.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
