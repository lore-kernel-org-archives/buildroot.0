Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E90CCC77B75
	for <buildroot@archiver.kernel.org>; Tue, 16 May 2023 18:36:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 446F1408F0;
	Tue, 16 May 2023 18:36:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 446F1408F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TZAWSr2v44E6; Tue, 16 May 2023 18:36:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7877840B80;
	Tue, 16 May 2023 18:36:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7877840B80
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 563E91BF295
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 18:36:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F95140108
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 18:36:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F95140108
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6TBByS2-E7Kq for <buildroot@lists.busybox.net>;
 Tue, 16 May 2023 18:36:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E910B400E5
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E910B400E5
 for <buildroot@buildroot.org>; Tue, 16 May 2023 18:36:33 +0000 (UTC)
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
 by mailout06.t-online.de (Postfix) with SMTP id 5B28F1813E
 for <buildroot@buildroot.org>; Tue, 16 May 2023 20:36:30 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.6.127]) by fwd86.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1pyzXB-1Uvynx0; Tue, 16 May 2023 20:36:29 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:46244)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pyzXB-0001OB-0P
 for buildroot@buildroot.org; Tue, 16 May 2023 20:36:29 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Tue, 16 May 2023 20:36:28 +0200
Message-Id: <20230516183628.1000689-2-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230516183628.1000689-1-bernd.kuhls@t-online.de>
References: <20230516183628.1000689-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1684262189-0E7FCC77-44291C95/0/0 CLEAN NORMAL
X-TOI-MSGID: 912e2c95-d520-4291-b694-9f65b2575055
Subject: [Buildroot] [PATCH 2/2] package/vdr: fix musl build
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
http://autobuild.buildroot.net/results/bdacedd845a2bf4db9826f0d3868f6b48d456d2a/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/vdr/0005-Fix-musl-build.patch | 37 +++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/vdr/0005-Fix-musl-build.patch

diff --git a/package/vdr/0005-Fix-musl-build.patch b/package/vdr/0005-Fix-musl-build.patch
new file mode 100644
index 0000000000..390e78eab5
--- /dev/null
+++ b/package/vdr/0005-Fix-musl-build.patch
@@ -0,0 +1,37 @@
+From 075472ec580e03cc89971f0c118cb363776a304d Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Tue, 16 May 2023 20:22:12 +0200
+Subject: [PATCH] Fix musl build
+
+malloc_trim is a GNU extension and therefore not present in non-glibc C
+libraries such as musl. Wrapping this in an ifdef fixes musl builds.
+
+Upstream: https://www.linuxtv.org/pipermail/vdr/2023-May/029742.html
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ vdr.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/vdr.c b/vdr.c
+index 0f426e61..bc4902de 100644
+--- a/vdr.c
++++ b/vdr.c
+@@ -1588,12 +1588,14 @@ int main(int argc, char *argv[])
+               cSchedules::Cleanup();
+               // Plugins housekeeping:
+               PluginManager.Housekeeping();
++#if defined(__GLIBC__)
+               // Memory cleanup:
+               static time_t LastMemoryCleanup = 0;
+               if ((Now - LastMemoryCleanup) > MEMCLEANUPDELTA) {
+                  malloc_trim(0);
+                  LastMemoryCleanup = Now;
+                  }
++#endif
+               }
+            }
+ 
+-- 
+2.39.2
+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
