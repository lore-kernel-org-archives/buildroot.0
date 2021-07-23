Return-Path: <SRS0=JV6j=MP=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38CD9C4338F
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 08:02:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA8C760F21
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 08:02:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CA8C760F21
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9AD5D4017E;
	Fri, 23 Jul 2021 08:02:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i6qjHO5ziiJr; Fri, 23 Jul 2021 08:02:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0666340161;
	Fri, 23 Jul 2021 08:02:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0DC0A1BF4D8
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 08:02:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF25B83A41
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 08:02:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=walle.cc
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g1MdprkExDNG for <buildroot@lists.busybox.net>;
 Fri, 23 Jul 2021 08:02:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6D92D83A15
 for <buildroot@buildroot.org>; Fri, 23 Jul 2021 08:02:53 +0000 (UTC)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id A250D22172;
 Fri, 23 Jul 2021 10:02:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1627027367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6EprojSU1PznrdwLxK35hsmSNsZ/JChEdJXQNH+sfAk=;
 b=Ej7bTH/Y2/nFX36r+B8VMzoALsXyaAsuUDVDAHC1SufoKDXYh3sxzme6QuPr+UWPCSnmW/
 ySGp5gGelkEDaVgZ/07n4oLL6NOLE9eRF1WRqeNMzcMDj5mQdVBkr8t9BtPKVXy/3HK1zn
 tifzaK6qb1ISidBdFFVHWHkGGi6Ojg0=
MIME-Version: 1.0
Date: Fri, 23 Jul 2021 10:02:46 +0200
From: Michael Walle <michael@walle.cc>
To: Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <20210705125139.1516789-1-fido_max@inbox.ru>
References: <20210705125139.1516789-1-fido_max@inbox.ru>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <44712143f72de987f5945a30a271cca1@walle.cc>
X-Sender: michael@walle.cc
Subject: Re: [Buildroot] [PATCH v2] package/gcc: fix libsanitizer in gcc
 11.1, 10.3 for linux 5.13
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: romain.naour@gmail.com, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Am 2021-07-05 14:51, schrieb Maxim Kochetkov via buildroot:
> Starting from 5.13 Cyclades async mux support is dropped from linux 
> kernel:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f76edd8f7ce06cdff2fe5b6b39a49644c684a161
> 
> But gcc's libsanitizer uses <linux/cyclades.h> header.
> This issue is fixed by:
> https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=745dae5923aba02982563481d75a21595df22ff8
> 
> Right now just gcc 9.4.0 has this commit and 8.4.0 is proposed to be 
> deleted.
> So we need to add this patch for 10.3 and 11.1 to fix build with linux
> kernel 5.13.
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>

Tested-by: Michael Walle <michael@walle.cc>

-michael
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
