Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EDC1C52D6F
	for <buildroot@archiver.kernel.org>; Fri,  2 Aug 2024 16:50:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0110F81FF2;
	Fri,  2 Aug 2024 16:50:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XIt7mdflEIEj; Fri,  2 Aug 2024 16:50:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E13C181FF9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E13C181FF9;
	Fri,  2 Aug 2024 16:50:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 016B51BF3EF
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 16:50:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF7DB81FF9
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 16:50:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y5fBNS61zg6C for <buildroot@lists.busybox.net>;
 Fri,  2 Aug 2024 16:50:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0736F81FF2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0736F81FF2
 for <buildroot@buildroot.org>; Fri,  2 Aug 2024 16:50:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E1F8383B3F; Fri,  2 Aug 2024 16:50:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Aug 2024 18:50:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b95fff0185803bac5c8cfb558d60234e59a1469b
X-Git-Newrev: f0877f5f9db6d14e39bd9c82ad13937906a2ab62
X-Patchwork-Hint: ignore
Message-Id: <20240802165049.E1F8383B3F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cwiid: fix build with gcc >= 14
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

commit: https://git.buildroot.net/buildroot/commit/?id=f0877f5f9db6d14e39bd9c82ad13937906a2ab62
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with gcc >= 14:

led.c: In function 'wmplugin_exec':
led.c:86:42: error: assignment to 'struct cwiid_btn_message *' from incompatible pointer type 'struct cwiid_btn_mesg *' [-Wincompatible-pointer-types]
   86 |                                 btn_mesg = &mesg[i].btn_mesg;
      |                                          ^

Fixes:
 - http://autobuild.buildroot.org/results/a3bde74ff2137d088f4261e62930859bfe460cb9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
