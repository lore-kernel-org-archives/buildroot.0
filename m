Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B7DC369B2
	for <buildroot@archiver.kernel.org>; Mon, 14 Apr 2025 21:25:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 931D2804DB;
	Mon, 14 Apr 2025 21:25:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TE_kyjNnU6Tb; Mon, 14 Apr 2025 21:25:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B850C811AD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B850C811AD;
	Mon, 14 Apr 2025 21:25:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D0292205
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 21:24:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B61F240703
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 21:24:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tQr-ZP5D2zx6 for <buildroot@buildroot.org>;
 Mon, 14 Apr 2025 21:24:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.41;
 helo=mail-wm1-f41.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C426F404C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C426F404C3
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C426F404C3
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 21:24:58 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-43cf05f0c3eso34421625e9.0
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 14:24:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744665896; x=1745270696;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wNQUBCBpIbN8p3xo5QLDapBssnewSNrc26khPWjAFXE=;
 b=rTqskoKCGJ2E8o59K/CbMlfDVlAJg+4EmtIplY99CIT7LIW8mEY3RM/3BbJIRRZqhE
 3RfjvpNEZ5RsFkC0ea+HQUGaN9sf1VZHLLI4586NnBnyX9+0pb9V8QH+apU6aE54d7MZ
 m0hwV7khMmXk/wD+r1r9tknfInu6GEDUo/xJu2rcAg9uMjUbXCaIisovLW8L9KpSYKMt
 EfKr6jlZZf7FDEXJSSIPAnUWfzgLWhBxpnz/MR+q0ZfFKfkUxEf6KS1GD2UGwhhXXVw1
 iHp0eACIuT2obLc8JWRU247QpmiRchLayQZzcP8LPEIbuoZmA3OUL86VsW8YAD+a42KU
 ACKw==
X-Gm-Message-State: AOJu0Yy5qXQz2IqmEJ+8khDrSZ+TqX9DrTAFyNM0av5OTZNaFALppE72
 Zu4ai822118t9P/Jh8pdGpRud2mYAF6Kp9SzZTF8QpayofbgFV4yEfdDH2KD
X-Gm-Gg: ASbGncv6AQBotKCMYl4/BDCq9PCHsUvxeBx6U4JhS/uOQ82MU/hF6rKFYesaqtdCPdc
 R0NSM7zr+DnG/1qkBocEdvsBcKmR0VFGEOvgaB0ezA7NynhOkbKjrHJK5oF4XBEOVWn6HNtTLdv
 akU84Lxojdd6CQxVfjKgkoYDmjudQm+mVY17a4zM4Ct6cKO/iqjqT8QgH3AWOCk+A1mbOvgiArE
 o25THyoo9NuVV4DfUAh8aYRFc5/YG62nKFOs5oS8VErCJyC25WXtzcp+0H5RXmzyQxg3OFckrha
 lhO6j8qV9rniigsVgTP52OwkUODPsX5cvWwVTrmgLreKIqjo6eXn
X-Google-Smtp-Source: AGHT+IFQeRPulBCoyjy7l/i28NOi6ChyCt5fZ6GIgmubVH9vMXwT5POtkrw8wZxZLUVClhRXMdj15A==
X-Received: by 2002:a05:600c:c06:b0:43d:8ea:8d7a with SMTP id
 5b1f17b1804b1-43f3a9b00c2mr112352875e9.28.1744665896382; 
 Mon, 14 Apr 2025 14:24:56 -0700 (PDT)
Received: from localhost.localdomain ([87.66.230.131])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f207c90a9sm189812945e9.36.2025.04.14.14.24.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Apr 2025 14:24:55 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Thomas Devoogdt <thomas.devoogdt@barco.com>
Date: Mon, 14 Apr 2025 23:24:53 +0200
Message-ID: <20250414212453.2903952-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1] package/libfcgi: bump to 2.4.5 to fix
 CVE-2025-23016
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

From: Thomas Devoogdt <thomas.devoogdt@barco.com>

Announcement:
- https://github.com/FastCGI-Archives/fcgi2/releases/tag/2.4.5

See:
- https://nvd.nist.gov/vuln/detail/CVE-2025-23016
- https://github.com/advisories/GHSA-9825-56cx-cfg6
- https://github.com/FastCGI-Archives/fcgi2/issues/67

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 package/libfcgi/libfcgi.hash | 2 +-
 package/libfcgi/libfcgi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libfcgi/libfcgi.hash b/package/libfcgi/libfcgi.hash
index ca660c6ebd..371dba8939 100644
--- a/package/libfcgi/libfcgi.hash
+++ b/package/libfcgi/libfcgi.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c0e0d9cc7d1e456d7278c974e2826f593ef5ca555783eba81e7e9c1a07ae0ecc  libfcgi-2.4.4.tar.gz
+sha256  92b0111a98d8636e06c128444a3d4d7a720bdd54e6ee4dd0c7b67775b1b0abff  libfcgi-2.4.5.tar.gz
 sha256  f0a8fe4513a43e8eebb24cdcf9d2e7efc52e4d8259178c6d76d3d84418397d81  LICENSE
diff --git a/package/libfcgi/libfcgi.mk b/package/libfcgi/libfcgi.mk
index 3c90b30e39..2348af843b 100644
--- a/package/libfcgi/libfcgi.mk
+++ b/package/libfcgi/libfcgi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFCGI_VERSION = 2.4.4
+LIBFCGI_VERSION = 2.4.5
 LIBFCGI_SITE = $(call github,FastCGI-Archives,fcgi2,$(LIBFCGI_VERSION))
 LIBFCGI_LICENSE = OML
 LIBFCGI_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
