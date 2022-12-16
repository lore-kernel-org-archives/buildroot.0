Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D052C4332F
	for <buildroot@archiver.kernel.org>; Fri, 16 Dec 2022 13:53:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 862AE404D1;
	Fri, 16 Dec 2022 13:53:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 862AE404D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VtsUSpMGKKNR; Fri, 16 Dec 2022 13:53:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C5545403C6;
	Fri, 16 Dec 2022 13:53:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5545403C6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 664E81BF2C6
 for <buildroot@lists.busybox.net>; Fri, 16 Dec 2022 13:53:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4279781F0F
 for <buildroot@lists.busybox.net>; Fri, 16 Dec 2022 13:53:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4279781F0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nLFiQTIAMkeW for <buildroot@lists.busybox.net>;
 Fri, 16 Dec 2022 13:53:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19D6481EB2
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 19D6481EB2
 for <buildroot@buildroot.org>; Fri, 16 Dec 2022 13:53:16 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AFC961C000E;
 Fri, 16 Dec 2022 13:53:13 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1p6B9E-0020g9-QG; Fri, 16 Dec 2022 14:53:12 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Quentin Schulz <foss+buildroot@0leil.net>
References: <20221216112908.3824372-1-foss+buildroot@0leil.net>
Date: Fri, 16 Dec 2022 14:53:12 +0100
In-Reply-To: <20221216112908.3824372-1-foss+buildroot@0leil.net> (Quentin
 Schulz's message of "Fri, 16 Dec 2022 12:29:08 +0100")
Message-ID: <87sfhfqwtz.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2022.02.x] package/wayland: fix CVE-2021-3782
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
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Quentin" == Quentin Schulz <foss+buildroot@0leil.net> writes:

 > From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
 > Add an upstream patch to fix CVE-2021-3782:
 > An internal reference count is held on the buffer pool, incremented
 > every time a new buffer is created from the pool. The reference count is
 > maintained as an int; on LP64 systems this can cause the reference count
 > to overflow if the client creates a large number of wl_shm buffer
 > objects, or if it can coerce the server to create a large number of
 > external references to the buffer storage. With the reference count
 > overflowing, a use-after-free can be constructed on the wl_shm_pool
 > tracking structure, where values may be incremented or decremented; it
 > may also be possible to construct a limited oracle to leak 4 bytes of
 > server-side memory to the attacking client at a time.

 > The first patch (0003-util-set-errno-in-wl_map_reserve_new.patch) comes
 > from upstream and its sole purpose is to allow the patch fixing
 > CVE-2021-3782 to be cleanly applied without any modification.

 > Cc: Quentin Schulz <foss+buildroot@0leil.net>
 > Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
