Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70924C3DA6D
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 11:00:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0067F8478D;
	Mon, 19 May 2025 11:00:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zm_SOkikp7Xt; Mon, 19 May 2025 11:00:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 249B684785
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 249B684785;
	Mon, 19 May 2025 11:00:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 80F21D4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:47:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD863417D5
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L7TbmO8zt5RU for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5957417E6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E5957417E6
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E148882A2E; Mon, 19 May 2025 10:40:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 May 2025 13:26:32 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 072f3bc8c61bd68ed75eb4419f938f718c79ac3f
X-Git-Newrev: b80278613e4aa23ab4f016a5ec65cfcd5201e4ec
X-Patchwork-Hint: ignore
Message-Id: <20250519104003.E148882A2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/pkg-download: switch
 from cargo2 to cargo3
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8332804150280567765=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8332804150280567765==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=b80278613e4aa23ab4f016a5ec65cfcd5201e4ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Starting from rust 1.84.0 (cargo 1.84.0), published crates now always
include a Cargo.lock file. Originally it was only included for packages
that have executables or examples for use with cargo install. see [1]

This behaviour change alters the contents of the .tar.gz archives,
which causes SHA256 hash mistmatches when trying to build Rust packages.

Example build failure with bat-0.24.0:

ERROR: while checking hashes from package/bat/bat.hash
ERROR: bat-0.24.0-cargo2.tar.gz has wrong sha256 hash:
ERROR: expected: 45fcdd6076dc1b45698a7b6c0f4d1f5d9ae676f3ca3b155402ad24680d5b4df6
ERROR: got     : 28b302b1aa325221796d4ebb25bacab19a8927ef32f4d56a965b32a7b1c102fc

After using the ne hash to download the new archive tar.gz, we have the
difference between the old archive and the new one using diffoscope:
│ │ --rw-r--r--   0        0        0     1529 2023-10-11 17:14:12.000000 bat-0.24.0/VENDOR/bincode/.cargo-checksum.json
│ │ +-rw-r--r--   0        0        0     1609 2023-10-11 17:14:12.000000 bat-0.24.0/VENDOR/bincode/.cargo-checksum.json
│ │ +-rw-r--r--   0        0        0     1766 2023-10-11 17:14:12.000000 bat-0.24.0/VENDOR/bincode/Cargo.lock
│ │  -rw-r--r--   0        0        0     1388 2023-10-11 17:14:12.000000 bat-0.24.0/VENDOR/bincode/Cargo.toml

We can see that Cargo.lock has been added.

To avoid hash mismatch issues and to clearly mark archives generated
with the new Cargo behavior, we migrate the naming from 'cargo2.tar.gz'
to 'cargo3.tar.gz'.

We did not find any alternative to disable this new cargo-publish
behavior, so this change is necessary to allow updating the hashes of
Cargo-fetched packages.

[1] https://github.com/rust-lang/cargo/pull/14815
https://doc.rust-lang.org/nightly/cargo/CHANGELOG.html

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-download.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index cf5959ea95..bbb3501643 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -12,7 +12,7 @@
 BR_FMT_VERSION_git = -git4
 BR_FMT_VERSION_svn = -svn5
 BR_FMT_VERSION_go = -go2
-BR_FMT_VERSION_cargo = -cargo2
+BR_FMT_VERSION_cargo = -cargo3
 
 DL_WRAPPER = support/download/dl-wrapper
 

--===============8332804150280567765==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8332804150280567765==--
