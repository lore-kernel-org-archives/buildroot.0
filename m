Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C111BE77188
	for <buildroot@archiver.kernel.org>; Tue, 31 Dec 2024 17:30:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87D438055A;
	Tue, 31 Dec 2024 17:30:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xepEpZnsyxei; Tue, 31 Dec 2024 17:30:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADD6981010
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADD6981010;
	Tue, 31 Dec 2024 17:30:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6DF8AE0F
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 17:30:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E48E6063C
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 17:30:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BeKb4ud18DZL for <buildroot@buildroot.org>;
 Tue, 31 Dec 2024 17:30:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B3A4605E6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B3A4605E6
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 17:30:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4B89C8345D; Tue, 31 Dec 2024 17:30:01 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 31 Dec 2024 18:25:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0b785f5b063690f29d091198f9632f0c6b680909
X-Git-Newrev: 70abaac71ea801f8ef8d9f3fb0873e6d18182bc8
X-Patchwork-Hint: ignore
Message-Id: <20241231173001.4B89C8345D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/emlog: backport patch fixing the
 build with Linux 6.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=70abaac71ea801f8ef8d9f3fb0873e6d18182bc8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The emlog kernel module code uses a function that no longer exists in
Linux 6.12. Backport a patch from upstream that fixes this issue.

Fixes:

  https://autobuild.buildroot.org/results/9233db6ca0e70d8e90a3ef59e521d1398724502d/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...g-Do-not-use-no_llseek-with-kernel-6.12.0.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/emlog/0002-emlog-Do-not-use-no_llseek-with-kernel-6.12.0.patch b/package/emlog/0002-emlog-Do-not-use-no_llseek-with-kernel-6.12.0.patch
new file mode 100644
index 0000000000..20cacc97be
--- /dev/null
+++ b/package/emlog/0002-emlog-Do-not-use-no_llseek-with-kernel-6.12.0.patch
@@ -0,0 +1,35 @@
+From 35a0e8d33c5a520df458483237966fa1b1024a3f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 14 Dec 2024 09:55:10 -0800
+Subject: [PATCH] emlog: Do not use no_llseek with kernel 6.12.0+
+
+no_llseek is finally gone with 6.12-rc1 [1]
+
+[1] https://github.com/torvalds/linux/commit/cb787f4ac0c2e439ea8d7e6387b925f74576bdf8
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Upstream: https://github.com/nicupavel/emlog/commit/dca01ea62833249d78ac3bdf277b73424bf93e89
+---
+ emlog.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/emlog.c b/emlog.c
+index 2ead738..b45c72d 100644
+--- a/emlog.c
++++ b/emlog.c
+@@ -464,7 +464,12 @@ static const struct file_operations emlog_fops = {
+     .open = emlog_open,
+     .release = emlog_release,
+     .poll = emlog_poll,
+-    .llseek = no_llseek,        /* no_llseek by default introduced at v2.6.37-rc1 */
++#if LINUX_VERSION_CODE < KERNEL_VERSION(6, 12, 0)
++    /* no_llseek by default introduced at v2.6.37-rc1 and
++     * removed in 6.12.0
++     */
++    .llseek = no_llseek,
++#endif
+     .owner = THIS_MODULE,
+ };
+ 
+-- 
+2.47.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
