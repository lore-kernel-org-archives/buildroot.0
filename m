Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3FD7C4332F
	for <buildroot@archiver.kernel.org>; Tue, 20 Dec 2022 09:53:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63A2581099;
	Tue, 20 Dec 2022 09:53:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63A2581099
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OHROP1kzmd8u; Tue, 20 Dec 2022 09:53:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A9CB80DD5;
	Tue, 20 Dec 2022 09:53:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A9CB80DD5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 42CC11BF421
 for <buildroot@lists.busybox.net>; Tue, 20 Dec 2022 09:53:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B89980F97
 for <buildroot@lists.busybox.net>; Tue, 20 Dec 2022 09:53:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B89980F97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eUZPt6MuikIu for <buildroot@lists.busybox.net>;
 Tue, 20 Dec 2022 09:53:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E9F880DD5
 for <buildroot@buildroot.org>; Tue, 20 Dec 2022 09:53:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E9F880DD5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5E4E286A8E; Tue, 20 Dec 2022 09:53:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 20 Dec 2022 10:50:38 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 8932807e5fabd822ad79d78079744ba1f910186f
X-Git-Newrev: 981474c29364b84154af122d2413fd0f6f8c89e5
X-Patchwork-Hint: ignore
Message-Id: <20221220095332.5E4E286A8E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/polkit: fix file
 permissions to match upstream
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

commit: https://git.buildroot.net/buildroot/commit/?id=981474c29364b84154af122d2413fd0f6f8c89e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

The permissions are now in sync with meson_post_install.py,
and debian.

Most importantly, polkit-agent-helper-1 is now setuid root,
but also the rules.d directories rather than their parents
are owned by polkitd.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 712ee21876562b46947142f35dfe1186d88ad241)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/polkit/polkit.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
index 39048a988d..920aa1b555 100644
--- a/package/polkit/polkit.mk
+++ b/package/polkit/polkit.mk
@@ -52,9 +52,10 @@ define POLKIT_USERS
 endef
 
 define POLKIT_PERMISSIONS
-	/etc/polkit-1 r 750 root polkitd - - - - -
-	/usr/share/polkit-1 r 750 root polkitd - - - - -
+	/etc/polkit-1/rules.d d 700 polkitd root - - - - -
+	/usr/share/polkit-1/rules.d d 700 polkitd root - - - - -
 	/usr/bin/pkexec f 4755 root root - - - - -
+	/usr/lib/polkit-1/polkit-agent-helper-1 f 4755 root root - - - - -
 endef
 
 define POLKIT_INSTALL_INIT_SYSTEMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
