Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 929DCC433EF
	for <buildroot@archiver.kernel.org>; Wed, 16 Mar 2022 10:20:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37243842EA;
	Wed, 16 Mar 2022 10:20:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zzRuzoA40VjH; Wed, 16 Mar 2022 10:20:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F8C7842E3;
	Wed, 16 Mar 2022 10:20:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7F97D1BF3F0
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 10:20:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7CFBF842E3
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 10:20:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xThtL_Oe_iMX for <buildroot@lists.busybox.net>;
 Wed, 16 Mar 2022 10:20:40 +0000 (UTC)
X-Greylist: delayed 00:07:59 by SQLgrey-1.8.0
Received: from mail.bitwise.fi (mail.bitwise.fi [109.204.228.163])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A39F0842D2
 for <buildroot@buildroot.org>; Wed, 16 Mar 2022 10:20:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.bitwise.fi (Postfix) with ESMTP id E8946460028;
 Wed, 16 Mar 2022 12:12:38 +0200 (EET)
X-Virus-Scanned: Debian amavisd-new at 
Received: from mail.bitwise.fi ([127.0.0.1])
 by localhost (mustetatti.dmz.bitwise.fi [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fx1RXcCuNyZR; Wed, 16 Mar 2022 12:12:36 +0200 (EET)
Received: from localhost.net (fw1.dmz.bitwise.fi [192.168.69.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: anssiha)
 by mail.bitwise.fi (Postfix) with ESMTPSA id E437346000A;
 Wed, 16 Mar 2022 12:12:36 +0200 (EET)
From: Anssi Hannula <anssi.hannula@bitwise.fi>
To: buildroot@buildroot.org
Date: Wed, 16 Mar 2022 12:12:23 +0200
Message-Id: <20220316101223.3704745-1-anssi.hannula@bitwise.fi>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] pkg-generic: fix rdepends and phony targets of
 virtual packages
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Virtual packages are not added to the _RDEPENDENCIES list of packages
that they depend on (i.e. their provider).

This causes <provider>-show-rdepends to not show the virtual package
and <provider>-show-recursive-rdepends to miss all the packages that
transitively depend on <provider> via the virtual package.

The virtual make targets (e.g. <pkg>-show-info) are also not marked as
phony for virtual packages.

To fix those issues, remove most of the special handling of virtual
packages in pkg-generic by making $($($(1)_KCONFIG_VAR))=y for them as
well.

This also allows removal of some duplicated code in pkg-generic.mk and a
now unneeded special condition in CHECK_ONE_DEPENDENCY.

Still keep the virtual package out of PACKAGES since there is e.g. no
need to rsync per-package target dir to global target dir. I am not
aware of any showstoppers preventing addition to PACKAGES as well,
though, so it is probably just an optimization.

Signed-off-by: Anssi Hannula <anssi.hannula@bitwise.fi>
---

I encountered this while using <pkg>-show-recursive-rdepends to
determine which packages to dirclean after modification of a
(non-virtual) <pkg> in per-package mode.

The current virtual vs. real distinction didn't seem worth the risk of
unintentional differences so I dropped it, but I'm not too familiar with
the code so I could have missed something.
In case I did and this is not a good idea, one less intrusive option
would be to split the common-to-virtual-and-real-packages code to be
under a new separate conditional block.


 Makefile               |  2 --
 package/pkg-generic.mk | 24 +++++-------------------
 2 files changed, 5 insertions(+), 21 deletions(-)

diff --git a/Makefile b/Makefile
index 4f693d40a9..9e875dd8d8 100644
--- a/Makefile
+++ b/Makefile
@@ -565,14 +565,12 @@ ifeq ($(BR_FORCE_CHECK_DEPENDENCIES),YES)
 
 define CHECK_ONE_DEPENDENCY
 ifeq ($$($(2)_TYPE),target)
-ifeq ($$($(2)_IS_VIRTUAL),)
 ifneq ($$($$($(2)_KCONFIG_VAR)),y)
 $$(error $$($(2)_NAME) is in the dependency chain of $$($(1)_NAME) that \
 has added it to its _DEPENDENCIES variable without selecting it or \
 depending on it from Config.in)
 endif
 endif
-endif
 endef
 
 $(foreach pkg,$(call UPPERCASE,$(PACKAGES)),\
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index b3a7e1d60e..a0d6198edc 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1064,15 +1064,15 @@ $$($(2)_TARGET_DIRCLEAN):		PKG=$(2)
 $$($(2)_TARGET_DIRCLEAN):		NAME=$(1)
 
 # Compute the name of the Kconfig option that correspond to the
-# package being enabled. We handle three cases: the special Linux
-# kernel case, the bootloaders case, and the normal packages case.
-# Virtual packages are handled separately (see below).
+# package being enabled.
 ifeq ($(1),linux)
 $(2)_KCONFIG_VAR = BR2_LINUX_KERNEL
 else ifneq ($$(filter boot/% $$(foreach dir,$$(BR2_EXTERNAL_DIRS),$$(dir)/boot/%),$(pkgdir)),)
 $(2)_KCONFIG_VAR = BR2_TARGET_$(2)
 else ifneq ($$(filter toolchain/% $$(foreach dir,$$(BR2_EXTERNAL_DIRS),$$(dir)/toolchain/%),$(pkgdir)),)
 $(2)_KCONFIG_VAR = BR2_$(2)
+else ifeq ($$($(2)_IS_VIRTUAL),YES)
+$(2)_KCONFIG_VAR = BR2_PACKAGE_HAS_$(2)
 else
 $(2)_KCONFIG_VAR = BR2_PACKAGE_$(2)
 endif
@@ -1178,7 +1178,9 @@ $(eval $(call check-deprecated-variable,$(2)_BUILD_OPT,$(2)_BUILD_OPTS))
 $(eval $(call check-deprecated-variable,$(2)_GETTEXTIZE_OPT,$(2)_GETTEXTIZE_OPTS))
 $(eval $(call check-deprecated-variable,$(2)_KCONFIG_OPT,$(2)_KCONFIG_OPTS))
 
+ifneq ($$($(2)_IS_VIRTUAL),YES)
 PACKAGES += $(1)
+endif
 
 ifneq ($$($(2)_PERMISSIONS),)
 PACKAGES_PERMISSIONS_TABLE += $$($(2)_PERMISSIONS)$$(sep)
@@ -1268,22 +1270,6 @@ ifneq ($$($(2)_HELP_CMDS),)
 HELP_PACKAGES += $(2)
 endif
 
-# Virtual packages are not built but it's useful to allow them to have
-# permission/device/user tables and target-finalize/rootfs-pre-cmd hooks.
-else ifeq ($$(BR2_PACKAGE_HAS_$(2)),y) # $(2)_KCONFIG_VAR
-
-ifneq ($$($(2)_PERMISSIONS),)
-PACKAGES_PERMISSIONS_TABLE += $$($(2)_PERMISSIONS)$$(sep)
-endif
-ifneq ($$($(2)_DEVICES),)
-PACKAGES_DEVICES_TABLE += $$($(2)_DEVICES)$$(sep)
-endif
-ifneq ($$($(2)_USERS),)
-PACKAGES_USERS += $$($(2)_USERS)$$(sep)
-endif
-TARGET_FINALIZE_HOOKS += $$($(2)_TARGET_FINALIZE_HOOKS)
-ROOTFS_PRE_CMD_HOOKS += $$($(2)_ROOTFS_PRE_CMD_HOOKS)
-
 endif # $(2)_KCONFIG_VAR
 endef # inner-generic-package
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
