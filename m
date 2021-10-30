Return-Path: <SRS0=xEd5=PS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B8F5C433EF
	for <buildroot@archiver.kernel.org>; Sat, 30 Oct 2021 21:55:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD93660E98
	for <buildroot@archiver.kernel.org>; Sat, 30 Oct 2021 21:55:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CD93660E98
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 960A080D34;
	Sat, 30 Oct 2021 21:55:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l05u3holpM2z; Sat, 30 Oct 2021 21:55:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1CBA80D35;
	Sat, 30 Oct 2021 21:55:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E44151BF23C
 for <buildroot@lists.busybox.net>; Sat, 30 Oct 2021 21:55:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DED2980D35
 for <buildroot@lists.busybox.net>; Sat, 30 Oct 2021 21:55:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0uYJJG4XsZO5 for <buildroot@lists.busybox.net>;
 Sat, 30 Oct 2021 21:55:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A7D2380D34
 for <buildroot@buildroot.org>; Sat, 30 Oct 2021 21:55:53 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 c71-20020a1c9a4a000000b0032cdcc8cbafso6453776wme.3
 for <buildroot@buildroot.org>; Sat, 30 Oct 2021 14:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DIeAuBtLGAT14GCJwnYU7ZSaxtdwPtQNcyS93ssvN+c=;
 b=U9A1pIk6XSCg3uW3iHKwBh7QWHjiCGOr+aOqDiorqHe3xUpHmJllWL8LL/vp7n7p/Z
 jHNgv51VOuB+ugxJxJt7CugAMrPazhwd7wvXvaQk9rluc+ErUC3tDTxTDCXGle2PQgcN
 XltX7oY6R0FolihngGzZE/39mivmqexbbCypR+gJwtU6ZbHB/k9l0I3oaecWwCHaXJjI
 464kQj7H/aVyu/qV2gNJLK8NRq+6qdL6zvtl92E74P/3B1Wd/GM594nMb3JRYAOigODS
 /Aa7wRDGvb94ggsLzV9nku+/R1ncHtpQDgbAszSw9CS4n+YPZyqlOdlw01wBYphXiZhO
 R0kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DIeAuBtLGAT14GCJwnYU7ZSaxtdwPtQNcyS93ssvN+c=;
 b=gnFSWpOPM1wkBmZcM7jHm3kfMxhU73+wrPyb9+tgGy3MhtK+xGQ9HiYT8ry8PBJTPs
 yYRzaw6YDu3SNewBKgaGFkebEGA9hQXnMecqT9jtOjtmVblDBXIXxV1czwGKHwA/4zCQ
 z8W7umJr7OHpAo9oD5MsKH9/t6f1/VQTjPw1B/IPNZJWsKPpgn72Fl8ULmIfzbUfa2vL
 qy/fi5TIw5BK0L38YJGJ4jre3ncwRZZF34pJN3DTBGR0BFd4g3/19k+DuyuzDq3gIPAg
 LLoOo8H0n5sk0r2JA2a9VRH37LZc88/nkEub5T++5iu10nC5MosE2bubHJhJpWm7v5Ch
 +Kiw==
X-Gm-Message-State: AOAM530NXGbuTVx8hFUtn2Q6Y27yVtYeKv45oCce2ab5x9wegmW6MZh4
 MlDAMZoAvncbIFEgN+PgIM1+g0//rTQ=
X-Google-Smtp-Source: ABdhPJzB3CufKZ9KSN6HeVsfdiEzZWlgfGiibV9MjpiUOgAe5Pl/xewAPZxqMgIld+FzwryS3DWP3w==
X-Received: by 2002:a05:600c:19cf:: with SMTP id
 u15mr21040145wmq.45.1635630951690; 
 Sat, 30 Oct 2021 14:55:51 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id y5sm11853323wrd.75.2021.10.30.14.55.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 14:55:51 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 30 Oct 2021 23:54:14 +0200
Message-Id: <20211030215414.2155338-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/ipcalc: fix static build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Derrick Lyndon Pallas <derrick@meter.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following static build failure raised since commit
77f4d2f8efcb6e3d842cd9719311907ecec6147b:

../ipcalc-maxmind.c:41:11: fatal error: dlfcn.h: No such file or directory
   41 | # include <dlfcn.h>
      |           ^~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/5f867aeab9c61538e34b14023d0ba327698d3c04

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ipcalc/ipcalc.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/ipcalc/ipcalc.mk b/package/ipcalc/ipcalc.mk
index 704844292a..dfe35e2cdc 100644
--- a/package/ipcalc/ipcalc.mk
+++ b/package/ipcalc/ipcalc.mk
@@ -10,6 +10,12 @@ IPCALC_SOURCE = ipcalc-$(IPCALC_VERSION).tar.bz2
 IPCALC_LICENSE = GPL-2.0+
 IPCALC_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_STATIC_LIBS),y)
+IPCALC_CONF_OPTS += -Duse_runtime_linking=disabled
+else
+IPCALC_CONF_OPTS += -Duse_runtime_linking=enabled
+endif
+
 ifeq ($(BR2_PACKAGE_GEOIP),y)
 IPCALC_CONF_OPTS += -Duse_geoip=enabled
 IPCALC_DEPENDENCIES += host-pkgconf geoip
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
