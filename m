Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 947CECA0EDC
	for <buildroot@archiver.kernel.org>; Fri, 30 Aug 2024 17:09:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F6C0411C2;
	Fri, 30 Aug 2024 17:09:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pkRTPrEK9Xoj; Fri, 30 Aug 2024 17:09:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23924411C3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 23924411C3;
	Fri, 30 Aug 2024 17:09:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D5CD21BF5A5
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 17:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D0E1D80A4C
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 17:09:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nRIXgnpf-dlW for <buildroot@lists.busybox.net>;
 Fri, 30 Aug 2024 17:09:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CC8B080567
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC8B080567
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CC8B080567
 for <buildroot@buildroot.org>; Fri, 30 Aug 2024 17:09:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0D7FE40003;
 Fri, 30 Aug 2024 17:09:29 +0000 (UTC)
Date: Fri, 30 Aug 2024 19:09:29 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20240830190929.026208bc@windsurf>
In-Reply-To: <20240830082650.1895430-1-peter@korsgaard.com>
References: <20240830082650.1895430-1-peter@korsgaard.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1725037770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SCSs0sWlDjOHbRZgjNtr2NgJlStDK97SQuWhh+MEp70=;
 b=l12Cv7cHH0GO46HIncpO3tWQu9rFvftlLLQVeLZVdZwL3UJ3zwk/Q9JwNLR4ZC7xqwp3MY
 ZEvc9QmxB94I95yjbO/NxY5wDOW5TtisZ3alyYAtRO9LpCCJICjtAUcCUg39kp/Cd6RLtp
 GkRjCaGvQC1C1oEkPQ8War5uQWQkb/IHlhelbk2OaIt4xYpQe70F1GqDa7Qshee0ROGTZ0
 Apvafg1NP4VS8OS8b+G4Esy64N97WfHZAwkOZZ5gv4rH1KcJDz+VDEPCi7K9Gy3HRiYOYr
 kiul+zVgw6Kn8FPBr8GtRZdaFvEWQy2yjpaviaZ282tdJZY2r/Dp62BiL2EN7Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=l12Cv7cH
Subject: Re: [Buildroot] [PATCH] support/scripts/genimage.sh: drop gzip
 compression
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

On Fri, 30 Aug 2024 10:26:49 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> Commit 6889056f1eb4 (support/scripts/genimage.sh: support creating a bmap
> image) added unconditional gzip compression of the genimage outputs if
> bmap-tools is enabled, which is problematic for a number of reasons:
> 
> - The gzip invocation is not reproducable (E.G. does not use -n)
> 
> - The original file is removed, dropping the sparse info
> 
> - It hardcodes policy, E.G.  bmap supports a number of different compression
>   algorithms / compression may not be desired for all images / different
>   compression levels may be desired
> 
> So drop the compression step.  If desired, compression can be done with a
> post-image script.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  support/scripts/genimage.sh | 1 -
>  1 file changed, 1 deletion(-)

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
