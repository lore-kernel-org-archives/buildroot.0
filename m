Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDFC2ECAAA1
	for <buildroot@archiver.kernel.org>; Mon, 12 Sep 2022 10:03:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 94D58418EC;
	Mon, 12 Sep 2022 10:03:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94D58418EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 43SXNiKK4OYV; Mon, 12 Sep 2022 10:03:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C2D2D418EE;
	Mon, 12 Sep 2022 10:03:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2D2D418EE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0E9451BF9AF
 for <buildroot@lists.busybox.net>; Mon, 12 Sep 2022 10:03:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA7D3844DD
 for <buildroot@lists.busybox.net>; Mon, 12 Sep 2022 10:03:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA7D3844DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WDGw-6nvQYMV for <buildroot@lists.busybox.net>;
 Mon, 12 Sep 2022 10:03:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE57B82EF1
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CE57B82EF1
 for <buildroot@buildroot.org>; Mon, 12 Sep 2022 10:03:06 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (unknown [217.70.183.197])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 6ED16CC1C5
 for <buildroot@buildroot.org>; Mon, 12 Sep 2022 09:56:06 +0000 (UTC)
Received: (Authenticated sender: foss@0leil.net)
 by mail.gandi.net (Postfix) with ESMTPSA id C7E831C0011;
 Mon, 12 Sep 2022 09:55:56 +0000 (UTC)
From: Quentin Schulz <foss+buildroot@0leil.net>
To: buildroot@buildroot.org
Date: Mon, 12 Sep 2022 11:55:32 +0200
Message-Id: <20220912095540.957477-1-foss+buildroot@0leil.net>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/5] add support for libedit and linenoise CLI
 implementations for nftables
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
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

nftables supports three different cli implementations at the moment:
libedit, readline and linenoise. When --without_cli and --with_cli are
omitted, libedit is the default implementation if the lib is found by
the configure script. To select readline or linenoise implementation the
appropriate --with_cli option should be given.

linenoise 1.0 is unfortunately incompatible with linenoise CLI
implementation and requires to be bumped.

libedit implementation suffers from a missing header in v1.0.1 and
earlier which is fixed by bumping nftables to its latest version, 1.0.5.

nftables 1.0.5 requires libnftnl 1.2.3 or later so the latter is also
bumped to its latest version.

This has only been build tested, the nft binary is created properly.

Cheers,
Quentin

Quentin Schulz (5):
  package/linenoise: bump linenoise to latest commit
  package/nftables: support linenoise cli backend support
  package/libnftnl: bump to version 1.2.3
  package/nftables: bump to version 1.0.5
  package/nftables: support libedit cli implementation

 package/libnftnl/libnftnl.hash   |  2 +-
 package/libnftnl/libnftnl.mk     |  2 +-
 package/linenoise/linenoise.hash |  2 +-
 package/linenoise/linenoise.mk   |  2 +-
 package/nftables/nftables.hash   |  2 +-
 package/nftables/nftables.mk     | 11 +++++++++--
 6 files changed, 14 insertions(+), 7 deletions(-)

-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
