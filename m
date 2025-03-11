Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94195C282DE
	for <buildroot@archiver.kernel.org>; Tue, 11 Mar 2025 02:48:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00093406DF;
	Tue, 11 Mar 2025 02:48:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5G_Lz2DQ9FWG; Tue, 11 Mar 2025 02:48:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C874B4081E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C874B4081E;
	Tue, 11 Mar 2025 02:48:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AB40EEDF
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 02:48:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F96B606BF
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 02:48:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z1CbSebZbotD for <buildroot@buildroot.org>;
 Tue, 11 Mar 2025 02:48:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com;
 envelope-from=charlie@rivosinc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 36DFD60664
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36DFD60664
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 36DFD60664
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 02:48:44 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-2254e0b4b79so27672345ad.2
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 19:48:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741661324; x=1742266124;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oJi1QNEr+ja5ML1eRTv6gDCJgdUoDVk5Wwj/OAC+mHs=;
 b=T7ePlP6BQfPcjrKOaA9WGlqVRWZ1KKgieMrF8g4/ca7M6vNZfx9kuhHmrIIaLqxXvb
 2ELfz9x+plCU7T+yyLYjT6pPOI5dN+G8cMLu9KpDNMiCAY2BnfI6ub7iOYFHD9uP3VcK
 B4FXLBT7QZuUoZfqP0vFa/EANONBwQWu1zGdr8sDJmzwv+cD0Fp9sqI6Qro5DsP2O1sV
 /g+24l6PvrMWqoCZIfAJRYRJvitycetS29JEd1XQ7HS40ZD8HmjFqM3iO50bN0bgaYZ8
 n97zEwJWoryUuGpMPz1GdyjI4w66SoazBlWIK3c3t0lwOkSEGhywELC4KPfNCGR2yS6x
 x3jQ==
X-Gm-Message-State: AOJu0YygPlFLh0lz7I56HTYNDKUXqGKc2fjlYZhExoNIL3CiNRodqRdr
 E6S9ldWnlUJD8/Dx4EiDhDRutmFeWou/avf/0wK9Q2vcAcLsJseSyYmbMeqv0so=
X-Gm-Gg: ASbGncudM0Kd9WyWqpyXlP5h8mES3jT8qAX/BJ96zd+hGIYIf/EJJPkeR7zZG3u4Pyh
 p0U1s0BMU0uhnq3Cm3Hv6Hfpo8kf0IDMvyxrE2vOQy+XZ+zrNkAXd+BuzBnG4V9r8mWpuTIOMth
 /5v2hE38zH31jenmy0ar6uvDGt2owri/o5qMdUwW29hqUgDtJi/Ihko+EHH48k32GZaC+IP7I8J
 xFlJRCxknBcveO3W5XKnqQPsX4A90xm5Go3Pc/qzhXPe7jk91wf3W4AbMUrU+A7UUt2mudKOefv
 XzLXBeqdGcp6a8EMFU6YeSfM1L8EuxdCQmKQHjLIv3a9cqXIGqkZ6m1Jcvfb
X-Google-Smtp-Source: AGHT+IGDrE1FlxxCEr2MS8etjHHfmD73OdUmPxK+/9x9dHax3hcztuTR+rj6aP88nRV4DOBn8XvYTA==
X-Received: by 2002:a17:902:cf07:b0:224:192a:9154 with SMTP id
 d9443c01a7336-22428a8cf90mr253834955ad.26.1741661324432; 
 Mon, 10 Mar 2025 19:48:44 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-224109ea7f9sm86267365ad.84.2025.03.10.19.48.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 19:48:43 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 10 Mar 2025 19:48:33 -0700
MIME-Version: 1.0
Message-Id: <20250310-fix_external_toolchains-v1-1-446f48af7cf7@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIAICkz2cC/x2MWwqAIBAArxL7naA9ILpKhFhutRAaq4QQ3b2lz
 4GZeSAhEyYYqwcYb0oUg4CpK1gPF3ZU5IWh0U2vW6PVRsViycjBnTbHeIpGISlvlmHtvNMLDiD
 1xSjqf57m9/0ALyxruGkAAAA=
X-Change-ID: 20250310-fix_external_toolchains-d1b8c4da0be8
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 Romain Naour <romain.naour@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1955; i=charlie@rivosinc.com; 
 h=from:subject:message-id;
 bh=PrqrwG415bjMJ0KK4fQtqMLDCfcF0Pfd5QC2dZhhGR4=; 
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/r5JS0fTPlmLpaU3VRVdl09p2Ca2LLISYmXz+W+K+vod
 BFMCmDsKGFhEONikBVTZOG51sDceke/7Kho2QSYOaxMIEMYuDgFYCKvwhl+bMzLiqhxm8nv0ali
 HxPdU33AwySxal5U3pH2wJ3PIlUZGW7c4vfY1+H8gW22y/ol97Rv6DEsTu5RzrzOvdm1cJWdJRs A
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741661324; x=1742266124;
 darn=buildroot.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oJi1QNEr+ja5ML1eRTv6gDCJgdUoDVk5Wwj/OAC+mHs=;
 b=PrXw8ywZhRqcK9qezbYRQ2/EE91OlvbCO1fnI/ONR6O/h1khEQKbBfiBD0SRoCTWNy
 rN5HailYSGgfmeSh7pHooytdWkmBe+dymyTs4jpvDxRJBY9uqaaPEwxIDsuoU38EXjbp
 7JAAkwrINK3XlVTsMAqsbwzTNAKJY6FNeeItnLQ2GI1FsQb7OpOklHyXe0LBzJbrDAPm
 +JPhl5HGVJqul5mHC0eEwes38V3eR90WXiuP6ds1awcP+/PS+g4CfCPizUCn65RzWjb4
 K3P7FlZeOpqoAfFBDnZ7MrkbMzn+yI9i6DqZTureRoIZED0tOgjDgjE/wFTEBa8ylaWl
 7z5w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=rivosinc.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rivosinc-com.20230601.gappssmtp.com
 header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=PrXw8ywZ
Subject: [Buildroot] [PATCH] toolchain-external: Fix external toolchains
 when BR2_ROOTFS_MERGED_USR
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

External toolchains like crosstool-ng place libraries at /lib.
When BR2_ROOTFS_MERGED_USR is enabled, these libraries were not being
copied into the target. This caused these toolchains to be unusable with
this option.

WHen BR2_ROOTFS_MERGED_USR is selected, copy the /lib and /lib64
directories into /usr/lib and /usr/lib64 respectively.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
I originally reported this issue here [1].

[1] https://lore.kernel.org/buildroot/Z86AGdrKHaUqgLVt@ghost/T/#t
---
 toolchain/helpers.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index f3fdaaec07c5a01688da685c4d0fd4e2cb357b95..b565da8a3a8f12567920f14dd3b6a18e548da6c7 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -55,6 +55,9 @@ copy_toolchain_lib_root = \
 # corresponding architecture variants), and we don't want to import
 # them.
 #
+# Furthermore, when BR2_ROOTFS_MERGED_USR is enabled, the 'lib*' directories
+# need to be copied over to usr/'lib*'.
+#
 # If ARCH_LIB_DIR is not a singular directory component, e.g.
 # 'lib32/octeon2', then symbolic links in ARCH_LIB_DIR and
 # usr/ARCH_LIB_DIR may be broken because Buildroot will flatten the
@@ -109,6 +112,10 @@ copy_toolchain_sysroot = \
 	ARCH_SUBDIR="$(strip $3)"; \
 	ARCH_LIB_DIR="$(strip $4)" ; \
 	SUPPORT_LIB_DIR="$(strip $5)" ; \
+	if [ "$(BR2_ROOTFS_MERGED_USR)" == "y" ]; then \
+		rsync -au --chmod=u=rwX,go=rX $${ARCH_SYSROOT_DIR}/lib $(STAGING_DIR)/usr/lib 1>&2 ; \
+		rsync -au --chmod=u=rwX,go=rX $${ARCH_SYSROOT_DIR}/$${ARCH_LIB_DIR} $(STAGING_DIR)/usr/$${ARCH_LIB_DIR} 1>&2 ; \
+	fi ; \
 	for i in etc $${ARCH_LIB_DIR} sbin usr usr/$${ARCH_LIB_DIR}; do \
 		if [ ! -d $${ARCH_SYSROOT_DIR}/$$i ] ; then \
 			continue ; \

---
base-commit: 4809690d42f9b395ccb76ee7583c199fdd8d42c5
change-id: 20250310-fix_external_toolchains-d1b8c4da0be8
-- 
- Charlie

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
