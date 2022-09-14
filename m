Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB28C6FA82
	for <buildroot@archiver.kernel.org>; Wed, 14 Sep 2022 22:04:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 91AE240283;
	Wed, 14 Sep 2022 22:04:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91AE240283
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wz2zkltZr7ST; Wed, 14 Sep 2022 22:04:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C0E3340A18;
	Wed, 14 Sep 2022 22:04:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C0E3340A18
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 270321BF38C
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 22:04:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F344240272
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 22:04:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F344240272
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yvEHUswfkmMv for <buildroot@lists.busybox.net>;
 Wed, 14 Sep 2022 22:04:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 29F3140124
 for <buildroot@buildroot.org>; Wed, 14 Sep 2022 22:04:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29F3140124
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 176FA83A89; Wed, 14 Sep 2022 22:04:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 14 Sep 2022 23:21:32 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 9aaa8ee02f41a16598306d976a8bff1e7b9c9299
X-Git-Newrev: 6cfbc63803f6ccd089501207c1c370881df76571
X-Patchwork-Hint: ignore
Message-Id: <20220914220453.176FA83A89@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/syslog-ng: work
 around gcc bug 101915
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

commit: https://git.buildroot.net/buildroot/commit/?id=6cfbc63803f6ccd089501207c1c370881df76571
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

With Microblaze Gcc version 12.1.0 the build fails due to gcc bug
101915: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101915. The bug
show up when building syslog-ng with optimization but not when building
with -O0. To work around this, if BR2_TOOLCHAIN_HAS_GCC_BUG_101915=y,
we force using -O0.

Fixes:
http://autobuild.buildroot.net/results/b57/b57d51ed320a8e1bbfcf8d44875c113d868f82ee/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2dc8b0dd7432480082e02e0b186476108728fb8b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/syslog-ng/syslog-ng.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index fc57a56820..36dc63e4cb 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -17,6 +17,13 @@ SYSLOG_NG_DEPENDENCIES = host-bison host-flex host-pkgconf \
 SYSLOG_NG_AUTORECONF = YES
 SYSLOG_NG_CONF_OPTS = --disable-manpages --localstatedir=/var/run \
 	--disable-java --disable-java-modules --disable-mongodb
+SYSLOG_NG_CFLAGS = $(TARGET_CFLAGS)
+
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_101915),y)
+SYSLOG_NG_CFLAGS += -O0
+endif
+
+SYSLOG_NG_CONF_ENV = CFLAGS="$(SYSLOG_NG_CFLAGS)"
 
 ifeq ($(BR2_PACKAGE_GEOIP),y)
 SYSLOG_NG_DEPENDENCIES += geoip
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
