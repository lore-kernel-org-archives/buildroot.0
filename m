Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE352C4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 21:36:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E10781337;
	Wed,  1 May 2024 21:36:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dSfA3G397iLt; Wed,  1 May 2024 21:36:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 880C981348
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 880C981348;
	Wed,  1 May 2024 21:36:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 618E81BF384
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 21:35:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B73060BCC
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 21:35:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Wlmzp7Zcxfo for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 21:35:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3321C60BCA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3321C60BCA
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3321C60BCA
 for <buildroot@buildroot.org>; Wed,  1 May 2024 21:35:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 14F2D1BF204;
 Wed,  1 May 2024 21:35:53 +0000 (UTC)
Date: Wed, 1 May 2024 23:35:53 +0200
To: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Message-ID: <20240501233553.3ee07ef3@windsurf>
In-Reply-To: <20240415120820.465163-1-buildroot@heine.tech>
References: <20240415120820.465163-1-buildroot@heine.tech>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1714599354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qQ6z0HRSiARWWNZ9IIP8M4Sf5ssaNyobntznbLKzhZc=;
 b=oaz+mTZKrW2gVergrev9gEBVMXCVTbpo5I+INbF4rt9Q/mLA2vJTIv0Mkl9yR1ahmpZv5n
 HJaZ/WHne+bhczBGEuFnud0YZ4iwPldpfNxH4hOwMhqsOhhPf27rie4QnJzqG/2RO/y22h
 8OZbU5hIbIVo4/zxAxtb8SD6NX3JFlp4P8HfOPKY5MzAP+2MX4fB/q2E1OcNjGXMNOtFOr
 vOnNvcXq2lfXNKE7DPZ5O4ubh+//QhzvCRG6GW1LLTnhYh8AOvgZ2ywrVKIc8AHifNvfvb
 lC93u+J0jhLz0z9WPz6xCSH6/dHbBO5GNkr0wuM3LqUV3wz9tcmp/6aeTThSJA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oaz+mTZK
Subject: Re: [Buildroot] [PATCH] package/catch2: bump to version 3.5.4
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 15 Apr 2024 14:08:19 +0200
Michael Nosthoff via buildroot <buildroot@buildroot.org> wrote:

> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> ---
>  package/catch2/catch2.hash | 2 +-
>  package/catch2/catch2.mk   | 2 +-
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
