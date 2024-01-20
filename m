Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DE1FC47258
	for <buildroot@archiver.kernel.org>; Sat, 20 Jan 2024 23:10:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D27A40012;
	Sat, 20 Jan 2024 23:10:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D27A40012
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Spx0wK4eT3Wj; Sat, 20 Jan 2024 23:10:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2327B400F9;
	Sat, 20 Jan 2024 23:10:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2327B400F9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 066C61BF27E
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 23:10:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D3F5F4189A
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 23:10:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3F5F4189A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9IyCOIMkQfRK for <buildroot@lists.busybox.net>;
 Sat, 20 Jan 2024 23:10:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 07D8141876
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 23:10:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07D8141876
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E32B786350; Sat, 20 Jan 2024 23:10:43 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 21 Jan 2024 00:10:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8c0bfcede9f03cf8277e4cfc9cd33befa28b22bb
X-Git-Newrev: 69ff7d8ed2a3befae3e1291739153c2344d82083
X-Patchwork-Hint: ignore
Message-Id: <20240120231043.E32B786350@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zlog: disable -Werror
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

commit: https://git.buildroot.net/buildroot/commit/?id=69ff7d8ed2a3befae3e1291739153c2344d82083
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Set WARNINGS="" to disable -Werror and fix the following build failure
raised since bump to version 1.2.17 in commit
53779570e50307482d095ff6ef95582cac2a0165 and
https://github.com/HardySimpson/zlog/commit/b8d9634a1a9fb6c60ec2a23b0cb4b5e29e6e3502:

event.c: In function 'zlog_event_new':
event.c:94:72: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
   94 |         a_event->tid_hex_str_len = sprintf(a_event->tid_hex_str, "%x", (unsigned int)a_event->tid);
      |                                                                        ^
cc1: all warnings being treated as errors

Fixes:
 - http://autobuild.buildroot.org/results/21e9212dbb3d77108b45f755890a8e66b23d2407

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/zlog/zlog.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/zlog/zlog.mk b/package/zlog/zlog.mk
index ccf2576529..347f482211 100644
--- a/package/zlog/zlog.mk
+++ b/package/zlog/zlog.mk
@@ -12,8 +12,9 @@ ZLOG_CPE_ID_VENDOR = zlog_project
 ZLOG_INSTALL_STAGING = YES
 
 define ZLOG_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE1) CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS)" \
-		-C $(@D) all
+	$(TARGET_MAKE_ENV) $(MAKE1) \
+		CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS)" \
+		WARNINGS="" -C $(@D) all
 endef
 
 define ZLOG_INSTALL_STAGING_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
