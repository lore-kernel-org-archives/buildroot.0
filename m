Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9A8AC83F17
	for <buildroot@archiver.kernel.org>; Tue, 15 Jul 2025 08:20:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B00FE820B7;
	Tue, 15 Jul 2025 08:20:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7fiA6f08QDEK; Tue, 15 Jul 2025 08:20:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7F4583547
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7F4583547;
	Tue, 15 Jul 2025 08:20:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D06411AA
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 08:20:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A1AC40123
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 08:20:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id irA_1KfHVFBF for <buildroot@buildroot.org>;
 Tue, 15 Jul 2025 08:20:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 82FDA40169
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82FDA40169
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 82FDA40169
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 08:20:25 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-ae04d3d63e6so1010292266b.2
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 01:20:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752567623; x=1753172423;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ou+ZSjBEWRL9aQF/VO4hgc5hXbfFl2f5q7JTA4ZgfmE=;
 b=QJ1nuea5fcBamFLt11z8lntOXAGUpme7bCeqTY25mY8A+0ySkOctpicKOXb9ayJ0us
 zpAa2SFEJE6S9tSZuLFJ5neWS6lQJjFj+tcc583Bh+gv6ufuClW7DYh8+dp1gfYHTDLs
 VbvYvPsG6sC07ZxoLDHvcP4syc7vbIbGguX96iSWPHDmiXCz28669fWTusB8W3sJT/UP
 arj4prxOXCTIDkO2wAodAia6PKRx6ZpGEl7KciZMe6dqSpcMkLXfZp683jNnek6n/FFL
 yvdV30kTFN81B6T43oA4FRYAuJe45YJWdQtWG2+HWYz8zuJjm2RU/dEtpWEKqux33WZi
 v4Ig==
X-Gm-Message-State: AOJu0YzrB9Q7zpZqU99Aoy4yRKEu1xBvsJ/0uApuloUyfH6gggNcbVCC
 6r3hu6CsmO4mpowBlbiU4Tfbb2+NJzeiSrBjUFpKCXuOKqzHRsu/RhI2tIeAHg==
X-Gm-Gg: ASbGncsrycezeBbKCOt8M50WlhvrJl15ISXhRf3pkMUxJIsRGmbnGhgg1WNqID9Bmno
 ldFM55QX+JqVJ0TUKsc4PGdPxkPoQM+FsnmNOqvtfyfLxE5ZDQYjhXCNH5J5J/Yvi6VzjZCO5AD
 aAJIv6x4EzmHbDYFxXBGLdKVhD2ZlXqdDl3IMDNKn2qZg5CWCIHHnpYvUlspJp3tJ0Yr1e13wKg
 7UBQcrzN51IfnZaEBNjYxvDphHX33UPcUuBV5nCwx1io2+Hg6poy56DBzMS/mhOe9v15biKOPUx
 BOU8dmULQ0uKS0xM4zqBBKXoqPOiX19yIG8qROerAw0ZoFZwYByK9kylRsX56x3ExQoFnaZX6Bk
 Dc18nrW6bvt49FDJqcdQGofgDEum43GVMdXHBDzPVh7U3WfH2EA==
X-Google-Smtp-Source: AGHT+IFwTII+3SVO5ozKPuPEZe4r4C73tAFmiTOJAgc8XhhrHxU7ekuSuJk29/uGVebxnf1+3f8nJw==
X-Received: by 2002:a17:907:fd18:b0:adf:7740:9284 with SMTP id
 a640c23a62f3a-ae6fc110089mr1720155966b.57.1752567622635; 
 Tue, 15 Jul 2025 01:20:22 -0700 (PDT)
Received: from hthiery.kontron.local ([213.135.10.150])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6e82635aasm943974966b.84.2025.07.15.01.20.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 01:20:22 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Romain Naour <romain.naour@gmail.com>,
 Bryan Brattlof <bb@ti.com>, Michael Walle <michael@walle.cc>,
 Heiko Thiery <heiko.thiery@gmail.com>
Date: Tue, 15 Jul 2025 10:20:17 +0200
Message-Id: <20250715082016.109224-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752567623; x=1753172423; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ou+ZSjBEWRL9aQF/VO4hgc5hXbfFl2f5q7JTA4ZgfmE=;
 b=WFFGDaaaIT4MwFAFUtgx6HDxKEpErt80mqlz2l01rQXdFB6AXTGIRfnYt3tfCDNnjV
 +WUWgl7+1vdM9KhlJfh0DQ82uhHu81NKz2kDH7Ul1UnEl7OwTgEPKSES7us/TqHz/vnJ
 FGcB9S5LmjdDtYhAwJsV/jSfKJlMp44R7rHqIdvRDg/KR1EScarVsD10HrxTcbulBMjI
 XI5oDnPXMAmYCFgflpKzBPuT/ld/eRGhJfrG6YhqfHrJ84D7ysdEaKve2M9dzoo+gPVT
 +n1b4+rAvDMKi9OdDBAQbJjLT49NoigkfW6z1VWQDd4X/SwLw6T5gL5FzpcdCvlY2WEe
 igPA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=WFFGDaaa
Subject: [Buildroot] [PATCH v2] package/mesa3d: add support for imagination
 vulkan driver
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

This adds the experimental vulkan support for the PowerVR rogue
architecture.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
v2:
    - update dependency according the requirements for libxshmfence (Julien)

 package/mesa3d/Config.in | 8 ++++++++
 package/mesa3d/mesa3d.mk | 1 +
 2 files changed, 9 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index b5c1d92d68..924437f033 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -359,6 +359,14 @@ config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_BROADCOM
 	help
 	  Vulkan broadcom driver.
 
+config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_IMAGINATION
+	bool "Vulkan imagination driver (experimental)"
+	depends on BR2_arm || BR2_aarch64
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
+	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
+	help
+	  Vulkan imagination driver.
+
 config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL
 	bool "Vulkan Intel driver"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 998fd25584..716e11044b 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -135,6 +135,7 @@ MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL)    += virgl
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ZINK)     += zink
 # Vulkan Drivers
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_BROADCOM) += broadcom
+MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_IMAGINATION) += imagination-experimental
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL)   += intel
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_SWRAST) += swrast
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_VIRTIO) += virtio
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
