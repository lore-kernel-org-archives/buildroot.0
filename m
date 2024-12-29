Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 284C3E7718B
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 21:11:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E748C8127F;
	Sun, 29 Dec 2024 21:11:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1d7fCptUptd0; Sun, 29 Dec 2024 21:11:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F35081291
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F35081291;
	Sun, 29 Dec 2024 21:11:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DAFDBC8
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 21:11:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC28E60ACA
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 21:11:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vDrV9DmGdcGX for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 21:11:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0980A60AC9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0980A60AC9
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 21:11:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0095087723; Sun, 29 Dec 2024 21:11:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 29 Dec 2024 22:10:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a2c6b8921cfa9bf0eb3667922de37fe7079a8d5b
X-Git-Newrev: 66a5f9bc742f517ad245e1ba0dcc8837205beedc
X-Patchwork-Hint: ignore
Message-Id: <20241229211127.0095087723@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/skeleton: create lib64 symlink on
 s390x
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=66a5f9bc742f517ad245e1ba0dcc8837205beedc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
