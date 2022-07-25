Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A50ADC43334
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 12:29:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4453261297;
	Mon, 25 Jul 2022 12:29:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4453261297
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gs7ihQDBv6PA; Mon, 25 Jul 2022 12:29:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BF306115E;
	Mon, 25 Jul 2022 12:29:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BF306115E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5A1C81BF215
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 12:29:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 33B4361B84
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 12:29:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33B4361B84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iuHt6mRRLVue for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 12:29:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF5236115E
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BF5236115E
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 12:29:43 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 38B7A6000F;
 Mon, 25 Jul 2022 12:29:40 +0000 (UTC)
Date: Mon, 25 Jul 2022 14:29:38 +0200
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <20220725142938.7aa092fb@windsurf>
In-Reply-To: <20220725094456.15051-1-romain.naour@smile.fr>
References: <20220725094456.15051-1-romain.naour@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658752180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o1MflRvNFfL29QwsJrswGM4HgSWlrO7GLxELDx/rwrY=;
 b=jf33bC/gaG1CDfM5un0cQsHzFsYi2ZqvJJabpqzRUUZ9g0yy5H4jmx6n138LyoLls3TNuS
 qX86UYNPVtFH7K2kd2IbXj6+V/45FnsPQrqRnADtwizQNIy9MJG1ZsmTC4mEGctIEdEbi/
 4ttebA/mHAlsR4F0gWLbhkTEnzCgb5qio4Fncfhx7f8sTodfK5uKGclHbeVUyjOi+G8rx/
 Uf4ZLED6Qxc8LHJ6fKYriG03rDwv+mKqjBL+Nz1cbbIc+/wn6VlYRfj8MmgWu4njOaLvtG
 vEshZ0Md5KhsPLhgoRJqQuVyKwESANG7Z3gelbsPeoCIRpQXoopHrnMiJxK4NQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jf33bC/g
Subject: Re: [Buildroot] [PATCH] package/gcc: disable split-stack for
 non-thread builds
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

On Mon, 25 Jul 2022 11:44:56 +0200
Romain Naour <romain.naour@smile.fr> wrote:

> Since commit [1], the autobuilder script generate fully random
> configurations that can triggers configuration that was not tested
> before.
> 
> Here, the toolchain build with uClibc-ng without threads support
> (BR2_PTHREADS_NONE=y) fail to build due to missing pthread.h header.
> 
> ../../../libgcc/generic-morestack-thread.c:42:10: fatal error: pthread.h: No such file or directory
>    42 | #include <pthread.h>
> 
> This issue was actually fixed by this commit [2] adding a patch for
> gcc 4.8, 4.9, 5.3. But it get lost when gcc 6 was added to Buildroot [3].
> 
> Since then the issue was present in Buildroot but has not been noticed.
> 
> [1] https://git.buildroot.net/buildroot-test/commit/?id=27b18dcb1686a98ce718b6a816e98f8505957a6c
> [2] 2631219f648f4aa13fa36d06a483e4507cb6f3d7
> [3] 519d83bfa0442439026db4e71e605a5c1347e566
> 
> Fixes:
> http://autobuild.buildroot.org/results/5ec/5ec9eefacd27ef4fa73066013188796b43a30428
> https://bugs.busybox.net/show_bug.cgi?id=8766
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Cc: Waldemar Brodkorb <wbx@openadk.org>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---

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
