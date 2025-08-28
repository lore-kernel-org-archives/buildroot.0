Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08BF1C8303F
	for <buildroot@archiver.kernel.org>; Thu, 28 Aug 2025 09:50:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C11AE81DE0;
	Thu, 28 Aug 2025 09:50:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c0YLglUrwa-L; Thu, 28 Aug 2025 09:50:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D05C481C26
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D05C481C26;
	Thu, 28 Aug 2025 09:50:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A18317D
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 09:50:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F41C40D03
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 09:50:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IFF72grUzK4s for <buildroot@buildroot.org>;
 Thu, 28 Aug 2025 09:50:06 +0000 (UTC)
X-Greylist: delayed 423 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 28 Aug 2025 09:50:05 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2BFD740CDB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2BFD740CDB
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2BFD740CDB
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 09:50:05 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 4F75335207BF; Thu, 28 Aug 2025 11:44:30 +0200 (CEST)
Date: Thu, 28 Aug 2025 11:44:30 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <aLAk_sEZ6rBguBPx@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.1.0-38-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1756374270; bh=PuIg+TjydUwo17YEgSokIHHY5dY/f4b4mPGq1HObEK0=;
 h=Date:From:To:Subject:From;
 b=pOTafCns3Em+OwXAum1vGDwkB9wPUI5ci9txKd4RZy0qJVPJg96mEtDER+3DNTGqh
 6TbLNX6grjIzwIwXdqGyQYG96/4GcKdNNXl0jwE8j78V8l1o7oxFLpzIBzk3eu1OCR
 vQBXqyyDV+8T9TRKoRBlstgaCgLDMBoNewexr0gG6qly9JFmaTmTMjQFvXdmRDWuhC
 DRoSvhv0za+O4CJDgOd3LS90e+dQ/0KWB7fuKtoMVoQ7WneZrZ+5TVB6BA11cLjTjr
 XDGKjLyanv+VLomXpd4K0qTgKlRoTWkCLAtAvw3zedGZXYGhFfL26jX8X4DkIgYl3Q
 NQBUNoQMBcIRg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=pOTafCns
Subject: [Buildroot] [PATCH] package/uclibc: fix grub2 compilation
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
 https://autobuild.buildroot.org/results/7a4/7a4d0f0571cd0cef1c87f3ef207618de72c1c78c/build-end.log

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 ...emove-uClibc-specific-gettext_printf.patch | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/uclibc/0001-remove-uClibc-specific-gettext_printf.patch

diff --git a/package/uclibc/0001-remove-uClibc-specific-gettext_printf.patch b/package/uclibc/0001-remove-uClibc-specific-gettext_printf.patch
new file mode 100644
index 0000000000..96736da562
--- /dev/null
+++ b/package/uclibc/0001-remove-uClibc-specific-gettext_printf.patch
@@ -0,0 +1,34 @@
+From 9ffed9adb130d45b9f31ca7a305153e86586c877 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Fri, 15 Aug 2025 20:29:52 +0200
+Subject: [PATCH] remove uClibc specific gettext_printf
+
+Other C libraries like musl/glibc does not define it.
+Including stdio.h here breaks Grub2 compilation with
+gcc 14 and above.
+Thanks to Thomas Petazzoni for analyzing the Grub2 build error.
+
+Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=9ffed9adb130d45b9f31ca7a305153e86586c877
+---
+ include/libintl.h | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/include/libintl.h b/include/libintl.h
+index b7123a963..6d8b9f342 100644
+--- a/include/libintl.h
++++ b/include/libintl.h
+@@ -50,9 +50,6 @@ char *bindtextdomain(const char *domainname, const char *dirname);
+ 
+ #endif
+ 
+-#include <stdio.h>
+-#define gettext_printf(args...) printf(args)
+-
+ /* to supply LC_MESSAGES and other stuff GNU expects to be exported when
+    including libintl.h */
+ #include <locale.h>
+-- 
+2.47.2
+
-- 
2.47.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
