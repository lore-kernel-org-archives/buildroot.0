Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E2AC43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 22:26:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 680D561B38;
	Sat, 23 Jul 2022 22:26:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 680D561B38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1t6C6tiYiOi4; Sat, 23 Jul 2022 22:26:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A01061B33;
	Sat, 23 Jul 2022 22:26:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A01061B33
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ADDDD1BF3AD
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 22:26:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 888BE405D1
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 22:26:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 888BE405D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hmzhjf57gYhY for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 22:26:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 948A440190
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 22:26:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 948A440190
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id CB2A1853F9; Sat, 23 Jul 2022 22:12:53 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 00:21:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ed97f60c3a363e461608cf843c564111134d0541
X-Git-Newrev: 95ea6664cdd552acbb366e8eb8393224df40e57f
X-Patchwork-Hint: ignore
Message-Id: <20220723221253.CB2A1853F9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-waf.mk: enable definiton of
 env. variables in every build steps
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

commit: https://git.buildroot.net/buildroot/commit/?id=95ea6664cdd552acbb366e8eb8393224df40e57f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It might be necessary for some packages to define environment variables when calling waf build and waf install.
This is done the same way as the others package types, by defining $(PKG)_MAKE_ENV in .mk.

Signed-off-by: David GOUARIN <david.gouarin@thalesgroup.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-waf.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pkg-waf.mk b/package/pkg-waf.mk
index d546b4a817..e090afa9e6 100644
--- a/package/pkg-waf.mk
+++ b/package/pkg-waf.mk
@@ -75,7 +75,7 @@ endif
 ifndef $(2)_BUILD_CMDS
 define $(2)_BUILD_CMDS
 	cd $$($$(PKG)_SRCDIR) && \
-	$$(TARGET_MAKE_ENV) $$(HOST_DIR)/bin/python3 $$($(2)_WAF) \
+	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$(HOST_DIR)/bin/python3 $$($(2)_WAF) \
 		build $$(WAF_OPTS) $$($(2)_BUILD_OPTS) \
 		$$($(2)_WAF_OPTS)
 endef
@@ -88,7 +88,7 @@ endif
 ifndef $(2)_INSTALL_STAGING_CMDS
 define $(2)_INSTALL_STAGING_CMDS
 	cd $$($$(PKG)_SRCDIR) && \
-	$$(TARGET_MAKE_ENV) $$(HOST_DIR)/bin/python3 $$($(2)_WAF) \
+	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$(HOST_DIR)/bin/python3 $$($(2)_WAF) \
 		install --destdir=$$(STAGING_DIR) \
 		$$($(2)_INSTALL_STAGING_OPTS) \
 		$$($(2)_WAF_OPTS)
@@ -102,7 +102,7 @@ endif
 ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
 	cd $$($$(PKG)_SRCDIR) && \
-	$$(TARGET_MAKE_ENV) $$(HOST_DIR)/bin/python3 $$($(2)_WAF) \
+	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$(HOST_DIR)/bin/python3 $$($(2)_WAF) \
 		install --destdir=$$(TARGET_DIR) \
 		$$($(2)_INSTALL_TARGET_OPTS) \
 		$$($(2)_WAF_OPTS)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
