Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7ED3C433F5
	for <buildroot@archiver.kernel.org>; Fri, 11 Feb 2022 17:12:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64BA7416D9;
	Fri, 11 Feb 2022 17:12:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YBKrMcJ-FU24; Fri, 11 Feb 2022 17:12:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F8F7416BE;
	Fri, 11 Feb 2022 17:12:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 527491BF2FE
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 17:12:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 40BEB60E7A
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 17:12:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QdL9_ZYryFKz for <buildroot@lists.busybox.net>;
 Fri, 11 Feb 2022 17:12:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6728E60BEC
 for <buildroot@buildroot.org>; Fri, 11 Feb 2022 17:12:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 4CABA82DEA; Fri, 11 Feb 2022 17:04:44 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 11 Feb 2022 17:25:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 618c5f7671643516432c1ec6b9f7b203313763a7
X-Git-Newrev: 6e40891a6679bc0dd87af32d5e672180751987b9
X-Patchwork-Hint: ignore
Message-Id: <20220211170444.4CABA82DEA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/download/helpers: adjust for older
 coreutils versions
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

commit: https://git.buildroot.net/buildroot/commit/?id=6e40891a6679bc0dd87af32d5e672180751987b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The -z option for head was only added in coreutils 8.25, but some older
enterprise-grade distributions (e.g. the oldest still maintained RHEL 7)
only have nothing more recent than coreutils 8.22.

We fix that by using sed to remove everything that starts with the first
NULL byte, \x00.

Signed-off-by: Clayton Shotwell <clayton.shotwell@collins.com>
[yann.morin.1998@free.fr: hex is \xHH, not \xH, reword commit log]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/download/helpers | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/download/helpers b/support/download/helpers
index ab31e27a69..90a7d6c1ec 100755
--- a/support/download/helpers
+++ b/support/download/helpers
@@ -79,7 +79,7 @@ post_process_unpack() {
 
     mkdir "${dest}"
     tar -C "${dest}" --strip-components=1 -xzf "${tarball}"
-    one_file="$(find "${dest}" -type f -print0 |LC_ALL=C sort -z |head -z -n1 |tr -d "\0")"
+    one_file="$(find "${dest}" -type f -print0 |LC_ALL=C sort -z |sed 's/\x0.*//')"
     touch -r "${one_file}" "${dest}.timestamp"
 }
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
