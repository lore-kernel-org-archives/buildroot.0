Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3998FE728C9
	for <buildroot@archiver.kernel.org>; Fri, 29 Sep 2023 16:29:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B02C383C8D;
	Fri, 29 Sep 2023 16:29:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B02C383C8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 23thOt1yaPD4; Fri, 29 Sep 2023 16:29:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A863B83C8E;
	Fri, 29 Sep 2023 16:29:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A863B83C8E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A18701BF27E
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 16:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7AFD2400DD
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 16:29:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7AFD2400DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g0-IWnPAiF45 for <buildroot@lists.busybox.net>;
 Fri, 29 Sep 2023 16:29:15 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 094D540012
 for <buildroot@buildroot.org>; Fri, 29 Sep 2023 16:29:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 094D540012
Received: from fli4l.lan.fli4l (p4fd6c587.dip0.t-ipconnect.de [79.214.197.135])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 955B0A4C0A0F;
 Fri, 29 Sep 2023 18:29:11 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36884)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qmGMY-000194-2v;
 Fri, 29 Sep 2023 18:29:10 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 29 Sep 2023 18:29:10 +0200
Message-Id: <20230929162910.345877-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1696004951;
 bh=ga9c1TGilfiYTFE7K58zM+cO/XIDastZCzbChuR2534=;
 h=From:To:Cc:Subject:Date:From;
 b=i1dyq2Zumei7UHHl9GY9U1pecOPm3WTjhpZDL/r7uUV1O9t6vyb8htoffv3m4GGDA
 Ix7eQRmWJC32g3/r4OdUf6uqRl6QvSRtXwr6138DI1HJ97QBMR0E9WrHRZd3tqAyo8
 Ea93XtuOW2CQqLFiwxTb3We9bU3l1UWxq636KIIk0Uv2KVcvVBff68nlrarj40iU8Y
 9JcNfX8qPiLEg6IM5xBrrTt0qsE2NZBf8CQUBE3thjnpheLOkR4BXRMh9nEkvDCFRe
 OJxCBRI2yrZGBB6io0qRRumZHR/kpU966DATHAYRjF7v8RB2WbS/JMlnrPhzT2LDWg
 xJF0WHCjk4KIg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=i1dyq2Zu
Subject: [Buildroot] [PATCH 1/1] package/libvpx: Add upstream patch to fix
 CVE-2023-5217
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
Cc: Spenser Gilliland <spenser@gillilanding.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...02-VP8-disallow-thread-count-changes.patch | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 package/libvpx/0002-VP8-disallow-thread-count-changes.patch

diff --git a/package/libvpx/0002-VP8-disallow-thread-count-changes.patch b/package/libvpx/0002-VP8-disallow-thread-count-changes.patch
new file mode 100644
index 0000000000..d625255a9f
--- /dev/null
+++ b/package/libvpx/0002-VP8-disallow-thread-count-changes.patch
@@ -0,0 +1,38 @@
+From 3fbd1dca6a4d2dad332a2110d646e4ffef36d590 Mon Sep 17 00:00:00 2001
+From: James Zern <jzern@google.com>
+Date: Mon, 25 Sep 2023 18:55:59 -0700
+Subject: [PATCH] VP8: disallow thread count changes
+
+Currently allocations are done at encoder creation time. Going from
+threaded to non-threaded would cause a crash.
+
+Bug: chromium:1486441
+Change-Id: Ie301c2a70847dff2f0daae408fbef1e4d42e73d4
+
+Fixes CVE-2023-5217: https://www.cve.org/CVERecord?id=CVE-2023-5217
+
+Upstream: https://github.com/webmproject/libvpx/commit/3fbd1dca6a4d2dad332a2110d646e4ffef36d590
+Upstream: https://chromium.googlesource.com/webm/libvpx/+/3fbd1dca6a4d2dad332a2110d646e4ffef36d590
+
+[Bernd: Removed patch for test/encode_api_test.cc]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ vp8/encoder/onyx_if.c   | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/vp8/encoder/onyx_if.c b/vp8/encoder/onyx_if.c
+index c65afc643bf..c5e9970c3cc 100644
+--- a/vp8/encoder/onyx_if.c
++++ b/vp8/encoder/onyx_if.c
+@@ -1447,6 +1447,11 @@ void vp8_change_config(VP8_COMP *cpi, VP8_CONFIG *oxcf) {
+   last_h = cpi->oxcf.Height;
+   prev_number_of_layers = cpi->oxcf.number_of_layers;
+ 
++  if (cpi->initial_width) {
++    // TODO(https://crbug.com/1486441): Allow changing thread counts; the
++    // allocation is done once in vp8_create_compressor().
++    oxcf->multi_threaded = cpi->oxcf.multi_threaded;
++  }
+   cpi->oxcf = *oxcf;
+ 
+   switch (cpi->oxcf.Mode) {
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
