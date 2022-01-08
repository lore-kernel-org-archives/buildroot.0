Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D109EC433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 22:38:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A037813C3;
	Sat,  8 Jan 2022 22:38:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Crt-hWuXgQRS; Sat,  8 Jan 2022 22:38:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F5E0813B5;
	Sat,  8 Jan 2022 22:38:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 02FF31BF3D2
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 22:36:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2E89813A6
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 22:36:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SSQrG8UEuhdL for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 22:36:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C51081460
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 22:36:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 6133583460; Sat,  8 Jan 2022 22:29:49 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 23:35:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 301a8eae0c2aded1821b44da1ab051c53df60486
X-Git-Newrev: 9d5749d2de9f2d4b0681593fbe0d95096612a1c2
X-Patchwork-Hint: ignore
Message-Id: <20220108222949.6133583460@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual/cargo: document the
 cargo-package infrastructure
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

commit: https://git.buildroot.net/buildroot/commit/?id=9d5749d2de9f2d4b0681593fbe0d95096612a1c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Buildroot manual was already providing some details on how to
integrate Cargo packages, and those details now need to be updated
with a proper documentation for the cargo-package infrastructure, as
well as updates related to vendoring support, which affects how
dependencies are handled.

In addition, now that we have vendoring support for Cargo packages,
let's rewrite the dependency management section in a more accurate
way.

We drop the part about the local cache of the registry, because
+CARGO_HOME+ in Buildroot points to $(HOST_DIR)/share/cargo, which is
not shared between builds nor preserved accross builds, so its effect
as a cache is limited.

Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
[Thomas: numerous updates and extensions.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/adding-packages-cargo.txt | 104 +++++++++++++++-------------------
 1 file changed, 45 insertions(+), 59 deletions(-)

diff --git a/docs/manual/adding-packages-cargo.txt b/docs/manual/adding-packages-cargo.txt
index 8fcc80bcc6..5343fbd4e6 100644
--- a/docs/manual/adding-packages-cargo.txt
+++ b/docs/manual/adding-packages-cargo.txt
@@ -1,7 +1,7 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-=== Integration of Cargo-based packages
+=== Infrastructure for Cargo-based packages
 
 Cargo is the package manager for the Rust programming language. It allows the
 user to build programs or libraries written in Rust, but it also downloads and
@@ -10,7 +10,7 @@ called "crates".
 
 [[cargo-package-tutorial]]
 
-==== Cargo-based package's +Config.in+ file
+==== +cargo-package+ tutorial
 
 The +Config.in+ file of Cargo-based package 'foo' should contain:
 
@@ -25,11 +25,7 @@ The +Config.in+ file of Cargo-based package 'foo' should contain:
 08: 	  http://foosoftware.org/foo/
 ---------------------------
 
-==== Cargo-based package's +.mk+ file
-
-Buildroot does not (yet) provide a dedicated package infrastructure for
-Cargo-based packages. So, we will explain how to write a +.mk+ file for such a
-package. Let's start with an example:
+And the +.mk+ file for this package should contain:
 
 ------------------------------
 01: ################################################################################
@@ -44,66 +40,56 @@ package. Let's start with an example:
 10: FOO_LICENSE = GPL-3.0+
 11: FOO_LICENSE_FILES = COPYING
 12:
-13: FOO_DEPENDENCIES = host-rustc
-14:
-15: FOO_CARGO_ENV = CARGO_HOME=$(HOST_DIR)/share/cargo
-16:
-17: FOO_BIN_DIR = target/$(RUSTC_TARGET_NAME)/$(FOO_CARGO_MODE)
-18:
-19: FOO_CARGO_OPTS = \
-20: 	$(if $(BR2_ENABLE_DEBUG),,--release) \
-21: 	--target=$(RUSTC_TARGET_NAME) \
-22: 	--manifest-path=$(@D)/Cargo.toml
-23:
-24: define FOO_BUILD_CMDS
-25: 	$(TARGET_MAKE_ENV) $(FOO_CARGO_ENV) \
-26: 		cargo build $(FOO_CARGO_OPTS)
-27: endef
-28:
-29: define FOO_INSTALL_TARGET_CMDS
-30: 	$(INSTALL) -D -m 0755 $(@D)/$(FOO_BIN_DIR)/foo \
-31: 		$(TARGET_DIR)/usr/bin/foo
-32: endef
-33:
-34: $(eval $(generic-package))
+13: $(eval $(cargo-package))
 --------------------------------
 
-The Makefile starts with the definition of the standard variables for package
-declaration (lines 7 to 11).
+The Makefile starts with the definition of the standard variables for
+package declaration (lines 7 to 11).
+
+As seen in line 13, it is based on the +cargo-package+
+infrastructure. Cargo will be invoked automatically by this
+infrastructure to build and install the package.
+
+It is still possible to define custom build commands or install
+commands (i.e.  with FOO_BUILD_CMDS and FOO_INSTALL_TARGET_CMDS).
+Those will then replace the commands from the cargo infrastructure.
+
+==== +cargo-package+ reference
 
-As seen in line 34, it is based on the
-xref:generic-package-tutorial[+generic-package+ infrastructure]. So, it defines
-the variables required by this particular infrastructure, where Cargo is
-invoked:
+The main macros for the Cargo package infrastructure are
++cargo-package+ for target packages and +host-cargo-package+ for host
+packages.
 
-* +FOO_BUILD_CMDS+: Cargo is invoked to perform the build. The options required
-  to configure the cross-compilation of the package are passed via
-  +FOO_CONF_OPTS+.
+Just like the generic infrastructure, the Cargo infrastructure works
+by defining a number of variables before calling the +cargo-package+
+or +host-cargo-package+ macros.
 
-* +FOO_INSTALL_TARGET_CMDS+: The binary executable generated is installed on
-  the target.
+First, all the package metadata information variables that exist in
+the generic infrastructure also exist in the Cargo infrastructure:
++FOO_VERSION+, +FOO_SOURCE+, +FOO_PATCH+, +FOO_SITE+,
++FOO_DEPENDENCIES+, +FOO_LICENSE+, +FOO_LICENSE_FILES+, etc.
 
-In order to have Cargo available for the build, +FOO_DEPENDENCIES+ needs to
-contain +host-cargo+.
+A few additional variables, specific to the Cargo infrastructure, can
+also be defined. Many of them are only useful in very specific cases,
+typical packages will therefore only use a few of them.
 
-To sum it up, to add a new Cargo-based package, the Makefile example can be
-copied verbatim then edited to replace all occurences of +FOO+ with the
-uppercase name of the new package and update the values of the standard
-variables.
+* +FOO_CARGO_ENV+ can be used to pass additional variables in the
+  environment of +cargo+ invocations. It used at both build and
+  installation time
 
-==== About Dependencies Management
+* +FOO_CARGO_BUILD_OPTS+ can be used to pass additional options to
+  +cargo+ at build time.
 
-A crate can depend on other libraries from crates.io or git repositories, listed
-in its Cargo.toml file. Before starting a build, Cargo usually downloads
-automatically them. This step can also be performed independently, via the
-+cargo fetch+ command.
+* +FOO_CARGO_INSTALL_OPTS+ can be used to pass additional options to
+  +cargo+ at install time.
 
-Cargo maintains a local cache of the registry index and of git checkouts of the
-crates, whose location is given by +$CARGO_HOME+. As seen in the package
-Makefile example at line 15, this environment variable is set to
-+$(HOST_DIR)/share/cargo+.
+A crate can depend on other libraries from crates.io or git
+repositories, listed in its +Cargo.toml+ file. Buildroot automatically
+takes care of downloading such dependencies as part of the download
+step of packages that use the +cargo-package+ infrastructure. Such
+dependencies are then kept together with the package source code in
+the tarball cached in Buildroot's +DL_DIR+, and therefore the hash of
+the package's tarball includes such dependencies.
 
-This dependency download mechanism is not convenient when performing an offline
-build, as Cargo will fail to fetch the dependencies. In that case, it is advised
-to generate a tarball of the dependencies using the +cargo vendor+ and add it to
-+FOO_EXTRA_DOWNLOADS+.
+This mechanism ensures that any change in the dependencies will be
+detected, and allows the build to be performed completely offline.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
