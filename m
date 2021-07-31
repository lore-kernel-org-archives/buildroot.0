Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20DAFC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:57:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C51EB60F38
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:57:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C51EB60F38
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A30976F93F;
	Wed,  4 Aug 2021 00:57:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4xjVRH6u6KKf; Wed,  4 Aug 2021 00:57:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E841C6F939;
	Wed,  4 Aug 2021 00:57:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AD1791BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:22:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 88D8840503
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4QDFCQ56dsOy for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DDD2841484
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 3102487E2D; Tue,  3 Aug 2021 21:10:24 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 31 Jul 2021 13:27:06 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3d63951ab897ae789be863ada148d0e9ee6f54e6
X-Git-Newrev: d0c82f20c75f683d8cafde08a0e558a9a13d3ded
X-Patchwork-Hint: ignore
Message-Id: <20210803211024.3102487E2D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/pkg-kconfig: hide
 defconfig targets if defconfig not supported
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=d0c82f20c75f683d8cafde08a0e558a9a13d3ded
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

When the savedefconfig target is not supported by a kconfig package,
(like is the case for busybox) it doesn't make sense to define
busybox-savedefconfig or busybox-update-defconfig. Calling these leads
to an error from busybox itself "No rule to make target
'savedefconfig'.", which may be confusing.

Only define the savedefconfig and update-defconfig target if
$(2)_KCONFIG_SUPPORTS_DEFCONFIG is YES.

Note that we also need to define it as phony in the condition, otherwise
'make busybox-update-defconfig' will just say "Nothing to be done" and
we really want the error "No rule to make target
'busybox-update-defconfig'".

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[yann.morin.1998@free.fr: move PHONY before corresponding rule]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-kconfig.mk | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index 715c3e04ec..66cb91862e 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -279,8 +279,11 @@ $(1)-check-configuration-done:
 		exit 1; \
 	fi
 
+ifeq ($$($(2)_KCONFIG_SUPPORTS_DEFCONFIG),YES)
+.PHONY: $(1)-savedefconfig
 $(1)-savedefconfig: $(1)-check-configuration-done
 	$$(call kconfig-package-savedefconfig,$(2))
+endif
 
 # Target to copy back the configuration to the source configuration file
 # Even though we could use 'cp --preserve-timestamps' here, the separate
@@ -289,13 +292,16 @@ $(1)-update-config: PKG=$(2)
 $(1)-update-config: $(1)-check-configuration-done
 	$$(call kconfig-package-update-config,$$($(2)_KCONFIG_DOTCONFIG))
 
+ifeq ($$($(2)_KCONFIG_SUPPORTS_DEFCONFIG),YES)
 # Note: make sure the timestamp of the stored configuration is not newer than
 # the .config to avoid a useless rebuild. Note that, contrary to
 # $(1)-update-config, the reference for 'touch' is _not_ the file from which
 # we copy.
+.PHONY: $(1)-update-defconfig
 $(1)-update-defconfig: PKG=$(2)
 $(1)-update-defconfig: $(1)-savedefconfig
 	$$(call kconfig-package-update-config,defconfig)
+endif
 
 # Target to output differences between the configuration obtained via the
 # defconfig + fragments (if any) and the current configuration.
@@ -315,9 +321,7 @@ endif # package enabled
 
 .PHONY: \
 	$(1)-update-config \
-	$(1)-update-defconfig \
 	$(1)-diff-config \
-	$(1)-savedefconfig \
 	$(1)-check-configuration-done \
 	$$($(2)_DIR)/.kconfig_editor_% \
 	$$(addprefix $(1)-,$$($(2)_KCONFIG_EDITORS))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
