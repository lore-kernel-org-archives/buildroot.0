Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A259ACDB47E
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 18:48:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 48E2940182;
	Fri, 13 Oct 2023 18:48:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48E2940182
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AGOLTURUpZn5; Fri, 13 Oct 2023 18:48:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D64941832;
	Fri, 13 Oct 2023 18:48:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D64941832
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0C1041BF995
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 18:45:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB6D36F666
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 18:45:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB6D36F666
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mkUrrNLlbdmy for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 18:45:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 01AEE6F672
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 18:45:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01AEE6F672
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EC54484C4C; Fri, 13 Oct 2023 18:45:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 13 Oct 2023 20:42:32 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: ac51d2a9032376ed375a9b8d65025c90daa24f1e
X-Git-Newrev: bc0f65857ef6cb3c82a364ebfa5867a3fa3bc350
X-Patchwork-Hint: ignore
Message-Id: <20231013184521.EC54484C4C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/go: security bump
 to version 1.20.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=bc0f65857ef6cb3c82a364ebfa5867a3fa3bc350
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

Fixes CVE-2023-39325: rapid stream resets can cause excessive work

A malicious HTTP/2 client which rapidly creates requests and immediately
resets them can cause excessive server resource consumption.  While the
total number of requests is bounded to the http2.Server.MaxConcurrentStreams
setting, resetting an in-progress request allows the attacker to create a
new request while the existing one is still executing.

go1.20.10 (released 2023-10-10) includes a security fix to the net/http
package.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index ac603e6e3b..a4aafbe6e4 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  4923920381cd71d68b527761afefa523ea18c5831b4795034c827e18b685cdcf  go1.20.9.src.tar.gz
+sha256  72d2f51805c47150066c103754c75fddb2c19d48c9219fa33d1e46696c841dbb  go1.20.10.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index cc374aa44f..c3f88b8682 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.20.9
+GO_VERSION = 1.20.10
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
