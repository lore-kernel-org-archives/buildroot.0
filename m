Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94A9BC5B572
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 13:14:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D51F6067E;
	Sun, 16 Aug 2026 13:14:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sygJ77SFiimE; Sun, 16 Aug 2026 13:14:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 50BDF60625
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786886072;
	bh=1f/DtKUog1BKat+UjzR7ID5D4bWDI1+GvW3aA+iIV/8=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VoKbB2TrX9HMoXbDXpTSUOOl4e2kgnJQE4/2DWBU+pTL92ScL2x2abM5Q8DU1C+Kg
	 mmzAsWa292fItgQmM1SvgRnKlxbw4X5BgVfz7XJqEmVZntApSH7WURjkcbMHi90sMh
	 SgufMehc5Osi22eHWzYLwwj3YKDKUrMEGZt0RiEXeqkiYmSt/aMmwcUHBrxXi7BLQD
	 h42yvLChGw7eZW3IwhkyJ/N5QMMIYoxk9vYiSPixUfA8ImRoFtgr5lZfqm0bUXVgCa
	 LzFy6yTqkqcJ7yCHn/bcLRwdK5TK5+DlRn1A69KeYKTamm1qxwk5gxAKAK7K0mn0U1
	 c4Wq1AF3oBXYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50BDF60625;
	Sun, 16 Aug 2026 13:14:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C171147
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 13:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 12FD680C45
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 13:14:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xGhmuNFpFQzh for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 13:14:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4826280C42
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=openadk.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4826280C42
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4826280C42
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 13:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
 t=1786886068; bh=GaH8NPN3JMzbrRNJ69kNnXzhTyY8MWcviD+15SK9GH0=;
 h=Date:From:To:Cc:Subject:From;
 b=oJPR/+C97NAC2AS7N+Ri7k8OtfQjdfkxWmzfHZU2r3fD40w1TUPhuFcTbSWkhm+/v
 Ny1URs9uOFjo2B/rRfFKmITRxMaICGhbQwGvrHa31MRfRb2Lb6zQMO2fwsEBSOtnIE
 KBerE+pbMcMuAnYta0YUaYyUo3RnQs6Bjr+QCho+X9tfyFNYyOerB0WZ3iEuudrF8G
 UCiy7AJIlMx7Zj5jBwAXR3YpJXl1kbaPmQEEAsgVXISDdwbpcd5dmNVzk+/zRpyJgK
 X333CIyRR/3y1B3uGwwPfv3rQvo7rwW91oQasMR1rhUlpDLtsyptqax5PYZrVBOWNe
 NX3pf5H6UJRYQ==
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 64E8131E0084; Sun, 16 Aug 2026 15:14:28 +0200 (CEST)
Date: Sun, 16 Aug 2026 15:14:28 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>
Message-ID: <aoG3tN3r2SnRX0el@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.96+deb13-amd64 x86_64
Subject: [Buildroot] [PATCH] package/runc: enable uClibc support
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

fexecve was added to uClibc in 2019 in commit
858ffad217076227089cc17eb832db0bd1497792.

Runtime tested on a Raspberry PI4 (64 Bit).
System compiled with Bootlin Toolchain.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/runc/Config.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/runc/Config.in b/package/runc/Config.in
index 73eac72527..e4027fddaa 100644
--- a/package/runc/Config.in
+++ b/package/runc/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_RUNC
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no fexecve
 	select BR2_PACKAGE_HOST_GO
 	help
 	  runC is a CLI tool for spawning and running containers
@@ -14,4 +13,4 @@ config BR2_PACKAGE_RUNC
 comment "runc needs a glibc or musl toolchain w/ threads"
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS && \
 		BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_UCLIBC
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
