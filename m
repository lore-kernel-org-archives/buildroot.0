Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A93A0C0218F
	for <buildroot@archiver.kernel.org>; Fri, 31 Jan 2025 17:19:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57F048488F;
	Fri, 31 Jan 2025 17:19:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rhx4aTCTRCjt; Fri, 31 Jan 2025 17:19:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7805784899
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7805784899;
	Fri, 31 Jan 2025 17:19:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 677DD12C
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 17:19:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5FC47412DB
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 17:19:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MYHM2nYKfWY8 for <buildroot@buildroot.org>;
 Fri, 31 Jan 2025 17:18:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=kazemi.ms@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0445E412C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0445E412C4
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0445E412C4
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 17:18:58 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-aaec111762bso566005666b.2
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 09:18:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738343936; x=1738948736;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VhoEuIdjKKrHRsyYWVneKnzozLfWCHmeLEU8YSXnTWM=;
 b=VvspeI9R8/wJc/wzJDTmhZ7M9ZLP7yNXXBbM2T9LTL8U7IxPPZNhdRB3TIQ4bFpjRx
 xvT14KJRM6K6d4dw5v1XcaQSo4ydbXy+uiECKgd0TPv7Q+WdMuowdESoUPTO8T2yJOF3
 BcqR7aTjoLWipPdXE0DtUKmbCVq1eOkY53cZGLdGPO1YMe8oCaoQEHOLcwgxQ+x0t59n
 Admht01eZooLLLxW7yoRKOzZScM6ZRPhKgov0vrZVk+N6d2QAWybpFU9vm1Nph2jXfXr
 XQmBpXNZmfxyUp4eeBjJ5YYiS+KgZbGlhey+x4/Y/cWPPhHWB2+u4GXRip1AdPQPVAY1
 weGQ==
X-Gm-Message-State: AOJu0Yw0X084BHIFGvZgJzSpoJyW/QtwYnhDp4bIv5vRlrr6gpVebsrN
 vpllENxlp5hkf2LkckBj+EkM1viy3XLCtnhniXj7k2jPZnWBzPwyTBWrc4QZ
X-Gm-Gg: ASbGnctarMM6pWqsz6oxlL0b6TZqkoNIZ9qHwlwtwIleAipgn77+kV1dEZjdS//xbfy
 cgXCd8JnEb8b2wsBbhfMgAFhwkqbHb2OQ/Mcw9rDtWSAhlLs0u9oZwnQcXZlOx2p576JJ++OA6F
 8fdhtThP7uEP0gi1vuMuCD1AbQES9oFoHapkutZFnkgZBZlByWX9mU5wbcVSy9RxGLKLI3JUuWG
 IWeeAgdiMN1NnTFtTOtOvt/NX/iz6vvPtNyNOzOvgs6q76zLHkbS+8aHGCZkD1FDu0ZQczj1Vq4
 i9WCmS2EoxOkH4IBTd46PjLej1LeQPFsUyskOWi6EJZbwdsgMOxsnFXYFvq+0pyi1b5Y2cfriu2
 9MGHY8Rh1cieHGaEAgUJct5nnkxYS/XjJ1Sj5jSg5iWe8hBUO30wgMJI=
X-Google-Smtp-Source: AGHT+IEnbbQmWRQWZ6Y2ZtuKXhn5oYmI8XOethD202hWbbLSFjHK03AEcmaI4XaZ9bflSP4+fcdKUQ==
X-Received: by 2002:a17:907:3da5:b0:ab2:b77e:3357 with SMTP id
 a640c23a62f3a-ab6cfcdfda6mr1096625966b.18.1738343936319; 
 Fri, 31 Jan 2025 09:18:56 -0800 (PST)
Received: from saeedkazemi-ThinkPad.dynamic.ziggo.nl
 (2001-1c00-0b8e-2100-a983-d10d-b482-34c3.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:b8e:2100:a983:d10d:b482:34c3])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e4a310dbsm324778866b.133.2025.01.31.09.18.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jan 2025 09:18:56 -0800 (PST)
From: Saeed Kazemi <kazemi.ms@gmail.com>
To: buildroot@buildroot.org
Cc: Saeed Kazemi <kazemi.ms@gmail.com>
Date: Fri, 31 Jan 2025 18:18:53 +0100
Message-ID: <20250131171853.2483009-1-kazemi.ms@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738343936; x=1738948736; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VhoEuIdjKKrHRsyYWVneKnzozLfWCHmeLEU8YSXnTWM=;
 b=Z2t96wCatkUpad3Ijt+UYNmAyEyWudtib2m4SVyjwilWg1ILGlFMAxuv3vIaQh0zDw
 sNMHNucB/SgnDEGu+azSCAlKIyyElnbbT2wwaYn81D21Oai6aYf8bXGO5s6VZ6fYi+z7
 D3GxqtOtPZ65tSp7y5TeC0vS7CafHOs1NYw3AOqS8tehIBEnx3mPCPhTjBYhY18UnYKY
 7F3++7/WzdpEugiAeaEuHrLiUiW4iV0etR727dzAg8S9KH8DV5YDS3xbn63FKs1pQJV0
 iG16arIuTW6VDhxXFiB2O/7IZXN2HQ5DOLf1D3Z3sltCAyrdkTCUM2h53YJCiks6ZSqf
 H9+A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Z2t96wCa
Subject: [Buildroot] [PATCH 1/1] package/zoxide: bump to version 0.9.6
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

Release notes:
https://github.com/ajeetdsouza/zoxide/releases/tag/v0.9.6

Signed-off-by: Saeed Kazemi <kazemi.ms@gmail.com>
---
 package/zoxide/zoxide.hash | 2 +-
 package/zoxide/zoxide.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zoxide/zoxide.hash b/package/zoxide/zoxide.hash
index 1a3a066af9..53d4130f22 100644
--- a/package/zoxide/zoxide.hash
+++ b/package/zoxide/zoxide.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f2d9b9448516919f6d5cf32a5f154c2dc3a90d9fdf0addab9cd6a7824020befc  zoxide-0.9.4-cargo2.tar.gz
+sha256  6a9d7bbde2acbd63bdd0f73715314500322d58cfb845559259c4edb111ab161a  zoxide-0.9.6-cargo2.tar.gz
 sha256  23aa3b08366e4ed6050f3d9950070201802aadbe5675fa1c19f24f4de91cf294  LICENSE
diff --git a/package/zoxide/zoxide.mk b/package/zoxide/zoxide.mk
index 92b4395a87..bd9a7e2acd 100644
--- a/package/zoxide/zoxide.mk
+++ b/package/zoxide/zoxide.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZOXIDE_VERSION = 0.9.4
+ZOXIDE_VERSION = 0.9.6
 ZOXIDE_SITE = $(call github,ajeetdsouza,zoxide,v$(ZOXIDE_VERSION))
 ZOXIDE_LICENSE = MIT
 ZOXIDE_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
