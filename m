Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A724C52D7D
	for <buildroot@archiver.kernel.org>; Sat, 17 Aug 2024 11:13:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EECEF6063E;
	Sat, 17 Aug 2024 11:13:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gHEsRR_v5Dd0; Sat, 17 Aug 2024 11:13:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DC72605E8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DC72605E8;
	Sat, 17 Aug 2024 11:13:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 76D711BF578
 for <buildroot@lists.busybox.net>; Sat, 17 Aug 2024 11:13:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 64E3E605E8
 for <buildroot@lists.busybox.net>; Sat, 17 Aug 2024 11:13:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r5DPlbMAW6pg for <buildroot@lists.busybox.net>;
 Sat, 17 Aug 2024 11:13:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 049EA60586
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 049EA60586
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 049EA60586
 for <buildroot@buildroot.org>; Sat, 17 Aug 2024 11:13:30 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 9A377353610E; Sat, 17 Aug 2024 13:13:27 +0200 (CEST)
Date: Sat, 17 Aug 2024 13:13:27 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZsCF118LHasdCmy7@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1723893207; bh=IOXhdnN+f90h1/KcjMSbhPaF2Zv5iLt+bmG4nWzqE/U=;
 h=Date:From:To:Subject:From;
 b=T2le3WdykH0XbOHpezyb1RYar7034/xFlZy63/S8thQyPd9M3HFdcm9amTUF5gMJ1
 aP/jn/d0bavNtD8evBoSD+7EWzPcbUFx3xUDsi45Vradb4Y3+Kc2D6QNcYwZMLIGIO
 ot92cN0NpjJu2wvWXEFjrzaRpsQ3GrIKcH57OlVMPvD9QSf1JnoPwtMe5PBLmm4MVa
 dXCXMuvMSzjY5yUQBquK376psqrC5/C3coDKkDInlruX5cJDDydIrCOQk2FsZonJmD
 y9L7/6a0qvbH/KzCDxxlVU3X08tbds+9IT+m8jMxQvy3QmO1CKnQ4qdNTZwotFQaaR
 lIh8qon6SJecg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=T2le3Wdy
Subject: [Buildroot] [PATCH] package/mdadm: quote TARGET_LDFLAGS
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
 - http://autobuild.buildroot.net/results/4a6/4a692e5aa5ac5cb409282a69f664c35611101b32

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/mdadm/mdadm.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mdadm/mdadm.mk b/package/mdadm/mdadm.mk
index 153395d32a..421f06d695 100644
--- a/package/mdadm/mdadm.mk
+++ b/package/mdadm/mdadm.mk
@@ -21,7 +21,7 @@ MDADM_BUILD_OPTS = \
 	CXFLAGS="$(MDADM_CXFLAGS)" \
 	CPPFLAGS="$(TARGET_CPPFLAGS) -DBINDIR=\\\"/sbin\\\"" \
 	CHECK_RUN_DIR=0 \
-	LDFLAGS=$(TARGET_LDFLAGS)
+	LDFLAGS="$(TARGET_LDFLAGS)"
 
 MDADM_INSTALL_TARGET_OPTS = install-bin
 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
