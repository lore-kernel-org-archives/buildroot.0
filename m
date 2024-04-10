Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8614ACD128A
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 20:45:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 492EF400DD;
	Wed, 10 Apr 2024 20:45:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RpOskqyqfkRr; Wed, 10 Apr 2024 20:45:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6001C402D4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6001C402D4;
	Wed, 10 Apr 2024 20:45:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EBC3A1BF4DD
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 20:45:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E5313409AB
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 20:45:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UP5AhXS6BXEV for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 20:45:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BCA344097A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCA344097A
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BCA344097A
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 20:45:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A7E81240004;
 Wed, 10 Apr 2024 20:45:21 +0000 (UTC)
Date: Wed, 10 Apr 2024 22:45:20 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20240410224520.23f371d9@windsurf>
In-Reply-To: <20240330141625.1304798-1-giulio.benetti@benettiengineering.com>
References: <20240330141625.1304798-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1712781921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zh0C0SRHI3/JquxZ0U//LbKc9s9tQ14gn9qILQI51WQ=;
 b=fbk3JUEA8j6nJUqxvLii65zL6pYgK310Leg8TwAvwvCwNZBVZ+rp57IHBoYso+FCfKCm3Q
 wyP0Hu5KCEifZ8SO28o/c3a60S6ZBnMEXvNHWWUsjcEZazNkEPMARcCoHUzXCSaNWSu4V2
 +Ej4kSEC6maAlmU0F7h7u+l14rXj5aghuEAwsvHE1jGpDzKinXPDpEj7RZ7/JEycs0qdIG
 7ctZ0VHYxFsYBrmJ6Ic69hqXuWe70oC8xQINvGbbHP8pevTlIM2t+ceX9/9jH5GZjsZTFg
 Sb1sbYGVw+lj+Ig8imyqXoMpLOI49Lf5osC8dlu28c8ssFUT2AeklwEailb0ng==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fbk3JUEA
Subject: Re: [Buildroot] [PATCH] package/harfbuzz: bump to version 8.4.0
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

On Sat, 30 Mar 2024 15:16:25 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/harfbuzz/harfbuzz.hash | 2 +-
>  package/harfbuzz/harfbuzz.mk   | 2 +-
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
