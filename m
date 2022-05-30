Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2666C433F5
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 21:44:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B4FB61250;
	Mon, 30 May 2022 21:44:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8HwcvC_x-7SO; Mon, 30 May 2022 21:44:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABE6A6124B;
	Mon, 30 May 2022 21:44:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D35F41BF276
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 21:44:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C1DF761243
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 21:44:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dwJzXwLPuDde for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 21:44:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AD54B61242
 for <buildroot@buildroot.org>; Mon, 30 May 2022 21:44:34 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8A59A1BF204;
 Mon, 30 May 2022 21:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1653947073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PTttWuwskOS9ITw0ZHW1sKT+NaucMiQxKjRxTtL/thg=;
 b=elFGAy9KZGmXM0tyEjrO5Mb39ifJdbk9W1r5zGvzM5XLZoQjSC27dHCBz43cVz8UcLw3Ta
 TwW8cUGeY9CIOcJqXIKMHL4KLOzrDCLmIwBa4TElTlXjdXlnDOTqgrZGRwei7SAk4OI2d4
 W8f+5KyPROadSFtnDBZTH34SAUXh3m8D2pon5waKAj2D2jvMYs69hp/JPMJShAWfRg3ZBz
 qYid0qwWKNfjSVvvpQOWdL3KgImchP4wgr+7qDwDR6XcD+cuYms6r/qksw+hQlh94fvbhV
 CJBB696we1p0t17I/X9gsqy6PAXVotiHQCVN3tfu13S7/OkWdGdCJhu8vDx/tg==
Date: Mon, 30 May 2022 23:44:31 +0200
To: Thomas Huth <huth@tuxfamily.org>
Message-ID: <20220530234431.206011ad@windsurf>
In-Reply-To: <20220529165616.767186-1-huth@tuxfamily.org>
References: <20220529165616.767186-1-huth@tuxfamily.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/kvm-unit-tests: Fix build on big
 endian aarch64 targets
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
Cc: Cornelia Huck <cohuck@redhat.com>, Matt Weber <matthew.weber@collins.com>,
 Cyril Bur <cyrilbur@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 29 May 2022 18:56:16 +0200
Thomas Huth <huth@tuxfamily.org> wrote:

> When building with BR2_cortex_a76 in big endian mode, the build of
> the kvm-unit-tests is currently failing since the "--arch" option
> of the configure script is not set right. We also have to look at
> BR2_aarch64_be in this case to get this initialized properly.
> 
> Fixes: f7228dadd371 ("package/kvm-unit-tests: add more arm support")
> Signed-off-by: Thomas Huth <huth@tuxfamily.org>
> ---
>  A failing build log can be seen here, for example:
>  http://autobuild.buildroot.net/results/760f43a2780b78c753e6b5d631cb744db896f575/build-end.log

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
