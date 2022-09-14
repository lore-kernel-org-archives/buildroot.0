Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C03BC6FA82
	for <buildroot@archiver.kernel.org>; Wed, 14 Sep 2022 22:05:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8CCD41809;
	Wed, 14 Sep 2022 22:05:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8CCD41809
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qMAHmpy1wW5K; Wed, 14 Sep 2022 22:05:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9F22417D1;
	Wed, 14 Sep 2022 22:05:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9F22417D1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7FC8B1BF38C
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 22:04:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 598F2417D1
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 22:04:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 598F2417D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xhGJBcwNmpwV for <buildroot@lists.busybox.net>;
 Wed, 14 Sep 2022 22:04:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 21946417CD
 for <buildroot@buildroot.org>; Wed, 14 Sep 2022 22:04:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21946417CD
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0C26083A88; Wed, 14 Sep 2022 22:04:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 14 Sep 2022 23:15:37 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 227dcd3428cc4e36fd6b5d3251b2fa55ec15fa37
X-Git-Newrev: 9aaa8ee02f41a16598306d976a8bff1e7b9c9299
X-Patchwork-Hint: ignore
Message-Id: <20220914220453.0C26083A88@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/rsyslog: imhttp
 support needs apr-util
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

commit: https://git.buildroot.net/buildroot/commit/?id=9aaa8ee02f41a16598306d976a8bff1e7b9c9299
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

imhttp support needs apr-util in addition to civetweb since bump to
version 8.2204.1 in commit bc469ee6329555284b2fe9162597917122fbbe3a
and
https://github.com/rsyslog/rsyslog/commit/a8b8d6c1f969286adac3d465e6ac018968550667. Without
apr-util, the build fails with:

configure: error: Package requirements (apr-util-1 >= 1.0) were not met:

Package 'apr-util-1', required by 'virtual:world', not found

Instead of having the user needing to figure out that apr-util is
needed for imhttp support, have the top-level rsyslog option selects
apr-util when civetweb-lib is enabled

Fixes:
 - http://autobuild.buildroot.org/results/4454ae5321df0c04c9dee19693f3908e69fbf23d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7bf8aed70c12aa785294f4b6d767873a5f4b38a9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rsyslog/Config.in  | 1 +
 package/rsyslog/rsyslog.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/rsyslog/Config.in b/package/rsyslog/Config.in
index 8c024e69c7..3ba326191a 100644
--- a/package/rsyslog/Config.in
+++ b/package/rsyslog/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_RSYSLOG
 	# even though rsyslog already depends on threads for itself:
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	select BR2_PACKAGE_APR_UTIL if BR2_PACKAGE_CIVETWEB_LIB
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_LIBESTR
 	select BR2_PACKAGE_LIBLOGGING
diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index 1788d29281..a6e32ecea1 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -53,7 +53,7 @@ RSYSLOG_CONF_OPTS += \
 endif
 
 ifeq ($(BR2_PACKAGE_CIVETWEB_LIB),y)
-RSYSLOG_DEPENDENCIES += civetweb
+RSYSLOG_DEPENDENCIES += apr-util civetweb
 RSYSLOG_CONF_OPTS += --enable-imhttp
 else
 RSYSLOG_CONF_OPTS += --disable-imhttp
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
