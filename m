Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09EB7EB64DC
	for <buildroot@archiver.kernel.org>; Fri, 14 Jul 2023 21:20:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6E6BE4052F;
	Fri, 14 Jul 2023 21:20:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E6BE4052F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ktixfMtX6uTf; Fri, 14 Jul 2023 21:20:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE784405B9;
	Fri, 14 Jul 2023 21:20:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE784405B9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8CB431BF97F
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 21:20:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 65A6860D68
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 21:20:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65A6860D68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tXvzS7PESgEN for <buildroot@lists.busybox.net>;
 Fri, 14 Jul 2023 21:20:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7280460B24
 for <buildroot@buildroot.org>; Fri, 14 Jul 2023 21:20:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7280460B24
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5F432870B2; Fri, 14 Jul 2023 21:20:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 14 Jul 2023 23:18:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7258c27f6335aa66ce634c93b82ab146bf65f7f2
X-Git-Newrev: 52b325d1d4b884f661d143aa5311ba7737c77dd3
X-Patchwork-Hint: ignore
Message-Id: <20230714212034.5F432870B2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/elfutils: fix build without c++
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=52b325d1d4b884f661d143aa5311ba7737c77dd3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The version bump to 0.189 with commit
258c27f6335aa66ce634c93b82ab146bf65f7f2 introduced an error when
libstdc++ support is not available and --disable-demangler was not used:
https://sourceware.org/git/?p=elfutils.git;a=commitdiff;h=73e212b0a778c6dbe84f79b7eb2647dea50ea16f

Fixes:
http://autobuild.buildroot.net/results/cd4/cd4ca1a2b2eabe6937cb920cda5d8e566216546e/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/elfutils/elfutils.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index 336544e125..0757851b72 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -66,6 +66,12 @@ ELFUTILS_DEPENDENCIES += argp-standalone
 ELFUTILS_CONF_OPTS += --disable-symbol-versioning
 endif
 
+ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
+ELFUTILS_CONF_OPTS += --enable-demangler
+else
+ELFUTILS_CONF_OPTS += --disable-demangler
+endif
+
 ifeq ($(BR2_PACKAGE_BZIP2),y)
 ELFUTILS_DEPENDENCIES += bzip2
 ELFUTILS_CONF_OPTS += --with-bzlib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
