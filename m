Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84928C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:49:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABBBC4FE94;
	Fri, 28 Feb 2025 16:49:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bjys2AqVBsi0; Fri, 28 Feb 2025 16:49:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9849B4FE8A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9849B4FE8A;
	Fri, 28 Feb 2025 16:49:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A1E168
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:35:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8133F4247C
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pe2HfFIFsh_c for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C7C9426C0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C7C9426C0
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 061FB87C2C; Fri, 28 Feb 2025 16:29:56 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 31 Dec 2024 18:25:56 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 0b785f5b063690f29d091198f9632f0c6b680909
X-Git-Newrev: 70abaac71ea801f8ef8d9f3fb0873e6d18182bc8
X-Patchwork-Hint: ignore
Message-Id: <20250228162956.061FB87C2C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/emlog: backport patch
 fixing the build with Linux 6.12
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
