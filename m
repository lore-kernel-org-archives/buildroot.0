Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91235C10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 16:22:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5ABC441E48;
	Thu,  9 May 2024 16:22:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1p1kYdxwEYvr; Thu,  9 May 2024 16:22:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3106441E49
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3106441E49;
	Thu,  9 May 2024 16:22:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DF73A1BF337
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:22:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D825041E48
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:22:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RWuFDJimCJvH for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 16:22:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9EB8341E49
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9EB8341E49
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9EB8341E49
 for <buildroot@buildroot.org>; Thu,  9 May 2024 16:22:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4A614E0006;
 Thu,  9 May 2024 16:22:45 +0000 (UTC)
Date: Thu, 9 May 2024 18:22:44 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240509182244.4c8ef07f@windsurf>
In-Reply-To: <20240423171118.230359-1-ju.o@free.fr>
References: <20240423171118.230359-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715271765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ubgcchSkYqzfLYVieRf/TZMAZO3M+82j+sb9EyXTRQc=;
 b=VDy7jzN2YeCMumfABX5A8fIWriPoMaUkgQRQDD81D7TYg2YccjmA5timUhL3tkptnaY++w
 YAPFGJSPycdc/t6W9UBcynSbj57jnRNENSGUdox72C73FMnl0DlB0N+sczXp1jPimcfyJL
 kUilMhKElAryS42QQPzcO/4n2JkYksWfybmSOY/Un0qEFtix63Fazn86Z0m9eEyAsH4Sm5
 IaCWowtHEyN/KkhY6Y3/Yjk0KuUZVsxzNx+630g9cqet0EpUEmyw8Y6fLUj/c9nJ5/z4hp
 iMO6SW8rTqRA05lRv9m9cE5bzJVCg95Ikg0CZJVtwpBptBhkit9XvHjsZd4spg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VDy7jzN2
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: add socat runtime test
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

On Tue, 23 Apr 2024 19:11:18 +0200
Julien Olivain <ju.o@free.fr> wrote:

> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  DEVELOPERS                                  |  1 +
>  support/testing/tests/package/test_socat.py | 56 +++++++++++++++++++++
>  2 files changed, 57 insertions(+)
>  create mode 100644 support/testing/tests/package/test_socat.py

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
