Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D886C07E9D
	for <buildroot@archiver.kernel.org>; Sat, 24 Sep 2022 08:30:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D42E9408C9;
	Sat, 24 Sep 2022 08:30:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D42E9408C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JJE8_rIDPgkD; Sat, 24 Sep 2022 08:30:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 115B3403E9;
	Sat, 24 Sep 2022 08:30:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 115B3403E9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 69D2F1BF861
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 08:30:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 44D2D83F78
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 08:30:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44D2D83F78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UE8AaIA5bGqy for <buildroot@lists.busybox.net>;
 Sat, 24 Sep 2022 08:30:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0218A83F70
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0218A83F70
 for <buildroot@buildroot.org>; Sat, 24 Sep 2022 08:30:40 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BE693E0004;
 Sat, 24 Sep 2022 08:30:37 +0000 (UTC)
Date: Sat, 24 Sep 2022 10:30:36 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Mario Haustein <mario.haustein@hrz.tu-chemnitz.de>
Message-ID: <20220924103036.6ba8ea92@windsurf>
In-Reply-To: <20220902222849.1098641-1-mario.haustein@hrz.tu-chemnitz.de>
References: <20220902222849.1098641-1-mario.haustein@hrz.tu-chemnitz.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664008238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ug6gQU9mSs514esJbCMieqpIhs6MDjWa87KNuMgblpM=;
 b=kPimaR3Z8wTXtqyNlJbENsl43f2R9zgVpbzzAUrVmoMzA/BXFyzFtFaOb933UeUENe1frW
 ZH4gIAEmsScZ6dnelu73gkyA6DYMP3wnALeEgnonXv8nTeZAhhZP7k2Jk6GAKcujWREW6k
 S8ebjcJ5pksmxDc1XlUq1wqaqyXv8mwfIlMT2erSEK6mE0MXKP3mTocOdGa9Dkv5jGKWI+
 RgrCbeFVbgZKez2cLf0NmV6cLdtsI9fMeZCj5ABkj7/Ut/lKExJjCAB595ATqXWxHNJ5+O
 Sa+Y6V/j1jvIHN60kpfX4uKvOKqqcuA7Y1nP4oh/QmfJN0DE/FDxMARX6HfV3w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kPimaR3Z
Subject: Re: [Buildroot] [PATCH 1/1] package/dcron: fix /etc/cron.d/system
 cron jobs
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
Cc: "Alvaro G . M" <alvaro.gamez@hazent.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Mario,

Thanks for your patch. See below some questions/comments.

On Sat,  3 Sep 2022 00:28:49 +0200
Mario Haustein <mario.haustein@hrz.tu-chemnitz.de> wrote:

> Jobs with the syntax @hourly, @daily, ... were not executed since the
> recent version bump. This patch fixes the bug downstream.

Which "recent" version bump ?

The last commit on package/dcron/ in Builroot is from January 2021, I
wouldn't call it recent. It bumped from version 4.5 to
1ba33c3325df48de46263276a43ed76cf9d81518, while switching to
https://github.com/dubiousjim/dcron/ as the upstream location.

Is it this version bump that broke things?


> diff --git a/package/dcron/0002-system-crontab.patch b/package/dcron/0002-system-crontab.patch
> new file mode 100644
> index 0000000000..5573c68111
> --- /dev/null
> +++ b/package/dcron/0002-system-crontab.patch
> @@ -0,0 +1,23 @@
> +commit 1fd99b71b063b1573beaf9f6b801ec5be2fbe24f
> +Author: Mario Haustein <mario.haustein@hrz.tu-chemnitz.de>
> +Date:   Fri Sep 2 23:20:14 2022 +0200
> +
> +    Make @hourly, @daily, ... work again
> +    
> +    closes #15
> +    
> +    Signed-off-by: Mario Haustein <mario.haustein@hrz.tu-chemnitz.de>

Could you use "git format-patch" to generate this patch, and include in
it a reference to the upstream pull request
https://github.com/dubiousjim/dcron/pull/35.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
