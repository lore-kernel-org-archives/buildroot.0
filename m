Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E488C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 18:43:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C346141499;
	Mon,  6 Dec 2021 18:43:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vS_uWLNXVQG1; Mon,  6 Dec 2021 18:43:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32F254093F;
	Mon,  6 Dec 2021 18:43:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 46DC01BF3F2
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:14:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 814A441C35
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u2fTCeBtd_8k for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 18:12:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B2B4641C11
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 18:12:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5721181468; Mon,  6 Dec 2021 18:07:43 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 4 Dec 2021 23:13:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e53e43da1277dfdd7bef564c179b918320757e51
X-Git-Newrev: 3ee7c86c8dde6baadf746ee74e81eb31f1f25a66
X-Patchwork-Hint: ignore
Message-Id: <20211206180743.5721181468@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/inadyn: replace local systemd unit
 file with upstream
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

commit: https://git.buildroot.net/buildroot/commit/?id=3ee7c86c8dde6baadf746ee74e81eb31f1f25a66
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If systemd is available at configure time, the inadyn configure script
detects it and generates the unit file.

Also, the local unit file had the wrong absolute path to the binary.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/inadyn/inadyn.mk      |  2 +-
 package/inadyn/inadyn.service | 10 ----------
 2 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/package/inadyn/inadyn.mk b/package/inadyn/inadyn.mk
index fc04fd5f25..9ccb16ddfe 100644
--- a/package/inadyn/inadyn.mk
+++ b/package/inadyn/inadyn.mk
@@ -31,7 +31,7 @@ define INADYN_INSTALL_INIT_SYSV
 endef
 
 define INADYN_INSTALL_INIT_SYSTEMD
-	$(INSTALL) -D -m 644 package/inadyn/inadyn.service \
+	$(INSTALL) -D -m 644 $(@D)/inadyn.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/inadyn.service
 endef
 
diff --git a/package/inadyn/inadyn.service b/package/inadyn/inadyn.service
deleted file mode 100644
index abc0a1e401..0000000000
--- a/package/inadyn/inadyn.service
+++ /dev/null
@@ -1,10 +0,0 @@
-[Unit]
-Description=DDNS client
-After=syslog.target network.target
-
-[Service]
-ExecStart=/usr/bin/inadyn
-Restart=always
-
-[Install]
-WantedBy=multi-user.target
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
