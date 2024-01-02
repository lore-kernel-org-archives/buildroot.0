Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90A19C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 22:41:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E1F160FDA;
	Tue,  2 Jan 2024 22:41:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E1F160FDA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4RYFNlyWtjiD; Tue,  2 Jan 2024 22:41:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8313960FD9;
	Tue,  2 Jan 2024 22:41:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8313960FD9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B72A61BF2FB
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 22:41:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9DDD381E68
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 22:41:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DDD381E68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NttCHJcmY7y2 for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 22:41:14 +0000 (UTC)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BBD5B815AB
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 22:41:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBD5B815AB
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40b5155e154so130086445e9.3
 for <buildroot@buildroot.org>; Tue, 02 Jan 2024 14:41:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704235271; x=1704840071;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NqVar2y03XT6UmgC244/6x2SLNUPuFM2BViwNHBi4wY=;
 b=bzayUr1gzfcLPdRCm5NMCDLZmsYfj3vm3ogautE2k4QxUd/8F14+5D2Iyh4RCeinCV
 jPKTaBIzsPsJjhzf3Tz81KXPPukg6V6jOBY80VrxJT/MyM/Tdy/znrmS+GsRGtiZu6YK
 e/QxRkMQmmZLTCe14xQiElQ5adgqYOSy5RomTWNxkWwmdUWnnR7NLDr4uHkmd57RNhwz
 mpbEyfvWHEam/9qK1W4FozoW5BumuIaOFWEXLAkZ0ZSO0dWHKJzNKfr3dMnScpK/MfET
 USFwA/wiF3RSVUgxN4yAo6CddgSf7UFQSJuRKKIg03t8eiLxYOaRRYj8hBaj27QU86Tl
 ooMQ==
X-Gm-Message-State: AOJu0YzHM43Tvm3UUR9RldPFlbNjL1LGiTrZ4Wq8Yse3zceJ79w4siOo
 dAGCkWwbEGWpaAaUry/1FBmVM0P55Rg=
X-Google-Smtp-Source: AGHT+IGYLBjy79/g6xQA/OPJVf6F/qkdHzFPu4Q1wbvdSVZDocURpyiZtftMtoFp7inZUm8q6PzpRg==
X-Received: by 2002:a1c:6a0d:0:b0:40d:621b:83c8 with SMTP id
 f13-20020a1c6a0d000000b0040d621b83c8mr4263048wmc.198.1704235271035; 
 Tue, 02 Jan 2024 14:41:11 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 8-20020a05600c024800b0040d87100733sm342758wmj.39.2024.01.02.14.41.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jan 2024 14:41:10 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  2 Jan 2024 23:41:08 +0100
Message-ID: <20240102224108.2515943-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704235271; x=1704840071; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NqVar2y03XT6UmgC244/6x2SLNUPuFM2BViwNHBi4wY=;
 b=Xm96mor0ObijKrEaGdp8QInxx04sHSgvPbpoG1xbRxM9E9MGQLqbWiZZ3v91YtQ5zG
 HO38MuMd9Q9LTwPoxHcvx1yYeHXbvYgkCdZ2t8ljEFrZUPBukYN4onNJVAhlmORRiViE
 tifYmIAenKFzHGCxYTMvm5YhogzwYGIaMHIS8AINo38f+IOqeAbm/W1BFn9OFn3k2ebI
 t4onwyXx0jyUddiWYpH3xqnbrePz02N7V/zTMFikOsgiOm1inX5+scT2tJC7IOX3OX/k
 GpclbiQBrL1qnf19aWuVBF7LKJw9MX3PFXsU8KrSjuj6EKaOb+g2VTw6zehwkxojbiy+
 5WiA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Xm96mor0
Subject: [Buildroot] [PATCH 1/1] package/postgis: drop autoreconf
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 1718c2ba6a4db1461b2490aa42ca4f0a2112adae removed all patches but
forgot to drop autoreconf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/postgis/postgis.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/postgis/postgis.mk b/package/postgis/postgis.mk
index cdb905e79f..5f1c643ceb 100644
--- a/package/postgis/postgis.mk
+++ b/package/postgis/postgis.mk
@@ -11,8 +11,6 @@ POSTGIS_MAKE = $(MAKE1)
 POSTGIS_LICENSE = GPL-2.0+ (PostGIS), BSD-3-Clause (xsl), GPL-2.0+ or LGPL-3.0+ (SFCGAL), MIT, Apache-2.0, ISC, BSL-1.0, CC-BY-SA-3.0
 POSTGIS_LICENSE_FILES = LICENSE.TXT
 POSTGIS_CPE_ID_VENDOR = postgis
-# configure.ac is patched so need to run autoreconf
-POSTGIS_AUTORECONF = YES
 
 POSTGIS_DEPENDENCIES = postgresql libgeos proj libxml2
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
