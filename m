Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F56C02182
	for <buildroot@archiver.kernel.org>; Tue, 21 Jan 2025 22:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FA40610C5;
	Tue, 21 Jan 2025 22:08:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gzpz0khh4UyC; Tue, 21 Jan 2025 22:08:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70FCB61153
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70FCB61153;
	Tue, 21 Jan 2025 22:08:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 46E37D7
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 22:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 27D1F84F90
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 22:08:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zghGqDfg9vsr for <buildroot@buildroot.org>;
 Tue, 21 Jan 2025 22:08:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::129; helo=mail-il1-x129.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 435D784DF9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 435D784DF9
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 435D784DF9
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 22:08:28 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id
 e9e14a558f8ab-3ce4b009465so16559115ab.0
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 14:08:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737497307; x=1738102107;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZReQmWt8tDqojUCPPR8HDmAHC41g/Va+KS2terQyUs4=;
 b=SSVc0DtI2Gxxjr3tIj5nn3rVGFxnJN6n5vl3D52OmmnIqLq8Dq+ae67232jYHhfQ+3
 IBRSMCfCJ0btGU98cFkxEw9zBFS83a3OtP9idK70nn8RUnlyD6/oyQ+o91ue6NRBklGr
 QPgf0vu1xzwq3zeHd1Ybwo42of34eVaYa72W81rGec97aaKUaDy8xpSG4C4y8zcMBxJ9
 yJ7Tu09bXE6jIPaEvaJudz+knZ5uY9321WXuZz3aCvesLn8PizcpwYEBR0FFEgqS1Vxk
 7cDCRTMNx/q+u2/DmS3bO0M2eosrmhDjSoK8DM2TJs9tuXfWfeUqvZr6ixhxHs+SmG+S
 stEg==
X-Gm-Message-State: AOJu0YyvKvUqXuG7aAjAqxx6WO5L3Fhji0GLcKdbeYiGCEOniTeSrO/t
 XvNMHPIgv+txgeLf5DXWi1NIsmNmS8/AKt3n4B+ME00GKqTtmm2CG1A9lKKZ
X-Gm-Gg: ASbGnctC9qk+C34xh/abHM5xcgGISsULL5u2RQL2FXG8EYu+uukdGrVM7zl8p2np5gr
 jKGASVTsnhtizz1B4BjzOtBIsQqLRfoUzjxXhMYBsDsenAU8sCwUs9N2gpfZW9cmWOJ72LQ/GnQ
 jwZV1gEkG9jbHkEuHJHXLUftiAet2bm/oavKPLZQQgNf/tTBv7+ikyLKYrfaXMCrFrXNcIRHuG2
 o6wviU9tp44nhTALXz07fEfrIfwHLMzf6u6BjqoHdO/5sJy+YWp38szwMFtamiarqnvVT2nxLPq
 XTmRYVxMBoW4FAZGmqCK1MgRckbxsIjRlsGIlpUA3FCY
X-Google-Smtp-Source: AGHT+IGNX0yKoojm2916IZt9ZffjGAseAweXGpmovga4het9+6LnpOUht1cM2X51lvInGe3wEfaauA==
X-Received: by 2002:a92:cda5:0:b0:3ce:6758:2500 with SMTP id
 e9e14a558f8ab-3cf74418e88mr112954415ab.13.1737497306996; 
 Tue, 21 Jan 2025 14:08:26 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3cfae0b3532sm3784195ab.62.2025.01.21.14.08.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2025 14:08:26 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Jan 2025 15:08:25 -0700
Message-Id: <20250121220825.3118126-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737497307; x=1738102107; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZReQmWt8tDqojUCPPR8HDmAHC41g/Va+KS2terQyUs4=;
 b=fppR2oC0Ml8GcpbfSU8s+wtmzR+m+NHxyw+fqrd+F7USDGWY26/LcUyURsJUViuIYK
 8iQQMxrIRqkIMvi7JkgD3/WjrHrAxSrvVAu5PMnY4XDX45/nBtXta+xX5GcV6KG7LG2y
 cGgf1VC7kvi/LHRuvEdaRKsuah3gwJm/95SwTASZ6JmUBBxsI20bHXAQNCJJuJG8vxrc
 ZxXaLkrKGOkXfhmBueTJF0qxYss2/AB32XVjUAr0pP2szXN+gslhb51SY1dhon0wZWat
 4xmCoD2aqUcsSI7KwtgU6Rsq2R/OALPKBnrZTK8VwogyQswo9+cL+ydV/Z6UDqOq5y9k
 WH3w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fppR2oC0
Subject: [Buildroot] [PATCH 1/1] package/python-alembic: bump to version
 1.14.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to year update:
https://github.com/sqlalchemy/alembic/commit/6bfca645563473da5b3212b827614d762e80feb0

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-alembic/python-alembic.hash | 6 +++---
 package/python-alembic/python-alembic.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-alembic/python-alembic.hash b/package/python-alembic/python-alembic.hash
index 5f20b18be0..3795afa260 100644
--- a/package/python-alembic/python-alembic.hash
+++ b/package/python-alembic/python-alembic.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/alembic/json
-md5  a12686c41704218fdb29f140be75cdfd  alembic-1.14.0.tar.gz
-sha256  b00892b53b3642d0b8dbedba234dbf1924b69be83a9a769d5a624b01094e304b  alembic-1.14.0.tar.gz
+md5  5fd5fe35fe820d03c0594cb3edd16829  alembic-1.14.1.tar.gz
+sha256  496e888245a53adf1498fcab31713a469c65836f8de76e01399aa1c3e90dd213  alembic-1.14.1.tar.gz
 # Locally computed sha256 checksums
-sha256  ce19e7ba2b77ca584b82a6792856e138eb30b311c896b076c09a405ee45fbee9  LICENSE
+sha256  35ea9c3419b261faf1be448c4f47d9255281bf6b36b5ffea55052227d4ba54de  LICENSE
diff --git a/package/python-alembic/python-alembic.mk b/package/python-alembic/python-alembic.mk
index 5050765db1..c6dcce445c 100644
--- a/package/python-alembic/python-alembic.mk
+++ b/package/python-alembic/python-alembic.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ALEMBIC_VERSION = 1.14.0
+PYTHON_ALEMBIC_VERSION = 1.14.1
 PYTHON_ALEMBIC_SOURCE = alembic-$(PYTHON_ALEMBIC_VERSION).tar.gz
-PYTHON_ALEMBIC_SITE = https://files.pythonhosted.org/packages/00/1e/8cb8900ba1b6360431e46fb7a89922916d3a1b017a8908a7c0499cc7e5f6
+PYTHON_ALEMBIC_SITE = https://files.pythonhosted.org/packages/99/09/f844822e4e847a3f0bd41797f93c4674cd4d2462a3f6c459aa528cdf786e
 PYTHON_ALEMBIC_SETUP_TYPE = setuptools
 PYTHON_ALEMBIC_LICENSE = MIT
 PYTHON_ALEMBIC_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
