Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA22CC02181
	for <buildroot@archiver.kernel.org>; Fri, 24 Jan 2025 18:44:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7735E40794;
	Fri, 24 Jan 2025 18:44:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OLKLTA3ZFX8Z; Fri, 24 Jan 2025 18:44:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24551407A4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24551407A4;
	Fri, 24 Jan 2025 18:44:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 75BE7941
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 18:44:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 63BDD407A4
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 18:44:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SLqU-yc8GuwA for <buildroot@buildroot.org>;
 Fri, 24 Jan 2025 18:44:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::134; helo=mail-il1-x134.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 48F6440794
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48F6440794
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 48F6440794
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 18:44:00 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-3cfce97a3d9so1975095ab.2
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 10:44:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737744239; x=1738349039;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=25GuwCwq+KeAM0la0JixiTsfbZaQBheyD0n7d4oH9sA=;
 b=g4DFCQY5c8JUN5VfecRZ6EuydaGhJOXvheUx3SByfgFinzhtbTiaH52g4ri4Z5Mosh
 iF/vyFoeAMSFErzhhLH+oHBns94yJ7HkMsr+TP3IpHnjldQE64UzlMN7+Mk9BtYH/Bvx
 t0LUkaYkY7ZVS9at4yDeHNedskGpaERj+MggsnYASGCjdWu3OgPgZ+GuJ4Qg3YY11NUq
 BVQJAHfajssIY3yigfNZeOme1J5KkrK9MFp0mvf8tMMF4ZqTPlMgXoqFV8UCrxmiol0u
 e5DFmDyeundo/pysmWXEnVIndPsyBR+PbX8iR141pFMyQyieO+eB4es5x2P6+uea+W9p
 SwPw==
X-Gm-Message-State: AOJu0YwI9EbPPJ8RCcBxugBwqtxyCfTKgm65JeaOev413pn93ZmHPhpj
 UX2JWMgjROuHqyQknOposMz6gf9HJK2N0kx1LUAbYx7PtlVz+XSJ8oUyz6HU
X-Gm-Gg: ASbGncu4ODNETQHTIsW/tAuBuv7cQVmWzjywI1pvP4IDtVC6zxFKivMMdiTK/AasXi4
 KMReT898vXW8UwUSQFpGUGX5AQvXmjp3W/CEjBQX/xlnI/HeE7vGplCuxMUZudgV37ofAdIix+k
 9e/Tc7VYxFAYXpyVc/4sci2qCSmU6/lEWXI+gc3s0KT8ZPGPnRH/N2uwKF4ifJ2USuhywE8IlW6
 b+/O4wqsD2a2mR6W7PayJVV5CCTpQAZKcV85DYCWIzrj5VYXXtWxfwGMcggomjCsiCx0Du+Gkup
 ENiSQqZld9vsKAkRXAdV1TArTkPXB+wBhA+RTcVfC/Uc4GLD9sCjLv0=
X-Google-Smtp-Source: AGHT+IHUwzL4jXHtNP52KBUCz6emmVp+6c3BxAZKDJq6xJxSGfCTsIoOmG736SP2set3V1yhpJYj2A==
X-Received: by 2002:a05:6e02:1f82:b0:3cf:bac5:d90c with SMTP id
 e9e14a558f8ab-3cfbac5db2fmr101191045ab.18.1737744238663; 
 Fri, 24 Jan 2025 10:43:58 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ec1da4ba13sm778451173.71.2025.01.24.10.43.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 10:43:58 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Jan 2025 11:43:56 -0700
Message-Id: <20250124184356.3795058-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737744239; x=1738349039; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=25GuwCwq+KeAM0la0JixiTsfbZaQBheyD0n7d4oH9sA=;
 b=D+sF7Ugdm9oEBIM+E35xy1gxPFKpgh8HHE3zYq9aaPSnLlpWM/WhOjkUQtpBW3kziF
 f0rBjeioLiOlpwFzlIXW9TR0RMgw0FgZkBW8f65mLzKwO9YiHJUf9wNu1DH5nx9JOBSa
 WiQfyHfvOfsM8GgxpX323XXyhxyBkYlWYG9mBDAL+h1GymB1Jq2u2+7Ps1fw8l0CAoE4
 LMCubvM0u4yot7UtjAGuWHEj5IoH8MdaRJOk4z82kSrD3RVtlXB1ng70bxlSIxvfvV4Z
 qL5InwmM/UNyK0g5s2OhHB8B3ojZXXx5D10UEjX/w3005Q8+b6zJs6lvQyNKoFzQNO6x
 HMTw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=D+sF7Ugd
Subject: [Buildroot] [PATCH 1/1] package/python-starlette: bump to version
 0.45.3
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-starlette/python-starlette.hash | 4 ++--
 package/python-starlette/python-starlette.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-starlette/python-starlette.hash b/package/python-starlette/python-starlette.hash
index 1542e565f9..a92aba62be 100644
--- a/package/python-starlette/python-starlette.hash
+++ b/package/python-starlette/python-starlette.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/starlette/json
-md5  ccdbb470d005b83cc8f808e6dc25f890  starlette-0.41.3.tar.gz
-sha256  0e4ab3d16522a255be6b28260b938eae2482f98ce5cc934cb08dce8dc3ba5835  starlette-0.41.3.tar.gz
+md5  6fb04f61bef00b3260413be6fbfa8591  starlette-0.45.3.tar.gz
+sha256  2cbcba2a75806f8a41c722141486f37c28e30a0921c5f6fe4346cb0dcee1302f  starlette-0.45.3.tar.gz
 # Locally computed sha256 checksums
 sha256  dcb95677a02240243187e964f941847d19b17821cf99e5afae684fab328c19bf  LICENSE.md
diff --git a/package/python-starlette/python-starlette.mk b/package/python-starlette/python-starlette.mk
index 0a4e5f3f17..c8825e43f4 100644
--- a/package/python-starlette/python-starlette.mk
+++ b/package/python-starlette/python-starlette.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_STARLETTE_VERSION = 0.41.3
+PYTHON_STARLETTE_VERSION = 0.45.3
 PYTHON_STARLETTE_SOURCE = starlette-$(PYTHON_STARLETTE_VERSION).tar.gz
-PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/1a/4c/9b5764bd22eec91c4039ef4c55334e9187085da2d8a2df7bd570869aae18
+PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/ff/fb/2984a686808b89a6781526129a4b51266f678b2d2b97ab2d325e56116df8
 PYTHON_STARLETTE_SETUP_TYPE = hatch
 PYTHON_STARLETTE_LICENSE = BSD-3-Clause
 PYTHON_STARLETTE_LICENSE_FILES = LICENSE.md
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
