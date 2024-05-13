Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F89C25B10
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 19:57:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF57960A8A;
	Mon, 13 May 2024 19:57:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J5RZQDt06Bs3; Mon, 13 May 2024 19:57:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 032FA60A6E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 032FA60A6E;
	Mon, 13 May 2024 19:57:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B6B6F1BF947
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 19:57:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AEED282A53
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 19:57:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FhkMhIhGpOrj for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 19:57:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EBF1F82A3B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EBF1F82A3B
 for <buildroot@buildroot.org>; Mon, 13 May 2024 19:57:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D5D0887131; Mon, 13 May 2024 19:57:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 13 May 2024 21:50:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b8c70f67017ebe08459992ac575ae4989243c232
X-Git-Newrev: b55d22f822d179ba25b630b50e98e6eeaffbdcfe
X-Patchwork-Hint: ignore
Message-Id: <20240513195730.D5D0887131@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/newlib-bare-metal: add patch for
 gcc 14.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=b55d22f822d179ba25b630b50e98e6eeaffbdcfe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch is needed for building newlib with gcc 14.1.0.  Without this patch,
the following build error will occur:

../../.././libgloss/microblaze/linux-outbyte.c: In function 'outbyte':
../../.././libgloss/microblaze/linux-outbyte.c:3:9: error: implicit declaration of function '_write' [-Wimplicit-function-declaration]
    3 |         _write(1, &c, 1);

This patch has been submitted upstream:
https://patchwork.sourceware.org/project/newlib/patch/20240513062419.2042278-1-neal.frager@amd.com/

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-microblaze-fix-read-and-_write-declarati.patch | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/package/newlib-bare-metal/0001-libgloss-microblaze-fix-read-and-_write-declarati.patch b/package/newlib-bare-metal/0001-libgloss-microblaze-fix-read-and-_write-declarati.patch
new file mode 100644
index 0000000000..5eacfd3270
--- /dev/null
+++ b/package/newlib-bare-metal/0001-libgloss-microblaze-fix-read-and-_write-declarati.patch
@@ -0,0 +1,40 @@
+From 1ebecb83607e9c0cc44ad1e518169ae03c0f2d26 Mon Sep 17 00:00:00 2001
+From: Neal Frager <neal.frager@amd.com>
+Date: Mon, 13 May 2024 07:22:47 +0100
+Subject: [PATCH] libgloss: microblaze: fix read and _write declarations
+
+This patch resolves the following build error which occurs with gcc 14.1.0:
+../../.././libgloss/microblaze/linux-outbyte.c: In function 'outbyte':
+../../.././libgloss/microblaze/linux-outbyte.c:3:9: error: implicit declaration of function '_write' [-Wimplicit-function-declaration]
+    3 |         _write(1, &c, 1);
+
+Signed-off-by: Neal Frager <neal.frager@amd.com>
+Upstream: https://patchwork.sourceware.org/project/newlib/patch/20240513062419.2042278-1-neal.frager@amd.com/
+---
+ libgloss/microblaze/linux-inbyte.c  | 2 ++
+ libgloss/microblaze/linux-outbyte.c | 2 ++
+ 2 files changed, 4 insertions(+)
+
+diff --git a/libgloss/microblaze/linux-inbyte.c b/libgloss/microblaze/linux-inbyte.c
+index 58fdf1957..2f8d33871 100644
+--- a/libgloss/microblaze/linux-inbyte.c
++++ b/libgloss/microblaze/linux-inbyte.c
+@@ -1,3 +1,5 @@
++extern int read (int, char *, int);
++
+ int inbyte(void)
+ {
+ 	char ch = 0;
+diff --git a/libgloss/microblaze/linux-outbyte.c b/libgloss/microblaze/linux-outbyte.c
+index 9d7bc4890..46de511f6 100644
+--- a/libgloss/microblaze/linux-outbyte.c
++++ b/libgloss/microblaze/linux-outbyte.c
+@@ -1,3 +1,5 @@
++extern int _write (int, char *, int);
++
+ void outbyte (unsigned char c)
+ {
+ 	_write(1, &c, 1);
+-- 
+2.25.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
