Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A29CAC5BB
	for <buildroot@archiver.kernel.org>; Sun,  5 Oct 2025 12:32:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 030DB40C89;
	Sun,  5 Oct 2025 12:32:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dqWoj5yob39L; Sun,  5 Oct 2025 12:32:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04E7840C8D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04E7840C8D;
	Sun,  5 Oct 2025 12:32:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 18FC8272
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 12:32:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0AA2440C89
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 12:32:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Covt70WIxwTe for <buildroot@buildroot.org>;
 Sun,  5 Oct 2025 12:32:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9460140C8D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9460140C8D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9460140C8D
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 12:32:49 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0845.dip0.t-ipconnect.de [91.58.8.69])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 08FACA4C5D9B
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 14:32:47 +0200 (CEST)
Received: from [192.168.1.144] (port=44516 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v5Nuw-000000006gK-2cc3
 for buildroot@buildroot.org; Sun, 05 Oct 2025 12:32:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  5 Oct 2025 14:32:46 +0200
Message-ID: <20251005123246.1165560-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1759667567;
 bh=4zLnKVvk7lPhneA6kg9xbUFuMSAtGhobYa3gf0bHa2U=;
 h=From:To:Subject:Date:From;
 b=yAw8zDErZWsiLYr/oENWHaeHwUWhsAROSPDty+TVPkxqfeBOQPv3RC6qilfFhIdaP
 8gkZD4uvmsqVIDa24gZb1yZukztNbjoOLZiFpRcaT52Za7+vpoNJXCHm9OK4fitHwC
 tbvzIyQPxUn3hd7D/ZYIBV3GL6xHL/xH4YT0grmrLsKqSmMPwKusYSoqDtfzBI2JPh
 KLu/+K00ue6IYwPX8zkuPdVb0CdJBQ9WFEU/JglRbDSQdzNo21hdv2h3TSrMkXq80L
 fJmPuPHE8wtz6dlqyreRsntMVTNtRY4u/GjaQhKS/FvXhiHwcCMWGgx86dMu/KsTs7
 15VCnrtOjqtlw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=yAw8zDEr
Subject: [Buildroot] [PATCH 1/1] package/apr: link with -lm
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

Fixes Apache runtime error:

    /usr/bin/httpd: Relink `/usr/lib64/libapr-1.so.0' with `/lib64/libm.so.6' for IFUNC symbol `modf'

caused by glibc bump to 2.42 with buildroot commit
fb6256c0efbc93d242e9ae2aa2d3b4a2e7fd149c.

Configure check of apr does not detect the need for -lm:
    checking for library containing modf... none required

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/apr/apr.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/apr/apr.mk b/package/apr/apr.mk
index 1c7553a501..98a7ece620 100644
--- a/package/apr/apr.mk
+++ b/package/apr/apr.mk
@@ -50,6 +50,10 @@ APR_CONF_ENV = \
 	apr_preload_done=yes
 APR_CONFIG_SCRIPTS = apr-1-config
 
+ifeq ($(BR2_PACKAGE_GLIBC),y)
+APR_CONF_ENV += LIBS=-lm
+endif
+
 # Doesn't even try to guess when cross compiling
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 APR_CONF_ENV += apr_cv_pthreads_lib="-lpthread"
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
