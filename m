Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7FA5CD379F
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 16:28:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F32A607B2;
	Tue,  3 Sep 2024 16:28:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yj-CyI-jvH06; Tue,  3 Sep 2024 16:28:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75555607FA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75555607FA;
	Tue,  3 Sep 2024 16:28:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4F3641BF83E
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 16:28:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C6EA40453
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 16:28:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QzHr2g9ChPKQ for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 16:28:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A1B640442
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A1B640442
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 16:28:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0412686A1E; Tue,  3 Sep 2024 16:28:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 3 Sep 2024 18:18:34 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 1baed8fbd3db296f5db66da6c8a3b60ca699baa2
X-Git-Newrev: 83c7e07828e8fc9d932b46fe65dbb0cf8c0dd6d9
X-Patchwork-Hint: ignore
Message-Id: <20240903162808.0412686A1E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/cwiid: fix build
 with gcc >= 14
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

commit: https://git.buildroot.net/buildroot/commit/?id=83c7e07828e8fc9d932b46fe65dbb0cf8c0dd6d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

Fix the following build failure with gcc >= 14:

led.c: In function 'wmplugin_exec':
led.c:86:42: error: assignment to 'struct cwiid_btn_message *' from incompatible pointer type 'struct cwiid_btn_mesg *' [-Wincompatible-pointer-types]
   86 |                                 btn_mesg = &mesg[i].btn_mesg;
      |                                          ^

Fixes:
 - http://autobuild.buildroot.org/results/a3bde74ff2137d088f4261e62930859bfe460cb9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f0877f5f9db6d14e39bd9c82ad13937906a2ab62)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...t-plugins-led-led.c-fix-build-with-gcc-14.patch | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/package/cwiid/0003-wminput-plugins-led-led.c-fix-build-with-gcc-14.patch b/package/cwiid/0003-wminput-plugins-led-led.c-fix-build-with-gcc-14.patch
new file mode 100644
index 0000000000..ba8121802b
--- /dev/null
+++ b/package/cwiid/0003-wminput-plugins-led-led.c-fix-build-with-gcc-14.patch
@@ -0,0 +1,37 @@
+From 10106fdb4cc833faa3c2fcb980d0a4eb121fe19d Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 23 Jul 2024 10:31:32 +0200
+Subject: [PATCH] wminput/plugins/led/led.c: fix build with gcc >= 14
+
+Fix the following build failure with gcc >= 14:
+
+led.c: In function 'wmplugin_exec':
+led.c:86:42: error: assignment to 'struct cwiid_btn_message *' from incompatible pointer type 'struct cwiid_btn_mesg *' [-Wincompatible-pointer-types]
+   86 |                                 btn_mesg = &mesg[i].btn_mesg;
+      |                                          ^
+
+Fixes:
+ - http://autobuild.buildroot.org/results/a3bde74ff2137d088f4261e62930859bfe460cb9
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/abstrakraft/cwiid/pull/47
+---
+ wminput/plugins/led/led.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/wminput/plugins/led/led.c b/wminput/plugins/led/led.c
+index 93b96d9..591f365 100644
+--- a/wminput/plugins/led/led.c
++++ b/wminput/plugins/led/led.c
+@@ -72,7 +72,7 @@ struct wmplugin_data *wmplugin_exec(int mesg_count, union cwiid_mesg mesg[])
+ {
+ 	int i;
+ 	uint8_t button;
+-	struct cwiid_btn_message *btn_mesg;
++	struct cwiid_btn_mesg *btn_mesg;
+ 
+ 	uint8_t led_state = (Led1 ? CWIID_LED1_ON : 0)
+ 	                  | (Led2 ? CWIID_LED2_ON : 0)
+-- 
+2.43.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
