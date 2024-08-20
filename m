Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 607C6C531DC
	for <buildroot@archiver.kernel.org>; Tue, 20 Aug 2024 19:58:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2207640B24;
	Tue, 20 Aug 2024 19:58:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zvLrB94qVtJF; Tue, 20 Aug 2024 19:58:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F11E6408C5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F11E6408C5;
	Tue, 20 Aug 2024 19:58:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6B56A1BF378
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 19:58:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 58A6960887
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 19:58:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 08fFhdBaG8lO for <buildroot@lists.busybox.net>;
 Tue, 20 Aug 2024 19:57:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 19CAB60868
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19CAB60868
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 19CAB60868
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 19:57:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 32084FF802;
 Tue, 20 Aug 2024 19:57:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sgUzL-000HN0-28;
 Tue, 20 Aug 2024 21:57:55 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20240630210938.1590435-1-yann.morin.1998@free.fr>
Date: Tue, 20 Aug 2024 21:57:55 +0200
In-Reply-To: <20240630210938.1590435-1-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sun, 30 Jun 2024 23:09:38 +0200")
Message-ID: <87seuzdl18.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/tar: fix linking with libiconv
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Backport two patches from upstream to fix linking with libiconv, e.g.
 > with this defconfig:

 >     BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
 >     BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 >     BR2_SYSTEM_ENABLE_NLS=y
 >     BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
 >     BR2_PACKAGE_LIBICONV=y
 >     BR2_PACKAGE_TAR=y

 > It is interesting to note that the first patch we backport is the first
 > commit in the tar repository after the 1.35 tag, and was comitted the
 > same day the release was cut...

 > Fixes: #4

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
