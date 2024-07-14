Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46837C3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 09:09:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E3298109A;
	Sun, 14 Jul 2024 09:09:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1GCfhGaKyntM; Sun, 14 Jul 2024 09:09:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E02680F66
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E02680F66;
	Sun, 14 Jul 2024 09:09:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1A80F1BF23C
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 09:08:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A533B8137E
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 09:08:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HJlBO16iDLi0 for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 09:08:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 170848137D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 170848137D
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 09:08:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 11CCE866E6; Sun, 14 Jul 2024 09:08:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Jul 2024 10:22:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f38e706a807d7f0fb9821f9760bd0f9fa13272a4
X-Git-Newrev: 03327ba224e7ade88e7d7d6a585c676fcbafd68d
X-Patchwork-Hint: ignore
Message-Id: <20240714090821.11CCE866E6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/download: accept manifest path as
 a post-process option
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=03327ba224e7ade88e7d7d6a585c676fcbafd68d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now we have the post-process options, we can use them to pass the
manifest path instead of passing it through an environment variable.

For now, we support both. The environment variable approach will be
removed again later.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 support/download/cargo-post-process | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/support/download/cargo-post-process b/support/download/cargo-post-process
index b94b160315..a9fbced466 100755
--- a/support/download/cargo-post-process
+++ b/support/download/cargo-post-process
@@ -5,10 +5,12 @@ set -e
 # shellcheck source=helpers source-path=SCRIPTDIR
 . "${0%/*}/helpers"
 
-while getopts "n:o:" OPT; do
+manifest="${BR_CARGO_MANIFEST_PATH-Cargo.toml}"
+while getopts "n:o:m:" OPT; do
     case "${OPT}" in
     o)  output="${OPTARG}";;
     n)  base_name="${OPTARG}";;
+    m)  manifest="${OPTARG}";;
     :)  error "option '%s' expects a mandatory argument\n" "${OPTARG}";;
     \?) error "unknown option '%s'\n" "${OPTARG}";;
     esac
@@ -29,7 +31,7 @@ mkdir -p .cargo/
 mkdir -p "${CARGO_HOME}"
 flock "${CARGO_HOME}"/.br-lock \
 cargo vendor \
-    --manifest-path "${BR_CARGO_MANIFEST_PATH-Cargo.toml}" \
+    --manifest-path "${manifest}" \
     --locked VENDOR \
     > .cargo/config
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
