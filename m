Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67FC5D3A696
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 20:26:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3789080A5D;
	Tue, 29 Oct 2024 20:26:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BXK3F8y7jMGk; Tue, 29 Oct 2024 20:26:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BA8280B37
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BA8280B37;
	Tue, 29 Oct 2024 20:26:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C2BB44969
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 20:26:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A3F6E405F4
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 20:26:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8UXGrzBYU9Ce for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 20:26:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 62F524014E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 62F524014E
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 62F524014E
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 20:26:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 690301BF205;
 Tue, 29 Oct 2024 20:26:21 +0000 (UTC)
Date: Tue, 29 Oct 2024 21:26:20 +0100
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Cc: Marcus Hoffmann <buildroot@bubu1.eu>
Message-ID: <20241029212620.0aae25b4@windsurf>
In-Reply-To: <20241029161142.3273594-1-buildroot@bubu1.eu>
References: <20241029161142.3273594-1-buildroot@bubu1.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730233581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tpjto92yeXzFtWtYtw2v9Vxqwt4tH34w8HELBV/bqUA=;
 b=fkWiS1SlcufNDGX5fJYGPWlQTwHykToDKp0eZObGBnRxGu+mNT7bXQeg79glnuNmISXUW1
 TX/mzcivAAHIKC2jDiuFF6Z/ExW7LPp10QyKmXYcxFZalZ84WvX2a5oHQx5L9dFCjUqZ6G
 0yHOof3hcEcMpmwdomlvkr6e7NSMjgxa6buScAkZuL6hCVnnEhfIBnzgBGye48wvyiypOg
 8Rb5m1744PewH7w+pyFmsQza7ii9GRyeALgHLjiBQUZ85myl8ybWbulsSVvK0KOrmAbyKB
 YixiGakeyF1u+bHVbkFWyw2ejqjwueTtqPHL956iSkzP4B6XdKQPisrrKefcpA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fkWiS1Sl
Subject: Re: [Buildroot] [PATCH v2] package/c-ares: bump to 1.34.2
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

On Tue, 29 Oct 2024 17:11:41 +0100
Marcus Hoffmann via buildroot <buildroot@buildroot.org> wrote:

> License hash changed due to [1].
> 
> [1] https://github.com/c-ares/c-ares/commit/595cf2133488d2e02c6389577a1b511971dba1ba
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> ---
>  package/c-ares/c-ares.hash | 4 ++--
>  package/c-ares/c-ares.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
