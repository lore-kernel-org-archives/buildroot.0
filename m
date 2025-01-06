Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E051E77198
	for <buildroot@archiver.kernel.org>; Mon,  6 Jan 2025 14:48:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4ABC40304;
	Mon,  6 Jan 2025 14:48:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eNFF3eq7Eguf; Mon,  6 Jan 2025 14:48:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCECA4030B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCECA4030B;
	Mon,  6 Jan 2025 14:48:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B4BDDF1E
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 14:48:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A25AA40304
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 14:48:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UlR5YsA1akDh for <buildroot@buildroot.org>;
 Mon,  6 Jan 2025 14:48:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C249C402E6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C249C402E6
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 14:48:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AFC2483B7E; Mon,  6 Jan 2025 14:48:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Jan 2025 14:58:38 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: 9bdb8f978506ce64961f4c3ea0fca586818a35d3
X-Git-Newrev: 7a6d41364f88ce644a63417cf7b92161fe816b97
X-Patchwork-Hint: ignore
Message-Id: <20250106144820.AFC2483B7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] package/skeleton: create
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

commit: https://git.buildroot.net/buildroot/commit/?id=7a6d41364f88ce644a63417cf7b92161fe816b97
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

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
index 1bb3971191..dc754f1244 100644
--- a/package/skeleton/skeleton.mk
+++ b/package/skeleton/skeleton.mk
@@ -23,7 +23,7 @@ define HOST_SKELETON_INSTALL_CMDS
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
