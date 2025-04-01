Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A9F4C36010
	for <buildroot@archiver.kernel.org>; Tue,  1 Apr 2025 11:36:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D50A8475B;
	Tue,  1 Apr 2025 11:36:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9N8_N1Wa02Fm; Tue,  1 Apr 2025 11:36:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31A7583EFE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31A7583EFE;
	Tue,  1 Apr 2025 11:36:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 592E817E
 for <buildroot@buildroot.org>; Tue,  1 Apr 2025 11:36:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F22580DBA
 for <buildroot@buildroot.org>; Tue,  1 Apr 2025 11:36:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tl_aJo6l5VCd for <buildroot@buildroot.org>;
 Tue,  1 Apr 2025 11:36:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3E3B081006
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E3B081006
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3E3B081006
 for <buildroot@buildroot.org>; Tue,  1 Apr 2025 11:36:40 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-ab7e08f56a0so74315366b.1
 for <buildroot@buildroot.org>; Tue, 01 Apr 2025 04:36:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743507397; x=1744112197;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oFV//MF+dwIIigojJR84pTFJ6OkFSt3Jb5VFXtIpr4s=;
 b=cQlPNjVOXvzdjltHGRWDpepsSHC0Vo130LywSINicn+xb5H5o6urEXJ/+2EchAzsGc
 C1CuYVsuRgIoDvClz0Q3c0ZuZ94YWAbtjprpnYp6SqCbZiDwQT+4GzsBlJf6tG8OfS62
 XY34LNgYQtPBgp+71XnWUHBo5Ep1qDNo6QkLljB9GZQGI2sPOveb4+ghEPQwfr51T4bi
 GRPEzveZDQI00MyRt5haVlAA93XVsTQ7qbU/ex38ZHsT3DbaZxDwh83OxPt6PjiNf8c8
 MpkwaF8cWqnoxh3h5bLYdRDjCJe4+LRiqkVYBDKJlqiDgd3SzK2sL6Gzn/eQ/D5MQ7ud
 JG+w==
X-Gm-Message-State: AOJu0Yzs5XFLvFELT/CeO77FMtVAFAxZD/hgZq0n5C2/HQthzDcZVi2t
 4gRjPv09hkNHmm49yY9diPsH/dIH0RmTxpJxLqnLrE93vCaOWUjwfULQ81v8Xq7ViLzA/f7vcSO
 +
X-Gm-Gg: ASbGncvPBjkIn7ZXS5q1d5To6jNxpioF8O2WeJupxN+lSe10pZoU3l5fTt9tALJ1M7a
 d9Gl/u24bLeLgAAvLt+iw0mNBiE0vJv7iCY4YKDxDE8Ido8WDGIFwTcWLqG3f6JVmZBssdLlejb
 9mM1lIB/bZ0QOTt2FlPfzkuzPdwP1VHjUIBcS+hJC2KebW69V5ieLJGwmkPxoLsFv0p2KFKlMSq
 2PhqkjBS/RbqzLOzrdgAwjoKAd8jjTqwsK4A12+ivlKrBgIMGHlE0jD4LKRMVcLL2Mi9Pa/nAN1
 RHl+1E3VJqV7LT7X6Nx76IDXqPpwGa5/2Kfu+HISTfTEMBZ1lIqoQxNYehCCN8VlIzH7hQmbNHx
 xwft7N49Zs5h/N+CLaiL63G3M9U8O/q9yMbnXKV4mM8FF6Dw/9nD3O9XYiWqeduLN/Cl3wzF1tv
 gYGHhysa7EQQ==
X-Google-Smtp-Source: AGHT+IEuztm6oT6rFU1pb4Aq7yY1XJALY9LsDfFIRDVFAalDNJNJQmNqWvIBo1DB2c3LgzrBAAxwZA==
X-Received: by 2002:a17:906:f40f:b0:ac7:3911:250f with SMTP id
 a640c23a62f3a-ac788d5fae6mr65245566b.14.1743507397322; 
 Tue, 01 Apr 2025 04:36:37 -0700 (PDT)
Received: from fedora.arnhem.chello.nl
 (2001-1c00-8182-4700-7c66-a2ec-386c-e866.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8182:4700:7c66:a2ec:386c:e866])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac7196ccfdasm747620166b.153.2025.04.01.04.36.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Apr 2025 04:36:36 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Tue,  1 Apr 2025 13:36:33 +0200
Message-ID: <20250401113633.900601-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1743507397; x=1744112197;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oFV//MF+dwIIigojJR84pTFJ6OkFSt3Jb5VFXtIpr4s=;
 b=ba0jkkKDe1og0a+GBG8mUKosMcCpCqdIjSqWHzLP24sD6nusxC981wCXSsgxfc/h+I
 5twaEDPyx+pEUhxfpzlBc7vr6I1cZW3zN7zVACX+b7WSZ2uZV/F675poCH2qc+lU25hL
 e/O005xy7VRHBIHdhLpE2iJJgkXtt5KzBtxIA=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=ba0jkkKD
Subject: [Buildroot] [PATCH 1/1] package/mender-grubenv: bump version to
 e4cdd9db213de15e79576b40fd3f07736ac85709
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

- Update License hash due to year change.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/mender-grubenv/mender-grubenv.hash | 4 ++--
 package/mender-grubenv/mender-grubenv.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mender-grubenv/mender-grubenv.hash b/package/mender-grubenv/mender-grubenv.hash
index d7f784493c..f3083e5d39 100644
--- a/package/mender-grubenv/mender-grubenv.hash
+++ b/package/mender-grubenv/mender-grubenv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0bac59698165a8dafdd282610246addd7bebf41612efa88c77b779f8ffb5ed9d  mender-grubenv-38e5043a215f696d126a2d707c9db9aeb93cfb2d.tar.gz
-sha256  d0f406b04e7901e6b4076bdf5fd20f9d7f04fc41681069fd8954413ac6295688  LICENSE
+sha256  bdb055332952f471d36d30cf8148d1d34eae16b8671cfd98200eaab5bc392a7f  mender-grubenv-e4cdd9db213de15e79576b40fd3f07736ac85709.tar.gz
+sha256  38791d93beae962b266e11ac888ea2af4f07578b272c2f9dcb05f54f32960a76  LICENSE
diff --git a/package/mender-grubenv/mender-grubenv.mk b/package/mender-grubenv/mender-grubenv.mk
index a47531fe58..cf2f7520c0 100644
--- a/package/mender-grubenv/mender-grubenv.mk
+++ b/package/mender-grubenv/mender-grubenv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MENDER_GRUBENV_VERSION = 38e5043a215f696d126a2d707c9db9aeb93cfb2d
+MENDER_GRUBENV_VERSION = e4cdd9db213de15e79576b40fd3f07736ac85709
 MENDER_GRUBENV_SITE = $(call github,mendersoftware,grub-mender-grubenv,$(MENDER_GRUBENV_VERSION))
 MENDER_GRUBENV_LICENSE = Apache-2.0
 MENDER_GRUBENV_LICENSE_FILES = LICENSE
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
