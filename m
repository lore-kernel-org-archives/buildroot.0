Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 923E4C71136
	for <buildroot@archiver.kernel.org>; Tue, 17 Jun 2025 20:34:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D77783B20;
	Tue, 17 Jun 2025 20:34:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6w0VUoLFcg4h; Tue, 17 Jun 2025 20:34:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94D938344C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94D938344C;
	Tue, 17 Jun 2025 20:34:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7BF6716B
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 20:34:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C75B8344C
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 20:34:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a_Yx5dHzR5Ee for <buildroot@buildroot.org>;
 Tue, 17 Jun 2025 20:34:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 33BFC832C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33BFC832C7
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 33BFC832C7
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 20:34:43 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01bf.dip0.t-ipconnect.de [91.58.1.191])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 61AE5A4C03A3;
 Tue, 17 Jun 2025 22:34:40 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56680)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uRd0x-000000005kf-24cZ;
 Tue, 17 Jun 2025 20:34:39 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 17 Jun 2025 22:34:39 +0200
Message-Id: <20250617203439.1053632-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1750192480;
 bh=0VVfavgIHhk2dWjsJLiW7G2WeA2P9oOEduxK/yzYK84=;
 h=From:To:Cc:Subject:Date:From;
 b=jSbsN+IT2Wf5VUQfzln/Vu8WuOZ9sbDwjbZu+SYtG9fvKqQufuJ9vbJ6ciNvonkEB
 wPTW4Zzv0iBTt8bK9YKFqx2WW/QN2x2P789UI0qGUr9dyG1xQoh1woPUs7633voJ7g
 mTiGAgrvaYqD8FAbU/I1LeCgCMZOKhajzUeFij0huO42i/SB1MA/rF5vBAuntqB1gG
 Q/EQoYlPLZjDlR+n3IlGhS9u4GyA5lvLLoU4PbAQ5TrbgSk29jYGu4M6e87uLu0JcD
 +ezvZTlCova9dj56++7UzxXZ8iHu9Ot6Gvs4EX/awEb01IPUr4qTmJ4qUzP43fvmW8
 Tg51ypB8bC+KA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=jSbsN+IT
Subject: [Buildroot] [PATCH 1/1] package/lpac: needs libqmi for optional
 support of libqrtr-glib
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

Buildroot commit dad998a8070bc07838f78453fcb7906fefab22ba added this
package but forgot to select libqmi for optional support of libqrtr-glib.

Fixes:
https://autobuild.buildroot.net/results/95e/95e30d1031912efa200edb9c7b926a31f0abe32f/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/lpac/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lpac/Config.in b/package/lpac/Config.in
index 6cfe11cc67..c754da96d9 100644
--- a/package/lpac/Config.in
+++ b/package/lpac/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_LPAC
 	depends on !BR2_STATIC_LIBS # pcsc-lite
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pcsc-lite
 	select BR2_PACKAGE_PCSC_LITE
+	select BR2_PACKAGE_LIBQMI if BR2_PACKAGE_LIBQRTR_GLIB
 	help
 	  C-based eUICC LPA.
 
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
