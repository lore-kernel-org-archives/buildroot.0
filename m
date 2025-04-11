Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D4EC369A2
	for <buildroot@archiver.kernel.org>; Fri, 11 Apr 2025 23:09:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B69B941E4D;
	Fri, 11 Apr 2025 23:09:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CjmgYDRBibTS; Fri, 11 Apr 2025 23:09:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC40D4054E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC40D4054E;
	Fri, 11 Apr 2025 23:09:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 68EB5108
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 23:09:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 582D141E50
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 23:09:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kG8LohrmKgNP for <buildroot@buildroot.org>;
 Fri, 11 Apr 2025 23:09:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com;
 envelope-from=charlie@rivosinc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 06D3541E49
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06D3541E49
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 06D3541E49
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 23:09:08 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-2243803b776so37166995ad.0
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 16:09:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744412948; x=1745017748;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i0sDwWLHQ7+OzfjN8g8ByuVrOYhDd7tg0fUaUzyAHmc=;
 b=w5GqK5dy1S96BDywUqMRfn4v+7Kk+00tONXpEB0VSW8NAp9uwXFnBZkFxYArR4+VES
 XPgaKBHz/Ldc0M4UwtQ5Uv5Ld6VlJHSs2vFGU0GMLpggduFbbdLsuSnVs0Kh/+3iXbNE
 dz7ZLjHwN7lZYOUKouHDUWG+yP+8Y1bWCQzLEGqknGkOw9yXAYqE9H94Mv+1QUWsvVgv
 WTvkbQhVvmuxWzkDOaeoIELS+/pjkvtK6GPRNFHRdILKyZ5CatUCZY1JvApMTR1qXPpg
 OgTrU/B4T29Z1yw7BOaPZ4SFl2prUHan3oWPtC1npMgBU38BX2lg+MNOZf0MCm+Q/ta1
 hCVg==
X-Gm-Message-State: AOJu0YwEeKtn3TbA2y56feFbUQuPXQTpkE+47HE0mZV325bKFw/R7yTw
 qC6GqLNOdxVfgov2gxoOVM9WkpRYA1SAWUWuBqk6G9kz2ddB8edNwEMl2F79Rtc=
X-Gm-Gg: ASbGnctrkldPt5S9uR7e/BkTSo3jrD8gS7Ftnp4QC4Maic/IfbzvxNr75Q5RNTX2HVy
 gRgB0AmF9/fjuBOJRt5fqntriujPQwZkSQ5j6kG1ndTF2m4Xrxyv3XKW+NzQICjsUii8N/LorD6
 IO2C9Gi2aIm5zn/aydYXOAIw2kuxmMvDOaIv3GPswNV5Bynrt38bqLUhGWTfLUIb7y76VPgr6vJ
 Q4q9Zp4i1pexHDn3PZrkTcUoxC9JAtybGmqtSATGkmsJI8fhYau2Xnurod8kVshGyNwCCRn9gYd
 R1/07Y2FJOa2IBk7lvzMoGZgBzM3yYQymBKJZIiBns3UGyOAIwN62ZY3
X-Google-Smtp-Source: AGHT+IFvgu++T7Kb4m5hcFmM+hr2MtKMy5pYOQCW/F1I377X5oXsY3IRnDftEKHHOm0MShqNuWsx6Q==
X-Received: by 2002:a17:902:ebd1:b0:224:1074:63a0 with SMTP id
 d9443c01a7336-22bea4ef9a8mr66784515ad.34.1744412948022; 
 Fri, 11 Apr 2025 16:09:08 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22ac7cdfe37sm56090665ad.238.2025.04.11.16.09.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Apr 2025 16:09:06 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 11 Apr 2025 16:08:53 -0700
MIME-Version: 1.0
Message-Id: <20250411-fix_external_toolchains-v2-1-fdf1ca2ca849@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIAASh+WcC/4WNQQ7CIBREr9L8tRioaIkr72GahsLH/qRCAw2pa
 bi72Au4fJOZNzskjIQJ7s0OETMlCr5Ce2rATNq/kJGtDC1vr/wiOHO0DbitGL2ehzWEudbIJ2b
 FqIy0mo+ooK6XiLV6mJ995YnSGuLnOMril/53ZsEEk/LmpNKuM657RMohkTdnE97Ql1K+9Q5G4
 8EAAAA=
X-Change-ID: 20250310-fix_external_toolchains-d1b8c4da0be8
To: buildroot@buildroot.org, Arnout Vandecappelle <arnout@rnout.be>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 Romain Naour <romain.naour@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2491; i=charlie@rivosinc.com; 
 h=from:subject:message-id;
 bh=1wygGw3gBkOnaU7dgIQILHnRfiPLlE6SXzg4LQBthEs=; 
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/rPhTw6XsKJbtfXhU2JYrS+aXYk1W4Pm4CjgEoa3z5Z7
 1Pat1g6SlkYxLgYZMUUWXiuNTC33tEvOypaNgFmDisTyBAGLk4BmIiVIiPD85WR87NmLn+4ov9w
 lfKG7qXWvzvtq267O79UeXNHwMWTn+F/EafH/sK5pfGJUWK14r2/p8lG3rqlrRCXctdNzrf/cjI
 vAA==
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744412948; x=1745017748;
 darn=buildroot.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=i0sDwWLHQ7+OzfjN8g8ByuVrOYhDd7tg0fUaUzyAHmc=;
 b=DL0biyGuq9pu6xEcqJOs2OU0ZcfbQO8nVCRtXGw3ERt/hhvYbjF7tmG/97JjHfiryg
 dAMW2efIjxnEeJ1kKGoaqt9bB0OzhfAT08HumHWjw2Dt3jwfs+ksYW92cQ5qluRrDbv7
 6Z1GSs2W0FtIobaoE8RR3hmbHm7X96iTia39WdGfr9czl+BIQvT5XlmMXrmcjfpFsfpI
 x7wV2T0mb89YXjzWI0AoBwfbSgyZZXskbzu6TyDZlbZalp/eBO2o2OtaeRZwLevKQdHN
 OBs+QwkyXvg2X4agoHgogtXDuIOz8bQW2pNAGBfhnJvmLVR3jn2BdaB8RDgyThfedqj/
 WnZw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=rivosinc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rivosinc-com.20230601.gappssmtp.com
 header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=DL0biyGu
Subject: [Buildroot] [PATCH v2] toolchain-external: Fix external toolchains
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
Changes in v2:
- Reduce rsync to root cause. The previous solution was very
  heavy-handed as pointed out by Arnout. This seems to be the proper way
  of doing this.
- Link to v1: https://lore.kernel.org/r/20250310-fix_external_toolchains-v1-1-446f48af7cf7@rivosinc.com
---
 toolchain/helpers.mk | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index f3fdaaec07c5a01688da685c4d0fd4e2cb357b95..c47f8cd80cf19be7a8a72e9d40eb7327705a3de7 100644
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
@@ -114,9 +117,15 @@ copy_toolchain_sysroot = \
 			continue ; \
 		fi ; \
 		if [ "$$i" = "usr" ]; then \
-			rsync -au --chmod=u=rwX,go=rX --exclude 'locale/' \
-				--include '/libexec*/' --exclude '/lib*/' \
-				$${ARCH_SYSROOT_DIR}/$$i/ $(STAGING_DIR)/$$i/ ; \
+			if [ "$(BR2_ROOTFS_MERGED_USR)" == "y" ]; then \
+				rsync -au --chmod=u=rwX,go=rX --exclude 'locale/' \
+					--include '/libexec*/' \
+					$${ARCH_SYSROOT_DIR}/$$i/ $(STAGING_DIR)/$$i/ ; \
+			else \
+				rsync -au --chmod=u=rwX,go=rX --exclude 'locale/' \
+					--include '/libexec*/' --exclude '/lib*/' \
+					$${ARCH_SYSROOT_DIR}/$$i/ $(STAGING_DIR)/$$i/ ; \
+			fi ; \
 		else \
 			rsync -au --chmod=u=rwX,go=rX --exclude 'locale/' \
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
