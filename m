Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F950D149D9
	for <buildroot@archiver.kernel.org>; Fri, 25 Oct 2024 17:57:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4995781EAD;
	Fri, 25 Oct 2024 17:57:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id arxDh3Ttc7JZ; Fri, 25 Oct 2024 17:57:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 622D181EB1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 622D181EB1;
	Fri, 25 Oct 2024 17:57:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A7CAA2316
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 17:57:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 86DAC81ED1
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 17:57:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mFomeCvcdZYV for <buildroot@buildroot.org>;
 Fri, 25 Oct 2024 17:57:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::130; helo=mail-il1-x130.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8A62681ECF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A62681ECF
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8A62681ECF
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 17:57:42 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-3a3a6abcbf1so9198585ab.2
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 10:57:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729879060; x=1730483860;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hV964E2+I1dBRrSAzpi0bDEMgWG+uU08+J5xl7NQkq0=;
 b=S7Twe9X0aN6PjZ1P4mtseutcHUpfNxw5PYiQEHFNah2+vey2g2+ZP05ohtO3JGQC1M
 hjoVNl411szDOZMg3nVFKNHd7WRlNID8c9LZWwEcMUSd0dgOEr+Uvg0o2ExcKedWpVHg
 t9R2rovIQ/EVEoeJa6UZxJL23li/bQy5n7a4pGpI/ouTCsIxu65ON8KAGR9MhlRdmESc
 1uUWv6/060PJmh39yqJmkQKLtCZtc8CXAYUdkM3y0BOnbCNkr/s6EE25x0UlqzSlkazq
 9VYeY/wHXvV/Xu3JtwmPPqb4JYRWTPY8GxdsY+lj4FJX6u9dSCidQn6gwrd6QgQJBKOR
 ouSA==
X-Gm-Message-State: AOJu0YwzsL8fqpPvT2NWJDPOdyZQKF/78f7VpHobybuWyzyFHzqWVqOn
 mN/aS+qTNWXRxY4e2O/fTOqWvLTE1It0kfhzPyKkPuy/VvXQH6VoRfpCUA==
X-Google-Smtp-Source: AGHT+IFQL8wI/9Huz9nnU4X+Asbs+XAS0qC5CAA6yx+XubiOM8enib07i+wFQS+UL5eLZskCgr8oxg==
X-Received: by 2002:a05:6e02:1c01:b0:3a3:4175:79da with SMTP id
 e9e14a558f8ab-3a4ed2b0af4mr1029865ab.13.1729879060405; 
 Fri, 25 Oct 2024 10:57:40 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dc7275073dsm358086173.88.2024.10.25.10.57.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2024 10:57:39 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 25 Oct 2024 11:57:38 -0600
Message-Id: <20241025175738.3590724-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729879060; x=1730483860; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hV964E2+I1dBRrSAzpi0bDEMgWG+uU08+J5xl7NQkq0=;
 b=jCFbtiQimVDMFXne7UKLjohGQzejAH0pGZtBtypxu6PTESDy0r4uBOJrSxk/x7Jq+d
 fibtcB2J2+O0u3mPKH3G2toVnWIWf5HPAQl2N7A1f1Nt2YAFiffQbq16amwnpPFyHfqH
 zDX1Hn9NDQojEfW+TbuLF4m4K0jUre9kkXK2O4qLy9aFWT29HgZR9CT5sii1VFHDy6PH
 2jIM6q6qCYf0zgnxnr8rOYIEtdX851zC8Mnei5aEMJsBHJveHFsPKVBsKy8O1t2kcl3f
 CrQwX97Sat2GVlsrqja45qaCv1H9x1KQEUZLpKdHzV4c8GBWM8FZSt5k2Su2rrFhPhc6
 053Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=jCFbtiQi
Subject: [Buildroot] [PATCH 1/1] package/python-grpcio-reflection: bump to
 version 1.67.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-grpcio-reflection/python-grpcio-reflection.hash    | 4 ++--
 package/python-grpcio-reflection/python-grpcio-reflection.mk  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-grpcio-reflection/python-grpcio-reflection.hash b/package/python-grpcio-reflection/python-grpcio-reflection.hash
index 6fce5c954f..516434e1d1 100644
--- a/package/python-grpcio-reflection/python-grpcio-reflection.hash
+++ b/package/python-grpcio-reflection/python-grpcio-reflection.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/grpcio-reflection/json
-md5  549455c15bdfce71667ec0d918465236  grpcio_reflection-1.66.2.tar.gz
-sha256  add827e2deb56e96803c82ace1d4e77fa0c8ec3747d6398e9951f739d71067d4  grpcio_reflection-1.66.2.tar.gz
+md5  ae7a26702153311fc7fa5bd4ee232ac4  grpcio_reflection-1.67.0.tar.gz
+sha256  c47143738b1897b6ce4af5e0e338c85c9aee5fdcbb3355d368a8dcae46d8933c  grpcio_reflection-1.67.0.tar.gz
 # Locally computed sha256 checksums
 sha256  590198e3f305f2c347fde64d637c65492bbef554db6c8364e149cd375e3797ee  LICENSE
diff --git a/package/python-grpcio-reflection/python-grpcio-reflection.mk b/package/python-grpcio-reflection/python-grpcio-reflection.mk
index b336ebd945..d211fd18df 100644
--- a/package/python-grpcio-reflection/python-grpcio-reflection.mk
+++ b/package/python-grpcio-reflection/python-grpcio-reflection.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GRPCIO_REFLECTION_VERSION = 1.66.2
+PYTHON_GRPCIO_REFLECTION_VERSION = 1.67.0
 PYTHON_GRPCIO_REFLECTION_SOURCE = grpcio_reflection-$(PYTHON_GRPCIO_REFLECTION_VERSION).tar.gz
-PYTHON_GRPCIO_REFLECTION_SITE = https://files.pythonhosted.org/packages/58/3f/85a801dda6357b01060ec743aa3831da77d222230f86f872b77cc7af002f
+PYTHON_GRPCIO_REFLECTION_SITE = https://files.pythonhosted.org/packages/fe/69/08a7c3c3524e3af650d22bd8e0015e35bc284eae919fbb38bc2702809d07
 PYTHON_GRPCIO_REFLECTION_SETUP_TYPE = setuptools
 PYTHON_GRPCIO_REFLECTION_LICENSE = Apache-2.0
 PYTHON_GRPCIO_REFLECTION_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
