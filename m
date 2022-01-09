Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B425C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 11:15:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BB8F817A8;
	Sun,  9 Jan 2022 11:15:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wp8t4vvxsfiA; Sun,  9 Jan 2022 11:15:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 613038177C;
	Sun,  9 Jan 2022 11:15:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 31CEF1BF969
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 11:14:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2079E81777
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 11:14:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dCie4KH6iTBt for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 11:14:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CCEE681448
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 11:14:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 6E22D82B94; Sun,  9 Jan 2022 11:07:56 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 12:13:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b0a7bffad9e041d9920171802621b67903f9389e
X-Git-Newrev: 36e8743da181420775b79d5be9bbe872b00f2c01
X-Patchwork-Hint: ignore
Message-Id: <20220109110756.6E22D82B94@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/download/cargo-post-process: make
 manifest path configurable
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

commit: https://git.buildroot.net/buildroot/commit/?id=36e8743da181420775b79d5be9bbe872b00f2c01
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In most pure Rust packages, the Cargo.toml manifest is at the root
directory, which is why we could call "cargo vendor" without
specifying the path of the manifest.

However, other packages, such as python-cryptography, which have parts
implemented in Rust, have their Cargo.toml located in a specific
subdirectory.

This commit extends the cargo-post-process download script to
understand a BR_CARGO_MANIFEST_PATH environment variable, which allows
a package to pass the location of the Cargo.toml file. If not passed,
"Cargo.toml" is used, preserving the existing behavior for other
packages.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/download/cargo-post-process | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/download/cargo-post-process b/support/download/cargo-post-process
index 2d1c66661d..a4a4718a2a 100755
--- a/support/download/cargo-post-process
+++ b/support/download/cargo-post-process
@@ -22,7 +22,7 @@ post_process_unpack "${base_name}" "${output}"
 
 # Do the Cargo vendoring
 pushd "${base_name}" > /dev/null
-cargo vendor --locked VENDOR
+cargo vendor --manifest-path ${BR_CARGO_MANIFEST_PATH-Cargo.toml} --locked VENDOR
 
 # Create the local .cargo/config with vendor info
 mkdir -p .cargo/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
