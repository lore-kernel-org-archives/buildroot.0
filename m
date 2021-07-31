Return-Path: <SRS0=zrjq=MX=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E170BC4338F
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 11:32:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 856C96044F
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 11:32:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 856C96044F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F340400D7;
	Sat, 31 Jul 2021 11:32:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YykGVPi4VECx; Sat, 31 Jul 2021 11:32:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 47236401CA;
	Sat, 31 Jul 2021 11:32:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 06EE81BF846
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 11:32:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E99C56069D
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 11:32:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1OLkvalpx_Ne for <buildroot@lists.busybox.net>;
 Sat, 31 Jul 2021 11:31:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D1D3160758
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 11:31:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id E5B728A37E; Sat, 31 Jul 2021 11:31:57 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 31 Jul 2021 13:31:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d0c82f20c75f683d8cafde08a0e558a9a13d3ded
X-Git-Newrev: de669abcb40ea20a685c7269efd79f94ee95381d
X-Patchwork-Hint: ignore
Message-Id: <20210731113157.E5B728A37E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-kconfig: only define
 -update-{def, }config if supported
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

commit: https://git.buildroot.net/buildroot/commit/?id=de669abcb40ea20a685c7269efd79f94ee95381d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The foo-update-config and foo-update-defconfig targets only work if a
custom config file was defined. Remove those targets entirely if they
don't work to begin with.

This was originally handled with an error condition in the
kconfig-package-update-config macro. However, it makes more sense to
simply remove the target if it anyway can't be used.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[yann.morin.1998@free.fr: move PHONY before corresponding rule]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-kconfig.mk | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index 66cb91862e..23a291fccf 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -12,12 +12,12 @@
 ################################################################################
 
 # Macro to update back the custom (def)config file
+# Must only be called if $(PKG)_KCONFIG_FILE is set and $(PKG)_KCONFIG_DEFCONFIG)
+# is not set.
 # $(1): file to copy from
 define kconfig-package-update-config
 	@$(if $($(PKG)_KCONFIG_FRAGMENT_FILES), \
 		echo "Unable to perform $(@) when fragment files are set"; exit 1)
-	@$(if $($(PKG)_KCONFIG_DEFCONFIG), \
-		echo "Unable to perform $(@) when using a defconfig rule"; exit 1)
 	$(Q)if [ -d $($(PKG)_KCONFIG_FILE) ]; then \
 		echo "Unable to perform $(@) when $($(PKG)_KCONFIG_FILE) is a directory"; \
 		exit 1; \
@@ -285,9 +285,11 @@ $(1)-savedefconfig: $(1)-check-configuration-done
 	$$(call kconfig-package-savedefconfig,$(2))
 endif
 
+ifeq ($$($(2)_KCONFIG_DEFCONFIG),)
 # Target to copy back the configuration to the source configuration file
 # Even though we could use 'cp --preserve-timestamps' here, the separate
 # cp and 'touch --reference' is used for symmetry with $(1)-update-defconfig.
+.PHONY: $(1)-update-config
 $(1)-update-config: PKG=$(2)
 $(1)-update-config: $(1)-check-configuration-done
 	$$(call kconfig-package-update-config,$$($(2)_KCONFIG_DOTCONFIG))
@@ -303,6 +305,8 @@ $(1)-update-defconfig: $(1)-savedefconfig
 	$$(call kconfig-package-update-config,defconfig)
 endif
 
+endif
+
 # Target to output differences between the configuration obtained via the
 # defconfig + fragments (if any) and the current configuration.
 # Note: it preserves the timestamp of the current configuration when moving it
@@ -320,7 +324,6 @@ $(1)-diff-config: $(1)-check-configuration-done
 endif # package enabled
 
 .PHONY: \
-	$(1)-update-config \
 	$(1)-diff-config \
 	$(1)-check-configuration-done \
 	$$($(2)_DIR)/.kconfig_editor_% \
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
