Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 725B3CA1013
	for <buildroot@archiver.kernel.org>; Mon,  8 Sep 2025 10:59:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4840D61CB5;
	Mon,  8 Sep 2025 10:59:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YYZjFmUb5tKt; Mon,  8 Sep 2025 10:59:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DA3661C45
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DA3661C45;
	Mon,  8 Sep 2025 10:59:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A66B9186
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:59:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 79C0F40098
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:59:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CjsqsocNIkOz for <buildroot@buildroot.org>;
 Mon,  8 Sep 2025 10:59:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23815414BD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23815414BD
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:59:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 21C5F83B51; Mon,  8 Sep 2025 10:59:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 5 Sep 2025 17:24:42 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 79809551fbf039c734e62d17d4f5de2a7793aac4
X-Git-Newrev: f1fa93476dccc480a3e0e4e31c88a3a7e7eb2dbd
X-Patchwork-Hint: ignore
Message-Id: <20250908105918.21C5F83B51@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x]
 package/liblog4c-localtime: fix build with GCC 15.x
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f1fa93476dccc480a3e0e4e31c88a3a7e7eb2dbd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Add simple patch, submitted upstream, to fix the build with GCC 15.x:

userloc_formatter.c: In function 'userloc_format':
userloc_formatter.c:30:5: error: implicit declaration of function 'sd_debug' [-Wimplicit-function-declaration]
   30 |     sd_debug("Formatter s13_userloc checking location info for userdata %X",a_event->evt_loc->loc_data);
      |     ^~~~~~~~
make[4]: *** [Makefile:519: userloc_formatter.lo] Error 1

Fixes:

  https://autobuild.buildroot.org/results/dab64025e6a1688d5fadc2b9bd3738a2c886aa9c/

Considering the level of upstream maintenance, we did hesitate with
dropping the package, but as the fix was quite simple, we did the fix
instead.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 41463deed46b1085d7e6d327d0846805c110d7fe)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...serloc_formatter.c-drop-usage-of-sd_debug.patch | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/package/liblog4c-localtime/0006-examples-userloc_formatter.c-drop-usage-of-sd_debug.patch b/package/liblog4c-localtime/0006-examples-userloc_formatter.c-drop-usage-of-sd_debug.patch
new file mode 100644
index 0000000000..8f54d1d6fd
--- /dev/null
+++ b/package/liblog4c-localtime/0006-examples-userloc_formatter.c-drop-usage-of-sd_debug.patch
@@ -0,0 +1,42 @@
+From 1dfc4a60ebf96766b682c464ae69c453ce15105a Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Tue, 19 Aug 2025 20:04:09 +0200
+Subject: [PATCH] examples/userloc_formatter.c: drop usage of sd_debug()
+
+With recent compilers, log4c-localtime fails to build with:
+
+userloc_formatter.c: In function 'userloc_format':
+userloc_formatter.c:30:5: error: implicit declaration of function 'sd_debug' [-Wimplicit-function-declaration]
+   30 |     sd_debug("Formatter s13_userloc checking location info for userdata %X",a_event->evt_loc->loc_data);
+      |     ^~~~~~~~
+make[4]: *** [Makefile:519: userloc_formatter.lo] Error 1
+
+This function seems to be an internal function of the log4c-localtime
+library, and is not used by any other example application. Since it's
+only used to print some debugging information, we simply get rid of
+the problematic code.
+
+Upstream: https://github.com/rcmadruga/log4c-localtime/pull/2
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ examples/userloc_formatter.c | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/examples/userloc_formatter.c b/examples/userloc_formatter.c
+index 4299a48..7bcf0e9 100644
+--- a/examples/userloc_formatter.c
++++ b/examples/userloc_formatter.c
+@@ -27,10 +27,8 @@ static const char* userloc_format(
+     static char buffer[4096];
+     user_locinfo_t* uloc = NULL;
+ 
+-    sd_debug("Formatter s13_userloc checking location info for userdata %X",a_event->evt_loc->loc_data);
+     if (a_event->evt_loc->loc_data != NULL)
+     {
+-	sd_debug("Formatter s13_userloc getting a valid user location info pointer");
+         uloc = (user_locinfo_t*) a_event->evt_loc->loc_data;
+         sprintf(buffer, "[%s][HOST:%s][PID:%i][FILE:%s][LINE:%i][MSG:%s]",
+ 		a_event->evt_category,  
+-- 
+2.50.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
