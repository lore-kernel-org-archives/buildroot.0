Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87772C433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 12:51:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AF3840354;
	Sun,  9 Jan 2022 12:51:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dwPcWlcfyAvE; Sun,  9 Jan 2022 12:51:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 784E94034C;
	Sun,  9 Jan 2022 12:51:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1FF5C1BF417
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 12:50:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C4E440336
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 12:50:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AYayLtvzaU1J for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 12:50:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2774A4034C
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 12:50:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 9601282C0A; Sun,  9 Jan 2022 12:44:15 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 13:48:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eb49354eb34842f88218fcf9ef60576b85653e38
X-Git-Newrev: 0f9828e5cf2a58f3f9be78ff32e97601c31356aa
X-Patchwork-Hint: ignore
Message-Id: <20220109124415.9601282C0A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/systemd: adopt odering in nsswitch
 to newer versions
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

commit: https://git.buildroot.net/buildroot/commit/?id=0f9828e5cf2a58f3f9be78ff32e97601c31356aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This modifies the order of the nss modules, reflecting the current
state of the documentation.

nss-mymachines lost support for resolution of users and groups,
and now only does resolution of hostnames. Changed in v246.

Multiple changes in regards to nss-myhostname now recommend placement
after nss-files and before nss-dns. See commits ce266330, f918c67.

nss-resolve handles the nss-files logic itself, and its suggested to
move in front of nss-files. Changed in v249.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/systemd/systemd.mk | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 330619e206..540a4d64f9 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -602,13 +602,11 @@ define SYSTEMD_INSTALL_NSSCONFIG_HOOK
 		-e '/^gshadow:/ {/systemd/! s/$$/ systemd/}' \
 		$(if $(BR2_PACKAGE_SYSTEMD_RESOLVED), \
 			-e '/^hosts:/ s/[[:space:]]*mymachines//' \
-			-e '/^hosts:/ {/resolve/! s/files/files resolve [!UNAVAIL=return]/}' ) \
+			-e '/^hosts:/ {/resolve/! s/files/resolve [!UNAVAIL=return] files/}' ) \
 		$(if $(BR2_PACKAGE_SYSTEMD_MYHOSTNAME), \
-			-e '/^hosts:/ {/myhostname/! s/$$/ myhostname/}' ) \
+			-e '/^hosts:/ {/myhostname/! s/files/files myhostname/}' ) \
 		$(if $(BR2_PACKAGE_SYSTEMD_MACHINED), \
-			-e '/^passwd:/ {/mymachines/! s/files/files mymachines/}' \
-			-e '/^group:/ {/mymachines/! s/files/files [SUCCESS=merge] mymachines/}' \
-			-e '/^hosts:/ {/mymachines/! s/files/files mymachines/}' ) \
+			-e '/^hosts:/ {/mymachines/! s/^\(hosts:[[:space:]]*\)/\1mymachines /}' ) \
 		$(TARGET_DIR)/etc/nsswitch.conf
 endef
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
