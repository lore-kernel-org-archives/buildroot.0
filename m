Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FEA6C433EF
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 20:43:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9E3560B54;
	Mon, 14 Feb 2022 20:43:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CbqELBGDVvGe; Mon, 14 Feb 2022 20:43:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21E4960A98;
	Mon, 14 Feb 2022 20:43:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3B5381BF97D
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 20:42:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2681C404FA
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 20:42:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cdozV06Y2tZL for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 20:42:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B75B40368
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 20:42:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 0B70F82BDC; Mon, 14 Feb 2022 20:35:07 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 14 Feb 2022 21:38:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 261bb9a17a21439e9688b07de1b8edf89f8eae31
X-Git-Newrev: 132eec5c47f5f9542d0c2e93d12341d624627de0
X-Patchwork-Hint: ignore
Message-Id: <20220214203507.0B70F82BDC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/systemd: don't treat ld warnings
 as errors
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

commit: https://git.buildroot.net/buildroot/commit/?id=132eec5c47f5f9542d0c2e93d12341d624627de0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Nios2 ld emits warnings like:
'
/home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/nios2-linux-gnu/7.3.1/../../../../nios2-linux-gnu/bin/ld: FDE encoding in /home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/nios2-linux-gnu/7.3.1/libgcc.a(_umoddi3.o)(.eh_frame) prevents .eh_frame_hdr table being created.
'
Since '-Wl,--fatal-warnings' is passed by default, build fails, so don't
treat warnings as errors by appending "-Wl,--no-fatal-warnings" to
SYSTEMD_LDFLAGS the same way I've done for Microblaze in commit:
https://git.buildroot.net/buildroot/commit/?id=cc53d5357d84ff9b78d76e45ce216061df8a37c1

Fixes:
http://autobuild.buildroot.net/results/5fc884e11e46ab165ea21c8e8f2901516d79ff80/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/systemd/systemd.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 5626b54e8e..b07fac27d4 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -90,6 +90,11 @@ SYSTEMD_CONF_OPTS += \
 	-Dumount-path=/usr/bin/umount \
 	-Dutmp=false
 
+ifeq ($(BR2_nios2),y)
+# Nios2 ld emits warnings, make warnings not to be treated as errors
+SYSTEMD_LDFLAGS = $(TARGET_LDFLAGS) -Wl,--no-fatal-warnings
+endif
+
 ifeq ($(BR2_PACKAGE_ACL),y)
 SYSTEMD_DEPENDENCIES += acl
 SYSTEMD_CONF_OPTS += -Dacl=true
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
