Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 063BFC4706C
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 20:33:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B699C60F14;
	Sat, 13 Jan 2024 20:33:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B699C60F14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IEvwT0nhPtTU; Sat, 13 Jan 2024 20:33:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E12B360F05;
	Sat, 13 Jan 2024 20:33:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E12B360F05
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 221D11BF868
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 20:33:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CDC5F83B40
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 20:33:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDC5F83B40
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jtH_afn2Dcyj for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 20:33:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE89E83B25
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 20:33:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE89E83B25
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BE34D8468D; Sat, 13 Jan 2024 20:33:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jan 2024 21:10:39 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 0f08a78c076d5490755f86c74a1e837135d509c3
X-Git-Newrev: 58a3ae71a65685a81d1b5a445cb1030ad605df05
X-Patchwork-Hint: ignore
Message-Id: <20240113203307.BE34D8468D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/nushell: fix
 sparc64 build
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

commit: https://git.buildroot.net/buildroot/commit/?id=58a3ae71a65685a81d1b5a445cb1030ad605df05
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Fix the following build failure on sparc64 raised since bump to version
0.85 in commit 470f0fb1ec0bd2ba03340f2aea34891ca8d7739d:

error[E0308]: mismatched types
   --> /home/autobuild/autobuild/instance-7/output-1/build/nushell-0.85.0/VENDOR/uucore/src/lib/features/fs.rs:121:16
    |
111 |     pub fn number_of_links(&self) -> u64 {
    |                                      --- expected `u64` because of return type
...
121 |         return self.0.st_nlink;
    |                ^^^^^^^^^^^^^^^ expected `u64`, found `u32`
    |
help: you can convert a `u32` to a `u64`
    |
121 |         return self.0.st_nlink.into();
    |                               +++++++

For more information about this error, try `rustc --explain E0308`.
error: could not compile `uucore` (lib) due to previous error

Fixes:
 - http://autobuild.buildroot.org/results/f9f0287a8e39c65895014ca513ed25071f020add

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b7c163f1903db0eeeba6d49b3a977b2f021c5396)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-uucore-add-support-for-sparc64.patch      | 57 ++++++++++++++++++++++
 package/nushell/nushell.mk                         |  7 +++
 2 files changed, 64 insertions(+)

diff --git a/package/nushell/0001-uucore-add-support-for-sparc64.patch b/package/nushell/0001-uucore-add-support-for-sparc64.patch
new file mode 100644
index 0000000000..2cc05c172e
--- /dev/null
+++ b/package/nushell/0001-uucore-add-support-for-sparc64.patch
@@ -0,0 +1,57 @@
+From 9f4330f94cc471d880df7d9089ee1105b27fd321 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 6 Jan 2024 10:26:54 +0100
+Subject: [PATCH] uucore: add support for sparc64
+
+Add support for sparc64 in uucore to avoid the following build failure
+with nushell:
+
+error[E0308]: mismatched types
+   --> /home/autobuild/autobuild/instance-7/output-1/build/nushell-0.85.0/VENDOR/uucore/src/lib/features/fs.rs:121:16
+    |
+111 |     pub fn number_of_links(&self) -> u64 {
+    |                                      --- expected `u64` because of return type
+...
+121 |         return self.0.st_nlink;
+    |                ^^^^^^^^^^^^^^^ expected `u64`, found `u32`
+    |
+help: you can convert a `u32` to a `u64`
+    |
+121 |         return self.0.st_nlink.into();
+    |                               +++++++
+
+For more information about this error, try `rustc --explain E0308`.
+error: could not compile `uucore` (lib) due to previous error
+
+Fixes:
+ - http://autobuild.buildroot.org/results/f9f0287a8e39c65895014ca513ed25071f020add
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/uutils/coreutils/commit/d158f1a396d19cc2aed68131b80ec3b7325d108e
+---
+ src/uucore/src/lib/features/fs.rs | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/VENDOR/uucore/src/lib/features/fs.rs b/VENDOR/uucore/src/lib/features/fs.rs
+index 20cc9e13d..3b9170bc3 100644
+--- a/VENDOR/uucore/src/lib/features/fs.rs
++++ b/VENDOR/uucore/src/lib/features/fs.rs
+@@ -121,6 +121,7 @@ impl FileInformation {
+             not(target_os = "solaris"),
+             not(target_arch = "aarch64"),
+             not(target_arch = "riscv64"),
++            not(target_arch = "sparc64"),
+             target_pointer_width = "64"
+         ))]
+         return self.0.st_nlink;
+@@ -137,6 +138,7 @@ impl FileInformation {
+                 target_os = "solaris",
+                 target_arch = "aarch64",
+                 target_arch = "riscv64",
++                target_arch = "sparc64",
+                 not(target_pointer_width = "64")
+             )
+         ))]
+-- 
+2.43.0
+
diff --git a/package/nushell/nushell.mk b/package/nushell/nushell.mk
index 779a3c4393..7b538da4e2 100644
--- a/package/nushell/nushell.mk
+++ b/package/nushell/nushell.mk
@@ -10,6 +10,13 @@ NUSHELL_LICENSE = MIT
 NUSHELL_LICENSE_FILES = LICENSE
 NUSHELL_DEPENDENCIES = host-pkgconf openssl ncurses
 
+# 0001-uucore-add-support-for-sparc64.patch
+define NUSHELL_PATCH_CHECKSUM_FILE
+	$(SED) 's/b0390ae7bca8b31f0db289a5d064bba36d45e4d137674e9df2c6ab6256f926f4/f8ce2ad571e1482f6833cb147eafeb724776e7887ebabf339a5f3e79860583cb/' \
+		$(@D)/VENDOR/uucore/.cargo-checksum.json
+endef
+NUSHELL_POST_PATCH_HOOKS += NUSHELL_PATCH_CHECKSUM_FILE
+
 # Add /usr/bin/nu to /etc/shells as in package/bash/bash.mk
 define NUSHELL_ADD_NU_TO_SHELLS
 	grep -qsE '^/usr/bin/nu$$' $(TARGET_DIR)/etc/shells \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
