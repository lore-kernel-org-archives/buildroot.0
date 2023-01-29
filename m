Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3E72C61D97
	for <buildroot@archiver.kernel.org>; Sun, 29 Jan 2023 16:31:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82DD760BA4;
	Sun, 29 Jan 2023 16:31:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 82DD760BA4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hNFKFq5CJrDa; Sun, 29 Jan 2023 16:31:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4BCD60B79;
	Sun, 29 Jan 2023 16:31:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4BCD60B79
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 09DFD1BF476
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 16:31:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D707460B79
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 16:31:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D707460B79
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5KTLbtHcNFzg for <buildroot@lists.busybox.net>;
 Sun, 29 Jan 2023 16:31:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93C34607AA
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 93C34607AA
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 16:31:43 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 m16-20020a05600c3b1000b003dc4050c94aso3811721wms.4
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 08:31:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RATaC0NLCmO3fhvLi/AsXOWkb6btes/LWmhdqKUYsTQ=;
 b=cpQOA8Jalc5KTSt8FvGpBR53cwIHD7C6w/IaUf9WyFBbP2YwBwRTwj4BDdDYTJ9dAq
 +ikQmKt+EI91ugqFP5wgd+4aoXXV2heT5jBbKa8bG0sLfwh1MDvosgoFwrdBMLerF/Qk
 ItnTP52MxST+AuTaqi90/ricHoKl94k+wovJxlQkP3lCJOb4oMbuILngzcroBgGv6+ku
 IwvNQh2Z7L7bB1S7stJhAwGNG6CSq0fS9lPvqmVpIqTfTqEGYi1tYqK7+PwjkcUFnh42
 s/rrZEDNh8wsfP6NRQ3bfRyXEH2P/HxNwOI8f4rUK8euCwZPKgJKfLaDhQx+bTBV/Zp3
 Atfg==
X-Gm-Message-State: AO0yUKVi8YKUCqI5WCNE1NIrMeF03DFprU5cJy0qJw+FkDdQXxDhlmlw
 5dsWZfUOpyhFEwgGCsa6aQ+c56gKfvo=
X-Google-Smtp-Source: AK7set8kRptqSF/LptobXI9tXFkrFaxtlKAnvA3hL5vgnzqEj4DiAN8flyqTd4uoGp5aiBBQEgzh+w==
X-Received: by 2002:a05:600c:1e08:b0:3dc:58fb:c1eb with SMTP id
 ay8-20020a05600c1e0800b003dc58fbc1ebmr961373wmb.8.1675009901435; 
 Sun, 29 Jan 2023 08:31:41 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 b11-20020adfe30b000000b002bfcc940014sm8281308wrj.82.2023.01.29.08.31.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 08:31:40 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 29 Jan 2023 17:31:35 +0100
Message-Id: <20230129163135.30876-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RATaC0NLCmO3fhvLi/AsXOWkb6btes/LWmhdqKUYsTQ=;
 b=n4necinvfQLUSCEjf/D3aTxci1v2ihp1Fo43HQ/ot2bZtn36L34j4DKT31Tr5lFIxB
 MEHJ09khmF/lpPCg7ou+KGs4/8C0r7fiiOzBRgQ4+WGS5UoSdBtZ+Ml82QZ0lbcOPdNS
 h1ZWiGkNZufvkC/RUxjpMUcojSBni4H3PiviBO+ggpyb29XRaIxlY3+MOLX/8ZVEC5ir
 0CHGIqsVUvYXYfSN1M1JlcM4Dcvejjfpq8sNdhf2Rm0CMFfhxH/afD24daBLPSX1GK2m
 LOR00ZW8bqI7GDIabN6T3V4I0EYHjcvmNbhkKm/yAnuJcy2yLl7aCwJj5rPvXZ0xPXMA
 YDvQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=n4necinv
Subject: [Buildroot] [PATCH 1/1] package/c-ares: security bump to version
 1.19.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Low. Stack overflow in ares_set_sortlist() which is used during c-ares
initialization and typically provided by an administrator and not an end
user.

https://c-ares.org/changelog.html#1_19_0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/c-ares/c-ares.hash | 2 +-
 package/c-ares/c-ares.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/c-ares/c-ares.hash b/package/c-ares/c-ares.hash
index af1f076aab..edf891674b 100644
--- a/package/c-ares/c-ares.hash
+++ b/package/c-ares/c-ares.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  1a7d52a8a84a9fbffb1be9133c0f6e17217d91ea5a6fa61f6b4729cda78ebbcf  c-ares-1.18.1.tar.gz
+sha256  bfceba37e23fd531293829002cac0401ef49a6dc55923f7f92236585b7ad1dd3  c-ares-1.19.0.tar.gz
 
 # Hash for license file
 sha256  db4eb63fe09daebdf57d3f79b091bb5ee5070c0d761040e83264e648d307af4c  LICENSE.md
diff --git a/package/c-ares/c-ares.mk b/package/c-ares/c-ares.mk
index 0152759ebc..4332fc6919 100644
--- a/package/c-ares/c-ares.mk
+++ b/package/c-ares/c-ares.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-C_ARES_VERSION = 1.18.1
+C_ARES_VERSION = 1.19.0
 C_ARES_SITE = http://c-ares.haxx.se/download
 C_ARES_INSTALL_STAGING = YES
 C_ARES_CONF_OPTS = --with-random=/dev/urandom
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
