Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4538EC64ED6
	for <buildroot@archiver.kernel.org>; Tue, 28 Feb 2023 15:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E90AB611B8;
	Tue, 28 Feb 2023 15:59:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E90AB611B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z3dOvz8dfkZM; Tue, 28 Feb 2023 15:59:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17D1261183;
	Tue, 28 Feb 2023 15:59:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17D1261183
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 52ED61BF20F
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 15:59:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B1A26110F
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 15:59:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B1A26110F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PZyw2r6XBl9t for <buildroot@lists.busybox.net>;
 Tue, 28 Feb 2023 15:59:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 620FE60AD4
 for <buildroot@buildroot.org>; Tue, 28 Feb 2023 15:59:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 620FE60AD4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5124286D0B; Tue, 28 Feb 2023 15:59:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 28 Feb 2023 16:51:26 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 30f7426bce3fc340d3970d2e5e9e798257611466
X-Git-Newrev: ace092f8f372c6e68a05e93ca24831e0af73e8ba
X-Patchwork-Hint: ignore
Message-Id: <20230228155909.5124286D0B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/pkg-generic.mk:
 require git on the host for packages using cargo/go vendoring
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

commit: https://git.buildroot.net/buildroot/commit/?id=ace092f8f372c6e68a05e93ca24831e0af73e8ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

The vendoring done for cargo / go packages (may) need git, so ensure we
check for it in dependencies, similar to how it is done for packages
directly using git.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 8c8ee42bbe6ebb7f20978b06a581c42733197ae2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-generic.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 6c3b64b4c8..a9b923fcbc 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1250,6 +1250,13 @@ else ifeq ($$($(2)_SITE_METHOD),cvs)
 DL_TOOLS_DEPENDENCIES += cvs
 endif # SITE_METHOD
 
+# cargo/go vendoring (may) need git
+ifeq ($$($(2)_DOWNLOAD_POST_PROCESS),cargo)
+DL_TOOLS_DEPENDENCIES += git
+else ifeq ($$($(2)_DOWNLOAD_POST_PROCESS),go)
+DL_TOOLS_DEPENDENCIES += git
+endif
+
 DL_TOOLS_DEPENDENCIES += $$(call extractor-system-dependency,$$($(2)_SOURCE))
 
 # Ensure all virtual targets are PHONY. Listed alphabetically.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
