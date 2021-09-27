Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50EADC433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 19:26:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5735560F4F
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 19:25:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5735560F4F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E1C040410;
	Mon, 27 Sep 2021 19:25:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yAEtbmxifPVt; Mon, 27 Sep 2021 19:25:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89746403B8;
	Mon, 27 Sep 2021 19:25:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CFA741BF379
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 19:25:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB3E440173
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 19:25:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BAIkqDUuYVN0 for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 19:25:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CD5B740150
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 19:25:45 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id A66E41BF207;
 Mon, 27 Sep 2021 19:25:41 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mUwFw-0001Ao-Qu; Mon, 27 Sep 2021 21:25:40 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20210911082047.2892382-1-yann.morin.1998@free.fr>
Date: Mon, 27 Sep 2021 21:25:40 +0200
In-Reply-To: <20210911082047.2892382-1-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sat, 11 Sep 2021 10:20:47 +0200")
Message-ID: <87y27hq0qz.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/kodi: fix selection of dependencies
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Thomas Ruschival <t.ruschival@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Commit 148e695e3756 (package/kodi: bump version to 19.0-Matrix) extended
 > the set of required libraries for various "platform" backends, by
 > selecting those libraries from the blind options. For example, we have:

 >     config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_GBM
 >         bool
 >         default y
 >         depends on [...]
 >         select BR2_PACKAGE_LIBINPUT
 >         [...]

 > However, that option is true as soon as the requirements are met (the
 > depends on), even when Kodi itself is not enabled.

 > This means that extra libraries are pulled in to the build, even when
 > not required.

 > We fix that by moving the actual selects to the main symbol, along with
 > the proper conditions. This means that we have two lines that select
 > libxbcommon, under two different conditions; we could make that a single
 > select, but the codition would need to be on two lines anyway, so meh...

 > This is not an ideal solution, because it is a bit ugly, but:
 >  1) adding three new blind options just for the select is kinda extreme
 >     and superfluous;
 >  2) our Kodi packaging is already a bit ugly anyway.

 > Fixes: #14206

 > Reported-by: Thomas Ruschival <t.ruschival@gmail.com>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2021.05.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
