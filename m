Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68FCEC00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 19:54:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E671860B97;
	Mon, 15 Aug 2022 19:54:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E671860B97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5038F0iVJY0i; Mon, 15 Aug 2022 19:54:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD3B160B96;
	Mon, 15 Aug 2022 19:54:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD3B160B96
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9D7041BF38D
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 19:54:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7919A60B96
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 19:54:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7919A60B96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a5n-8s3oAwOn for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 19:54:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D291D60A9E
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 19:54:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D291D60A9E
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id D8590876D8; Mon, 15 Aug 2022 19:40:19 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 21:54:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3a9369fdebe0801b20fc2e4faa7043009d6beb25
X-Git-Newrev: 612ae4bd180de764becb48f609ffe836d362a87b
X-Patchwork-Hint: ignore
Message-Id: <20220815194019.D8590876D8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-tools/linux-tool-perf.mk.in:
 Fix disabling of documentation
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

commit: https://git.buildroot.net/buildroot/commit/?id=612ae4bd180de764becb48f609ffe836d362a87b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We are trying to not build the perf documentation. However, the hook
being used to do so was named incorrectly. As a result, the build steps
to disable the documentation were never executed.

Rename the hook from
    LINUX_POST_PATCH_HOOKS
to
    LINUX_TOOLS_POST_PATCH_HOOKS
to fix the issue.

Fixes: 20b144666909 ("linux/tools: make it a real, separate package")
Signed-off-by: Markus Mayer <mmayer@broadcom.com>
Tested-by: Florian Fainelli <f.fainelli@gmail.com>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/linux-tools/linux-tool-perf.mk.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
index 7bba440530..057c6f80e7 100644
--- a/package/linux-tools/linux-tool-perf.mk.in
+++ b/package/linux-tools/linux-tool-perf.mk.in
@@ -126,7 +126,7 @@ define PERF_DISABLE_DOCUMENTATION
 		printf "%%:\n\t@:\n" >$(LINUX_DIR)/tools/perf/Documentation/GNUmakefile; \
 	fi
 endef
-LINUX_POST_PATCH_HOOKS += PERF_DISABLE_DOCUMENTATION
+LINUX_TOOLS_POST_PATCH_HOOKS += PERF_DISABLE_DOCUMENTATION
 
 # O must be redefined here to overwrite the one used by Buildroot for
 # out of tree build. We build perf in $(LINUX_DIR)/tools/perf/ and not just
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
