Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D7CDC00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 15:20:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8C2C61008;
	Mon,  8 Aug 2022 15:20:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8C2C61008
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DXWVgDm0ksZ2; Mon,  8 Aug 2022 15:20:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1485D60E48;
	Mon,  8 Aug 2022 15:20:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1485D60E48
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0B3A21BF2FA
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 15:20:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D49D640876
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 15:20:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D49D640876
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PHqEPInwZqsv for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 15:20:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6FC94018F
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 15:19:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6FC94018F
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 30D7E86FD4; Mon,  8 Aug 2022 15:05:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 8 Aug 2022 17:19:25 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: c45193b8d0cf00a069ecca553bd0ca276b505ed1
X-Git-Newrev: f61bf4dc704345e67d8e2917901a243a43b602b2
X-Patchwork-Hint: ignore
Message-Id: <20220808150546.30D7E86FD4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/lxc: add
 linux-pam optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=f61bf4dc704345e67d8e2917901a243a43b602b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 86deafe8635738c3f9efcbda5b22883504d59129)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lxc/lxc.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
index 9311dc8775..abe4f0804a 100644
--- a/package/lxc/lxc.mk
+++ b/package/lxc/lxc.mk
@@ -51,6 +51,13 @@ else
 LXC_CONF_OPTS += --disable-liburing
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
+LXC_CONF_OPTS += --enable-pam
+LXC_DEPENDENCIES += linux-pam
+else
+LXC_DEPENDENCIES += --disable-pam
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LXC_CONF_OPTS += --enable-openssl
 LXC_DEPENDENCIES += openssl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
