Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B5B5C369C5
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 20:24:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4397941E69;
	Wed, 16 Apr 2025 20:24:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H5WvGgN3YcgR; Wed, 16 Apr 2025 20:24:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D2AF413AC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D2AF413AC;
	Wed, 16 Apr 2025 20:24:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 94296159
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 20:24:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 852BA40AED
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 20:24:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OLZsDyUUwD8t for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 20:24:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.149;
 helo=smtpdh19-2.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 96EBE40590
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96EBE40590
Received: from smtpdh19-2.aruba.it (smtpdh19-2.aruba.it [62.149.155.149])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 96EBE40590
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 20:24:11 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id 59ImulXLpvoVF59InupE3r; Wed, 16 Apr 2025 22:24:09 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed, 16 Apr 2025 22:24:08 +0200
Message-Id: <20250416202408.3278761-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfFl8oumR7TtGwlIWpreCwbg6qKcpgdyCEPYNTrVaVmruYHAmZTO0S2vZ9ZY2zH2BEu4fSjmWbCxiaaTbkoUjZhHPv/UQJV7BSf6+NWpkPZU2DDGBszoA
 r9LA2yicn3UPpHOvCwkDBE/VKWFDi7w4lEGH1TeEEm85G36gtVz10F3gQSKPHCnqBGY5PvKKj2lhXBeuABAtJ7+PuIzeJZ1chteldYATo+pSV9zF2VQ4t3US
 YGgBAqHZ9NyrxFXLU3KwffCH/SWbl+u0Wggy1Q/rYAc=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1744835049; bh=swSP4tRt/d+BABa9NfSmd+4FK9SGcDDOk2lqhPA8V4Q=;
 h=From:To:Subject:Date:MIME-Version;
 b=lBpvFVVqqRNfKE9r+ftZ14vXf7gUjCCO/WmRyWVgb07Xl2YuBaSvDlrNJrP7j+g4z
 GXwH+XV1cb5v0Ty/gcaBRd8OgafnXAAsXMNGMw3+eknPNG3hZPmEkrvT3i4b+VV3Tb
 xjzQQaz/83HQNQIjXrSwJxze+46P1kwJnnAPokFFy/LpYPK/enVN9RaPPC8RTL1O7T
 jycdBOA1/jp7SzPfF1npbY+fXYDZO7khCwEcOio+nfLRA98/RWI+dxb/gR5YQ1+2B/
 VVG5y8mtbpWiSbpMPheJdbYE1sK4Vxn47VObQ1dfjIBdj2t6//qj2GW/PSv65wnkKD
 jXtyrsfDBm/3w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=lBpvFVVq
Subject: [Buildroot] [PATCH] package/libfuse3: requires THREAD_NPTL
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

With commit:
https://github.com/libfuse/libfuse/commit/43ec53d6a16363184a95e59627c3f54d5568d8d1
pthread_setname_np() has been used and it's part of NPTL, so let's add
a dependency on BR2_TOOLCHAIN_HAS_THREADS_NPTL.

Fixes:
https://autobuild.buildroot.org/results/71299a3db2660084ba362ff7c1b875bd0f71324a

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libfuse3/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libfuse3/Config.in b/package/libfuse3/Config.in
index 584d3bf132..73ffc3497c 100644
--- a/package/libfuse3/Config.in
+++ b/package/libfuse3/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_LIBFUSE3
 	bool "libfuse3"
 	depends on !BR2_STATIC_LIBS
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # pthread_setname_np()
 	depends on BR2_USE_MMU # fork()
 	help
 	  The reference implementation of the Linux FUSE
@@ -9,6 +9,6 @@ config BR2_PACKAGE_LIBFUSE3
 
 	  https://github.com/libfuse/libfuse
 
-comment "libfuse3 needs a toolchain w/ threads, dynamic library"
+comment "libfuse3 needs a toolchain w/ NPTL, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
