Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44156D24454
	for <buildroot@archiver.kernel.org>; Thu, 10 Oct 2024 21:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 14A2741305;
	Thu, 10 Oct 2024 21:38:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mq-7UvAd2atZ; Thu, 10 Oct 2024 21:38:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7984F416CB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7984F416CB;
	Thu, 10 Oct 2024 21:38:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 24D041BF3C3
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:36:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 14A3881F78
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:36:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DUomYHk3sgMI for <buildroot@lists.busybox.net>;
 Thu, 10 Oct 2024 21:36:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1ADD481F71
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1ADD481F71
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1ADD481F71
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 21:36:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5227340004;
 Thu, 10 Oct 2024 21:36:45 +0000 (UTC)
Date: Thu, 10 Oct 2024 23:34:12 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20241010233412.64e9e99e@windsurf>
In-Reply-To: <20241009155037.3779101-1-james.hilliard1@gmail.com>
References: <20241009155037.3779101-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1728596205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IynYHp5t3i2nGg/El1PrclWnfmf9XR08OaBxCKk9Q7U=;
 b=QFyigTNKVCTkdwFKCFCjOSC5zc0x8F9seBhI8JCwMloKDNmimqtb/nILPxabk67plMo5wa
 8XdUwjxp2Ccbh0pH+dXIkdRHdbG6SQv4OAgPGThl7Ey4Kkux1YvG3m3qml7quMWn/EOnqP
 JtGArq72WeLcXNiJjfJytWIGYZIC2b41YEH9vC8y8lle46QG8JwugJFkTTFw1VVxb8nYpI
 oXpPxhAOlzD3TRVauOmhF1sy1uXb06T3T9K+mVdSu9+mI8d9ttQJlEB5zI0t7upn7TQ7tk
 zF4U/2IhDBJNiDu23MLU53jgRGh/9pmnZd0U6fClSvrqDJckMLHmxklnU0zgkg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QFyigTNK
Subject: Re: [Buildroot] [PATCH 1/1] package/python-boto3: bump to version
 1.35.36
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
Cc: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  9 Oct 2024 09:50:37 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-boto3/python-boto3.hash | 4 ++--
>  package/python-boto3/python-boto3.mk   | 4 ++--
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
