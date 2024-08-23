Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4979DC5321D
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 17:42:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13B78810FC;
	Fri, 23 Aug 2024 17:42:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p9XZI6JL8zqI; Fri, 23 Aug 2024 17:42:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3AF9381865
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3AF9381865;
	Fri, 23 Aug 2024 17:42:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DD7301BF34F
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 17:42:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB424612F6
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 17:42:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ux0H3JXCZIkL for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 17:42:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C1F76612EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1F76612EC
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C1F76612EC
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 17:42:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D0DA41C0002;
 Fri, 23 Aug 2024 17:42:19 +0000 (UTC)
Date: Fri, 23 Aug 2024 19:42:18 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240823194218.26c85b6b@windsurf>
In-Reply-To: <ZsWidTexm+tBiTlo@waldemar-brodkorb.de>
References: <ZsWidTexm+tBiTlo@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724434940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cusU7i2rPb/UCoZqqShAlaYRjaOCcOBq/xhea0wyPOQ=;
 b=RS5TPipoCqJQh0PsQ+l6XFrhp6MQYTRJ4a5YJkfb0Wuu8e5Fl5oELnnY8ElyisaK/YiC/3
 uOufLeJ8hWvV8NMBBS/xHNYNw7do2DtTjCzTJwhAAynw7oA7hw5bbRE/l5PaRz2Xr8eIJi
 xPP5SaTpMow0d8T+x41Js9UuwpElomsYZtjROwYnc9Y51Y2wDqtmnohqHG6ShExBv8gK0V
 TYEUIOWP5KHvHpTJlrKb3xFsq+METvMdfYnYSqv5TF9kRAg5AEuNbD6S4lG/3mN+RhsQQJ
 xGvcRzfSX8n3fBkNXUfoc2sN6CfNoCHaAMEpnOV082pxjiqfhk2ytUm7/wU1Pg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RS5TPipo
Subject: Re: [Buildroot] [PATCH] package/libglob: update download URL
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

On Wed, 21 Aug 2024 10:16:53 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Fixes:
> 
>  http://autobuild.buildroot.org/results/92c/92c697697c07f63f0e03ceb655b5d558e85c392e
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/libglob/libglob.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

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
