Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE03C04FFE
	for <buildroot@archiver.kernel.org>; Sat, 11 May 2024 06:58:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFE39616BA;
	Sat, 11 May 2024 06:58:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L2R3SkK4wKJI; Sat, 11 May 2024 06:58:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A14F6169E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A14F6169E;
	Sat, 11 May 2024 06:58:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2B60F1BF868
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 06:58:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1803761632
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 06:58:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bkpYRSKXQMLK for <buildroot@lists.busybox.net>;
 Sat, 11 May 2024 06:58:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B60261431
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B60261431
 for <buildroot@buildroot.org>; Sat, 11 May 2024 06:58:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2701486E8A; Sat, 11 May 2024 06:58:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 11 May 2024 08:58:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 01f2a530e2c73aba7c0aaaeded4fc160d560707f
X-Git-Newrev: 28d37d34acaa50f4095fbf0ec96ca3cd8261fed7
X-Patchwork-Hint: ignore
Message-Id: <20240511065824.2701486E8A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ledmon: fix musl build
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

commit: https://git.buildroot.net/buildroot/commit/?id=28d37d34acaa50f4095fbf0ec96ca3cd8261fed7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following musl build failure raised since bump to version 1.0.0
in commit b3819b761f4a06bc75fe33b785e5ff2cecc5d211 and
https://github.com/intel/ledmon/commit/bcb90426a156fcb3147b5722ed78ac8cf26f2976:

/home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/arm-buildroot-linux-musleabi/12.3.0/../../../../arm-buildroot-linux-musleabi/bin/ld: ledctl-ledctl.o: in function `main':
ledctl.c:(.text.startup+0x140): undefined reference to `on_exit'

Fixes: b3819b761f4a06bc75fe33b785e5ff2cecc5d211
 - http://autobuild.buildroot.org/results/d535e03f6ee0f43ecea34fb29ea148a4cdc01169

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ledctl-ledctl.c-replace-on_exit-by-atexit.patch | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/package/ledmon/0001-src-ledctl-ledctl.c-replace-on_exit-by-atexit.patch b/package/ledmon/0001-src-ledctl-ledctl.c-replace-on_exit-by-atexit.patch
new file mode 100644
index 0000000000..4e1536df4f
--- /dev/null
+++ b/package/ledmon/0001-src-ledctl-ledctl.c-replace-on_exit-by-atexit.patch
@@ -0,0 +1,40 @@
+From ff6f5cd263da4683b3ea07d4ef8afdbf95e2a401 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 9 May 2024 10:04:38 +0200
+Subject: [PATCH] ledctl: replace on_exit() by atexit()
+
+Replace on_exit() by atexit() to avoid the following musl build failure
+raised since bcb9042 ("ledctl: Remove enum ledctl_status_code_t")
+which partially reverted f08dd2c ("Fix build with Musl libc (#139)")
+
+/home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/arm-buildroot-linux-musleabi/12.3.0/../../../../arm-buildroot-linux-musleabi/bin/ld: ledctl-ledctl.o: in function `main':
+ledctl.c:(.text.startup+0x140): undefined reference to `on_exit'
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/intel/ledmon/commit/ff6f5cd263da4683b3ea07d4ef8afdbf95e2a401
+---
+ src/ledctl/ledctl.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/ledctl/ledctl.c b/src/ledctl/ledctl.c
+index 231253dc..95db2d86 100644
+--- a/src/ledctl/ledctl.c
++++ b/src/ledctl/ledctl.c
+@@ -230,7 +230,7 @@ static void ibpi_state_fini(struct ibpi_state *p)
+  *
+  * @return The function does not return a value.
+  */
+-static void _ledctl_fini(int _i, void *_arg)
++static void _ledctl_fini(void)
+ {
+ 	led_free(ctx);
+ 	list_erase(&ibpi_list);
+@@ -1101,7 +1101,7 @@ int main(int argc, char *argv[])
+ 	if (status != LED_STATUS_SUCCESS)
+ 		return status;
+ 
+-	if (on_exit(_ledctl_fini, progname))
++	if (atexit(_ledctl_fini))
+ 		exit(LED_STATUS_ONEXIT_ERROR);
+ 
+ 	status = _read_shared_conf();
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
