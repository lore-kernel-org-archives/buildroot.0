Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60C91C5DF9C
	for <buildroot@archiver.kernel.org>; Mon, 24 Aug 2026 19:34:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE629405F4;
	Mon, 24 Aug 2026 19:34:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2d70KWSXoMUX; Mon, 24 Aug 2026 19:34:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787600075;
	bh=/0uyZv7UUN8SHFocGDplf+2uF/5lcqbgIoO5if7lOBc=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lXP+jssKyw2BtJNdpV8qbmd9P7+mUlts66lId7dnRDu8JpA3ayka/WjSC1lIqyYzv
	 y0OMg9yc4/QlcIw4japyMP+t2y3uioi9+vgSgOqiJW0aHsVNlUeVo0R7AS0NQqas0Z
	 2HJXD8AI5B2qzcB+osZ0Q7rsberPzZ0QMrtVOwtp0ZosBaOW+ZCszifUcdDZQAth2R
	 lEimtXYmxwuH6ojhLDMZOhgtwn84qdCHy6DNRYXb3qWbBQtqlryt3Kv8MVd1v1vZgJ
	 IGqROMOW/APJlG3woXdpeIJof5RxNenwG4e+IoXLZBl4xtJeGeoFF0ATsRwPwwQKr2
	 ooHZQqSHWvZYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BCA24059A;
	Mon, 24 Aug 2026 19:34:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3ADD22FD
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 19:34:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 183F1400A2
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 19:34:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BkZs5vP6MLJp for <buildroot@buildroot.org>;
 Mon, 24 Aug 2026 19:34:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=openadk.org
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 08B1140083
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 19:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
 t=1787600069; bh=rDrbaFCvxSPA9eUqLkgwy2R2SAcDhiIn4baWl8ezM48=;
 h=Date:From:To:Subject:From;
 b=qQRw9S5jst6QhNXeChfWCUWPQgY+N0xPYcLVzC6ZpsVJDbsIyo32s8g8+z4/RjzyQ
 TkyKHnzG9ZMXUzpj6RiWexfU7cdjNBLFMKjxKXIc7MpSdCTyY95Ph9wU14zm72GLNI
 ItY/ZIoaGd7BOFQMiPdt0kBOBphv59mVgefjFFvhMynnH6FMX+d6KDxnlLK5KqLLkF
 kVfbKAwlIVzxoc3MMvVNE5abwRpXyOwMlviCw3N45FTq5DBUfxZIhkjreI43OlmtOm
 23M91+CIWieBS0+2l1KkzF3NylPjs7J2V7azeXN8BIlgixxrMfczV7JP/XZhmJ2pCV
 maR5e+Cn9w8aA==
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 56AC631E0D44; Mon, 24 Aug 2026 21:34:29 +0200 (CEST)
Date: Mon, 24 Aug 2026 21:34:28 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <aoycxGKgl6IjLCPv@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.96+deb13-amd64 x86_64
Subject: [Buildroot] [PATCH] arch/Config.in.arc: clarify float configuration
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

Select soft-float configurations where appropriate,
checked with all selectable CPU's and uClibc-ng toolchains.

uClibc-ng enabled FENV support for hard-float toolchains
unconditionally in commit 4c5039b80ebbe42db35af189afcff7fb7d5cace6.

Glibc has a preconfigure script to check if the toolchain is a
soft-float toolchain.

Fixes:
 - https://autobuild.buildroot.org/results/d0e735bcd9de979ab74df0c2f5229f7534d1539a

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 arch/Config.in.arc | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/Config.in.arc b/arch/Config.in.arc
index f250ae5eeb..8fac281045 100644
--- a/arch/Config.in.arc
+++ b/arch/Config.in.arc
@@ -7,12 +7,15 @@ choice
 
 config BR2_arc750d
 	bool "ARC 750D"
+	select BR2_SOFT_FLOAT
 
 config BR2_arc770d
 	bool "ARC 770D"
+	select BR2_SOFT_FLOAT
 
 config BR2_archs38
 	bool "ARC HS38"
+	select BR2_SOFT_FLOAT
 	help
 	  Generic ARC HS capable of running Linux, i.e. with MMU,
 	  caches and 32-bit multiplier. Also it corresponds to the
@@ -20,6 +23,7 @@ config BR2_archs38
 
 config BR2_archs38_64mpy
 	bool "ARC HS38 with 64-bit mpy"
+	select BR2_SOFT_FLOAT
 	help
 	  Fully featured ARC HS capable of running Linux, i.e. with
 	  MMU, caches and 64-bit multiplier.
@@ -39,15 +43,17 @@ config BR2_archs38_full
 
 config BR2_archs4x_rel31
 	bool "ARC HS48 rel 31"
+	select BR2_SOFT_FLOAT
 	help
 	  Build for HS48 release 3.1
 
 config BR2_archs4x
 	bool "ARC HS48"
+	select BR2_SOFT_FLOAT
 	help
 	  Latest release of HS48 processor
 	   - Dual and Quad multiply and MAC operations
-	   - Double-precision FPU
+	   - Double-precision FPU (optional)
 
 endchoice
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
