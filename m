Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 344F0C35FE7
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 10:54:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3BDE8052C;
	Sun, 15 Sep 2024 10:54:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zRMbW9U8skwU; Sun, 15 Sep 2024 10:54:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD35C80D74
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD35C80D74;
	Sun, 15 Sep 2024 10:54:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 392C11BF29D
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 10:54:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 351D880D74
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 10:54:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OhUL8pX-jTfS for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 10:54:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F07278052C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F07278052C
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F07278052C
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 10:54:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CDA1160002;
 Sun, 15 Sep 2024 10:54:21 +0000 (UTC)
Date: Sun, 15 Sep 2024 12:54:20 +0200
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Message-ID: <20240915125420.37622174@windsurf>
In-Reply-To: <20240915103629.884407-1-thomas.perale@mind.be>
References: <20240915103629.884407-1-thomas.perale@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726397662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vEWG/fTxppJINyrf0ZrZAOcQDJG3Y1pJNuT/ugWUHPE=;
 b=PrragqJ31XvpgbI0TuvDhFyaIyihlcd2UV+axp5NR+Yu28DP3y7eaOdXPTGTZi9Xei4MlS
 ej/Su8bGgaxauNXAxWQX+7efJtIZuA2542QbKxLEHRvlrB194UqS1sA/hrseoG2inpSaU7
 V+B7iBAOKuUoFs0gg6UeGS+u+gdKK2dfEZNc944ZqzDCJZ/M3f3RqefIKPbFgCmy9hAADF
 O95iUnJURZw/8uaYjU+1MjJ0m1+4vJ/Aauv3NIk01ZXB6UGrFaV4C4KkPciYjR9pveQ7wn
 UTe7B/ZRdCGNj827R9gT0qd5Pvvs9q8C1QRdtZodwKZXuAaRkgCE8mO3iMs32g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PrragqJ3
Subject: Re: [Buildroot] [PATCH 1/1 v2] package/libssh: fix build failure
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
Cc: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 15 Sep 2024 12:36:29 +0200
Thomas Perale via buildroot <buildroot@buildroot.org> wrote:

> diff --git a/package/libssh/0001-cmake-Only-enable-CXX-when-running-the-coverage.patch b/package/libssh/0001-cmake-Only-enable-CXX-when-running-the-coverage.patch
> new file mode 100644
> index 0000000000..e70c0fa44e
> --- /dev/null
> +++ b/package/libssh/0001-cmake-Only-enable-CXX-when-running-the-coverage.patch
> @@ -0,0 +1,56 @@
> +From 328ae3d2306c9f65b5e85a2be98a368c07287a05 Mon Sep 17 00:00:00 2001
> +From: Thomas Perale <thomas.perale@mind.be>
> +Date: Sat, 14 Sep 2024 21:07:30 +0200
> +Subject: [PATCH] cmake: Only enable CXX when running the coverage
> +
> +Commit 25a678190c42b24076fdd805a8d7a722a8a9c798 introduced code coverage
> +collection. That also introduced a dependency to CXX language.
> +
> +When cross-compiling libssh in an environment that doesn't have a C++ compiler
> +the following error is raised: "No CMAKE_CXX_COMPILER could be found.".
> +
> +Since the C++ part is only needed for the coverage part, this commit only enable
> +that language dependency when actually needing it.
> +
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Then it was missing the Upstream: tag this time around, causing a
"check-package" issue. I fixed that up, and applied. You may want to
add https://paste.ack.tf/f908e5 as your .git/hooks/post-commit to get
nice check-package checking integrated in your Git workflow.

Thanks a lot for providing this fix!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
