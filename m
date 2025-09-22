Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C618CAC5AC
	for <buildroot@archiver.kernel.org>; Mon, 22 Sep 2025 22:26:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C78D6606EA;
	Mon, 22 Sep 2025 22:26:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PVnwG64TNqUo; Mon, 22 Sep 2025 22:26:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08E1460707
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08E1460707;
	Mon, 22 Sep 2025 22:26:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E7D5498
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 22:26:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 44F9D60760
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 22:26:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 67i1sw6weUZY for <buildroot@buildroot.org>;
 Mon, 22 Sep 2025 22:26:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D705A606EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D705A606EA
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D705A606EA
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 22:26:00 +0000 (UTC)
Received: from 91-153-34-249.elisa-laajakaista.fi ([91.153.34.249] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1v0oyr-00FwCS-AD; Tue, 23 Sep 2025 00:25:57 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 4a9914ad;
 Mon, 22 Sep 2025 22:25:55 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>
Date: Tue, 23 Sep 2025 01:25:48 +0300
Message-ID: <20250922222555.351974-2-aperez@igalia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250922222555.351974-1-aperez@igalia.com>
References: <20250922222555.351974-1-aperez@igalia.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yqEQt1Am3sLOcHa7kVdbjB1X3WoEwq8gANPkiWYr6w4=; b=hPhmecmu3GsyjV302bdAmSeWcv
 zVOPB3BeNp46fFUf58Ysk63ty07cNli9CQxesYu/wbZqMeIpn9V7wyEmYjzONr8OONgMXmgg7Dp8O
 ZEHaU0971mBCOBNfpZrMoVakuC4u7NKKOgXXH3ym5G9LNanRnWMMZxtfiM7u0uA7iTmRlU6/9a/Ca
 ZZGB+1lV512gJvEjJx1WGmsaiQc3Ck090OA4PUzJeWWSq9g5l5SIYljQ0phSykJCAEd0U51xQ+SzB
 UTiVGva1tyA9VjF4ca0SUgqWNuWAnKvYiukZ4Wrrj6HJZQ6eVAGXzQ4QbvwtIdGCHllADk/Gh/sYA
 c1pCIEbg==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=hPhmecmu
Subject: [Buildroot] [PATCH 1/2] package/sysprof: disable debuginfod support
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

This fixes building sysprof when elfutils is also selected (which is
a common setup). The debuginfod client support relies in elfutils
being built with the libdebuginfod option enabled; but Buildroot
unconditionally disables it in the elfutils package.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/sysprof/sysprof.mk | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/package/sysprof/sysprof.mk b/package/sysprof/sysprof.mk
index abbddfb6e1..2670588ebb 100644
--- a/package/sysprof/sysprof.mk
+++ b/package/sysprof/sysprof.mk
@@ -12,6 +12,7 @@ SYSPROF_LICENSE = GPL-3.0+
 SYSPROF_LICENSE_FILES = COPYING
 SYSPROF_DEPENDENCIES = libglib2 libdex libunwind json-glib polkit
 SYSPROF_CONF_OPTS = \
+	-Ddebuginfod=disabled \
 	-Ddevelopment=false \
 	-Dexamples=false \
 	-Dgtk=false \
@@ -22,13 +23,6 @@ SYSPROF_CONF_OPTS = \
 	-Dtools=true \
 	-Dsystemdunitdir=/usr/lib/systemd/system
 
-ifeq ($(BR2_PACKAGE_ELFUTILS),y)
-SYSPROF_DEPENDENCIES += elfutils
-SYSPROF_CONF_OPTS += -Ddebuginfod=enabled
-else
-SYSPROF_CONF_OPTS += -Ddebuginfod=disabled
-endif
-
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 SYSPROF_DEPENDENCIES += systemd
 endif
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
