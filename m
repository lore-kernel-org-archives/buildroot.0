Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E49CA0EE4
	for <buildroot@archiver.kernel.org>; Mon, 18 Aug 2025 06:50:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAA338439C;
	Mon, 18 Aug 2025 06:50:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vHVKPP0TnOco; Mon, 18 Aug 2025 06:50:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4EBB843A5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4EBB843A5;
	Mon, 18 Aug 2025 06:50:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BD5BE75
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 06:50:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF38440DA4
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 06:50:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fL-pUvIuA2cl for <buildroot@buildroot.org>;
 Mon, 18 Aug 2025 06:50:37 +0000 (UTC)
X-Greylist: delayed 445 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 18 Aug 2025 06:50:36 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 77B6740E5C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77B6740E5C
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.243.197.30;
 helo=mail.hostpark.net; envelope-from=christian@klarinett.li;
 receiver=<UNKNOWN> 
Received: from mail.hostpark.net (mail.hostpark.net [212.243.197.30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 77B6740E5C
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 06:50:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.hostpark.net (Postfix) with ESMTP id 2B8D716459;
 Mon, 18 Aug 2025 08:43:08 +0200 (CEST)
X-Virus-Scanned: by Hostpark/NetZone Mailprotection at hostpark.net
Received: from mail.hostpark.net ([127.0.0.1])
 by localhost (mail0.hostpark.net [127.0.0.1]) (amavis, port 10224) with ESMTP
 id B48vgIqZ1OTm; Mon, 18 Aug 2025 08:43:07 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.hostpark.net (Postfix) with ESMTPSA id 3F400162C2;
 Mon, 18 Aug 2025 08:43:07 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Christian Hitz <christian.hitz@bbv.ch>,
 Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>
Date: Mon, 18 Aug 2025 08:42:35 +0200
Message-ID: <20250818064235.258181-1-christian@klarinett.li>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=klarinett.li; h=
 content-transfer-encoding:mime-version:x-mailer:message-id:date
 :date:subject:subject:from:from; s=sel2011a; t=1755499387; bh=s6
 rWAgECjwPvFkfujVDWps+XxYkNGZRl8oCNMdOU0bY=; b=jnKfjuwZ0ATxP+nn3h
 WJDSCNLucTDLdl2knUg006hsbQ0tyJUnA7oa+kKzVj5rQ6zLJ7lAJNFhefJyGMl1
 tHjb+gIOUI6rtTFs/g1rk4WsMrflk7VgwsnQsTi02V8tt8Fnw7fGaq7aVUtgnC8O
 oNmK6X3EDESMy+kwNtgYGQ5P8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=klarinett.li
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=klarinett.li header.i=@klarinett.li header.a=rsa-sha256
 header.s=sel2011a header.b=jnKfjuwZ
Subject: [Buildroot] [PATCH 2020.02.x] package/systemd: bump required
 toolchain headers for systemd-networkd
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
From: Christian Hitz via buildroot <buildroot@buildroot.org>
Reply-To: Christian Hitz <christian@klarinett.li>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Christian Hitz <christian.hitz@bbv.ch>

Since 256.12 systemd-networkd requires kernel >=5.4 due to the inclusion of
the sockios.h header, which uses the SIOCGSTAMP_OLD macro.

The same change has already been applied to master/2025.08 in
7d8d48cd2ba1396ea146e94020939f4dfe08c5cb

Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
---
 package/systemd/Config.in | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 851b91aeba..320d416203 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -52,9 +52,11 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	  an elaborate transactional dependency-based service control
 	  logic.  It can work as a drop-in replacement for sysvinit.
 
-	  Kernel versions below 4.15 ("recommended baseline") have
+	  Kernel versions below 5.4 ("recommended baseline") have
 	  significant gaps in functionality and are not recommended
-	  for use with this version of systemd.
+	  for use with this version of systemd. (e.g. lack race-free
+	  process tracking by pidfd, systemd-networkd, and new mount
+	  API support).
 
 	  Systemd requires a Linux kernel >= 3.15 with the following
 	  options enabled:
@@ -354,7 +356,8 @@ config BR2_PACKAGE_SYSTEMD_MYHOSTNAME
 
 config BR2_PACKAGE_SYSTEMD_NETWORKD
 	bool "enable network manager"
-	default y
+	default y if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
 	help
 	  systemd-networkd is a system service that manages networks.
 	  It detects and configures network devices as they appear, as
@@ -365,6 +368,9 @@ config BR2_PACKAGE_SYSTEMD_NETWORKD
 
 	  https://www.freedesktop.org/software/systemd/man/systemd-networkd.html
 
+comment "systemd-networkd needs a toolchain with kernel headers >= 5.4"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
+
 config BR2_PACKAGE_SYSTEMD_OOMD
 	bool "enable out-of-memory killer"
 	help
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
