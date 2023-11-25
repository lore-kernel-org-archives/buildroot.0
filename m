Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7294DC4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 20:18:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20A2941802;
	Mon,  4 Dec 2023 20:18:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20A2941802
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TawXXlyY1T2L; Mon,  4 Dec 2023 20:18:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BD1A417DA;
	Mon,  4 Dec 2023 20:18:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BD1A417DA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C370F1BF31D
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 840B341763
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 840B341763
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ygdWFJny5hVy for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 20:13:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0CB6A4174F
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 20:13:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0CB6A4174F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0A71D879B8; Mon,  4 Dec 2023 20:13:29 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 25 Nov 2023 16:41:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ba27abf3566a86ecf2f89c7a4bb1d2c6a50eda89
X-Git-Newrev: aae25fb55e13198cfabbcbd7e561767d337c0407
X-Patchwork-Hint: ignore
Message-Id: <20231204201329.0A71D879B8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-python.mk: split the commands
 in a target and host section
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

commit: https://git.buildroot.net/buildroot/commit/?id=aae25fb55e13198cfabbcbd7e561767d337c0407
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Only define the _CMDS variables that are relevant for the target resp.
host variant. Duplicate the _BUILD_CMDS. This will allow us to
differentiate part of the _BUILD_CMDS definition in a follow-up patch.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-python.mk | 47 +++++++++++++++++++++++++++++++++--------------
 1 file changed, 33 insertions(+), 14 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index eacf75c165..c1640d71bb 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -324,6 +324,7 @@ $(2)_DOWNLOAD_POST_PROCESS = cargo
 $(2)_DOWNLOAD_DEPENDENCIES = host-rustc
 endif # SETUP_TYPE
 
+ifeq ($(4),target)
 #
 # Build step. Only define it if not already defined by the package .mk
 # file.
@@ -338,20 +339,6 @@ define $(2)_BUILD_CMDS
 endef
 endif
 
-#
-# Host installation step. Only define it if not already defined by the
-# package .mk file.
-#
-ifndef $(2)_INSTALL_CMDS
-define $(2)_INSTALL_CMDS
-	(cd $$($$(PKG)_BUILDDIR)/; \
-		$$($$(PKG)_BASE_ENV) $$($$(PKG)_ENV) \
-		$$(HOST_DIR)/bin/python3 \
-		$$($$(PKG)_BASE_INSTALL_CMD) \
-		$$($$(PKG)_INSTALL_OPTS))
-endef
-endif
-
 #
 # Target installation step. Only define it if not already defined by
 # the package .mk file.
@@ -380,6 +367,38 @@ define $(2)_INSTALL_STAGING_CMDS
 endef
 endif
 
+else # host
+
+#
+# Host build step. Only define it if not already defined by the package .mk
+# file.
+#
+ifndef $(2)_BUILD_CMDS
+define $(2)_BUILD_CMDS
+	(cd $$($$(PKG)_BUILDDIR)/; \
+		$$($$(PKG)_BASE_ENV) $$($$(PKG)_ENV) \
+		$$(HOST_DIR)/bin/python3 \
+		$$($$(PKG)_BASE_BUILD_CMD) \
+		$$($$(PKG)_BUILD_OPTS))
+endef
+endif
+
+#
+# Host installation step. Only define it if not already defined by the
+# package .mk file.
+#
+ifndef $(2)_INSTALL_CMDS
+define $(2)_INSTALL_CMDS
+	(cd $$($$(PKG)_BUILDDIR)/; \
+		$$($$(PKG)_BASE_ENV) $$($$(PKG)_ENV) \
+		$$(HOST_DIR)/bin/python3 \
+		$$($$(PKG)_BASE_INSTALL_CMD) \
+		$$($$(PKG)_INSTALL_OPTS))
+endef
+endif
+
+endif # host / target
+
 # Call the generic package infrastructure to generate the necessary
 # make targets
 $(call inner-generic-package,$(1),$(2),$(3),$(4))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
