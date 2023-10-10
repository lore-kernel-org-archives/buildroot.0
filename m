Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DCEDCD8CB6
	for <buildroot@archiver.kernel.org>; Tue, 10 Oct 2023 20:36:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1F8560FE8;
	Tue, 10 Oct 2023 20:36:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1F8560FE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pi2e0z045uRg; Tue, 10 Oct 2023 20:36:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 197EB6F576;
	Tue, 10 Oct 2023 20:36:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 197EB6F576
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B77901BF389
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 20:36:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9E61F4184D
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 20:36:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E61F4184D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0m_3La7K_G04 for <buildroot@lists.busybox.net>;
 Tue, 10 Oct 2023 20:36:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 91FC84183C
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 20:36:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91FC84183C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7FCB6844B2; Tue, 10 Oct 2023 20:36:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 10 Oct 2023 22:34:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 23c5fe7909cc5ee3222331fb822496b580163e04
X-Git-Newrev: 7490cac62d42370a0a954d44ec34537e81234dd9
X-Patchwork-Hint: ignore
Message-Id: <20231010203622.7FCB6844B2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/systemd: create the /boot directory
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7490cac62d42370a0a954d44ec34537e81234dd9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The gpt-auto-generator can generate the boot.mount unit, which reports
an error if this directory can't be created (if / is read-only). There
is no reason not to create this directory, even if the platform doesn't
actually have a boot partition that can be mounted there.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/systemd/systemd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 824c811c0c..13cd41f75b 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -621,6 +621,7 @@ define SYSTEMD_INSTALL_IMAGES_CMDS
 endef
 
 define SYSTEMD_PERMISSIONS
+	/boot d 700 0 0 - - - - -
 	/var/spool d 755 0 0 - - - - -
 	/var/lib d 755 0 0 - - - - -
 	/var/lib/private d 700 0 0 - - - - -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
