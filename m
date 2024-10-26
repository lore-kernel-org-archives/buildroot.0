Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23071D10C06
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 21:03:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D977340346;
	Sat, 26 Oct 2024 21:03:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9WPKtAaRj2nL; Sat, 26 Oct 2024 21:03:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A51B1402E6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A51B1402E6;
	Sat, 26 Oct 2024 21:03:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 71FB45C24
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 21:03:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F11C812A9
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 21:03:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DmSe8wJYdYeI for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 21:03:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D9E928128F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9E928128F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D9E928128F
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 21:03:06 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b313.dip0.t-ipconnect.de [84.161.179.19])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DD935A4C0CE0
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 23:03:04 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36010)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1t4nw8-0000000058k-0rdU
 for buildroot@buildroot.org; Sat, 26 Oct 2024 21:03:04 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 23:03:04 +0200
Message-Id: <20241026210304.2668409-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1729976584;
 bh=53HD+kUwS8y+x4geZaKzahlhKI6hUpjELjBioGXqFHQ=;
 h=From:To:Subject:Date:From;
 b=SElMbTdPWu34rh/yOmZe/uG+7XnYuTKPvgXKp+fq+1EKc1f1Opp6d/gvBTXrEsUCO
 WvjwcmVBfIv5/KzIC2peHPdI6ROxxqwZLz4XGddczw256Srh8VpwhQaP510lyAyFdm
 ZzEMramCfzNxcQ3LIk001ysHJC4JHQTPhE160RO6y3yrrc/zyoAO4fXjLXqhnIDolB
 NRzzqfBxOPLzW4C8PL6Pa05GZQplZR/n4X4RLQMwpoiKBawh6TodeXUk+HDX0ViAAO
 Bq9ydssqZNbYSc3K26TiH+6GiTQmMjdDk64FtC7e1awOEklNxxeKkPIrGf3kAD/m/s
 QRaVcpqJXc1yw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=SElMbTdP
Subject: [Buildroot] [PATCH 1/1] package/ghostscript: security bump version
 to 10.04.0
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

Release notes:
https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/tag/gs10040

Fixes CVE-2024-46951, CVE-2024-46952, CVE-2024-46953, CVE-2024-46954,
CVE-2024-46955 & CVE-2024-46956.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ghostscript/ghostscript.hash | 4 ++--
 package/ghostscript/ghostscript.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ghostscript/ghostscript.hash b/package/ghostscript/ghostscript.hash
index ed8e4cf7d9..c64ab80eb0 100644
--- a/package/ghostscript/ghostscript.hash
+++ b/package/ghostscript/ghostscript.hash
@@ -1,5 +1,5 @@
-# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10031/SHA512SUMS
-sha512  59e071cd23aed246b51317d3cccd9ccf8e1e84c4ecf9b22fb938e561eff42cec61915b0bdd96a313a3ea27750579c54ca0d0862b65edd306a621731c0063ffd3  ghostscript-10.03.1.tar.xz
+# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10040/SHA512SUMS
+sha512  2e711f8ba86491570684f13851190f41e6eee87dcfacce0a4adfd09a4523abf2e0b6727f0958ee2683834218f5705675b531fd2419cb7fc314ed4becf51f3ce3  ghostscript-10.04.0.tar.xz
 
 # Hash for license file:
 sha256  8ce064f423b7c24a011b6ebf9431b8bf9861a5255e47c84bfb23fc526d030a8b  LICENSE
diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
index 80e2543d1c..a29ab9b66e 100644
--- a/package/ghostscript/ghostscript.mk
+++ b/package/ghostscript/ghostscript.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GHOSTSCRIPT_VERSION = 10.03.1
+GHOSTSCRIPT_VERSION = 10.04.0
 GHOSTSCRIPT_SOURCE = ghostscript-$(GHOSTSCRIPT_VERSION).tar.xz
 GHOSTSCRIPT_SITE = https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs$(subst .,,$(GHOSTSCRIPT_VERSION))
 GHOSTSCRIPT_LICENSE = AGPL-3.0
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
