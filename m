Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE734C369AB
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 00:10:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7514A4140F;
	Wed, 16 Apr 2025 00:10:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KNmXvxF5KheL; Wed, 16 Apr 2025 00:10:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D00441446
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D00441446;
	Wed, 16 Apr 2025 00:10:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A9C8108
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 00:10:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 309FB41E6D
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 00:10:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sfI-FacuUyp2 for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 00:10:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com;
 envelope-from=charlie@rivosinc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B2FB441E63
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2FB441E63
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B2FB441E63
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 00:10:43 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2295d78b433so64573695ad.2
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 17:10:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744762243; x=1745367043;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MBYmqF0x73lrAF4Nu6wSUkCxCfyDM0r5UoygFOWCH1w=;
 b=CUzmBf2tkwcMXgDO1asxXNJ5ppV16RD3K2U07wQSjjo9Wrd0uGrW5ezYpgfhlPODOO
 klfLIK0yBbmmcce4r69QD8UIXYzxKzmBAO/jlWX3+F38q/d2pzynjTe3ubqHqvXIoJ59
 co7vtIwYJv3lnWBOR+iFXmMaPeGDttABqf+5gxobFwLaVyzGosroihmv1la6tio3UDdL
 Q01nPon2cmREhB12SXXsSeFe2smgqh9Uyh/P3iwiVHLnCTDt/IaH79ZvfUd0iQ9Anc+R
 flBWcfoBB66ytid83EqD8EaLmbos4nD1T3CQFve+uv4MZmIrPPtfjDcllL0V7wCaQdvJ
 G8bg==
X-Gm-Message-State: AOJu0YyisMY7+IvV+NiPLnKr3LUdZK8kKuDQM3BNOj3ycI8Oo/zgBWki
 S/yudiZJYgb7yq3LpWqjI/SkW6TMNzyHBL8ncbeQoOE0X7OzZONyY5O4g80l4mE=
X-Gm-Gg: ASbGncuIdCJNVwXGuDA6QhLlEJaz0VBJSTpfRi1oqoIAjfHETSqhBTXEEd7CuqXWB9a
 hyZV+UITsXM3ylDFRclGfZNC08/vVgouvjpnSbMpX5DfWChQ1xnXDx2EaMQ4AU6dlE3YpcsRifv
 Fu0G4JpZ7gqcF3s0Z/XKe0ZGetdP4F6KcUfbPSIa6gtVUz3ZuGKdXvABAakVClAE4H33pmijGhX
 HOls6PQfZdgINwIy/M6J/viMNjG6oINDWCBpyXC0ewtkskL9fCzg2+zVD40oQ93aW5r5dFGbDjq
 IMaNu6ULn9Q6aqNp/+2/kjCiCzLxYSmDofZllTaGfOoxJdztlGWo+AeHtkn76xqAwTg=
X-Google-Smtp-Source: AGHT+IFpiPXeWbEFSD+GA0sSMP1F2HxYPcQ/ma5h8/FNgu9E4lQ+DI+gHcl4QXM58AaUV/+/XHCiVQ==
X-Received: by 2002:a17:902:d581:b0:224:18bb:44c2 with SMTP id
 d9443c01a7336-22c318b1282mr14886135ad.6.1744762242893; 
 Tue, 15 Apr 2025 17:10:42 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22c33fcea58sm1313175ad.199.2025.04.15.17.10.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 17:10:41 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 15 Apr 2025 17:10:32 -0700
MIME-Version: 1.0
Message-Id: <20250415-fix_external_toolchains-v3-1-81609e84100a@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIAHf1/mcC/4XN0QrCIBQG4FcZXmeos2Zd9R4Rw+mxHVgaOmQx9
 u653QRBdPkf/v87M0kQERI5VzOJkDFh8CXUu4qYXvs7ULQlE8HEgdWcUYdTC9MI0euhHUMYSg1
 9opZ3ykirWQeKlPUzQqlu8vVWco9pDPG1Pcp8vf43M6ecSnl0UmnXGNdcIuaQ0Ju9CQ+ysll8K
 Mn5b0oUylnHjRZGK3n6opZleQMrsQ7dDAEAAA==
X-Change-ID: 20250310-fix_external_toolchains-d1b8c4da0be8
To: buildroot@buildroot.org, Arnout Vandecappelle <arnout@rnout.be>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 Romain Naour <romain.naour@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2278; i=charlie@rivosinc.com; 
 h=from:subject:message-id;
 bh=+tKbqpZ6fMcTKQ3UIpSZLIHXw+Y5ACicz8VrLWwVhiA=; 
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/q/rzWze23fdCs5pr01O1grxsRqc8Msdt3DHc2yzkfSR
 AUud8Z0lLIwiHExyIopsvBca2BuvaNfdlS0bALMHFYmkCEMXJwCMJEptxn+J/k9dq01tlaV1tyV
 LXFrXsKR9zt+3tfknXIlxby0dtpsUYY/HDPLoz861v2znxaSwH26svL8Upt/U9tUWf9yOlWvWWL
 ICwA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744762243; x=1745367043;
 darn=buildroot.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MBYmqF0x73lrAF4Nu6wSUkCxCfyDM0r5UoygFOWCH1w=;
 b=r5wP+deEAuxzn34OTiGD9d19TnQURIIxfGRrgnk7EBiUzLOsqOMOlsJnTfVrtmljGi
 n3Ux2aUzI6TilFKmDsJExyysrhx7Lx3D/VrBNbaQuIhqGyJLoUraSZhTneC8ncN4T53x
 lga6qb9LdNlOXhbu+pHEkzzEHcTYTO8pqWYsOp4h9HBAufqO0RYZA/F3e1NhLLob6dSr
 w6xuGtm+9hyPndTk8Aq8rZ/hFEUHHWEZDEm0v9cjNeQ8fGRrnbRshzutITGqMjxDVao+
 DhrXtUSpVEUwvuYfsgXrBeEfso06M9wUCfXNYLzvEw7sSP591jBozv+ZJp6imL8cfFYx
 SKBA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=rivosinc.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rivosinc-com.20230601.gappssmtp.com
 header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=r5wP+deE
Subject: [Buildroot] [PATCH v3] toolchain-external: Fix external toolchains
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

External toolchains like crosstool-ng place libraries at /usr/lib and /usr/lib64.
When BR2_ROOTFS_MERGED_USR is enabled, these libraries were not being
copied into the target. This caused these toolchains to be unusable with
this option.

When BR2_ROOTFS_MERGED_USR is selected, copy the /usr/lib and /usr/lib64
directories to the target respectively.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
I originally reported this issue here [1].

[1] https://lore.kernel.org/buildroot/Z86AGdrKHaUqgLVt@ghost/T/#t
---
Changes in v3:
- Simplify patch further to fix the core of the problem
- Link to v2: https://lore.kernel.org/r/20250411-fix_external_toolchains-v2-1-fdf1ca2ca849@rivosinc.com

Changes in v2:
- Reduce rsync to root cause. The previous solution was very
  heavy-handed as pointed out by Arnout. This seems to be the proper way
  of doing this.
- Link to v1: https://lore.kernel.org/r/20250310-fix_external_toolchains-v1-1-446f48af7cf7@rivosinc.com
---
 toolchain/helpers.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index f3fdaaec07c5a01688da685c4d0fd4e2cb357b95..7acb535cc4a6730c07487aec7e90cefd6a6202e9 100644
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
@@ -113,7 +116,7 @@ copy_toolchain_sysroot = \
 		if [ ! -d $${ARCH_SYSROOT_DIR}/$$i ] ; then \
 			continue ; \
 		fi ; \
-		if [ "$$i" = "usr" ]; then \
+		if [ "$$i" = "usr" ] && [ "$(BR2_ROOTFS_MERGED_USR)" != "y" ]; then \
 			rsync -au --chmod=u=rwX,go=rX --exclude 'locale/' \
 				--include '/libexec*/' --exclude '/lib*/' \
 				$${ARCH_SYSROOT_DIR}/$$i/ $(STAGING_DIR)/$$i/ ; \

---
base-commit: 4809690d42f9b395ccb76ee7583c199fdd8d42c5
change-id: 20250310-fix_external_toolchains-d1b8c4da0be8
-- 
- Charlie

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
