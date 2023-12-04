Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D00C4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 21:16:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E0018417C2;
	Mon,  4 Dec 2023 21:16:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0018417C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eKgrT29Sy5Ml; Mon,  4 Dec 2023 21:16:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C73EE419B6;
	Mon,  4 Dec 2023 21:16:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C73EE419B6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9423F1BF30E
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 21:16:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7AFBD82197
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 21:16:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AFBD82197
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P1vqhmKzlaqP for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 21:16:37 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8ABC4818EC
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 21:16:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8ABC4818EC
Received: from fli4l.lan.fli4l (p4fd6c4a5.dip0.t-ipconnect.de [79.214.196.165])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3FB91A4C0EB0;
 Mon,  4 Dec 2023 22:16:23 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58136)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1rAGIg-00077J-37;
 Mon, 04 Dec 2023 22:16:23 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  4 Dec 2023 22:16:21 +0100
Message-Id: <20231204211622.12687-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231204211622.12687-1-bernd@kuhls.net>
References: <20231204211622.12687-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1701724583;
 bh=V+Det2W0TyQ/GnVUOcR3CAIRsEi045p6h0VWEYpJ4m4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IVUel2F9ZAnI32tfsoaJpNINlX1m3haeCFvwpzPZPePpe9nqiDNcbC/wO2Dx1mMGS
 0MJG5nEs0ehV1VYL22BJDP+dlmZpbQ0aPpnS2pA41tTPjLNfKBflMmF39rDJsEE4ca
 OUcwZ1yy3Geuoss2ABp8CIK+6/L2g0/trMVpF3hv9hvSjgrN+52M3iGzIprObq5AzD
 3sY7eBnYIoGhNz42kga6aYxaohdzjjz7JciosZNdEagDvpNIJmlvtRpx0ag3cPnNuv
 m7SNBdxMVVTDjPxgBlvjnPbzFPR6H27sz0oYh45CGGq0q7W54mHhHgkBBoQpHHpFCf
 AUglvlxYpGQDQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=IVUel2F9
Subject: [Buildroot] [PATCH 2/3] package/xmlstarlet: Fix build with
 libxml2-2.12
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../0001-Fix-build-with-libxml2-2.12.patch    | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/xmlstarlet/0001-Fix-build-with-libxml2-2.12.patch

diff --git a/package/xmlstarlet/0001-Fix-build-with-libxml2-2.12.patch b/package/xmlstarlet/0001-Fix-build-with-libxml2-2.12.patch
new file mode 100644
index 0000000000..9f32020d7d
--- /dev/null
+++ b/package/xmlstarlet/0001-Fix-build-with-libxml2-2.12.patch
@@ -0,0 +1,33 @@
+From 59395730bc66d97c154f727543e501d6f3c061af Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sat, 25 Nov 2023 14:03:45 +0100
+Subject: [PATCH] Fix build with libxml2-2.12
+
+Upstream reorganized header includes:
+https://github.com/GNOME/libxml2/blob/master/NEWS
+
+"Several cyclic dependencies in public header files were fixed. As a
+ result, certain headers won't include other headers as before."
+
+Upstream: https://sourceforge.net/p/xmlstar/patches/22/
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/xmlstar.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/xmlstar.h b/src/xmlstar.h
+index 3e1eed3..1a12da1 100644
+--- a/src/xmlstar.h
++++ b/src/xmlstar.h
+@@ -15,6 +15,7 @@
+ #include <libxml/xpath.h>
+ #include <libxml/xpathInternals.h>
+ #include <libxml/xmlreader.h>
++#include <libxml/xmlsave.h>
+ 
+ typedef enum { /* EXIT_SUCCESS = 0, EXIT_FAILURE = 1, */
+     EXIT_BAD_ARGS = EXIT_FAILURE+1, EXIT_BAD_FILE,
+-- 
+2.39.2
+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
