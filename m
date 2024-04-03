Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F12CD1288
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 19:56:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F03A418B9;
	Wed,  3 Apr 2024 19:56:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1v7SewUglf2J; Wed,  3 Apr 2024 19:56:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E7E541A42
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E7E541A42;
	Wed,  3 Apr 2024 19:56:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6AC491BF982
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:55:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2394240515
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:55:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WQ7VP-dErCqi for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 19:55:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 30C93402E6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 30C93402E6
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 19:55:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 279CC8476E; Wed,  3 Apr 2024 19:55:57 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 3 Apr 2024 21:54:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f12c77442e1184427eee0960646833728a4c47db
X-Git-Newrev: 99abd6e406b0bd55a1bcff807a2ab7d89357c3d1
X-Patchwork-Hint: ignore
Message-Id: <20240403195557.279CC8476E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/apg: add optional dependency to
 libxcrypt
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

commit: https://git.buildroot.net/buildroot/commit/?id=99abd6e406b0bd55a1bcff807a2ab7d89357c3d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When glibc was bumped to version 2.39 in commit
b5680f53d60acf8ff6010082f873438a39bd5d97 it removed the deprecated
libcrypt support.

As glibc's libcrypt was providing apg's libcrypt dependency this broke
the apg build using glibc version 2.39.

To fix this select the libxcrypt dependency to apg when using a glibc
toolchain and add the dependency if selected.

Fixes:
http://autobuild.buildroot.net/results/3df84ae300bb648492cffc21e4481fc5abf02aeb/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/apg/Config.in | 1 +
 package/apg/apg.mk    | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/apg/Config.in b/package/apg/Config.in
index 94c286a178..f54ffdba39 100644
--- a/package/apg/Config.in
+++ b/package/apg/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_APG
 	bool "apg"
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  Automated Password Generator (APG).
 
diff --git a/package/apg/apg.mk b/package/apg/apg.mk
index 16661f4b8d..1929e21f58 100644
--- a/package/apg/apg.mk
+++ b/package/apg/apg.mk
@@ -9,6 +9,10 @@ APG_SITE = $(call github,wilx,apg,v$(APG_VERSION))
 APG_LICENSE = BSD-3-Clause
 APG_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
+APG_DEPENDENCIES += libxcrypt
+endif
+
 define APG_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) FLAGS="$(TARGET_CFLAGS)" -C $(@D)
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
