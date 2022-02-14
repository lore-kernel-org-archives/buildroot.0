Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD5DC433EF
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 16:24:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5814D40985;
	Mon, 14 Feb 2022 16:24:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jGMGqNXG3yqK; Mon, 14 Feb 2022 16:24:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7011A40940;
	Mon, 14 Feb 2022 16:24:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C51A11BF97D
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 16:24:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B2D2940211
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 16:24:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YH-IQF75eg4T for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 16:24:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net
 [89.40.174.40])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E595640207
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 16:24:33 +0000 (UTC)
Received: from host-79-2-93-196.business.telecomitalia.it ([79.2.93.196]:52294
 helo=pc-ceresoli.dev.aim)
 by hostingweb31.netsons.net with esmtpa (Exim 4.94.2)
 (envelope-from <luca@lucaceresoli.net>)
 id 1nJe9P-0001n4-JR; Mon, 14 Feb 2022 17:24:31 +0100
From: Luca Ceresoli <luca@lucaceresoli.net>
To: buildroot@buildroot.org
Date: Mon, 14 Feb 2022 17:24:12 +0100
Message-Id: <20220214162413.17301-1-luca@lucaceresoli.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - buildroot.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id:
 luca+lucaceresoli.net/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: [Buildroot] [PATCH 1/2] utils/docker-run: use portable bash shebang
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

/usr/bin/bash does not exist on Ubuntu 2018.04. Use the more portable
alternative /bin/bash.

Note that currently "/usr/bin/bash" does not appear anywhere in the
Buildroot source code, while "/bin/bash" is used by many scripts.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Fixes: 242e9d72e7d2 ("utils/docker-run: new script")
---
 utils/docker-run | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/docker-run b/utils/docker-run
index 0614f1325d78..979aec69b946 100755
--- a/utils/docker-run
+++ b/utils/docker-run
@@ -1,4 +1,4 @@
-#!/usr/bin/bash
+#!/bin/bash
 set -o errexit -o pipefail
 DIR=$(dirname "${0}")
 MAIN_DIR=$(readlink -f "${DIR}/..")
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
