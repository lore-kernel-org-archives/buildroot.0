Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D29AC4332F
	for <buildroot@archiver.kernel.org>; Mon, 30 Oct 2023 10:20:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 272E0852E4;
	Mon, 30 Oct 2023 10:20:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 272E0852E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zvHbRjw-1PaO; Mon, 30 Oct 2023 10:20:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59E14852C7;
	Mon, 30 Oct 2023 10:20:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59E14852C7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B40AA1BF38B
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 10:20:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA3A070A81
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 10:20:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA3A070A81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h_4Xc_53gz2m for <buildroot@lists.busybox.net>;
 Mon, 30 Oct 2023 10:20:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EADE870A78
 for <buildroot@buildroot.org>; Mon, 30 Oct 2023 10:20:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EADE870A78
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DA9FB8617C; Mon, 30 Oct 2023 10:20:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 30 Oct 2023 11:17:32 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 8eb970bdf1c7ac2b83120528d006c8f7093d84e5
X-Git-Newrev: c2770f7cc3953aac1484af8895f2febd9d074cf7
X-Patchwork-Hint: ignore
Message-Id: <20231030102016.DA9FB8617C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/nghttp2: security
 bump to version 1.57.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=c2770f7cc3953aac1484af8895f2febd9d074cf7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Fix CVE-2023-44487: The HTTP/2 protocol allows a denial of service
(server resource consumption) because request cancellation can reset
many streams quickly, as exploited in the wild in August through October
2023.

Fix CVE-2023-35945: nghttp2 fails to release memory when PUSH_PROMISE or
HEADERS frame cannot be sent, and nghttp2_on_stream_close_callback fails
with a fatal error. For example, if GOAWAY frame has been received, a
HEADERS frame that opens new stream cannot be sent.

https://github.com/nghttp2/nghttp2/security/advisories/GHSA-vx74-f528-fxqg
https://github.com/nghttp2/nghttp2/security/advisories/GHSA-6pcr-v3hg-752p
https://github.com/nghttp2/nghttp2/compare/v1.41.0...v1.57.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 07c44afc8d297c5a2e13bd6303e07f48f18b5c8a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nghttp2/nghttp2.hash | 2 +-
 package/nghttp2/nghttp2.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/nghttp2/nghttp2.hash b/package/nghttp2/nghttp2.hash
index 3702a91b5e..18774d01d4 100644
--- a/package/nghttp2/nghttp2.hash
+++ b/package/nghttp2/nghttp2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  eacc6f0f8543583ecd659faf0a3f906ed03826f1d4157b536b4b385fe47c5bb8  nghttp2-1.41.0.tar.gz
+sha256  9210b0113109f43be526ac5835d58a701411821a4d39e155c40d67c40f47a958  nghttp2-1.57.0.tar.xz
 sha256  6b94f3abc1aabd0c72a7c7d92a77f79dda7c8a0cb3df839a97890b4116a2de2a  COPYING
diff --git a/package/nghttp2/nghttp2.mk b/package/nghttp2/nghttp2.mk
index 9190fa30d6..70a25d409c 100644
--- a/package/nghttp2/nghttp2.mk
+++ b/package/nghttp2/nghttp2.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-NGHTTP2_VERSION = 1.41.0
+NGHTTP2_VERSION = 1.57.0
+NGHTTP2_SOURCE =  nghttp2-$(NGHTTP2_VERSION).tar.xz
 NGHTTP2_SITE = https://github.com/nghttp2/nghttp2/releases/download/v$(NGHTTP2_VERSION)
 NGHTTP2_LICENSE = MIT
 NGHTTP2_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
