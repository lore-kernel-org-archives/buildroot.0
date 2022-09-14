Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE67C6FA82
	for <buildroot@archiver.kernel.org>; Wed, 14 Sep 2022 22:05:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07D6360C0A;
	Wed, 14 Sep 2022 22:05:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07D6360C0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZHpxleyNBhIf; Wed, 14 Sep 2022 22:05:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DF1060BEC;
	Wed, 14 Sep 2022 22:05:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DF1060BEC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EA6681BF38C
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 22:05:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C20A2417D1
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 22:05:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C20A2417D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DHImudHArxhD for <buildroot@lists.busybox.net>;
 Wed, 14 Sep 2022 22:05:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A8576417CD
 for <buildroot@buildroot.org>; Wed, 14 Sep 2022 22:05:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8576417CD
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 97BFD83A92; Wed, 14 Sep 2022 22:05:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 14 Sep 2022 23:22:53 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 9fb6a415a8c16fb43e89f1f766addded8afb794e
X-Git-Newrev: a484b3d95084075cc79657ed5950a576e7312b62
X-Patchwork-Hint: ignore
Message-Id: <20220914220506.97BFD83A92@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/syslog-ng: work
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

commit: https://git.buildroot.net/buildroot/commit/?id=a484b3d95084075cc79657ed5950a576e7312b62
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
index c05ec9785c..80cb270501 100644
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
