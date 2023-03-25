Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79DC1C6FD1F
	for <buildroot@archiver.kernel.org>; Sat, 25 Mar 2023 21:09:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D4CE81FEB;
	Sat, 25 Mar 2023 21:09:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D4CE81FEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KNpQe997x_YV; Sat, 25 Mar 2023 21:09:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D81481F5C;
	Sat, 25 Mar 2023 21:09:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D81481F5C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C4A311BF86C
 for <buildroot@lists.busybox.net>; Sat, 25 Mar 2023 21:07:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 78E8E81DE3
 for <buildroot@lists.busybox.net>; Sat, 25 Mar 2023 21:07:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78E8E81DE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SQbpsvl41jUX for <buildroot@lists.busybox.net>;
 Sat, 25 Mar 2023 21:07:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A51FD81E56
 for <buildroot@buildroot.org>; Sat, 25 Mar 2023 21:07:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A51FD81E56
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A218482AA8; Sat, 25 Mar 2023 21:07:39 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 25 Mar 2023 21:55:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 98de5e4aad1c2cae97cbcaa8fd2771a4a69f8d4c
X-Git-Newrev: e32123b866442a1ccf65627b98147c91128b5912
X-Patchwork-Hint: ignore
Message-Id: <20230325210739.A218482AA8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-autotools: drop support for
 FOO_GETTEXTIZE
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

commit: https://git.buildroot.net/buildroot/commit/?id=e32123b866442a1ccf65627b98147c91128b5912
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove all support for FOO_GETTEXTIZE and alert users to FOO_AUTOPOINT
as the recommended solution in its stead. We can use the standard
check-deprecated-variable for this, because from a user perspective
FOO_AUTOPOINT is pretty-much a drop-in replacement.

The warnings about FOO_GETTEXTIZE_OPTS are no longer relevant, because
they will only make sense if FOO_GETTEXTIZE was already set.

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
[Arnout:
 - use check-deprecated-variable;
 - remove FOO_GETTEXTIZE_OPTS warnings;
 - remove definition of GETTEXTIZE]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/pkg-autotools.mk | 23 +----------------------
 package/pkg-generic.mk   |  9 +--------
 2 files changed, 2 insertions(+), 30 deletions(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 48485567d7..f17186dfe4 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -87,14 +87,6 @@ define CONFIGURE_FIX_POWERPC64_HOOK
 	support/scripts/fix-configure-powerpc64.sh $($(PKG)_DIR)
 endef
 
-#
-# Hook to gettextize the package if needed
-#
-define GETTEXTIZE_HOOK
-	@$(call MESSAGE,"Gettextizing")
-	$(Q)cd $($(PKG)_SRCDIR) && $(GETTEXTIZE)
-endef
-
 #
 # Hook to autoreconf the package if needed
 #
@@ -144,14 +136,6 @@ ifndef $(2)_AUTORECONF
  endif
 endif
 
-ifndef $(2)_GETTEXTIZE
- ifdef $(3)_GETTEXTIZE
-  $(2)_GETTEXTIZE = $$($(3)_GETTEXTIZE)
- else
-  $(2)_GETTEXTIZE ?= NO
- endif
-endif
-
 ifndef $(2)_AUTOPOINT
  ifdef $(3)_AUTOPOINT
   $(2)_AUTOPOINT = $$($(3)_AUTOPOINT)
@@ -245,13 +229,8 @@ $(2)_POST_PATCH_HOOKS += UPDATE_CONFIG_HOOK
 
 ifeq ($$($(2)_AUTORECONF),YES)
 
-# This has to come before autoreconf
-ifeq ($$($(2)_GETTEXTIZE),YES)
-$(2)_PRE_CONFIGURE_HOOKS += GETTEXTIZE_HOOK
-$(2)_DEPENDENCIES += host-gettext
-$(2)_AUTORECONF_ENV += AUTOPOINT=/bin/true
 # autopoint is provided by gettext
-else ifeq ($$($(2)_AUTOPOINT),YES)
+ifeq ($$($(2)_AUTOPOINT),YES)
 $(2)_DEPENDENCIES += host-gettext
 $(2)_AUTORECONF_ENV += AUTOPOINT=$$(HOST_DIR)/bin/autopoint
 else
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index fc873c045a..5d1c1da128 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1207,14 +1207,7 @@ $(eval $(call check-deprecated-variable,$(2)_AUTORECONF_OPT,$(2)_AUTORECONF_OPTS
 $(eval $(call check-deprecated-variable,$(2)_CONF_OPT,$(2)_CONF_OPTS))
 $(eval $(call check-deprecated-variable,$(2)_BUILD_OPT,$(2)_BUILD_OPTS))
 $(eval $(call check-deprecated-variable,$(2)_KCONFIG_OPT,$(2)_KCONFIG_OPTS))
-
-# Check for deprecated variables that have no replacement
-ifneq ($$($(2)_GETTEXTIZE_OPT),)
-$$(error "$(2)_GETTEXTIZE_OPT is no longer supported. Please fix your .mk file.")
-endif
-ifneq ($$($(2)_GETTEXTIZE_OPTS),)
-$$(error "$(2)_GETTEXTIZE_OPTS is no longer supported. Please fix your .mk file.")
-endif
+$(eval $(call check-deprecated-variable,$(2)_GETTEXTIZE,$(2)_AUTOPOINT))
 
 PACKAGES += $(1)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
