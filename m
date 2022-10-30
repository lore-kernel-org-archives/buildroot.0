Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C77C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 11:13:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35FD380C2C;
	Sun, 30 Oct 2022 11:13:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35FD380C2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fPxw0uMfoQix; Sun, 30 Oct 2022 11:13:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 319428109A;
	Sun, 30 Oct 2022 11:13:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 319428109A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E8B841BF2EB
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 11:10:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D237F812F4
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 11:10:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D237F812F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xe7UXgxznlsR for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 11:10:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EEA2880C3A
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 11:10:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEA2880C3A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DF3A587481; Sun, 30 Oct 2022 11:10:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 12:10:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 85c20ffa95a145e418e82f7a7106a857b5230a1e
X-Git-Newrev: 2ee966794a5ab3adfc192525fe07945b671760d2
X-Patchwork-Hint: ignore
Message-Id: <20221030111047.DF3A587481@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sentry-cli: fix build failure by
 bumping to 2.8.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=2ee966794a5ab3adfc192525fe07945b671760d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For a very long time, host-sentry-cli has been failing to build with:

error[E0512]: cannot transmute between types of different sizes, or dependently-sized types
   --> /home/buildroot/autobuild/instance-2/output-1/build/host-sentry-cli-1.59.0/VENDOR/socket2/src/sockaddr.rs:176:9
    |
176 |         mem::transmute::<SocketAddrV4, sockaddr_in>(v4);
    |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    |
    = note: source type: `SocketAddrV4` (48 bits)
    = note: target type: `sockaddr_in` (128 bits)

For more information about this error, try `rustc --explain E0512`.
error: could not compile `socket2` due to previous error

This socket2 create issue has apparently been fixed by upstream commit
https://github.com/rust-lang/socket2/commit/fd1565af4a82e765754d5baa3ff6e61a2627cabc,
as it removes/reworks the problematic code. This commit has been part
of socket2 since the 0.3.3 version, but sentry-cli 1.59.0 uses socket2
in version 0.3.2.

The next version of sentry-cli that has moved to a more recent
version of socket2 is 1.61.0, however this one also fails to build
with:

   Compiling sentry-cli v1.61.0 (/home/buildroot/buildroot/output/build/host-sentry-cli-1.61.0)
warning: fields `schemes` and `name` are never read
  --> src/utils/xcode.rs:41:5
   |
39 | pub struct XcodeProjectInfo {
   |            ---------------- fields in this struct
40 |     targets: Vec<String>,
41 |     schemes: Vec<String>,
   |     ^^^^^^^
42 |     configurations: Vec<String>,
43 |     name: String,
   |     ^^^^
   |
   = note: `#[warn(dead_code)]` on by default
   = note: `XcodeProjectInfo` has a derived impl for the trait `Debug`, but this is intentionally ignored during dead code analysis

warning: `sentry-cli` (bin "sentry-cli") generated 1 warning
    Finished release [optimized] target(s) in 55.05s
  Installing /home/buildroot/buildroot/output/host/bin/sentry-cli
   Installed package `sentry-cli v1.61.0 (/home/buildroot/buildroot/output/build/host-sentry-cli-1.61.0)` (executable `sentry-cli`)

So we just gave up, and went for building the very lastest sentry-cli
version, 2.8.0, which apparently builds fine, at least in the
configurations that used to previously fail.

Yes, such a huge version bump is probably not ideal as a "minimal fix"
to backport on our stable branches, but that's probably the best we
can do without investing too much effort into this package that is
otherwise poorly maintained in Buildroot, as nobody stepped up to
address the issue even though it has been failing for months.

Fixes:

  http://autobuild.buildroot.net/results/883b83a5ee44206e0d67a30787bf5d60765ac1e4/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sentry-cli/sentry-cli.hash | 2 +-
 package/sentry-cli/sentry-cli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sentry-cli/sentry-cli.hash b/package/sentry-cli/sentry-cli.hash
index 73f818125f..3562199a82 100644
--- a/package/sentry-cli/sentry-cli.hash
+++ b/package/sentry-cli/sentry-cli.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  d687336379fd96c4ee73f24bd062d31672bd7453af53311b72977be3c8c78fef  sentry-cli-1.59.0.tar.gz
+sha256  fa06f9f47782713eef8a4f10b674e2375b9439360ab34b37558ec4b30ec84861  sentry-cli-2.8.0.tar.gz
 sha256  9503def7b54ceb6e3cd182fd59bc05d3a30d7eae481e65aaba4b495133c83c14  LICENSE
diff --git a/package/sentry-cli/sentry-cli.mk b/package/sentry-cli/sentry-cli.mk
index 58f5f1e325..15094c2d01 100644
--- a/package/sentry-cli/sentry-cli.mk
+++ b/package/sentry-cli/sentry-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SENTRY_CLI_VERSION = 1.59.0
+SENTRY_CLI_VERSION = 2.8.0
 SENTRY_CLI_SITE = $(call github,getsentry,sentry-cli,$(SENTRY_CLI_VERSION))
 SENTRY_CLI_LICENSE = BSD-3-clause
 SENTRY_CLI_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
