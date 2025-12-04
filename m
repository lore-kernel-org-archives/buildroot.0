Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F04D20694
	for <buildroot@archiver.kernel.org>; Thu,  4 Dec 2025 13:48:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D2BD608D5;
	Thu,  4 Dec 2025 13:48:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pn12hGFe-7oV; Thu,  4 Dec 2025 13:48:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E63C60B13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764856090;
	bh=xcNgXE/cbKt6qadYJ3WVKWEjMjGfgB33Qcydv47nlJA=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RRuZtXRMRU4GDoWZihZ6c8vmkl9WQzAfo0J0Va1AyrxSLvX4ViZeicAFGk2WVOTLr
	 MWPdOc62gy3oN+a8HsLIMe8LWdObqGyhRWkThd6wBWIyfxJxHtrZZPVnrIe0QU9qb4
	 8Va0fObsBUe86F2H7lnxkoAqCq43rW3V49++hTlV2bHsFmMs/KVPIBc4ATRJ9Xow7v
	 LnsaDqMG/xquta4YGhcKSi3b26nRYx+W9glM5f2PXxeOYQNN/LZrgsKR8+PspOvBRK
	 FGc4DYnp6WlDt4JSk48mAlTyQTQkVoIEXGG/deLe8+uv61PzaE8uYBzUF8SaC2g6Da
	 w0GdATQy+Mh8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E63C60B13;
	Thu,  4 Dec 2025 13:48:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9DD40D3
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 13:48:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9022B608D5
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 13:48:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V932-WHdn5e7 for <buildroot@buildroot.org>;
 Thu,  4 Dec 2025 13:48:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7E42360899
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E42360899
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7E42360899
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 13:48:08 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4779cc419b2so11181255e9.3
 for <buildroot@buildroot.org>; Thu, 04 Dec 2025 05:48:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764856086; x=1765460886;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=E5f69L8vjJoLjECqGgASX8939eayYT52KuQsgUdKBmo=;
 b=G8UCBkUH7K0XkVkoP+81bxYWonJIgUSniB2JfYfqFea6+6xGwBcAfWcufhcVyAJJuu
 63JiHgIZ3YOcCiPTcm8sWgDVtQupLbjgechQXRgf2liWznEec/uW7kL1aeLTKwPxPhNF
 0Ey79LaGkI8IYsvOMapnBSnPMXWrRFqE91ih1T0R9ejNV40wNCM9970WnK/wB6SB8yL7
 9Un+1Ny27+3wRIqt7uSyAAaHzbve3MOHhUQml56EfEmDVlMQUQXffBnuML76zwdRlfY/
 NHfqC5IhxZeKAmyMZxn2UOGg0ze1qv07gvifYzR2JUqaGQeZLVur74wlT3sM+YW+yZYY
 aFIQ==
X-Gm-Message-State: AOJu0YztAdY4ZP2AGgXgZsVjprfSSQws/+AciROIW9JOsBzD4cxYXtik
 QLewJRI++dnRRCHvek9js1nerDvxFnP5eOXm6kldl35EP5MfknPzyw+VAOKpZg==
X-Gm-Gg: ASbGncttUSFry6x4rl6X68fBaiy7JOsRXui28NkQF09bjNNd8phyZO31bWPulQC3Oq/
 FA7UbrIt3HWrMamHoiMD9+CiveMDcrIMouJJ0apDys8UvvgtBtliaTwRIoF8mKKO9sus+gj7nXb
 wWXzQh0SsQLNdC4Kcyc5p4rxFSfXpKY41xzFWZXwRcDiLMl1TyhceJ/TV52N+XCl8SrxfKIOuRl
 NLKKkvqH6BLD+Peod8XN98S+HNKDVgt4PVud0xOJPO9yWH+N4HiFsHXUx6XhjhsDpw8hdMrVIJp
 mwiUAbailOLWAJj4OzbneTnvAjO7UDBusyhDRHbrzX5eS+1cWdMt61S2e2qkHgOVNAhwG477gwh
 1EUE5sRnN5MauyIozzEPETwpZ9U9xFIb/4SsrpYQEw1OLNMhp1Q381FCNEj2tm6R4sfNpybmX0h
 CD0qh7D50OI6F2KQ==
X-Google-Smtp-Source: AGHT+IFDCqmzC2ORIiArEChQtmK6dNeo5jR6+9/hqZ66i525UEePDU9dQfsAIxvE+Ep9pmN6TJyAnQ==
X-Received: by 2002:a05:600c:8b21:b0:459:db7b:988e with SMTP id
 5b1f17b1804b1-4792aee3850mr58260575e9.13.1764856086428; 
 Thu, 04 Dec 2025 05:48:06 -0800 (PST)
Received: from freepad.proxad.net ([213.228.1.188])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-479311fbaf4sm28817255e9.15.2025.12.04.05.48.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Dec 2025 05:48:06 -0800 (PST)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: Maxime Leroy <maxime@leroys.fr>, Vincent Jardin <vjardin@free.fr>,
 Julien Olivain <ju.o@free.fr>
Date: Thu,  4 Dec 2025 14:47:40 +0100
Message-ID: <20251204134742.406507-6-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251204134742.406507-1-maxime@leroys.fr>
References: <20251204134742.406507-1-maxime@leroys.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764856086; x=1765460886; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E5f69L8vjJoLjECqGgASX8939eayYT52KuQsgUdKBmo=;
 b=Sl0Vgfw13RehzK1Q4kyTRqeg9nwN58/TvKFrbEGSqO+psWnyW9gYgVG1R9WiUbxpVx
 tysia00fu1C7LgrahzNbieZtLAcEAKQnic5qjtJsZvFletEJoI3YvzdVSzu0YAMbekYA
 uK8dxsdmOvt3o91XJRQSxc7YMYi+ZIKeKxReUDadsqcmb0EAr4PKSPVm5+7v7jmiwT1q
 iNNmi109HtfI+4jrUgzLkRNCRqYNDx4uzrYcrQSXo1sFZxMp39If+bQGKoN/p5y6BbJr
 kdsNKU5s+9NeFfFTr0QCQYpBx0Dlxp13X2g8vx6n0WHtq7BUYPgOcmfZnOZPmN0/RfSv
 sDwA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Sl0Vgfw1
Subject: [Buildroot] [PATCH 5/7] package/grout: bump to 0.14.1 version
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

See the release note of the new versions:
https://github.com/DPDK/grout/releases/tag/v0.14.0
https://github.com/DPDK/grout/releases/tag/v0.14.1

Since v0.14.0, Grout uses the libmnl [1], the dependency are updated in
consequence.

[1] https://github.com/DPDK/grout/commit/2eb97af1e8
Signed-off-by: Maxime Leroy <maxime@leroys.fr>
---
 package/grout/Config.in  | 1 +
 package/grout/grout.hash | 2 +-
 package/grout/grout.mk   | 3 ++-
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/grout/Config.in b/package/grout/Config.in
index 7e6e34e07f..1cfec41d7a 100644
--- a/package/grout/Config.in
+++ b/package/grout/Config.in
@@ -13,6 +13,7 @@ config BR2_PACKAGE_GROUT
 	select BR2_PACKAGE_LIBEVENT
 	select BR2_PACKAGE_NUMACTL
 	select BR2_PACKAGE_LIBECOLI
+	select BR2_PACKAGE_LIBMNL
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS
 	help
diff --git a/package/grout/grout.hash b/package/grout/grout.hash
index 248c375710..b032c23918 100644
--- a/package/grout/grout.hash
+++ b/package/grout/grout.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  6d1ba4fda3fec6cbc5d4f4d48fe2435fabd36b27540a439a01a44361f6998971  grout-0.13.0.tar.gz
+sha256  52dcf7be2394625a5268a5b7e1f5240826981fa7bfd27a2ce2b2a995b58d4aae  grout-0.14.1.tar.gz
 sha256  1e412aae8da58b718c78b3d7a52eb547004384d4347e4746a22ca6af7522930c  licenses/BSD-3-clause.txt
diff --git a/package/grout/grout.mk b/package/grout/grout.mk
index 07ea585a01..56cc68d1aa 100644
--- a/package/grout/grout.mk
+++ b/package/grout/grout.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GROUT_VERSION = 0.13.0
+GROUT_VERSION = 0.14.1
 GROUT_SITE = $(call github,DPDK,grout,v$(GROUT_VERSION))
 GROUT_LICENSE = BSD-3-Clause
 GROUT_LICENSE_FILES = licenses/BSD-3-clause.txt
@@ -16,6 +16,7 @@ GROUT_DEPENDENCIES = \
 	host-pkgconf \
 	dpdk \
 	libevent \
+	libmnl \
 	numactl \
 	libecoli \
 	util-linux
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
