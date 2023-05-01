Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A85AC77B73
	for <buildroot@archiver.kernel.org>; Mon,  1 May 2023 12:32:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 39A5240A14;
	Mon,  1 May 2023 12:32:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39A5240A14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0-SDc9k1ZTk9; Mon,  1 May 2023 12:32:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A9CB340A52;
	Mon,  1 May 2023 12:32:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A9CB340A52
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8CBBC1BF422
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 12:32:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7364740A04
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 12:32:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7364740A04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ie202iA9sJ3j for <buildroot@lists.busybox.net>;
 Mon,  1 May 2023 12:32:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A6F4401B1
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2A6F4401B1
 for <buildroot@buildroot.org>; Mon,  1 May 2023 12:32:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A2DBE1814B9; Mon,  1 May 2023 14:32:37 +0200 (CEST)
To: buildroot@buildroot.org
Date: Mon,  1 May 2023 14:32:03 +0200
Message-Id: <20230501123211.18167-1-buildroot@heine.tech>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1682944360; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=uFAvBeNs7ZwYB9EvX9g1allU5zXBzu9rurBwGQ0fF54=;
 b=S2GbXU8zdzHDf9U9rniSykT8z6b0IkLVJthiGwhipngj5zPLTNRxaFCkkrGyefq1uXfuBg
 J4FQmvumxZ95M4swCS14XIbxI+gqyYCjz+tuqmCSiYCll791exxuEKPFiei+Dr8UqvF4rR
 IQ3N3cN4o9xPaeRIolcHo3CMOYoLRf8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=heine.tech header.i=@heine.tech
 header.a=rsa-sha256 header.s=dkim header.b=S2GbXU8z
Subject: [Buildroot] [PATCH] package/wpewebkit: fix NEON build with gcc-12
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

since gcc-12 gcc complains about attributes in between decl-specifiers.
This code is NEON specific so it should not appear on builds for other systems.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

---

@Adrian: should I submit this somewhere upstream? Or would it make more sense to
include this in the other NEON specific patch?
---
 .../0002-change-position-of-alignas.patch     | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/wpewebkit/0002-change-position-of-alignas.patch

diff --git a/package/wpewebkit/0002-change-position-of-alignas.patch b/package/wpewebkit/0002-change-position-of-alignas.patch
new file mode 100644
index 0000000000..5a1564c4c1
--- /dev/null
+++ b/package/wpewebkit/0002-change-position-of-alignas.patch
@@ -0,0 +1,33 @@
+From e2a3e36c8df59d83de0a48b806cad5bb5515a658 Mon Sep 17 00:00:00 2001
+From: Michael Nosthoff <michael.nosthoff@iba-group.com>
+Date: Tue, 18 Apr 2023 19:47:03 +0200
+Subject: [PATCH] change position of alignas
+
+fixes:
+Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp:38:8: error: standard attributes in middle of decl-specifiers
+   38 | static alignas(16) short s_FELightingConstantsForNeon[] = {
+      |        ^~~~~~~
+
+on gcc-12
+
+Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
+---
+ .../platform/graphics/cpu/arm/filters/FELightingNEON.cpp        | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp
+index 64950d1732e8..cafb4ee184ba 100644
+--- a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp
++++ b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.cpp
+@@ -35,7 +35,7 @@ namespace WebCore {
+ //   ALPHAX_Q ALPHAY_Q REMAPX_D REMAPY_D
+ 
+ 
+-static alignas(16) short s_FELightingConstantsForNeon[] = {
++static short alignas(16) s_FELightingConstantsForNeon[] = {
+     // Alpha coefficients.
+     -2, 1, 0, -1, 2, 1, 0, -1,
+     0, -1, -2, -1, 0, 1, 2, 1,
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
