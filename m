Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED1BC636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3DE57010A;
	Tue, 21 Feb 2023 01:45:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3DE57010A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r2SK5qh8VvsU; Tue, 21 Feb 2023 01:45:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4E2770106;
	Tue, 21 Feb 2023 01:45:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4E2770106
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E7A771BF2B1
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:04:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1417B6FFFB
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1417B6FFFB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hSGvANQBtnc2 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4DF596FFF2
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DF596FFF2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3AA00828C8; Mon, 20 Feb 2023 20:52:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 7 Feb 2023 23:03:03 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: bed21bb9b462bece7cd1b9741643aa553ced4d35
X-Git-Newrev: 8c8ee42bbe6ebb7f20978b06a581c42733197ae2
X-Patchwork-Hint: ignore
Message-Id: <20230220205254.3AA00828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/pkg-generic.mk:
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8c8ee42bbe6ebb7f20978b06a581c42733197ae2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The vendoring done for cargo / go packages (may) need git, so ensure we
check for it in dependencies, similar to how it is done for packages
directly using git.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-generic.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 5d618c6b39..82187d7db9 100644
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
