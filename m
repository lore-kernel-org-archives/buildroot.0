Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5ADBC433F5
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 07:40:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A636060F6E
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 07:40:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A636060F6E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B4BA60786;
	Mon,  8 Nov 2021 07:40:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q3nf5grDGnHN; Mon,  8 Nov 2021 07:40:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C72606077D;
	Mon,  8 Nov 2021 07:40:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2E3F11BF3A6
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 07:40:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A96280D3E
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 07:40:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GyCuFTluPsDz for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 07:40:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2A2FF80D3C
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 07:40:12 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id E609120005;
 Mon,  8 Nov 2021 07:40:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mjzGC-00007L-TZ; Mon, 08 Nov 2021 08:40:08 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20211107214505.3620429-1-fontaine.fabrice@gmail.com>
Date: Mon, 08 Nov 2021 08:40:08 +0100
In-Reply-To: <20211107214505.3620429-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 7 Nov 2021 22:45:05 +0100")
Message-ID: <87fss7859j.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/mono: fix build with autoconf
 >= 2.70
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > For an unknown reason, the following build failure is raised on one of
 > the autobuilder with host gcc 6.3.0 since bump of autoconf to version
 > 2.71 in commit ecd54b65c1f998a7ccd91f7c523e4ff38c4781da:

 > icall.c: In function 'mono_create_icall_signatures':
 > icall.c:9513:20: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
 >    gsize_a *types = (gsize*)(sig + 1);
 >                     ^

 > Add an upstream patch to fix it.

Odd that it only triggers now, but the patch looks obviously
correct. Interesting enough, gsize_a is defined as:

typedef gsize G_MAY_ALIAS gsize_a;

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
