Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D22D6E77197
	for <buildroot@archiver.kernel.org>; Thu,  9 Jan 2025 08:58:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89A668083C;
	Thu,  9 Jan 2025 08:58:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BH9XCZ2cHt96; Thu,  9 Jan 2025 08:58:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A617A80847
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A617A80847;
	Thu,  9 Jan 2025 08:58:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 949C1940
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 08:58:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F0D7401EA
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 08:58:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6rqrj_yZoEO1 for <buildroot@buildroot.org>;
 Thu,  9 Jan 2025 08:57:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 55DB0401B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55DB0401B1
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 55DB0401B1
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 08:57:59 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2166f1e589cso12175915ad.3
 for <buildroot@buildroot.org>; Thu, 09 Jan 2025 00:57:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736413078; x=1737017878;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZRSg4qFEOyNZ/SPOhgzre9v9ZBzRX27343B1TKklNLw=;
 b=eDd7I985Zp5YGz5uwK/1RxEIZmDGGnIsVaawh7axSj5Li+MPryG2b9gRa/oidNFJs5
 bYQFrS7EsklUMOlocPJ0XWIQbWztfNG6RKDrVcPkQlsJ5PIO3ape0UhzSa9qgYzP13pA
 pnvKVNFYnC+sJEVg9SvDnCnHQen7twJcLPEBvRzwr+kAen9oN2nxDE30PxZN6ihKL6YN
 JQoTX/ZGXNtcRz42xbDdbcu78aEb5aC6Ux8VbIpyLEXxJ/EJJUHayU98lC6az0PsT9Ea
 ZX0cH8e5fqkRRwIO8OBI1BNM7vgpo0L0Fv/HO8MgK0fYNabRvkvy42NzHXOSj03CRQlI
 O/fA==
X-Gm-Message-State: AOJu0YyEVW4foJHJPS5U+zCjHDHupfcYlV4OmVy379jER+dVSBewroN/
 HJ7vjo4AHlwAnMBSGTsJ19+jQl/T5h94XaBAidLyBGlLNagThSwhdEFor5QQ
X-Gm-Gg: ASbGnctuk0zUNwc29Mz7wQCLqH8hQg26xkhWfFTHHHE/CAaOobBfJkMZRZCvB1nKS5F
 cCZ0jBlyzcod6T34keulou0MgmF0DSUQDrN3GPDp64ze7Je2t6RI5uMgkns2jr2cz9ik0m3gC9B
 ho62MgSiu8eRGJYN8sCD1H+aoWhcRlFabGczvKpdbGKG4wiZQdt3M6PMrI+r5Qi1dDkLPH2dUPB
 IUMmgFYLDd9DepREhcS0goO3IQnRTXq7XX5pLqyb9I0N7qIgfb0RDqcTJqeWxzpuklnNZPhBqlA
 Ll61SMrXHaS2h+TrX5k8sTBhH2TlJUZ1nruy3kEe
X-Google-Smtp-Source: AGHT+IHPbgqQFksUJek0XARNBJsCZRC+SSH65jViLrDzd3Kgjxdo0gis1C32I+KeWiNrF/wQtxgK6w==
X-Received: by 2002:a05:6a20:a103:b0:1e1:aab8:386a with SMTP id
 adf61e73a8af0-1e88d115298mr9752883637.18.1736413078182; 
 Thu, 09 Jan 2025 00:57:58 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-a31d5047ea0sm806583a12.58.2025.01.09.00.57.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 00:57:57 -0800 (PST)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Thu,  9 Jan 2025 00:57:54 -0800
Message-Id: <20250109085754.760776-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736413078; x=1737017878; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZRSg4qFEOyNZ/SPOhgzre9v9ZBzRX27343B1TKklNLw=;
 b=VfjtO8WgtUQ3wwu+dPrLBl5q4aG22rl9KgViQ9tOebKjfEUv5ILES0IArDXLhMtDC6
 EimyXv2e4OXsfLR5qGb4yBmT/BQU0tvHV5pvwKREWZRcYP0jjBAP26Km0c1m58XqIKUd
 G2Lr7QaapeOIAlN9dvrDI3daaEOR5GLGiCFD9leIFWnv23Yl9SXkXySs2wz6VX04jR7L
 2p/dprOCTtJWjSY+jFb4v/PW1a1IA9x+i0RlhyrnZ0O8mCRkyR/GDsOBwTC6K2HL9DPP
 /K56bHhN2LZlg8K8FpYbAvE4kUYkYzvsO9pLEaaLmqc6H3iGx0Td3icySTyRyBe0HJii
 L2Pg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=VfjtO8Wg
Subject: [Buildroot] [PATCH 1/1] package/e2fsprogs: bump version to 1.47.2
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
https://github.com/tytso/e2fsprogs/blob/v1.47.2/doc/RelNotes/v1.47.2.txt

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/e2fsprogs/e2fsprogs.hash | 4 ++--
 package/e2fsprogs/e2fsprogs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/e2fsprogs/e2fsprogs.hash b/package/e2fsprogs/e2fsprogs.hash
index 94ce2d5bc9..1e97e4363a 100644
--- a/package/e2fsprogs/e2fsprogs.hash
+++ b/package/e2fsprogs/e2fsprogs.hash
@@ -1,5 +1,5 @@
-# From https://mirrors.edge.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.47.1/sha256sums.asc
-sha256  5a33dc047fd47284bca4bb10c13cfe7896377ae3d01cb81a05d406025d99e0d1  e2fsprogs-1.47.1.tar.xz
+# From https://mirrors.edge.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.47.2/sha256sums.asc
+sha256  08242e64ca0e8194d9c1caad49762b19209a06318199b63ce74ae4ef2d74e63c  e2fsprogs-1.47.2.tar.xz
 # Locally calculated
 sha256  5da5ef153e559c1d990d4c3eedbedd4442db892d37eae1f35fff069de8ec9020  NOTICE
 sha256  032989b508f1a72ebee5b3417e55d06d473f9ee203e45ab11864a7e49cdec63d  lib/ss/mit-sipb-copyright.h
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 7e2d9a739d..61d89add3c 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-E2FSPROGS_VERSION = 1.47.1
+E2FSPROGS_VERSION = 1.47.2
 E2FSPROGS_SOURCE = e2fsprogs-$(E2FSPROGS_VERSION).tar.xz
 E2FSPROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/tytso/e2fsprogs/v$(E2FSPROGS_VERSION)
 E2FSPROGS_LICENSE = GPL-2.0, MIT-like with advertising clause (libss and libet)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
