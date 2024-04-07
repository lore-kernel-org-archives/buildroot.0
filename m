Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A5F3CD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 17:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52B6D8196A;
	Sun,  7 Apr 2024 17:07:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gdp-ay80Z9Ju; Sun,  7 Apr 2024 17:07:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49CE3819B8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49CE3819B8;
	Sun,  7 Apr 2024 17:07:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 348141BF2BE
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 17:07:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 21A4940320
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 17:07:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d16lT10XcTSD for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 17:07:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 986A040210
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 986A040210
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 986A040210
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 17:07:11 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2d4a8bddc21so49256691fa.0
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 10:07:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712509628; x=1713114428;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6vC+EefCxKuWG9PfjR5csG+/GJCseOP3yANtujNPkVY=;
 b=a598p0T6RIOelx01ssqfQubmyDJkxzHN0a98HSuUf0wfBITD1DNew9rUxgYPMZOCuy
 HRJb/0g4RNkLJIwnQz97IRUOcJTGEDiibLFLfQH5pv8TN5Sl5opLvxV7uzl+vdYRCoJU
 kR7sM//5zjIlBCuYaLNiF13FgGKmyVhl1QACAgt2txu9/zvqu5WwVecHBlK0F84WuAwo
 NVWQt7Iej/uqk6nPsTcoyw4MxWM63nfRWe0axroTN4WCoAvggz2XsOrZIsQi9gKu7Fcw
 20WJVVgHlFpUkYTDgfhdvmzYHag0eQy1BxS5v4UJBs1UhqMWEZGRvWoAuWcDSSq461M7
 3KHw==
X-Gm-Message-State: AOJu0YwnrnoIFIKF0iCdqFcgFfRRJ6E7HonCmToe2P9Jv527S4MuDomk
 aEjqrL64ykmvWg3+GkS4FiLjMG7n9nD0wwxZes9EnxBv+dtWPBz8zfiQFKfu
X-Google-Smtp-Source: AGHT+IF6ptKN8QCzEs02SkRa+1nSP89gr2EyEfo6VQQ0HUZnw07/TcE7msSZOYDQUV9cGvz10jvBRA==
X-Received: by 2002:a2e:8613:0:b0:2d8:5a5e:76bf with SMTP id
 a19-20020a2e8613000000b002d85a5e76bfmr4106368lji.25.1712509628204; 
 Sun, 07 Apr 2024 10:07:08 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 f11-20020a5d568b000000b00343c9ce4b50sm7004128wrv.53.2024.04.07.10.07.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 10:07:07 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 19:07:06 +0200
Message-ID: <20240407170706.2785735-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712509628; x=1713114428; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6vC+EefCxKuWG9PfjR5csG+/GJCseOP3yANtujNPkVY=;
 b=hB6M498m8Afr80LW1YLflC/ioTjikl4KmOAVsnfAekvbj4n/Ej6OzSsXa+WSKAvc70
 cyOxF9+Q6r28P7oNXoGitmP97Tbsrh38w5AEV+KQ/kjARJ2OBT/rG3xppwYNR85ME1Cu
 eoRLdXNqj1JS0AdO2tZFu27g/K4Wrwt5xDn3W6L5nqRhsedPEbHdNR5UgT29TsSdKvPN
 1ivtXlIJ3mrEGM+WyBEeQIhPGeqHOybErAk7lqi0wpoEDu/5i+itAl5+P6G5el2tJYId
 0tSEYwxIni3RJCAe4/jM1OUg8t+UVkO98eKPP3V0K6KHK1119/gOtzIOAsBSoE1XmOVY
 nIXQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=hB6M498m
Subject: [Buildroot] [PATCH 1/1] package/wolfssl: security bump to version
 5.7.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Sergio Prado <sergio.prado@e-labworks.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Vulnerabilities
 - [High] CVE-2024-0901 Potential denial of service and out of bounds
   read. Affects TLS 1.3 on the server side when accepting a connection
   from a malicious TLS 1.3 client. If using TLS 1.3 on the server side
   it is recommended to update the version of wolfSSL used.
 - [Med] CVE-2024-1545 Fault Injection vulnerability in
   RsaPrivateDecryption function that potentially allows an attacker
   that has access to the same system with a victims process to perform
   a Rowhammer fault injection.
 - [Med] Fault injection attack with EdDSA signature operations. This
   affects ed25519 sign operations where the system could be susceptible
   to Rowhammer attacks.

No official tarball provided so switch to github and set autoreconf

https://github.com/wolfSSL/wolfssl/releases/tag/v5.7.0-stable

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wolfssl/wolfssl.hash | 2 +-
 package/wolfssl/wolfssl.mk   | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/wolfssl/wolfssl.hash b/package/wolfssl/wolfssl.hash
index 59e42e98b9..e705bba9fd 100644
--- a/package/wolfssl/wolfssl.hash
+++ b/package/wolfssl/wolfssl.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  75aaafe3b8c776d1ac417288116c8d444115f9fac5acb382a39a7d163dfd618d  wolfssl-5.6.6.tar.gz
+sha256  2de93e8af588ee856fe67a6d7fce23fc1b226b74d710b0e3946bc8061f6aa18f  wolfssl-5.7.0.tar.gz
 
 # Hash for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wolfssl/wolfssl.mk b/package/wolfssl/wolfssl.mk
index 68c69afd59..893408eca4 100644
--- a/package/wolfssl/wolfssl.mk
+++ b/package/wolfssl/wolfssl.mk
@@ -4,14 +4,16 @@
 #
 ################################################################################
 
-WOLFSSL_VERSION = 5.6.6
-WOLFSSL_SITE = https://github.com/wolfSSL/wolfssl/releases/download/v$(WOLFSSL_VERSION)-stable
+WOLFSSL_VERSION = 5.7.0
+WOLFSSL_SITE = $(call github,wolfSSL,wolfssl,v$(WOLFSSL_VERSION)-stable)
 WOLFSSL_INSTALL_STAGING = YES
 
 WOLFSSL_LICENSE = GPL-2.0+
 WOLFSSL_LICENSE_FILES = COPYING LICENSING
 WOLFSSL_CPE_ID_VENDOR = wolfssl
 WOLFSSL_CONFIG_SCRIPTS = wolfssl-config
+# From git
+WOLFSSL_AUTORECONF = YES
 WOLFSSL_DEPENDENCIES = host-pkgconf
 
 WOLFSSL_CONF_OPTS = --disable-examples --disable-crypttests
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
