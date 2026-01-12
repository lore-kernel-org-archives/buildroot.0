Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C242D2504D
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:23:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51C2A614B8;
	Mon, 12 Jan 2026 08:23:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R92usKWHvEPC; Mon, 12 Jan 2026 08:23:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D4C1612BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768206229;
	bh=1F47JrzOlW4tVskCe+KVA54mtD3NpT31Daenm0DuJcU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IU8j9DGSV/AHkyQzqiMlFjCLRVnUFsaCkXRRJSDEtBlrOMpsOyCb28Z+J9ZFV77dI
	 Sjymt6XHF/CcwEvQxBh4qhOKaOgq2RLmxAMYza20BxXIiUe6hM6hglScRjDEZYiZsz
	 /E5lAoppOB/HYhl1l/9MWHPgRTp3/xYkLaNzdnWv+A6ENkyQsmm55wDKTLCgBDeHjj
	 kV94hqB8zI3tZM41OtwuR5WUGaGJez7Js3riRuzxnPpuDnDwOG2qQKCRpFH71Kf681
	 SPgZrYa7Edvi8O3yR42rMp2iFIh1K9LcPjL+xAcXesSaJt7UzeKADk5FTmc5whnZ+U
	 VK8AgVZa675SQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D4C1612BF;
	Mon, 12 Jan 2026 08:23:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9600312E
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:23:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7CB844031B
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:23:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2FGHS_P4pTgc for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:23:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 733664013F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 733664013F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 733664013F
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:23:46 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 187A8A4C4231
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:05:48 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCuX-000000003M6-30SA
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:25 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:03:21 +0100
Message-ID: <20260112080419.2516889-46-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205148;
 bh=UdQdqU7gy3qA6N2cnxuvV1utVPHzyFIeufxno83VTIg=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=FMEg8qdm6rGTiB3ZBfgyHQjtmP7PJ5A8mqy0qsOaSkbavBPcQVVVRtWJg6mAWrFje
 IdSmZbN5qhgt2UebVIqsyLmlveRjznl6FOrXK+dbARxt78qms0V/ev7D/tvPd08Og5
 a8kjsqXMQHIPzK5ucz826Pt6EytlbXHL0vvUCqFvRkrygAHQ+DOHEmq7nvNOSmLK+S
 8UmHEICUi1Jg9txCr4NuS27LLstmYTEcaNZDa8ofxJH1yXeSnkzJbJJeZRtqfS3CUF
 OWzWqxX852vljhVCJ9V6/P3zjg3/7glPLoQjl001NJk2QhQtmFoNRDf1W9cF12SLAh
 eVpzR18aa4hxg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=FMEg8qdm
Subject: [Buildroot] [PATCH 046/104] package/x11r7/xapp_xcompmgr: bump
 version to 1.1.10
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

https://lists.x.org/archives/xorg-announce/2024-November/003555.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_xcompmgr/xapp_xcompmgr.hash | 6 +++---
 package/x11r7/xapp_xcompmgr/xapp_xcompmgr.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xapp_xcompmgr/xapp_xcompmgr.hash b/package/x11r7/xapp_xcompmgr/xapp_xcompmgr.hash
index b9675a5ecf..74333d92c0 100644
--- a/package/x11r7/xapp_xcompmgr/xapp_xcompmgr.hash
+++ b/package/x11r7/xapp_xcompmgr/xapp_xcompmgr.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-November/003254.html
-sha256  4875b6698672d01eb3a5080bde6eac9a989d486a82226a2d5e23624f1527a6f0  xcompmgr-1.1.9.tar.xz
-sha512  699117492af7fd84b36d317dcbf422d5ec86a7f21e29370caa737cd940d8ff866a5c8704ba2e7bd17a64e085d77fd23b628263d619813dead85cd669ff5b860e  xcompmgr-1.1.9.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-November/003555.html
+sha256  7824f709c4f22432eaea7542ec93384e5dd48f6fcb85c12ff82d721423b0b98f  xcompmgr-1.1.10.tar.xz
+sha512  6dd5c72d6859489580dabdb96e3b572931cec7c426022213007c92df2d805a8f01a7f3dc5e8493f6e550bb809f71a50ca1630f50555d47b8d5b4b2726d7b8b12  xcompmgr-1.1.10.tar.xz
 # Locally computed
 sha256  c843545f72771b3ff95eb88defc2e3ed8f9a1802d9bb6c32c196bb5eec3d3a5d  COPYING
diff --git a/package/x11r7/xapp_xcompmgr/xapp_xcompmgr.mk b/package/x11r7/xapp_xcompmgr/xapp_xcompmgr.mk
index c754ea37b3..d8a6855d88 100644
--- a/package/x11r7/xapp_xcompmgr/xapp_xcompmgr.mk
+++ b/package/x11r7/xapp_xcompmgr/xapp_xcompmgr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XCOMPMGR_VERSION = 1.1.9
+XAPP_XCOMPMGR_VERSION = 1.1.10
 XAPP_XCOMPMGR_SOURCE = xcompmgr-$(XAPP_XCOMPMGR_VERSION).tar.xz
 XAPP_XCOMPMGR_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XCOMPMGR_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
