Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C76C27C4F
	for <buildroot@archiver.kernel.org>; Sat, 15 Jun 2024 07:56:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B2FE60717;
	Sat, 15 Jun 2024 07:56:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EPECFwe78mFI; Sat, 15 Jun 2024 07:56:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4AFD6606E5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AFD6606E5;
	Sat, 15 Jun 2024 07:56:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5EE921BF30C
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 07:56:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 471284091D
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 07:56:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RmOCXIqc9j55 for <buildroot@lists.busybox.net>;
 Sat, 15 Jun 2024 07:56:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 93584406CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93584406CC
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 93584406CC
 for <buildroot@buildroot.org>; Sat, 15 Jun 2024 07:56:24 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2ebeefb9a6eso28779971fa.1
 for <buildroot@buildroot.org>; Sat, 15 Jun 2024 00:56:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718438182; x=1719042982;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QAkML8bFW9ilgGqpH9va/8Ow+D4QV861w+11s07lIt0=;
 b=UtGayk24UTT0aBz/eMi2ZqIzRo1+Gzql38Wd99CKn5FDBdPv+o7Xz7cbyOS/3sSute
 dNnwL9aiB1M8YYdmSDzmjEGResUmBnywDvOUkFsFj5EIFXpkxkYAUELvp7FQ6mFSDTJz
 X/IMBfsTqSPmClP6nXQilSBzOx+gubmnTutVV56GX1wWWpxZcl4yG5FNKOHWKH5HkPnz
 hwtmSOrbi8QURZPBmVsX3qzkY8jy4NC+MXAISajG9FWcElQusByC/zSjHmoJ2Ffb3EB/
 j212ABjO56QDOvtJHVmMXjyMOPUecJo65aQDY8F9+QXSfhDyQXlAir99VTSb4t2lHJIC
 5DbQ==
X-Gm-Message-State: AOJu0Yxhm1VGX5m5H8EjH2KniLwnY4DQJpilQ/uG7UOsoQ9KSGwPvkQh
 731urqUOIc7Pg0oFosEYOQz4ntWjAM4oLTUugpk3Cwoqzz5n7Zc2nA06uw==
X-Google-Smtp-Source: AGHT+IHfNN22MEkVdpivh0IQvhBpSEd9iiqVh0w4YMaxmfXbC5PXDT9EpCLD5FFWhoDOKoq2BEu1iQ==
X-Received: by 2002:a2e:92c5:0:b0:2eb:ec28:62f2 with SMTP id
 38308e7fff4ca-2ec0e47c214mr29120081fa.28.1718438181721; 
 Sat, 15 Jun 2024 00:56:21 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422f6320bfdsm87626245e9.37.2024.06.15.00.56.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Jun 2024 00:56:21 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 15 Jun 2024 09:56:19 +0200
Message-ID: <20240615075619.2410679-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718438182; x=1719042982; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QAkML8bFW9ilgGqpH9va/8Ow+D4QV861w+11s07lIt0=;
 b=fmXWeHHKrEm1PbQOHLwapY4ZubflKBknB7FSfPvE5h50eVbtS56xybCoQavmofW9HV
 Ek99hLz/RhpYAVkBLbLeut93VEpPoCpV5bKh2muYVi4JkOrkBZhzAQiFsKtl/qMMBfGs
 R8nVp+pAJd9AXUzBzimXZ5M7gCvUGBDeOTHL+6o579Lzloj+f0zouI3zXDCGhnoodPE/
 9Sz7/lpTotoBEMYykuNKt+UzDMpRQAYkP6I5cMs6NyXGEZ/szgM3N5cUF/6PuWohGS7K
 wqGAui7oz81o2gjeq+xbobGKiyqxo+H5UdSng32JL4nlk9f+lqakg4+hdz45TAfcpI8H
 blBg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fmXWeHHK
Subject: [Buildroot] [PATCH 1/1] package/execline: fix uclibc build
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following uclibc build failure raised since bump to version
2.9.5.1 in commit 42fad03182ed53de8003b66d50e893f42b72145e and
https://github.com/skarnet/execline/commit/6dfe54be869c117676dcc004400ac68096945531:

src/execline/eltest.c: In function 'eltest_run':
src/execline/eltest.c:366:31: error: 'struct stat' has no member named 'st_mtim'; did you mean 'st_mtime'?
  366 |       return timespec_cmp(&st.st_mtim, &st.st_atim) > 0 ;
      |                               ^~~~~~~
      |                               st_mtime

Fixes: 42fad03182ed53de8003b66d50e893f42b72145e
 - http://autobuild.buildroot.org/results/64bf2928f36e07332052854cbaaa7a6f8f347e29

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/execline/execline.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/execline/execline.mk b/package/execline/execline.mk
index 842ded6b88..b3d2d98216 100644
--- a/package/execline/execline.mk
+++ b/package/execline/execline.mk
@@ -12,6 +12,7 @@ EXECLINE_INSTALL_STAGING = YES
 EXECLINE_DEPENDENCIES = skalibs
 
 EXECLINE_CONF_OPTS = \
+	CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE" \
 	--prefix=/ \
 	--with-sysdeps=$(STAGING_DIR)/lib/skalibs/sysdeps \
 	--with-include=$(STAGING_DIR)/include \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
