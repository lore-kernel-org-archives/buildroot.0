Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 269D3C636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:10:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCD4082CAC;
	Mon, 20 Feb 2023 23:10:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCD4082CAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WVTkbsneaQHC; Mon, 20 Feb 2023 23:10:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0C6082C8E;
	Mon, 20 Feb 2023 23:10:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0C6082C8E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6E8D51BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:56:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE54B4172F
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE54B4172F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MnY2JSL0ZrBp for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE5F441730
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE5F441730
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DC01686495; Mon, 20 Feb 2023 20:52:28 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 10 Jan 2023 17:58:05 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 75519b19c8d0763fc02647c6df55c67fbe3ac89e
X-Git-Newrev: ac2b26fba2ad06fadf14244505319dc5c272906c
X-Patchwork-Hint: ignore
Message-Id: <20230220205228.DC01686495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] support/download: fix cargo
 vendoring
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

commit: https://git.buildroot.net/buildroot/commit/?id=ac2b26fba2ad06fadf14244505319dc5c272906c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit de4cf253752d (package/{rust, rust-bin}: bump to version 1.66.0)
forgot, despite the big comment above the version strings, to confirm
that the vendoring was still working.

Previously, we were adding the vendoring equivalence manually, but in
commit 04154a651729 (support/download/cargo-post-process: cargo output
for vendor config), we switched to using the output of "cargo vendor"
(on stdout) to support cases were the vendoring equivalence would be
more complex (e.g. when using crates not hosted on crates.io).

With rust until and including 1.65.0, "cargo vendor" would output (for
crates.io crates) the same output as our manual fixups, except it was
preceded by an empty line. So, to avoid recompting all our hashes, we
added a tweak to strip away the leading empty line in 04154a651729.

But rust 1.66.0 includes [0] which changes the output (on stdout) of
"cargo vendor", where the first empty line is no longer emitted.

This means that our tweak for rust 1.65.0 now strips out an important
part of the cargo vendor output, which renders the archives invalid, and
thus generates different archives, which fail to validate against our
hashes.

Fix this by doing what the comment in the post-process helper states,
and just keep the whole output of "cargo vendor", by just removing the
"tail --lines=+2". Since that comment is no longer meaningful, we drop
it too.

Now, all our 6 cargo-based packages, as well as our 5 python packages
that have rust code, can be vendored again, without changing our hashes,
but most importantly, with valid archives.

Still, we keep the comment above the versions strings, in the hope that
a future bumper will notice and be more careful at validating the
vendoring.

[0] https://github.com/rust-lang/cargo/pull/11273

Fixes:
    http://autobuild.buildroot.org/results/bea/beac7674bbc9fd2f8777b5861f65afee9c485753/  (bat)
    http://autobuild.buildroot.org/results/d1e/d1ec1ebbde115628a4b8b9099544347242a97c1c/  (dust)
    http://autobuild.buildroot.org/results/f96/f968be895be9ca98b314fdd688ef8d3bdf4e5dfb/  (hyerfine)
    http://autobuild.buildroot.org/results/a0c/a0cdb6cc9493f5248d98f98b13da854e12adc2be/  (ripgrep)
    ... and so many others...

Reported-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Simon Richter <simon.richter@ptwdosimetry.com>
Reviewed-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Tested-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/download/cargo-post-process | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/support/download/cargo-post-process b/support/download/cargo-post-process
index 186e9eb69b..21a6be8dbe 100755
--- a/support/download/cargo-post-process
+++ b/support/download/cargo-post-process
@@ -25,25 +25,11 @@ post_process_unpack "${base_name}" "${output}"
 pushd "${base_name}" > /dev/null
 
 # Create the local .cargo/config with vendor info
-#
-# The first line of the output to stdout is empty.
-# So skip it to have the file start with the vendoring
-# configuration (`tail --lines=+2`).
-#
-# NOTE:
-#   There is  a patch for cargo to remove the first empty line:
-#   See: https://github.com/rust-lang/cargo/pull/11273
-#
-#   The patch already landed in +nightly and will end up
-#   in +stable soon.
-#
-# ->  When updating rust/cargo, the call to `tail` must be removed.
-#
 mkdir -p .cargo/
 cargo vendor \
     --manifest-path ${BR_CARGO_MANIFEST_PATH-Cargo.toml} \
     --locked VENDOR \
-    | tail --lines=+2 | tee .cargo/config
+    | tee .cargo/config
 
 popd > /dev/null
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
