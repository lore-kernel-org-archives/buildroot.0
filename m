Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC03C369CB
	for <buildroot@archiver.kernel.org>; Sat, 26 Apr 2025 05:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13B2D41DD5;
	Sat, 26 Apr 2025 05:36:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cXoiobgBntYq; Sat, 26 Apr 2025 05:36:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CBFB41DE0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CBFB41DE0;
	Sat, 26 Apr 2025 05:36:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C4FFC5
 for <buildroot@buildroot.org>; Sat, 26 Apr 2025 05:36:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 52019608D4
 for <buildroot@buildroot.org>; Sat, 26 Apr 2025 05:36:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qz6wqTHa-d1v for <buildroot@buildroot.org>;
 Sat, 26 Apr 2025 05:36:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7A62060834
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A62060834
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7A62060834
 for <buildroot@buildroot.org>; Sat, 26 Apr 2025 05:36:36 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-736aaeed234so2565358b3a.0
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 22:36:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745645794; x=1746250594;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6w1pYYH0xOV/FA4nWjvza/jrW7tFiPIA6caMP58k5Ys=;
 b=xMcvZz9wcR5JHDGNhd6Pmnv6mxjskg/jNk/fZ8LLmwMBrg/Jj8Tr6E/O8Agz3kpX6+
 emtsD2Q/k3tpskf0anVy5xBfD35zDS5HW9IyeF2j4ygvWN5Pbq43HuA19gIDKkx7d/lZ
 qvfS7+dlUQpEc97wrTUtMwTxAK/k27CMj87uD3SDzE6dTZN3ehv4C44xSbLd9pGop1cE
 9ALX8O+j7JaieKJR4RQQgirfAbEu89fZUo6v/8VRW+q7lKvvtx7WkX7KRX8U90s1/GPU
 gA35urc4MZIrs874npt/2hIrqo02m8HYtEP1CI5E8GK/q6ZFFomMemysbK/u3ANQ+uYR
 VpRw==
X-Gm-Message-State: AOJu0YwaLNOZFeqBX+sIijjL1+4CDdvl0jtCa/D6Qf0ZaZVroNayf4b9
 90p3PZAHB6AIXDXsyfaEXhYG9q7uJbONGwKD4SPBrhoIONGeGUSeqoZYgNmY
X-Gm-Gg: ASbGnctR5coy5vsrxYOe78c/DvmCBgclCblhfU+wyzmz6l0red+SymLp7x7oDR4EDk+
 IjQV3sgxH4SwHWRTKtzY/VbCaKDLmF0bn2VDgeSXgLOI85yxw7YSCVGAg2YjNphxQIUHLC3QABd
 kQtaRedNEvTMunik2EDsjmbVXbOOwpr4F0FV7V1Fca+/Tl6a2n1hwnbNRX8GvGt9oDv5/O+y5ob
 C3ldsw5NWrICZv7HXcFPg3uGQxOO0r+GXk2sq3cU7Pxoc25oUotfBgVfczvfEMrilzK389YeyHU
 7u/0tICAFwBql2QBDp+AkedhflmsKZ2Zx5h1ZjQn7MlZXtO6lYxLbgIJwtP63Efr60y8eSYfoeo
 XGoSISRTss6zcP/tOIvDfx6eX7fw=
X-Google-Smtp-Source: AGHT+IGoIMnj3DCh0qdhpLX5woTzoLx4GM88VNPu9PM8M70pNTaskBnQA4FzlfddVd9xXvG4BYQOGQ==
X-Received: by 2002:a05:6a21:b94:b0:1f5:7007:9eb8 with SMTP id
 adf61e73a8af0-2045b6f4c2amr6749032637.16.1745645794311; 
 Fri, 25 Apr 2025 22:36:34 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b15fa80f2dasm3781286a12.59.2025.04.25.22.36.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 22:36:33 -0700 (PDT)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>,
	Kadambini Nema <kadambini.nema@gmail.com>
Date: Fri, 25 Apr 2025 22:36:30 -0700
Message-Id: <20250426053630.37164-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745645794; x=1746250594; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6w1pYYH0xOV/FA4nWjvza/jrW7tFiPIA6caMP58k5Ys=;
 b=SK+WLw0aiMNP1OP7fRWcZWI/cFMDWzCwYr9YeFPtxl1qdF8aFnYGMDb7FtgwVwKLyS
 SAlFiOuXkgBYrtAneXIATXk9/9AuKivGmv3DCUht4iUazK9i03Nolnm1z9y2rBFrS3RF
 Wc/zj69FDqNPqo8WYGb2g+jE30ub8HQT5h0ByDpGWtdEzEZSehB3YUb/LtS4mzcHQ68V
 3icK1q/WWYkvtc3JHlGq9N0lPPhMhdDeSAFjDBnWiaiczfLs64s7U22jEXfiqzphmAWO
 5mvpLrklY0FoPwF2KyR7qLXEhjh9SsPuArTsYtrM8TfwFUWcskwbdYtXPfpEf0uoR1c6
 4vMA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=SK+WLw0a
Subject: [Buildroot] [PATCH 1/1] package/libuv: bump to version 1.51.0
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
https://github.com/libuv/libuv/releases/tag/v1.51.0

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 package/libuv/libuv.hash | 2 +-
 package/libuv/libuv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libuv/libuv.hash b/package/libuv/libuv.hash
index 6618450af7..8becf44d50 100644
--- a/package/libuv/libuv.hash
+++ b/package/libuv/libuv.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  c42c51d4e630f95dcefcafff95bf003ea52939e312d5e6584e7d9e102ead3e9e  libuv-v1.50.0-dist.tar.gz
+sha256  2ceca1a7577633cf92794db5bf5512370f6cd45a5746d6e14f8c20aeab0a547b  libuv-v1.51.0-dist.tar.gz
 sha256  16de0c32b265cb7d46a6d3bd614f259dd4d693a5e26b3407b04aae8d73041f0c  LICENSE
 sha256  262c44bd2cdba037e6d2a82fba15f5800d292bc993a6f5d6b6ea487744d02836  LICENSE-extra
diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
index 57c128abf0..b38f3c62ac 100644
--- a/package/libuv/libuv.mk
+++ b/package/libuv/libuv.mk
@@ -6,7 +6,7 @@
 
 # When bumping libuv, check if a new version of uvw is available
 # and bump it too.
-LIBUV_VERSION = 1.50.0
+LIBUV_VERSION = 1.51.0
 LIBUV_SOURCE = libuv-v$(LIBUV_VERSION)-dist.tar.gz
 LIBUV_SITE = https://dist.libuv.org/dist/v$(LIBUV_VERSION)
 LIBUV_DEPENDENCIES = host-pkgconf
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
