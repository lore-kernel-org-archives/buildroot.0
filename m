Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD68BC433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 14:49:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BE36606C0;
	Sun,  9 Jan 2022 14:49:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h94fcuMWfrIT; Sun,  9 Jan 2022 14:49:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A71E760B24;
	Sun,  9 Jan 2022 14:49:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CBFD21BF969
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 14:49:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BBA7C40302
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 14:49:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O2zL_VyPN0Oi for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 14:49:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C2F87402FE
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 14:49:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 11CCD82DCE; Sun,  9 Jan 2022 14:42:58 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 15:30:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8b94dab2ee4f7467e017ebd8aaa8b26aaa1cc70e
X-Git-Newrev: 99dabffc096c81bcd01198edc81b7ce262091ffb
X-Patchwork-Hint: ignore
Message-Id: <20220109144258.11CCD82DCE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/systemd: fix pre-creation of
 directories for coredump
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

commit: https://git.buildroot.net/buildroot/commit/?id=99dabffc096c81bcd01198edc81b7ce262091ffb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix a copy-paste bug in commit be256690788fefad93ab00f0233ddb9414d29727.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/systemd/systemd.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index a72ed04aeb..3811dbae42 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -414,7 +414,7 @@ endif
 ifeq ($(BR2_PACKAGE_SYSTEMD_COREDUMP),y)
 SYSTEMD_CONF_OPTS += -Dcoredump=true
 SYSTEMD_COREDUMP_USER = systemd-coredump -1 systemd-coredump -1 * - - - systemd core dump processing
-SYSTEMD_HOMED_PERMISSIONS = /var/lib/systemd/coredump d 755 0 0 - - - - -
+SYSTEMD_COREDUMP_PERMISSIONS = /var/lib/systemd/coredump d 755 0 0 - - - - -
 else
 SYSTEMD_CONF_OPTS += -Dcoredump=false
 endif
@@ -576,6 +576,7 @@ define SYSTEMD_PERMISSIONS
 	$(SYSTEMD_LOGIND_PERMISSIONS)
 	$(SYSTEMD_MACHINED_PERMISSIONS)
 	$(SYSTEMD_HOMED_PERMISSIONS)
+	$(SYSTEMD_COREDUMP_PERMISSIONS)
 	$(SYSTEMD_PSTORE_PERMISSIONS)
 	$(SYSTEMD_TIMESYNCD_PERMISSIONS)
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
