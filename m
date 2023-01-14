Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4378C46467
	for <buildroot@archiver.kernel.org>; Sat, 14 Jan 2023 20:01:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6595F4148F;
	Sat, 14 Jan 2023 20:01:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6595F4148F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gIySRLEWaL0f; Sat, 14 Jan 2023 20:01:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F90B41496;
	Sat, 14 Jan 2023 20:01:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F90B41496
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C2BC81BF3D8
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 20:01:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9DB3181DE2
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 20:01:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DB3181DE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xW2fMPCkOMAU for <buildroot@lists.busybox.net>;
 Sat, 14 Jan 2023 20:01:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AFFF981D7C
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 20:01:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFFF981D7C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9CC3F879BC; Sat, 14 Jan 2023 20:01:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Jan 2023 21:00:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 16d83fa724e97c51b78d516674842a1f33c9a71b
X-Git-Newrev: fbddd126011611e97cc920e40cd58784e29f242d
X-Patchwork-Hint: ignore
Message-Id: <20230114200127.9CC3F879BC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/download: fix concurrent cargo
 vendor
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

commit: https://git.buildroot.net/buildroot/commit/?id=fbddd126011611e97cc920e40cd58784e29f242d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 8450b7691870 (package/pkg-cargo: move CARGO_HOME into DL_DIR)
allowed for a shared cargo cache of crates. Internally, cargo is
supposed to lock themselves when accessing that cache, and that commit
even had some research in that area, pointing at [0] for complaints
about too-coarse the lock, so it was deemed safe to have a shared cargo
home.

However, in practice, the locking as implemented by cargo, fails to
properly protect the concurrent accesses to the crates cache, with random
failures that manifest themselves like so:

        Blocking waiting for file lock on package cache
        Blocking waiting for file lock on package cache
     Downloading crates ...
    error: failed to sync
    Caused by:
      failed to download packages
    Caused by:
      failed to download `autocfg v1.1.0`
    Caused by:
      unable to get packages from source
    Caused by:
      failed to unpack package `autocfg v1.1.0`
    Caused by:
      failed to unpack entry at `autocfg-1.1.0/src/tests.rs`
    Caused by:
      No such file or directory (os error 2) while canonicalizing [...]

with the last few errors sometime being:

    Caused by:
      failed to parse manifest at `[...]/aho-corasick-0.7.18/Cargo.toml`
    Caused by:
      can't find library `aho_corasick`, rename file to `src/lib.rs` or specify lib.path

So, as we do not systematically use our own cargo build (we can use a
pre-built one with host-rust-bin), we can't patch cargo (even if we knew
what to do!).

Instead, we implement a lock ourselves, by wrapping the call to "cargo
vendor" with a flock(1) on cargo home.

Note: the download wrapper is already flock-ed, but it is a per-package
lock, so it does not prevent different packages from being downloaded in
parallel; if those packages need cargo vendoring, that will not be
protected by the flock on the dl wrapper. So we really do need a flock
on cargo home.

[0] https://github.com/rust-lang/cargo/issues/6930

Fixes: 8450b769187087751f83cbefcf0a88f70d9da670

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Moritz Bitsch <moritz@h6t.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/download/cargo-post-process | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/support/download/cargo-post-process b/support/download/cargo-post-process
index 21a6be8dbe..aea2d8da7a 100755
--- a/support/download/cargo-post-process
+++ b/support/download/cargo-post-process
@@ -26,6 +26,8 @@ pushd "${base_name}" > /dev/null
 
 # Create the local .cargo/config with vendor info
 mkdir -p .cargo/
+mkdir -p "${CARGO_HOME}"
+flock "${CARGO_HOME}"/.br-lock \
 cargo vendor \
     --manifest-path ${BR_CARGO_MANIFEST_PATH-Cargo.toml} \
     --locked VENDOR \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
