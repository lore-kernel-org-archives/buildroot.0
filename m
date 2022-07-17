Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B562C43334
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 08:34:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BEC0184567;
	Sun, 17 Jul 2022 08:34:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BEC0184567
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uzzFnwV3whOT; Sun, 17 Jul 2022 08:34:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7431841D8;
	Sun, 17 Jul 2022 08:34:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7431841D8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 25BF91BF369
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 08:34:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 003B1607F5
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 08:34:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 003B1607F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZozAXuEL7plR for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 08:34:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A5CF607CE
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 08:34:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A5CF607CE
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 7C21A83862; Sun, 17 Jul 2022 08:20:54 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 17 Jul 2022 10:33:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9c92e958b34ed1d2c3a0f9551f2c493196a943a5
X-Git-Newrev: 86deafe8635738c3f9efcbda5b22883504d59129
X-Patchwork-Hint: ignore
Message-Id: <20220717082054.7C21A83862@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lxc: add linux-pam optional
 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=86deafe8635738c3f9efcbda5b22883504d59129
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
