Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71DD1CA0EE6
	for <buildroot@archiver.kernel.org>; Tue, 19 Aug 2025 20:29:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C72340D91;
	Tue, 19 Aug 2025 20:29:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LcqYUY0Qp1Lk; Tue, 19 Aug 2025 20:29:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53C2240D94
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53C2240D94;
	Tue, 19 Aug 2025 20:29:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E2A0DE6
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 20:29:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4BC1080ACD
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 20:29:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TgdKj8NjDcmP for <buildroot@buildroot.org>;
 Tue, 19 Aug 2025 20:29:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5052680A96
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5052680A96
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5052680A96
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 20:29:29 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 36793C6B394
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 20:29:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A72EF60697;
 Tue, 19 Aug 2025 20:29:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 25AD41C228A8C; 
 Tue, 19 Aug 2025 22:29:23 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Alexander Varnin <fenixk19@mail.ru>
Date: Tue, 19 Aug 2025 22:29:21 +0200
Message-ID: <20250819202922.3407686-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1755635365; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=sRNCrSKLn8ltf5HlknKfp0Rcu8yHXH3hCmYFqPWuLPM=;
 b=MvSP051ThBOh1dzlKqERvLct5rLIkTB3dm56xSuiTReS1i2S6cRbZivcEnPkCG3+LfYhS8
 hBILiO8IwahyD04+1wKeHck9YJoDAnYGyaxykZ0jxJw3tCKn4FTlax6Fhxg/00pBHOinj+
 OPH+Sb7IJSkxQRKY2O8syLpwQ1pSWUtA6FBTxHJB/3O99p7s3qVElZLko2S1tG1tNlMrc5
 kOnxl4EikXvHuW1UzW6I7jNvaJfhQNS1azOjgwP7wjjnpZJgwA1GaQfxXqAQrz8hBC5S8f
 gv/3C2RsxB+/svZq7CchovsVWIQqqc2Ed8aZh7q6ZBHYcXs3GGsApsMrP0gHZA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=MvSP051T
Subject: [Buildroot] [PATCH] package/liblog4c-localtime: fix build with GCC
 15.x
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
 ...c_formatter.c-drop-usage-of-sd_debug.patch | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 package/liblog4c-localtime/0006-examples-userloc_formatter.c-drop-usage-of-sd_debug.patch

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
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
