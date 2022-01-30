Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A4E1C433F5
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 21:55:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C410B409B6;
	Sun, 30 Jan 2022 21:55:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8OVEteaT6w22; Sun, 30 Jan 2022 21:55:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 073C240922;
	Sun, 30 Jan 2022 21:55:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B4EB81BF3E3
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 21:55:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A35C140922
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 21:55:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iF-wgEPTZbWS for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 21:55:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E52F74090C
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 21:55:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 88852817B8; Sun, 30 Jan 2022 21:48:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Jan 2022 22:55:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 14233f3f0fdf133f30510a9e8c35faff4f22eb8f
X-Git-Newrev: fdee6c9f3987189eb743f54be2e545ce84d4d3bb
X-Patchwork-Hint: ignore
Message-Id: <20220130214852.88852817B8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/apitrace: fix build failure on
 m68k architecture
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

commit: https://git.buildroot.net/buildroot/commit/?id=fdee6c9f3987189eb743f54be2e545ce84d4d3bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

apitrace uses very big switch statements, which causes the build to fail
on m68k, because the offsets there are only 16-bit.

We fix that by using -mlong-jump-table-offsets on m68k, to use 32-bit
offsets for switch statements. That flag is available on gcc version >= 7
but apitrace package already depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7, so
we can use it with no problem.

Fixes:
http://autobuild.buildroot.net/results/7306bf05962fec30fbe98b1eb8ee09b3162b8080/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/apitrace/apitrace.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/apitrace/apitrace.mk b/package/apitrace/apitrace.mk
index 3656a5722b..c47562233b 100644
--- a/package/apitrace/apitrace.mk
+++ b/package/apitrace/apitrace.mk
@@ -38,6 +38,11 @@ ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
 APITRACE_CXXFLAGS += -O0
 endif
 
+# m68k needs 32-bit offsets in switch tables to build
+ifeq ($(BR2_m68k),y)
+APITRACE_CXXFLAGS += -mlong-jump-table-offsets
+endif
+
 APITRACE_CONF_OPTS += \
 	-DCMAKE_C_FLAGS="$(APITRACE_CFLAGS)" \
 	-DCMAKE_CXX_FLAGS="$(APITRACE_CXXFLAGS)"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
