Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2E57C433F5
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 08:49:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C9D783EC4;
	Thu, 12 May 2022 08:49:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cNfzwa8_nup6; Thu, 12 May 2022 08:49:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9402283EB6;
	Thu, 12 May 2022 08:49:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DB1351C115D
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 08:48:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C963483EB6
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 08:48:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d_KSYeEpe8iV for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 08:48:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A20E83EA7
 for <buildroot@buildroot.org>; Thu, 12 May 2022 08:48:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 7367785A5C; Thu, 12 May 2022 08:38:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 12 May 2022 10:41:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0ebbf0b280b10b04ab6b7b23c597f76f6490df64
X-Git-Newrev: 8866d747cd821254ea6f64bf2fe5bdd81d1e9807
X-Patchwork-Hint: ignore
Message-Id: <20220512083801.7367785A5C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/htop: fix uclibc build without
 wchar
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

commit: https://git.buildroot.net/buildroot/commit/?id=8866d747cd821254ea6f64bf2fe5bdd81d1e9807
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following uclibc build failure without wchar raised since bump
to version 3.2.0 in commit b054353e59488713f841cd9ac9384b8a23f2e83a:

configure:5351: checking for /nvmedata/autobuild/instance-0/output-1/host/bin/i586-buildroot-linux-uclibc-gcc option to accept ISO C99
configure:5500: /nvmedata/autobuild/instance-0/output-1/host/bin/i586-buildroot-linux-uclibc-gcc  -c -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g1  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 conftest.c >&5
conftest.c:70:9: error: unknown type name 'wchar_t'
   70 |   const wchar_t *name;
      |         ^~~~~~~

[...]

configure: error: htop is written in C99. A newer compiler is required.

Fixes:
 - http://autobuild.buildroot.org/results/795bb4ae4f1a725c56353915c21fa784ca547c59

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/htop/htop.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/htop/htop.mk b/package/htop/htop.mk
index f4d9032d4a..cb8170a0a3 100644
--- a/package/htop/htop.mk
+++ b/package/htop/htop.mk
@@ -13,6 +13,10 @@ HTOP_CONF_ENV = HTOP_NCURSES_CONFIG_SCRIPT=$(STAGING_DIR)/usr/bin/$(NCURSES_CONF
 HTOP_LICENSE = GPL-2.0+
 HTOP_LICENSE_FILES = COPYING
 
+# ac_cv_prog_cc_c99 is required for BR2_USE_WCHAR=n because the C99 test
+# provided by autoconf relies on wchar_t.
+HTOP_CONF_ENV += ac_cv_prog_cc_c99=-std=gnu99
+
 ifeq ($(BR2_PACKAGE_HWLOC),y)
 HTOP_CONF_OPTS += --enable-hwloc
 HTOP_DEPENDENCIES += hwloc
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
