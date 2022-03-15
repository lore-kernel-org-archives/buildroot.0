Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 037D8C433EF
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 20:19:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB83B408B8;
	Tue, 15 Mar 2022 20:19:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ORNoutyPd8Vp; Tue, 15 Mar 2022 20:19:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 43DBC4045C;
	Tue, 15 Mar 2022 20:19:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CD5B81BF31E
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 20:18:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BCF6F8140D
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 20:18:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QmW0VbujR4GJ for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 20:18:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C029813CC
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 20:18:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 8D91183F84; Tue, 15 Mar 2022 20:10:12 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 15 Mar 2022 20:54:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d589604b46dbfea8df5f1e73baa025ace8b7e92f
X-Git-Newrev: eceb90dc76f8e1a49e92076fd032dc98622a4535
X-Patchwork-Hint: ignore
Message-Id: <20220315201012.8D91183F84@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bubblewrap: switch to the meson
 build system
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

commit: https://git.buildroot.net/buildroot/commit/?id=eceb90dc76f8e1a49e92076fd032dc98622a4535
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Version 0.6.0 introduced a Meson build system, and upstream seems to
have the intention to abandon the previous autotools based one. Switch
to Meson for future proofing.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/bubblewrap/bubblewrap.mk | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/package/bubblewrap/bubblewrap.mk b/package/bubblewrap/bubblewrap.mk
index 1ca2029700..5875b0d6e2 100644
--- a/package/bubblewrap/bubblewrap.mk
+++ b/package/bubblewrap/bubblewrap.mk
@@ -14,22 +14,24 @@ BUBBLEWRAP_LICENSE_FILES = COPYING
 BUBBLEWRAP_CPE_ID_VENDOR = projectatomic
 
 BUBBLEWRAP_CONF_OPTS = \
-	--enable-require-userns=no \
-	--disable-man \
-	--disable-sudo \
-	--with-priv-mode=none
+	-Dzsh_completion=disabled \
+	-Dman=disabled \
+	-Dpython=$(HOST_DIR)/bin/python \
+	-Drequire_userns=false
 
 ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
-BUBBLEWRAP_CONF_OPTS += --with-bash-completion-dir=/usr/share/bash-completion/completions
+BUBBLEWRAP_CONF_OPTS += \
+	-Dbash_completion=enabled \
+	-Dbash_completion_dir=/usr/share/bash-completion/completions
 else
-BUBBLEWRAP_CONF_OPTS += --without-bash-completion-dir
+BUBBLEWRAP_CONF_OPTS += -Dbash_completion=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
-BUBBLEWRAP_CONF_OPTS += --enable-selinux
+BUBBLEWRAP_CONF_OPTS += -Dselinux=enabled
 BUBBLEWRAP_DEPENDENCIES += libselinux
 else
-BUBBLEWRAP_CONF_OPTS += --disable-selinux
+BUBBLEWRAP_CONF_OPTS += -Dselinux=disabled
 endif
 
 # We need to mark bwrap as setuid, in case the kernel
@@ -38,4 +40,4 @@ define BUBBLEWRAP_PERMISSIONS
 	/usr/bin/bwrap f 1755 0 0 - - - - -
 endef
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
