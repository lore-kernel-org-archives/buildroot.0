Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40088FF8873
	for <buildroot@archiver.kernel.org>; Thu, 30 Apr 2026 14:51:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC9F384CF7;
	Thu, 30 Apr 2026 14:51:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6v0LMKknPYeR; Thu, 30 Apr 2026 14:51:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1006A848C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777560699;
	bh=UK+gIJL0Sec1EL+0edsygSs/47h4O7xDlFfQab8hSTE=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rVSpOkoozi5HwvMOl0x1CZpDrv12COndNUahsP15tCeRLpEpPg5sE7gjngHVypIln
	 GZd6k+6UwKBstqsNM0X3YMrN47KOOV4pbmZBkvaMMmk9Optc4U3RNpvS5HLlBINfCk
	 ttKuDptAkB27qCh9gNN8IzwQatPqOBNzrWaLM7tefiFQZ1nJU7oGwKLA4zCNksK24D
	 hOyi96kCr+LKLHyAp2cmavqCuqrcP88DD+F5Ii7nktrDnY9QZ2Hu1EMmjxZVgC+sa4
	 oVhkRBlF41Ar1JaUPZem9VFstnZBuxiVxDxsrpTmWD2MGrzTRbkOH/Q2h/gissfatM
	 zEDu+2krAqGFw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1006A848C9;
	Thu, 30 Apr 2026 14:51:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D135192
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 14:51:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 82A6C848C9
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 14:51:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pkbMmmPgh5V8 for <buildroot@buildroot.org>;
 Thu, 30 Apr 2026 14:51:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.116;
 helo=smtpcmd03116.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5AD4484556
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5AD4484556
Received: from smtpcmd03116.aruba.it (smtpcmd03116.aruba.it [62.149.158.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5AD4484556
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 14:51:33 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id ISjjwuJKl5gYjISjjwdMPV; Thu, 30 Apr 2026 16:51:31 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Thu, 30 Apr 2026 16:51:30 +0200
Message-ID: <20260430145130.1803104-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfO4geY+d29QOwW5KWxBi8x3tj6RgDm9+W0z6qNnKRRskAUDm6KuRbhNfb9EyESvcBSzDPc5Jp6SsPMmh26L4d0+yHWRyvak4a4YPSqYSbRAoLyqsbKRy
 hd5uXK/VvocWP8fUjXmM6LNvgoi3kO3+Jr8idnbChzC7yGYd4rA6VB4E30KE4j15snXA10KXjeeuwv1ZE38/u8bY6kabcRLPv1DPg54convc/KqpqjuIXfYi
 4PXttqESnCilU53nSBVRzwsTZFIMI/wNSsMB25iETqs=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1777560691; bh=hLxINQkJBp3PtGMKxMAYsDQKBTwtTXlHKMfcDRpe3oY=;
 h=From:To:Subject:Date:MIME-Version;
 b=hprI6cgZxdVk3f4xlCw8JbxukPYUNAyeeu1bQwtfGosZc5+G7mr4/lrx/l72Bhal+
 R1PCGnU50EEJrv+mjNh5gx3es2jSdDFmpkH7nYA7pZ4zYfZ/wEFVpuyEuY7zi7FGWE
 Bj544laOc7kARj+eAYBx5FUC+rmL5+rKJkpiXtweq8WlrZsBig2W1/bfe8AWPlles4
 ykqD/SxnKjdE1ha1DLxaoRbRB183OoWUqH82wn8eNZwwPGI48c1s9aWnxJhEfhkBSY
 lNa7KRSEw56LZrvPngj2ZO6KasOyBa5fyJVZm6oBk8ayfe9SBScEMhUgLM0z/SAorS
 P0/zngWwlMhzA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=hprI6cgZ
Subject: [Buildroot] [PATCH] package/wireshark: security bump to v4.4.15
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

For more information on the version bump, see:
  - https://www.wireshark.org/docs/relnotes/wireshark-4.4.15.html

Fixes the following vulnerabilities:
CVE-2026-5409, CVE-2026-5408, CVE-2026-5406, CVE-2026-5407, CVE-2026-5299,
CVE-2026-5401, CVE-2026-5404, CVE-2026-5403, CVE-2026-5405, CVE-2026-5654,
CVE-2026-5657, CVE-2026-5656, CVE-2026-5653, CVE-2026-6538, CVE-2026-6537,
CVE-2026-6535, CVE-2026-6534, CVE-2026-6533, CVE-2026-6532, CVE-2026-6531,
CVE-2026-6530, CVE-2026-6529, CVE-2026-6527, CVE-2026-6524, CVE-2026-6523,
CVE-2026-6521, CVE-2026-6520, CVE-2026-6519, CVE-2026-6522, CVE-2026-6870,
CVE-2026-6869, CVE-2026-6868.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 7572ea8b52..037f2f509a 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.4.14.txt
-sha1  41536d8ba1fc977d0832b509af6ea65056c6fe1d  wireshark-4.4.14.tar.xz
-sha256  c9113130bd2b37919fdcf575f710469ce391960baaff31911e3288469e6a8e8d  wireshark-4.4.14.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.4.15.txt
+sha1  dd591df261c7866e7eaac3f015c904ab21d9d51d  wireshark-4.4.15.tar.xz
+sha256  05e884da8d91929bd1fb6a91c26836d69145ecd439b97c2d82698388de221570  wireshark-4.4.15.tar.xz
 
 # Locally calculated
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index d58fa7a6c5..1ded080906 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 4.4.14
+WIRESHARK_VERSION = 4.4.15
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
