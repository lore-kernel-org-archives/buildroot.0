Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5832CCD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 12:13:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 253576069A;
	Sun,  7 Apr 2024 12:13:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PXKQLvyX7NDR; Sun,  7 Apr 2024 12:13:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 355996089F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 355996089F;
	Sun,  7 Apr 2024 12:13:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 290D71BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 12:13:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 21BE58137E
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 12:13:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kwGBYPIHaB48 for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 12:13:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1B35381377
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B35381377
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1B35381377
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 12:13:49 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3454fbdd88aso989667f8f.3
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 05:13:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712492027; x=1713096827;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=E+aYmZyjIW0srfDBz/Lkgsz4WeZKsnhVXrO/MJ+OCGU=;
 b=RfM+DGNSNMeWAFFQin2WORuwYXSkknNAv6O5AR0oeNpeaERyEWAMouVk3Vncp999aG
 SxqBI4MHuLZfg6mEE6pahCckpDhD3q4ReCv85hsc+/roZ1mayIcH2zwTgJ+6MplZl4GL
 IB5KWneycF95Ei2yKDKMylXHNRW3TlIgt8eLCBf8XdGtTQxra0g34qFR//CQdgg26a6e
 ADa0C3qPbkGi8oGCv88ops7Ciy1qDQppzVj/6sPIx3e5vFicg61IBpbObrAfB9Al8sWC
 sIV1QlDxkAHbsvEW1KuP6lnAL97zozg8H01QTkpIdUViA09WBVwXLuN6pO/JlblK6436
 I5PQ==
X-Gm-Message-State: AOJu0Ywg90o1Bza32BjunFuSJX1+6J7DurLQhFs6r6ofl99mSYHuu+Sb
 o+O8WRWuEOh2MCSZCfHOBrPOZQ1qVnMQagdxBBEyfHrhVq7ndhGMyuKR7pnf
X-Google-Smtp-Source: AGHT+IFCs1T4GPFpc4ev9yAHkq1jb8vi0kui3vSa8nusAZ01nGohzDw+MAAePZQYAanPls/a4Xt8VA==
X-Received: by 2002:a5d:4527:0:b0:344:2550:4bcd with SMTP id
 j7-20020a5d4527000000b0034425504bcdmr2699192wra.25.1712492026894; 
 Sun, 07 Apr 2024 05:13:46 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 ay4-20020a05600c1e0400b0041646c5fc21sm3793333wmb.42.2024.04.07.05.13.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 05:13:46 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 14:13:42 +0200
Message-ID: <20240407121342.892419-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712492027; x=1713096827; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=E+aYmZyjIW0srfDBz/Lkgsz4WeZKsnhVXrO/MJ+OCGU=;
 b=F/cCvCdVHDEQtQL9nZOnQBypQkkU7sKxrayIeGML/NPp0X4bt2IxdqsRt+Ijq/GT81
 kkp2dG22nxQ2MMqZtgyR3ABsivrDE1suKhEs5dgXMcDb5vqSOyOHqu9Ihxabetr8O5He
 34mESUHJf3t9XC/+i9x4tQuyOOOsKbBe6hxUwyxSCDKFPUk+QNRRbZo4eozHDJoDXaPz
 s3GO91wJNUR+uX+bTKNFWyF5YE5MDhnb1Kf0122lZP5InFgXwJXeoOvrHvClhnNKb+PF
 1aG254Iexn3XkQiDFsmdPxkTzp9/6sYx8dysqloUdYDRHf8bXyV7NEqfd+T+78u8gI+l
 yDig==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=F/cCvCdV
Subject: [Buildroot] [PATCH 1/1] package/whois: add libxcrypt optional
 dependency
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

Fix the following build failure raised since bump of glibc to version
2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97:

/home/autobuild/autobuild/instance-12/output-1/host/lib/gcc/riscv32-buildroot-linux-gnu/12.3.0/../../../../riscv32-buildroot-linux-gnu/bin/ld: cannot find -lcrypt: No such file or directory

Fixes: b5680f53d60acf8ff6010082f873438a39bd5d97
 - http://autobuild.buildroot.org/results/b0aaffaf951725186ae078ce101edb24c963c6a3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/whois/Config.in | 1 +
 package/whois/whois.mk  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/whois/Config.in b/package/whois/Config.in
index d2a030282b..19c22b5583 100644
--- a/package/whois/Config.in
+++ b/package/whois/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_WHOIS
 	bool "whois"
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  Improved whois client.
 
diff --git a/package/whois/whois.mk b/package/whois/whois.mk
index 5a85bea358..e98add4e6a 100644
--- a/package/whois/whois.mk
+++ b/package/whois/whois.mk
@@ -10,6 +10,7 @@ WHOIS_SOURCE = whois_$(WHOIS_VERSION).tar.xz
 WHOIS_DEPENDENCIES = \
 	host-pkgconf \
 	$(if $(BR2_PACKAGE_LIBIDN2),libidn2) \
+	$(if $(BR2_PACKAGE_LIBXCRYPT),libxcrypt) \
 	$(TARGET_NLS_DEPENDENCIES)
 WHOIS_MAKE_ENV = $(TARGET_MAKE_ENV)
 WHOIS_MAKE_OPTS = CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
