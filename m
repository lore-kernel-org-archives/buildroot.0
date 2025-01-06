Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4499E77199
	for <buildroot@archiver.kernel.org>; Mon,  6 Jan 2025 14:47:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6085F60661;
	Mon,  6 Jan 2025 14:47:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PicIF48f5EBH; Mon,  6 Jan 2025 14:47:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7265560729
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7265560729;
	Mon,  6 Jan 2025 14:47:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 16A2CF1F
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 14:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E59CD404C1
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 14:47:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id raM5aNnfEhFF for <buildroot@buildroot.org>;
 Mon,  6 Jan 2025 14:47:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E74684032C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E74684032C
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 14:47:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CBECD83B64; Mon,  6 Jan 2025 14:47:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Jan 2025 14:59:02 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: aa14c37abf4ec06147754a1119e88181ace02f5e
X-Git-Newrev: 24be3751ab53dcfbccb20139043176ada504a396
X-Patchwork-Hint: ignore
Message-Id: <20250106144712.CBECD83B64@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/skeleton: create
 lib64 symlink on s390x
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=24be3751ab53dcfbccb20139043176ada504a396
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Building on a s390x host, we currently end up with:

  output/host/lib
  output/host/lib32 -> lib
  output/host/lib64

host-libopenssl installs to lib64, but since the kernel build doesn't
explicitly search there, it breaks:

  >>> linux 6.6.32 Building
  [...]
    HOSTCC  scripts/sign-file
  /usr/bin/ld: cannot find -lcrypto: No such file or directory
  collect2: error: ld returned 1 exit status

Fix this by creating a lib64 link instead of lib32, so we get:

  output/host/lib
  output/host/lib64 -> lib

Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 66a5f9bc742f517ad245e1ba0dcc8837205beedc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/skeleton/skeleton.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
index 4eaaf32ead..595089ed4d 100644
--- a/package/skeleton/skeleton.mk
+++ b/package/skeleton/skeleton.mk
@@ -20,7 +20,7 @@ define HOST_SKELETON_INSTALL_CMDS
 	$(Q)mkdir -p $(HOST_DIR)/lib
 	$(Q)mkdir -p $(HOST_DIR)/include
 	$(Q)case $(HOSTARCH) in \
-		(*64) ln -snf lib $(HOST_DIR)/lib64;; \
+		(*64|s390x) ln -snf lib $(HOST_DIR)/lib64;; \
 		(*)   ln -snf lib $(HOST_DIR)/lib32;; \
 	esac
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
