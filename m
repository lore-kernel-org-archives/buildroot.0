Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB22CD128A
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 20:24:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D9B354176D;
	Wed, 10 Apr 2024 20:24:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jyTGrlgLEGLb; Wed, 10 Apr 2024 20:24:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D73B741722
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D73B741722;
	Wed, 10 Apr 2024 20:24:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 14C4F1BF4DD
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 20:24:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 01EE860E82
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 20:24:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yaf0TwwjgB70 for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 20:24:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 38BAB60E76
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38BAB60E76
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 38BAB60E76
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 20:24:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5554220004;
 Wed, 10 Apr 2024 20:24:46 +0000 (UTC)
Date: Wed, 10 Apr 2024 22:24:45 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240410222445.1a8c6294@windsurf>
In-Reply-To: <20240410181318.7494-1-ju.o@free.fr>
References: <20240410181318.7494-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1712780686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LQqVkwbf9FtPoH8aPb0lSRFtgoFk1yoAMVGa7Ths734=;
 b=BwFfGhF5Pcy24y1XZa3nyhFVb4/Z4uv6hJ9olyQeciJfPsQISIOA4p1NVAidhk3sq7ZYq4
 Uk4erwceLpV82GLJsDm6u9kkuUy14l6GQ6EMITRvtoSx6y2Zvi8JtfvlWjlAqQnUP9aDT9
 cH36+wppuCJ4bne5rtLaJlzsUyeFQ9rqCxBkKuBKermteUom3jIRViag2n9ni0aH3yusKw
 tZCRjC9IOljavcZ57EupLB7DjdIivVoxMv1fflUoaDfn+BDgIKzSWkyriPTedX0oKPmvw9
 ttfxoIHxUY60ERsQXOMWhR6m6De7L4SJdhxiAEqMXhRKq7wt3E6HgLdpG3yxlw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BwFfGhF5
Subject: Re: [Buildroot] [PATCH 1/1] configs/imx28evk: bump U-Boot and
 kernel versions
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
Cc: Fabio Estevam <festevam@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 10 Apr 2024 20:13:17 +0200
Julien Olivain <ju.o@free.fr> wrote:

> Bump U-Boot to 2024.04 and kernel to 6.6.26 versions.
> 
> The Kernel DTS name is also updated, to follow
> the reorganization in [1], first included in v6.5.
> 
> Fixes: [2]
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=724ba6751532055db75992fc6ae21c3e322e94a7
> [2] https://gitlab.com/buildroot.org/buildroot/-/jobs/6544501164
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  configs/freescale_imx28evk_defconfig | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

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
