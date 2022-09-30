Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 979D0C433F5
	for <buildroot@archiver.kernel.org>; Fri, 30 Sep 2022 15:24:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4A3AC41081;
	Fri, 30 Sep 2022 15:24:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A3AC41081
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JysPEUM_ycEJ; Fri, 30 Sep 2022 15:24:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 487C540B9D;
	Fri, 30 Sep 2022 15:24:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 487C540B9D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3E97D1BF3DE
 for <buildroot@lists.busybox.net>; Fri, 30 Sep 2022 15:24:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 272B6610FC
 for <buildroot@lists.busybox.net>; Fri, 30 Sep 2022 15:24:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 272B6610FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N6t7A2n2OY4Y for <buildroot@lists.busybox.net>;
 Fri, 30 Sep 2022 15:24:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F8A860BE8
 for <buildroot@buildroot.org>; Fri, 30 Sep 2022 15:24:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F8A860BE8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1ED46866A3; Fri, 30 Sep 2022 15:24:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 30 Sep 2022 17:18:22 +0200
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: dfe497af960ca5f9ff0e5325147ff04c7ad1a84f
X-Git-Newrev: 69c50f1f26966434c0aff5a873f7f950ac639831
X-Patchwork-Hint: ignore
Message-Id: <20220930152400.1ED46866A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/pkg-generic:
 don't exclude virtual packages from packages list
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

commit: https://git.buildroot.net/buildroot/commit/?id=69c50f1f26966434c0aff5a873f7f950ac639831
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

Currently, with a configuration with an internal toolchain, and no other
package is selected [0], especially when one wants to generate an SDK or
a pre-built, pre-installed toolchain, running 'make' will only build
glibc (and its dependencies), and not the full toolchain, as one would
have expected, so there would be no host-final-gcc.

The reason is that 'toolchain' is a virtual package, so it is excluded
from PACKAGES, the list of packages enabled in the configuration. so it
is not a dependency of target-finalize, and so nothing pulls it in the
build.

The reason for excluding virtual packages from that list is not obvious.

When virtual packages were introduced in 743982441201 (packages: add
infrastructure for virtual packages), there was no BR2_PACKAGE_FOO
symbol for virtual packages (but there was BR2_PACKAGE_HAS_FOO), so
there was no telling that the virtual package was enabled, like we had
for the other kinds of packages (normal, bootloader, toolchain, or linux
kernel).

That caused issues, so in f674c428c2ef (core/pkg-virtual: do not check
they are neabled [sic]), and then 3e1b33a5349b (pkg-generic: improve
incorrectly used package detection), we explicitly excluded the virtual
packages from causing a build failure when something depended on them,
as we could not yet now whether a virtual package was actually enabled
or not.

Then, in 842ba7eceffb (pkg-generic: fix rdepends and phony targets of
virtual packages), we eventually associated a virtual package to is
BR2_PACKAGE_HAS_FOO, which allows treating virtual packages like the
other kinds of packages. There, we explicitly kept virtual packages out
of the list, though (the reasoning was that virtual packages install
nothing in host/ or target/, so they do not directly contribute to the
final content, so we do not need to rsync them, so this was an
optimisation).

However, virtual packages are in fact actual generic packages, and it is
possible for virtual packages to actually provide content for the final
image. Even though we do not have any virtual package that has actual
_INSTALL_CMDS, we still have udev that provides a user for example;
virtual packages in br2-external trees may also very well provide
install commands (e.g. to install files common to their various
implementations).

So, there is currently no technical reason to exclude virtual packages
from PACKAGES, the list of packages enabled in the configuration.

Drop the excluding condition, and always add enabled package, whatever
their kind, to the list of enabled packages.

[0] defconfig to reproduce the issue:
    BR2_INIT_NONE=y
    BR2_SYSTEM_BIN_SH_NONE=y
    # BR2_PACKAGE_BUSYBOX is not set
    # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
    # BR2_TARGET_ROOTFS_TAR is not set

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 02fe7c747bfff95c0e4da215980a0dfc25699fde)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-generic.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index b233b07548..f24e03a325 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1207,9 +1207,7 @@ $(eval $(call check-deprecated-variable,$(2)_BUILD_OPT,$(2)_BUILD_OPTS))
 $(eval $(call check-deprecated-variable,$(2)_GETTEXTIZE_OPT,$(2)_GETTEXTIZE_OPTS))
 $(eval $(call check-deprecated-variable,$(2)_KCONFIG_OPT,$(2)_KCONFIG_OPTS))
 
-ifneq ($$($(2)_IS_VIRTUAL),YES)
 PACKAGES += $(1)
-endif
 
 ifneq ($$($(2)_PERMISSIONS),)
 PACKAGES_PERMISSIONS_TABLE += $$($(2)_PERMISSIONS)$$(sep)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
