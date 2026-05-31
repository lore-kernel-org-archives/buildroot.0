Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54687CD6E57
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 17:14:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25BF384CAC;
	Sun, 31 May 2026 17:14:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ojsmaoOZ_b2d; Sun, 31 May 2026 17:14:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4737B84CAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780247694;
	bh=xXJkn9NQIAeJyFklRvnozHyN7rZ680kJ7LzbtqPsvJI=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=I/o4dzg903NqAV4KgDkUtcGFAsjmeE7p8146/F532wCXdNZbsYXlnnHqoWZb1jfau
	 VEZLPkfeyr5jmFYyW3Knl7tRjZrnvP60y26sYLF37TiTu6BzERMgaHgXmjQh4mLVEA
	 yoiq2mUdeR2U5RVxLCfgBuQ+h/7CrnyVx2rxx9oBUmEpLMn+2EaorvbMRQc1o2fXg3
	 DCStwV7sk9zCr2FppnkpRZCMQer+1gJliwHoMVrUawwZDG5HFINlpEO6m1NzcTOhhy
	 8OIkLUC6241x+txoWs9HvIZu++H4aA6AhGGp8zsjtLCahCM2Ptlr9AsabDlp9qR5bw
	 N+5pLvFDfgb+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4737B84CAD;
	Sun, 31 May 2026 17:14:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 345202AA
 for <buildroot@buildroot.org>; Sun, 31 May 2026 17:14:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E59C405E3
 for <buildroot@buildroot.org>; Sun, 31 May 2026 17:14:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lb9BBa9MR7or for <buildroot@buildroot.org>;
 Sun, 31 May 2026 17:14:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 17A2E40183
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17A2E40183
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 17A2E40183
 for <buildroot@buildroot.org>; Sun, 31 May 2026 17:14:50 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0bc7.dip0.t-ipconnect.de [91.58.11.199])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C9AD3A4C05B8;
 Sun, 31 May 2026 19:14:47 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36488)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wTjkN-000000002aF-3b6Z;
 Sun, 31 May 2026 17:14:47 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 May 2026 19:14:47 +0200
Message-ID: <20260531171447.1675303-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1780247687;
 bh=/yJeOYUhlMgZd2yQsXxg9I74j690+xRIrisMiIlRkOA=;
 h=From:To:Cc:Subject:Date:From;
 b=rDrfob/DYKURl0ANbcEXPn6kmrhxeBXRtAAZpB9CStniLMS9asEzCSRlF1n8xwWcG
 Fs0y8/DzJn/DfGWHee5kZosXOm61l9YYF8fby1fwEJnKAPlOAQRmlCG649F4zT07+6
 VP31NknW1KxsTB4Af8Ohd4VLe4skmrsGEpzntBpy2PAT989bPcs57cl8tiT0+FPNcS
 MdzM0nZS3mNnEWWeIgPX9MWhxjJqh+NSUwNkq4IZP8L+uMZxPWcxo6+Wscsq/L0NJg
 4DvSR882HkVT28s0HZozgAHvexFdMGguKqLoU1T2F3RbSBgExb77iFB0igpniuKmwr
 d7uKfCHCafFLQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=rDrfob/D
Subject: [Buildroot] [PATCH 1/1] package/weston: needs C++
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

Buildroot commit 2e6b2b82d5301977cf2f59adfd633d8774830f69 bumped the
package to version 15.0.0 but forgot to add a dependency to C++ which is
needed due to upstream commit
https://gitlab.freedesktop.org/wayland/weston/-/commit/bdfe7a3e588c26a5b3eca0636a2353de2af24ff6
which was first included in this release.

Fixes:
https://autobuild.buildroot.net/results/297/2971e8cd37224f08e5a9932cb62d2fdde0c397d1/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipeline passed:
https://gitlab.com/bkuhls/buildroot/-/pipelines/2565545084

 package/weston/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/weston/Config.in b/package/weston/Config.in
index 6f61c3c561..abd996482a 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -1,10 +1,11 @@
-comment "weston needs udev and a toolchain w/ locale, threads, dynamic library, headers >= 3.0"
+comment "weston needs udev and a toolchain w/ C++, locale, threads, dynamic library, headers >= 3.0"
 	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 || BR2_STATIC_LIBS || \
-		!BR2_ENABLE_LOCALE
+		!BR2_ENABLE_LOCALE || !BR2_INSTALL_LIBSTDCPP
 
 config BR2_PACKAGE_WESTON
 	bool "weston"
+	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_HAS_UDEV
 	depends on !BR2_STATIC_LIBS # wayland
 	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
