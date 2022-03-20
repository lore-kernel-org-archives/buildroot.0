Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4205C433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 22:39:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A637E40170;
	Sun, 20 Mar 2022 22:39:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zE-8x3CuTKzP; Sun, 20 Mar 2022 22:39:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2AC740238;
	Sun, 20 Mar 2022 22:39:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8892B1BF402
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 22:39:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 866744018F
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 22:39:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AQ0M_QNCJ2eA for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 22:39:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C59A640170
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 22:39:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 867B6846DE; Sun, 20 Mar 2022 22:30:43 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 20 Mar 2022 22:55:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2fca33462b8ed4ed7c54d5d0640ddb64723b3dae
X-Git-Newrev: 842ba7eceffb97e9795807e890b0557ab6d542aa
X-Patchwork-Hint: ignore
Message-Id: <20220320223043.867B6846DE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] pkg-generic: fix rdepends and phony
 targets of virtual packages
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

commit: https://git.buildroot.net/buildroot/commit/?id=842ba7eceffb97e9795807e890b0557ab6d542aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Makefile               |  2 --
 package/pkg-generic.mk | 24 +++++-------------------
 2 files changed, 5 insertions(+), 21 deletions(-)

diff --git a/Makefile b/Makefile
index 6756945819..3bbbdfbe01 100644
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
index 79fcf603d3..1222526ba1 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1088,15 +1088,15 @@ $$($(2)_TARGET_DIRCLEAN):		PKG=$(2)
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
@@ -1202,7 +1202,9 @@ $(eval $(call check-deprecated-variable,$(2)_BUILD_OPT,$(2)_BUILD_OPTS))
 $(eval $(call check-deprecated-variable,$(2)_GETTEXTIZE_OPT,$(2)_GETTEXTIZE_OPTS))
 $(eval $(call check-deprecated-variable,$(2)_KCONFIG_OPT,$(2)_KCONFIG_OPTS))
 
+ifneq ($$($(2)_IS_VIRTUAL),YES)
 PACKAGES += $(1)
+endif
 
 ifneq ($$($(2)_PERMISSIONS),)
 PACKAGES_PERMISSIONS_TABLE += $$($(2)_PERMISSIONS)$$(sep)
@@ -1292,22 +1294,6 @@ ifneq ($$($(2)_HELP_CMDS),)
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
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
