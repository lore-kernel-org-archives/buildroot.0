Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E938AEB64DA
	for <buildroot@archiver.kernel.org>; Mon, 19 Jun 2023 17:20:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75939611C9;
	Mon, 19 Jun 2023 17:20:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75939611C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2DpInMsjh1W5; Mon, 19 Jun 2023 17:20:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 860A360E53;
	Mon, 19 Jun 2023 17:20:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 860A360E53
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ACAC31BF34D
 for <buildroot@lists.busybox.net>; Mon, 19 Jun 2023 17:20:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 86CAF404C9
 for <buildroot@lists.busybox.net>; Mon, 19 Jun 2023 17:20:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86CAF404C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q4zIEFMhUMeR for <buildroot@lists.busybox.net>;
 Mon, 19 Jun 2023 17:20:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EFB1940490
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EFB1940490
 for <buildroot@buildroot.org>; Mon, 19 Jun 2023 17:20:48 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0f96.dip0.t-ipconnect.de [91.58.15.150])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C1AFCA4C06CF;
 Mon, 19 Jun 2023 19:20:46 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53570)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qBIYY-0006Wo-1I;
 Mon, 19 Jun 2023 19:20:46 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 19 Jun 2023 19:20:46 +0200
Message-Id: <20230619172046.744739-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1687195246;
 bh=j0WWbXloBePzOWjKHBiuqtjzBPChZ57eOsnspJRf+kE=;
 h=From:To:Cc:Subject:Date:From;
 b=UKAxRFdfOQ9mjWAko2m/M1Pb8pOveU8laJmkNsmRSAUQh9yXl0td+I1DVXBuJ0mxN
 4ZCPEPlgZMLN9UyiKUeRbMlqm7nnG7ZxIejCw68UHD3YRePslz3hp4z67LEG4pc5Yv
 S6EDD8Dp65L8NQli/w/OJvLEg9cyfLksg9RxoavJ8qZnMMXd5KnbQbxjvr4clhsWkG
 YRJgzkaI8kDLJEVydlHN8Nvezrt3qxPv9npr5x1j8XhY8Nwm9tJMpDDmTXnJbHHKjg
 4uHJ0d+dnTMpqHE4TT2DJ3q23atXBkuo61OO423r0Uk0ATRoybZACu0cW0q8Hg6pNS
 frnBunLWRlo3w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=UKAxRFdf
Subject: [Buildroot] [PATCH 1/1] package/check: switch to cmake
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
Cc: Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The autoconf-build system fails to properly detect vsnprintf

    checking for vsnprintf... yes
    checking whether vsnprintf is C99 compliant... no

which leads to a build error

    snprintf.c:495:1: error: inlining failed in call to 'always_inline'
     'rpl_vsnprintf.localalias': function not inlinable

Building with cmake fixes the problem:

-- Looking for vsnprintf
-- Looking for vsnprintf - found

Fixes:
http://autobuild.buildroot.net/results/e55/e5562513226de902dae642526165b1555a540144/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/check/check.mk | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/package/check/check.mk b/package/check/check.mk
index ccffd08ee3..d3977154df 100644
--- a/package/check/check.mk
+++ b/package/check/check.mk
@@ -10,12 +10,6 @@ CHECK_INSTALL_STAGING = YES
 CHECK_DEPENDENCIES = host-pkgconf
 CHECK_LICENSE = LGPL-2.1+
 CHECK_LICENSE_FILES = COPYING.LESSER
-CHECK_CONF_OPTS = --disable-build-docs
+CHECK_CONF_OPTS = -DBUILD_TESTING=OFF -DINSTALL_CHECKMK=OFF
 
-# Having checkmk in the target makes no sense
-define CHECK_REMOVE_CHECKMK
-	rm -f $(TARGET_DIR)/usr/bin/checkmk
-endef
-CHECK_POST_INSTALL_TARGET_HOOKS += CHECK_REMOVE_CHECKMK
-
-$(eval $(autotools-package))
+$(eval $(cmake-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
