Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F48ACD128A
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 21:06:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E00C60E90;
	Wed, 10 Apr 2024 21:06:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jBDjr2D9kbDt; Wed, 10 Apr 2024 21:06:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01CD760EC7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01CD760EC7;
	Wed, 10 Apr 2024 21:06:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2B5701BF4D6
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 21:06:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1712360EBB
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 21:06:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o5YTFmOfaSVS for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 21:06:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B215560EBD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B215560EBD
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B215560EBD
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 21:06:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4EEA4240003;
 Wed, 10 Apr 2024 21:06:22 +0000 (UTC)
Date: Wed, 10 Apr 2024 23:06:21 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240410230621.36c7317e@windsurf>
In-Reply-To: <20240330180023.787791-1-fontaine.fabrice@gmail.com>
References: <20240330180023.787791-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1712783182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9czR8AOHEcq/r6Yg2xecwY1+WuJ7TsShp9SEzxORzV0=;
 b=Bq59UfbiI5Lx02EocB0g6U1Xn5K8jP1Xeribavnil8PExiSN22sZRuUmJzqcurqWHAnZmV
 xmE4ujEk9jxmFl7ORdOXdWtKo/+wsZGpaSAMBtJGkTlcF8Aq7rA0E7TMX/E2xG1weExxCk
 bw7eu4pkWQWzKMBV+5xB4PMmpKctB7Kb7MF/2CdtWLfm4W2052u74PZ1k1cgmYQihi8/2w
 4OH4WDaDCZqqEQ3JlxoTEX29uPodBkEJ4Jnc8h1EybpRvLfnYn8rDdJIsnlqutbKbFGTIm
 N5IxUWXQQVy4iS6ZAJshvsaQnYu9MCio2BD+yv7deVQqpSi1w7HNAJGEbAbQZg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Bq59Ufbi
Subject: Re: [Buildroot] [PATCH 1/1] package/php: fix build without threads
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 30 Mar 2024 19:00:23 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure without threads raised since bump to
> version 8.3.4 in commit e50460f9f12a8c5f82f2166733afe9cca3c8cd19 and
> https://github.com/php/php-src/commit/a11c8a30399e90c17c287b9656c0077bc5131c9c:
> 
> /home/buildroot/instance-0/output-1/build/php-8.3.4/Zend/zend_call_stack.c:39:11: fatal error: pthread.h: No such file or directory
>    39 | # include <pthread.h>
>       |           ^~~~~~~~~~~
> 
> Fixes: e50460f9f12a8c5f82f2166733afe9cca3c8cd19
>  - http://autobuild.buildroot.org/results/a4ef648a9da50b26ed56d5d490e4cf5a1bfff970
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ll_stack.c-fix-build-without-pthread.patch | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 package/php/0006-Zend-zend_call_stack.c-fix-build-without-pthread.patch

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
