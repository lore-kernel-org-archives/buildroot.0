Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAF87C433EF
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 17:46:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 705F042907;
	Fri,  7 Jan 2022 17:46:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lh3_fbTLnGMF; Fri,  7 Jan 2022 17:46:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4F4C428EB;
	Fri,  7 Jan 2022 17:46:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8BBB61BF35F
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 17:46:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7AB14428EB
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 17:46:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lwEhZsUAuDty for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 17:46:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 97A05428E7
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 17:46:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2400782678; Fri,  7 Jan 2022 17:40:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 7 Jan 2022 18:43:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 48b77b25b71fa3c47b8d6fac1da46ea122715350
X-Git-Newrev: 5408db0d9fae1c7735ba339b30498303994ca07f
X-Patchwork-Hint: ignore
Message-Id: <20220107174006.2400782678@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mdadm: disable -Werror
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

commit: https://git.buildroot.net/buildroot/commit/?id=5408db0d9fae1c7735ba339b30498303994ca07f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable -Werror by setting CWFLAGS to ""
This will avoid the following build failure raised since bump to version
4.2 in commit b03fc7974536378ba102418451ba7e9801bc6251:

mdadm.c: In function 'main':
mdadm.c:156:28: error: this statement may fall through [-Werror=implicit-fallthrough=]
  154 |    if (mode == ASSEMBLE || mode == BUILD ||
      |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/c0f216b7aadb794110409d03dcef7fa58e833cd4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mdadm/mdadm.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mdadm/mdadm.mk b/package/mdadm/mdadm.mk
index 6ee0bb60c9..0a2eb4e5bd 100644
--- a/package/mdadm/mdadm.mk
+++ b/package/mdadm/mdadm.mk
@@ -16,6 +16,7 @@ MDADM_BUILD_OPTS = \
 	CC=$(TARGET_CC) \
 	COROSYNC=-DNO_COROSYNC \
 	DLM=-DNO_DLM \
+	CWFLAGS="" \
 	CXFLAGS="$(MDADM_CXFLAGS)" \
 	CPPFLAGS="$(TARGET_CPPFLAGS) -DBINDIR=\\\"/sbin\\\"" \
 	CHECK_RUN_DIR=0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
