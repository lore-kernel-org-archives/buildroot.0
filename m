Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B28C021AA
	for <buildroot@archiver.kernel.org>; Tue, 18 Feb 2025 20:14:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12D6B80C20;
	Tue, 18 Feb 2025 20:14:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 68B4mzEHI1dF; Tue, 18 Feb 2025 20:14:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F19080CD1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F19080CD1;
	Tue, 18 Feb 2025 20:14:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 439C81D76
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 20:14:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 278DE60FCA
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 20:14:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zy8e3mJV_Unl for <buildroot@buildroot.org>;
 Tue, 18 Feb 2025 20:14:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1275E60FD3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1275E60FD3
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 20:14:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9935C8771B; Tue, 18 Feb 2025 20:14:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 18 Feb 2025 20:45:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3761177a89a78c83a102d811efd0079ed01a3abb
X-Git-Newrev: 3aacb38098864eba4f0af21e947cb9cbf2cf6dbe
X-Patchwork-Hint: ignore
Message-Id: <20250218201425.9935C8771B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/brmake: drop use of unbuffer
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
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3aacb38098864eba4f0af21e947cb9cbf2cf6dbe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When it was introduced in afdb545b2847 (tools: new tool to filter the
output of make), brmake made use of unbuffer, so as to try and ensure
that no output would get lost between make printing it, and the logger
loop time-stamping it and storing it in the logfile, in case the user
would interrup the build (SIGINT, ^C)

However, unbuffer is missing in our reference build image (we could have
added it, but we missed the occasion to do so every time we updated the
reference build image).

Furthermore, the rationale for using unbuffer, although reasonable, is
not so practical: indeed, when the user hits Crtl-C, this is inherently
asynchronous, and they can't expect everything to be entirely cleanly
terminated, especially buffering. Using unbuffer is thus slightly
superfluous.

The timestamps will be slightly off because of buffering, but a build
generates so much output that this won't be a problem in practice.

Drop use of unbuffer.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 utils/brmake | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/utils/brmake b/utils/brmake
index 4756016a0c..e5437d8f2c 100755
--- a/utils/brmake
+++ b/utils/brmake
@@ -5,11 +5,6 @@
 main() {
     local ret start d h m mf
 
-    if ! which unbuffer >/dev/null 2>&1; then
-        printf "you need to install 'unbuffer' (from package expect or expect-dev)\n" >&2
-        exit 1
-    fi
-
     start=${SECONDS}
 
     if [ -n "$BR2_DOCKER" ]; then
@@ -18,7 +13,7 @@ main() {
         docker=()
     fi
 
-    ( exec 2>&1; unbuffer "${docker[@]}" make "${@}"; ) \
+    ( exec 2>&1; "${docker[@]}" make "${@}"; ) \
     > >( while read -r line; do
              printf "%(%Y-%m-%dT%H:%M:%S)T %s\n" -1 "${line}"
          done \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
