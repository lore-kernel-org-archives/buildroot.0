Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B68F3CF58EA
	for <buildroot@archiver.kernel.org>; Fri, 20 Sep 2024 10:32:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60E2140190;
	Fri, 20 Sep 2024 10:32:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iVO04sNrxOYk; Fri, 20 Sep 2024 10:32:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B619401B3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B619401B3;
	Fri, 20 Sep 2024 10:32:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 76BAB1BF599
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 10:32:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 65025401B3
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 10:32:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ivaiNEWzhzCF for <buildroot@lists.busybox.net>;
 Fri, 20 Sep 2024 10:32:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D68E840190
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D68E840190
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D68E840190
 for <buildroot@buildroot.org>; Fri, 20 Sep 2024 10:32:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0D961240008;
 Fri, 20 Sep 2024 10:32:21 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sraw1-00H38I-0S;
 Fri, 20 Sep 2024 12:32:21 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
References: <20240914095501.194725-1-arnout@mind.be>
Date: Fri, 20 Sep 2024 12:32:21 +0200
In-Reply-To: <20240914095501.194725-1-arnout@mind.be> (Arnout Vandecappelle
 via buildroot's message of "Sat, 14 Sep 2024 11:54:58 +0200")
Message-ID: <87jzf6ipje.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/4] package/pkg-generic.mk: legal-info:
 create redist directory for override
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
Cc: Nicolas Carrier <carrier.nicolas0@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle via buildroot <buildroot@buildroot.org> writes:

 > Commit aacca7f0639bac6bb3fb262d0b1738c4387edeb0 introduced the
 > possibility to also create tarballs for packages that are local or
 > overridden (i.e., with a custom version). However, it forgot to create
 > the directory in which that tarball is stored. The original patch did,
 > but it was reworked by Arnout to use mk_tar_gz instead of tar directly,
 > and the mkdir was dropped there.

 > This failure was silent because the mk_tar_gz function doesn't exit on
 > error. The following error was printed but ignored:

 >     support/download/helpers: line 68: .../legal-info/sources/busybox-custom/busybox-custom.tar.gz: No such file or directory

 > Create the directory before calling mk_tar_gz.

 > Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
 > Cc: Nicolas Carrier <carrier.nicolas0@gmail.com>
 > Reported-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2024.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
