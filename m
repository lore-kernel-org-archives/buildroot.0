Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C721DC433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 11:22:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 581AB8438A;
	Thu, 10 Mar 2022 11:22:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dKEHzqEwe93d; Thu, 10 Mar 2022 11:22:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 792BD84386;
	Thu, 10 Mar 2022 11:22:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8DB7F1BF868
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 11:22:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7960F60FDB
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 11:22:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=grenoble.cnrs.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hNUtlGD_QNgc for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 11:22:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [IPv6:2001:660:530d:201::44])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 07C5F60FCF
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 11:22:20 +0000 (UTC)
Received: from [147.173.65.159] (pulsar.grenoble.cnrs.fr [147.173.65.159])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 40CFEBFE57;
 Thu, 10 Mar 2022 12:22:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grenoble.cnrs.fr;
 s=202106-grenoble.cnrs.fr; t=1646911337;
 bh=1Mw9Q3VqczgEYM6avfnUsI5sAMD4HE4+Ow3g90adUic=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=fJkq+Jw3AYTctAL85U6yJ+BhrnzaeWFXC2xU4kuoon1IWuZzYiz1XvzhJQxVO4DAk
 iwUPmAPX6Wrnv0unQKRHpbLuKZA8bN5zcYw6vS0vdMZyQsG0RKvUEUJvBrIXRk4BkR
 2qk0R+2KGLFjFzK7CiEA4tyrvnZAbhW2Bn/ybFpaFMsfroEdMZrIX/EHunzA4QidX3
 4M7x1WDjdzNmLm4wN/t60xyM/J4TqD9LSjzEFI3E7hbPFJg0QeanOuq9xSiaCb3jaZ
 BAL/yevGHQY5tkiZlft4du88VhBTWlp53R/23sfSJv3arQevw9oBMRz6UmiravakAq
 Rf8kQ2Vl/9qwQ==
Message-ID: <455a9499-b6a6-adbd-1e20-0b4f1ceb66f7@grenoble.cnrs.fr>
Date: Thu, 10 Mar 2022 12:22:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Mathieu Mirmont <mat@parad0x.org>, buildroot@buildroot.org
References: <20220310101826.GA2353@parad0x.org>
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
In-Reply-To: <20220310101826.GA2353@parad0x.org>
Subject: Re: [Buildroot] [PATCH 1/1] fs/common.mk: use find instead of shell
 glob patterns
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Mathieu Mirmont wrote:
> Using dash:
> $ mkdir /tmp/foo
> $ echo /tmp/foo/.[^.]*
> /tmp/foo/..

There is an error in this glob pattern. Fixing it would be simpler than
invoking find/xargs.

Within a regexp, character classes are complemented with "^": [^.] means
"any character other that a dot". Within a glob pattern, character
classes are complemented with "!", and the same class would be written
[!.]

C.f. glob(7).

Regards,

Edgar.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
