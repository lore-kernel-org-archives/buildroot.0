Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 944F4C433F5
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 21:11:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5754160EF3;
	Mon,  7 Mar 2022 21:11:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2VabJr3Yxh1v; Mon,  7 Mar 2022 21:11:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E14FC60EFA;
	Mon,  7 Mar 2022 21:11:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 945C71BF2C3
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 21:10:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B007C40475
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 21:10:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SR8yxHJ5N2Uq for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 21:10:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9E35C4016A
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 21:10:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id DC44F82DF0; Mon,  7 Mar 2022 21:02:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 7 Mar 2022 22:04:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6d508d8e45a4b4afcb7f5291181393c9a249d8cf
X-Git-Newrev: 6b59ed35a2d08fedd8b77e4c70d10bf22a0ce1e1
X-Patchwork-Hint: ignore
Message-Id: <20220307210210.DC44F82DF0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-cargo: allow building in a
 sub-directory
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

commit: https://git.buildroot.net/buildroot/commit/?id=6b59ed35a2d08fedd8b77e4c70d10bf22a0ce1e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some packages have their rust sources as a sub-directory, rather
than at the root of the source tree.

Do like we do for autotools-package, and use the package's _SRCDIR
rather than the top-level directory $(@D).

Additionally, in such a situation, it is more than probable that
the Cargo.toml is also present in that sub-directory, so use that
when vendoring the package.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/adding-packages-cargo.txt |  5 +++++
 package/pkg-cargo.mk                  | 13 +++++++++----
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/docs/manual/adding-packages-cargo.txt b/docs/manual/adding-packages-cargo.txt
index 5343fbd4e6..e18fd9ce23 100644
--- a/docs/manual/adding-packages-cargo.txt
+++ b/docs/manual/adding-packages-cargo.txt
@@ -73,6 +73,11 @@ A few additional variables, specific to the Cargo infrastructure, can
 also be defined. Many of them are only useful in very specific cases,
 typical packages will therefore only use a few of them.
 
+* +FOO_SUBDIR+ may contain the name of a subdirectory inside the package
+  that contains the Cargo.toml file. This is useful, if for example, it
+  is not at the root of the tree extracted by the tarball. If
+  +HOST_FOO_SUBDIR+ is not specified, it defaults to +FOO_SUBDIR+.
+
 * +FOO_CARGO_ENV+ can be used to pass additional variables in the
   environment of +cargo+ invocations. It used at both build and
   installation time
diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
index 66bea513e0..8b246abfed 100644
--- a/package/pkg-cargo.mk
+++ b/package/pkg-cargo.mk
@@ -71,6 +71,11 @@ $(2)_DOWNLOAD_DEPENDENCIES += host-rustc
 $(2)_DOWNLOAD_POST_PROCESS = cargo
 $(2)_DL_ENV += CARGO_HOME=$$(HOST_DIR)/share/cargo
 
+# If building in a sub directory, use that to find the Cargo.toml
+ifneq ($$($(2)_SUBDIR),)
+$(2)_DL_ENV += BR_CARGO_MANIFEST_PATH=$$($(2)_SUBDIR)/Cargo.toml
+endif
+
 # Due to vendoring, it is pretty likely that not all licenses are
 # listed in <pkg>_LICENSE.
 $(2)_LICENSE += , vendored dependencies licenses probably not listed
@@ -97,7 +102,7 @@ $(2)_LICENSE += , vendored dependencies licenses probably not listed
 ifndef $(2)_BUILD_CMDS
 ifeq ($(4),target)
 define $(2)_BUILD_CMDS
-	cd $$(@D) && \
+	cd $$($$(PKG)_SRCDIR) && \
 	$$(TARGET_MAKE_ENV) \
 		$$(TARGET_CONFIGURE_OPTS) \
 		$$(PKG_CARGO_ENV) \
@@ -111,7 +116,7 @@ define $(2)_BUILD_CMDS
 endef
 else # ifeq ($(4),target)
 define $(2)_BUILD_CMDS
-	cd $$(@D) && \
+	cd $$($$(PKG)_SRCDIR) && \
 	$$(HOST_MAKE_ENV) \
 		RUSTFLAGS="$$(addprefix -C link-args=,$$(HOST_LDFLAGS))" \
 		$$(HOST_CONFIGURE_OPTS) \
@@ -133,7 +138,7 @@ endif # ifndef $(2)_BUILD_CMDS
 #
 ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
-	cd $$(@D) && \
+	cd $$($$(PKG)_SRCDIR) && \
 	$$(TARGET_MAKE_ENV) \
 		$$(TARGET_CONFIGURE_OPTS) \
 		$$(PKG_CARGO_ENV) \
@@ -152,7 +157,7 @@ endif
 
 ifndef $(2)_INSTALL_CMDS
 define $(2)_INSTALL_CMDS
-	cd $$(@D) && \
+	cd $$($$(PKG)_SRCDIR) && \
 	$$(HOST_MAKE_ENV) \
 		RUSTFLAGS="$$(addprefix -C link-args=,$$(HOST_LDFLAGS))" \
 		$$(HOST_CONFIGURE_OPTS) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
