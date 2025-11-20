Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9906CFA441
	for <buildroot@archiver.kernel.org>; Thu, 20 Nov 2025 22:08:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B0BF80D47;
	Thu, 20 Nov 2025 22:08:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AYUulqyNIBsy; Thu, 20 Nov 2025 22:08:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E181F80D16
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E181F80D16;
	Thu, 20 Nov 2025 22:08:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 31BD2158
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 22:08:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23E9541159
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 22:08:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zL32795CRmDQ for <buildroot@buildroot.org>;
 Thu, 20 Nov 2025 22:08:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=mr.zoltan.gyarmati@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0096141DBC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0096141DBC
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0096141DBC
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 22:08:08 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-47118259fd8so12084675e9.3
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 14:08:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763676487; x=1764281287;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lrLl6V/3dd8XVuz5rpn5JD0Bw9w6IyTt0d+s6MX5II4=;
 b=S0TM05Rp9ZdmsNq516Z5sB36McXwgVmNSzL4zpNhXGkgILZgUyOo+YfVZ6Qo/wpPiB
 XTyvDObKghNiMmnfAyTlk1Oqz3hKa+D0BFYDFLqiieLOs+p7J3cgJOWoBQLRseWOScH8
 QBknx9XYRquE7jb3YANpDPhJCiOL58YNs3juSDWZS2RLMVH8MZuE9VfKTUIQBtN/XahH
 DRiTuL9bFVrBmIuoiLhnT1DYKNJ49AyxSOvd9HWpuPZdSA7HJCNjT9h31/PxYOox16Nu
 fzvBO2/zDOXRxtHO6OhDGnHAwzecnmtUIPdSE7HHhnSerQ1AFcgm1qnNF5tmaxF3CeDJ
 9pVA==
X-Gm-Message-State: AOJu0Yx3Sw11zZK5UCvWx3FMg2cHw3Hn655dtYo1FGDq2IX8CvynULce
 IEUhOWocTouUe4hjimHf7+0/eQrqh3bOM3J86nwQqGj6vqACIeQV0MmayMJoKQ==
X-Gm-Gg: ASbGncuuaEOj4D7ld67f1QtuwLPkvbNuWRaY9E3tx9tjF+I3sHKeko30n7aZ9bIvIRI
 A8mtGj6zlWFS9zvMiRmiefnSfUA3vnSRKD2yUSktxS/GTN+wubBHS+FE1yw0yw7c6ZPPDkWytDS
 nhZw5GWEHyc/NdqGPQiMH6epjyBFoWKoD2JGSW2bPkVnXGuhhrKAB6m0JwxDT4/deT7yu/heD1f
 dhFvW3Hq4X8oalF/boKphCi5YJ9o7i4N0zqzTy9YH5d181UdoMSReJLhWE45ddgGStUF/C3T65o
 GBu3bdfNp028wN0BtDzX0LirXzoPYBJTdmdM5v3iF0uODhYshty4QLeHwac21lG0IFhrAaRJK7o
 DLrkF31M1FAZ7v5j8P27f9EyS93xVBtbxitIBQesnVplf2uAfgcl9f8QRR0gEDH8Fvpegxwz68D
 B+JLGMSHQbRYgHbGgyhxPS4HvFmTJizXcFM2TzR178mccsj68a9mUIWMY=
X-Google-Smtp-Source: AGHT+IEhqY14LkU/srG1SjCLo8Qlo53cnsJUveGi4TurTOnJKUW8tBy2oXpvlN6iLfzN0d8lPGZw0A==
X-Received: by 2002:a05:600c:474b:b0:46e:5100:326e with SMTP id
 5b1f17b1804b1-477c01ea24amr1967405e9.23.1763676486570; 
 Thu, 20 Nov 2025 14:08:06 -0800 (PST)
Received: from zgyarmati-t580.. (netacc-gpn-5-84-233.pool.yettel.hu.
 [84.225.84.233]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477a972141bsm71641275e9.2.2025.11.20.14.08.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Nov 2025 14:08:05 -0800 (PST)
From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
To: buildroot@buildroot.org
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Thu, 20 Nov 2025 23:08:00 +0100
Message-ID: <20251120220801.1877397-1-mr.zoltan.gyarmati@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763676487; x=1764281287; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lrLl6V/3dd8XVuz5rpn5JD0Bw9w6IyTt0d+s6MX5II4=;
 b=NYnUpVjWF6iEaoUyfcQHsbnYWLjpr43NSErLrSYt/BbsVFCcw33HcIbzPFu0TXd/PI
 e89+JIyDapQXUXvKwtMN2TyHWcEa/dG+mXCBD5q+Kl92Llwvaxbguil6aE+WHDm/LtRu
 QE0JiM0/MbQY6GKmLmSx6tJvk1Em7R3FCxLifKMBB7CkUEhDRI+GQg4W8L6v7v77OkjP
 tevNaIBtXVOVPV6TYYJ/JTrFFQsWqPK2dHUbajzYnbzIcswJUFB92qjYph4XNKDuWDK3
 KFNYvXwUvfet5lqvIqF8yRRrHbbhbgVMzYZKw2Tx37CBbERTQmN7oK/HRMZsphuZeQly
 XVdg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=NYnUpVjW
Subject: [Buildroot] [PATCH 1/2] package/quazip: add config option to enable
 building and installing unit tests
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

Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
---
 package/quazip/Config.in | 11 +++++++++++
 package/quazip/quazip.mk | 10 ++++++++++
 2 files changed, 21 insertions(+)

diff --git a/package/quazip/Config.in b/package/quazip/Config.in
index 4c7a187571..c6099719e5 100644
--- a/package/quazip/Config.in
+++ b/package/quazip/Config.in
@@ -10,3 +10,14 @@ config BR2_PACKAGE_QUAZIP
 	  archives. It uses the Qt toolkit.
 
 	  http://quazip.sourceforge.net
+
+if BR2_PACKAGE_QUAZIP
+
+config BR2_PACKAGE_QUAZIP_INSTALL_TESTS
+	bool "Build tests"
+	select BR2_PACKAGE_QT6BASE_TEST if BR2_PACKAGE_QT6
+	select BR2_PACKAGE_QT6BASE_NETWORK if BR2_PACKAGE_QT6
+	help
+	  Build and install unit test binaries
+
+endif
diff --git a/package/quazip/quazip.mk b/package/quazip/quazip.mk
index 06b702e732..830eb92065 100644
--- a/package/quazip/quazip.mk
+++ b/package/quazip/quazip.mk
@@ -16,6 +16,16 @@ ifeq ($(BR2_PACKAGE_QT6BASE),y)
 QUAZIP_DEPENDENCIES +=  qt6base qt6core5compat
 endif
 
+ifeq ($(BR2_PACKAGE_QUAZIP_INSTALL_TESTS),y)
+QUAZIP_CONF_OPTS += -DQUAZIP_ENABLE_TESTS=ON
+
+define QUAZIP_INSTALL_TESTS
+	$(INSTALL) -D -m 0755 $(@D)/qztest/qztest $(TARGET_DIR)/usr/bin
+endef
+
+QUAZIP_POST_INSTALL_TARGET_HOOKS += QUAZIP_INSTALL_TESTS
+endif
+
 QUAZIP_LICENSE = LGPL-2.1
 QUAZIP_LICENSE_FILES = COPYING
 QUAZIP_CPE_ID_VALID = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
