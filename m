Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 309E5C3ABDD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 11:01:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6482881162;
	Mon, 19 May 2025 11:01:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tmKA728cwKFk; Mon, 19 May 2025 11:01:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F0E1810FB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F0E1810FB;
	Mon, 19 May 2025 11:01:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 20A4CE4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:47:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9ED3B41A3A
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CpW4aC16ScKf for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C89C441A70
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C89C441A70
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C6B7783BC0; Mon, 19 May 2025 10:40:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 May 2025 20:00:36 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e743759a5202d50b40b10bd9b9a1c31243621dad
X-Git-Newrev: 3776f7c11ffa5bf0ee8d4f7d03bb06db1ae418aa
X-Patchwork-Hint: ignore
Message-Id: <20250519104005.C6B7783BC0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] support/download: replace
 deprecated .cargo/config
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3776f7c11ffa5bf0ee8d4f7d03bb06db1ae418aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

With the current vendoring process, any Cargo build emits the
following warning:

warning: `.../.cargo/config` is deprecated in favor of `config.toml`

.cargo/config.toml was introduced in 1.39 [1], so there shouldn't be
backwards compatibility issues in Buildroot. However, because the
generated config file becomes part of the vendored archive, this
changes the hashes of all Cargo-based packages.

[1] https://doc.rust-lang.org/cargo/reference/config.html#hierarchical-structure

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 support/download/cargo-post-process | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/download/cargo-post-process b/support/download/cargo-post-process
index 12198051a4..b0e59ad74d 100755
--- a/support/download/cargo-post-process
+++ b/support/download/cargo-post-process
@@ -31,14 +31,14 @@ post_process_unpack "${base_name}" "${output}"
 # Do the Cargo vendoring
 pushd "${base_name}" > /dev/null
 
-# Create the local .cargo/config with vendor info
+# Create the local .cargo/config.toml with vendor info
 mkdir -p .cargo/
 mkdir -p "${CARGO_HOME}"
 flock "${CARGO_HOME}"/.br-lock \
 cargo vendor \
     --manifest-path "${manifest}" \
     --locked VENDOR \
-    > .cargo/config
+    > .cargo/config.toml
 
 # "cargo vendor' outputs on stderr a message directing to add some data
 # to the project's .cargo/config.toml, data that it outputs on stdout.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
