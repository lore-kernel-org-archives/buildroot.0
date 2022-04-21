Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9110BC433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 18:01:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48AFA83F03;
	Thu, 21 Apr 2022 18:01:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PTKKU67GmRIJ; Thu, 21 Apr 2022 18:01:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60B3383689;
	Thu, 21 Apr 2022 18:01:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E5CCC1BF406
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 18:01:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D39CA60FB1
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 18:01:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E8Km3kHPMZpv for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 18:01:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 361FC60E00
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 18:01:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 5077B83FB8; Thu, 21 Apr 2022 17:50:56 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 21 Apr 2022 19:31:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b936a95d021d73ed27ddb7c856a2e113bf467670
X-Git-Newrev: 98c22550e208d79ae212d4481a24d355eb509d18
X-Patchwork-Hint: ignore
Message-Id: <20220421175056.5077B83FB8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/netdata: fix uclibc build without
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

commit: https://git.buildroot.net/buildroot/commit/?id=98c22550e208d79ae212d4481a24d355eb509d18
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following uclibc build failure without wchar raised since bump
to version 1.33.1 in commit 73dc2eef2dc40b78e732872b26eee0bcea1087d1:

configure: error: Netdata requires a compiler that supports C99 to build

Fixes:
 - http://autobuild.buildroot.org/results/bca4d370ed0553d5f99f1277d0a1e3b49f62b95f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/netdata/netdata.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/netdata/netdata.mk b/package/netdata/netdata.mk
index da6f8eb18b..4287e8406b 100644
--- a/package/netdata/netdata.mk
+++ b/package/netdata/netdata.mk
@@ -18,6 +18,10 @@ NETDATA_CONF_OPTS = \
 	--disable-unit-tests
 NETDATA_DEPENDENCIES = libuv util-linux zlib
 
+# ac_cv_prog_cc_c99 is required for BR2_USE_WCHAR=n because the C99 test
+# provided by autoconf relies on wchar_t.
+NETDATA_CONF_ENV = ac_cv_prog_cc_c99=-std=gnu99
+
 ifeq ($(BR2_GCC_ENABLE_LTO),y)
 NETDATA_CONF_OPTS += --enable-lto
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
