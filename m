Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3082C433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 18:15:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 733E26070A;
	Sun, 20 Mar 2022 18:15:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FEnCaqhvt7Db; Sun, 20 Mar 2022 18:15:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 983236059D;
	Sun, 20 Mar 2022 18:15:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 133601BF4D8
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 18:15:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F3F41408BD
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 18:15:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p02BtK97Oghb for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 18:15:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F8B54089C
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 18:15:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5EB3B845E3; Sun, 20 Mar 2022 18:06:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 20 Mar 2022 19:13:52 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 44db0dba5976bc1b5ff979589e51c8d023af4195
X-Git-Newrev: 46c073662bc24bb7c5b9fd1a27ae1945d0439528
X-Patchwork-Hint: ignore
Message-Id: <20220320180628.5EB3B845E3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/rust: set
 musl-root for musl toolchains
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

commit: https://git.buildroot.net/buildroot/commit/?id=46c073662bc24bb7c5b9fd1a27ae1945d0439528
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Without musl-root in config.toml the build stop with the following error:

thread 'main' panicked at 'couldn't find libc.a in musl libdir: output/host/arm-buildroot-linux-musleabihf/sysroot/lib/lib', src/bootstrap/sanity.rs:192:25

musl-root is needed to provide the path to libc.a and libunwind.a because
rust link them statically into the standard library and liblibc [1].

For other libc, musl-root is not used and ignored [2].

[1] https://github.com/rust-lang/rust/commit/cd980b3bee5bd48e8a6cd4c0d7c8e0fb0fdb64dd
[2] https://github.com/rust-lang/rust/blob/1.58.1/src/bootstrap/sanity.rs#L181

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit a41b0f31dea3e62b006ac815bf628600676b328f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rust/rust.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index 3c560882ca..cd8c87b68d 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -56,6 +56,7 @@ define HOST_RUST_CONFIGURE_CMDS
 		echo 'sysconfdir = "$(HOST_DIR)/etc"'; \
 		echo '[rust]'; \
 		echo 'channel = "stable"'; \
+		echo 'musl-root = "$(STAGING_DIR)"' ; \
 		echo '[target.$(RUSTC_TARGET_NAME)]'; \
 		echo 'cc = "$(TARGET_CROSS)gcc"'; \
 		echo '[llvm]'; \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
