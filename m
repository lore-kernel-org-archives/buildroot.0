Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF02EE748EE
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 16:32:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81E6981E5A;
	Sun,  1 Oct 2023 16:32:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81E6981E5A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J1KCt93rdpy0; Sun,  1 Oct 2023 16:32:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF71C81E6F;
	Sun,  1 Oct 2023 16:32:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF71C81E6F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 295921BF947
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 16:31:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 001C2418F7
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 16:31:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 001C2418F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XYYrauxcdaCi for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 16:31:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F2EAD417D3
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 16:31:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2EAD417D3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D9A3D83DB7; Sun,  1 Oct 2023 16:31:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Oct 2023 18:31:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f664d7dc24c70ef08ced78d5d3f50a8ad673ea02
X-Git-Newrev: 19372d52ab42be240561583896554e5eb29db72c
X-Patchwork-Hint: ignore
Message-Id: <20231001163133.D9A3D83DB7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rust-bindgen: new host package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=19372d52ab42be240561583896554e5eb29db72c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

host-rust-bindgen will be required to build several different rust-based
packages, including a Linux kernel with rust modules and mesa3d's
rusticl which is the rust-based implementation of OpenCL.

The Cargo.toml file at the project root is a "virtual manifest". Since
we only want to install rust-bindgen, we can specify RUST_BINDGEN_SUBDIR
= bindgen-cli to use the Cargo.toml from this directory.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                             |  1 +
 package/rust-bindgen/rust-bindgen.hash |  3 +++
 package/rust-bindgen/rust-bindgen.mk   | 17 +++++++++++++++++
 3 files changed, 21 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index bc4027932c..c1d9577ba5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2649,6 +2649,7 @@ F:	package/ripgrep/
 N:	Sebastian Weyer <sebastian.weyer@smile.fr>
 F:      package/amlogic-boot-fip/
 F:	package/nushell/
+F:	package/rust-bindgen/
 F:	support/testing/tests/package/sample_nu.nu
 F:	support/testing/tests/package/test_nu.py
 
diff --git a/package/rust-bindgen/rust-bindgen.hash b/package/rust-bindgen/rust-bindgen.hash
new file mode 100644
index 0000000000..fe94bbc096
--- /dev/null
+++ b/package/rust-bindgen/rust-bindgen.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  e1cdbaa8e0ed96f647e49807aecfc44d9239d438c2b1c084edb9a3cca0b1f68f  rust-bindgen-0.65.1.tar.gz
+sha256  c23953d9deb0a3312dbeaf6c128a657f3591acee45067612fa68405eaa4525db  LICENSE
diff --git a/package/rust-bindgen/rust-bindgen.mk b/package/rust-bindgen/rust-bindgen.mk
new file mode 100644
index 0000000000..aa0d7d44a4
--- /dev/null
+++ b/package/rust-bindgen/rust-bindgen.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# rust-bindgen
+#
+################################################################################
+
+RUST_BINDGEN_VERSION = 0.65.1
+RUST_BINDGEN_SITE = $(call github,rust-lang,rust-bindgen,v$(RUST_BINDGEN_VERSION))
+RUST_BINDGEN_LICENSE = BSD-3-clause
+RUST_BINDGEN_LICENSE_FILES = LICENSE
+
+# The Cargo.toml at the root directory is a "virtual manifest".
+# Since we only want to build and install bindgen use the Cargo.toml
+# from the bindgen-cli subdirectory.
+RUST_BINDGEN_SUBDIR = bindgen-cli
+
+$(eval $(host-cargo-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
