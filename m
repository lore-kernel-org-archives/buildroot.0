Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25ECEC433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 18:50:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E344540A2B;
	Tue, 14 Jun 2022 18:50:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UMj-bOaqRiDC; Tue, 14 Jun 2022 18:50:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 354B7405B5;
	Tue, 14 Jun 2022 18:50:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A61F81BF306
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 18:48:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D67B60034
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 18:48:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9GNJEosDKdGn for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 18:48:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C83F86068A
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 18:48:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id BB5F3870E1; Tue, 14 Jun 2022 18:36:34 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 14 Jun 2022 20:10:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 07044207ed610d3f26deaeddff4749140ad8ec75
X-Git-Newrev: f939cf7c8cb1f08f0fa43aa20c8d98b01f32ac7e
X-Patchwork-Hint: ignore
Message-Id: <20220614183634.BB5F3870E1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/php: simplify icu configure options
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f939cf7c8cb1f08f0fa43aa20c8d98b01f32ac7e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since php-7.4 upstream switched to pkg-config to detect icu:
https://github.com/php/php-src/commit/20fa2e7b58c519cc148d9658456b695884b1ecf4

Remove all unneeded code from php.mk.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/php/php.mk | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index 39db9d3a7c..d9c2edd839 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -176,13 +176,8 @@ endif
 endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_INTL),y)
-PHP_CONF_OPTS += --enable-intl --with-icu-dir=$(STAGING_DIR)/usr
-PHP_CXXFLAGS += "`$(STAGING_DIR)/usr/bin/icu-config --cxxflags`"
+PHP_CONF_OPTS += --enable-intl
 PHP_DEPENDENCIES += icu
-# The intl module is implemented in C++, but PHP fails to use
-# g++ as the compiler for the final link. As a workaround,
-# tell it to link libstdc++.
-PHP_EXTRA_LIBS += -lstdc++
 endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_GMP),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
