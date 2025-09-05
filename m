Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83CB2CA0FED
	for <buildroot@archiver.kernel.org>; Fri,  5 Sep 2025 07:48:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EE014087A;
	Fri,  5 Sep 2025 07:48:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gJoUERoVbwbF; Fri,  5 Sep 2025 07:48:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D9F640850
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D9F640850;
	Fri,  5 Sep 2025 07:48:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EF97CB69
 for <buildroot@buildroot.org>; Fri,  5 Sep 2025 07:48:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D6E4760594
 for <buildroot@buildroot.org>; Fri,  5 Sep 2025 07:48:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zzZZziGZREGf for <buildroot@buildroot.org>;
 Fri,  5 Sep 2025 07:48:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6F2D860B33
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F2D860B33
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6F2D860B33
 for <buildroot@buildroot.org>; Fri,  5 Sep 2025 07:48:04 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-61cf0901a72so3209509a12.1
 for <buildroot@buildroot.org>; Fri, 05 Sep 2025 00:48:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757058482; x=1757663282;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ytX6WYzNDSwE0fadVDB4TrxHHIHIwjeiNJS38P22ghM=;
 b=TC9xnfB+d4Uc/u8Pe4Cz03e7IVMqNIoi/wimjk3+0Xs5Kfj0x7PHrKTMKHe+6dD1AG
 zFLuw2utktZykgjnU/ZsupxDFHVmzDHMfSAK3O4DX1PKbVGbEnwj33EYRsuhG2XCcGlq
 im1lNywBeJxQOJrfGgN+GSoAwJP0b9ofudqYRHj9nl459ZOSHv9wywCi07hMW0/rpqDt
 abPwpTZAjZY2LecnpJ70y8Bsw62QLvdvyh3YHxsDnKxuLi91DGWdWpAYiYCV0n60Pv+c
 wk9X1jQhIeo2IaGlAs0hEMZ/nRZms/ogOtNR+O5uGwPtGEg500QX51obaJ9/G4EMxQhT
 ltOw==
X-Gm-Message-State: AOJu0Yw3yBfn56D8ueOhqz1CLGg9PPIguHurea0q/rP5xQycgz4ruUMj
 oxO+cW60Ht2g9kP+W7hJvtL4i4O2l1aDSp1T3f5LK3Id97h1VwMs1m5L0TRDvGr3dIXMCYDr2om
 sahkfKW0=
X-Gm-Gg: ASbGnctbgcXhMCA/v5OTh1bgpR9C3bLXKr469JN81mDzAQW3cV3qglXB5igp3JcJ0iO
 9TGl6YHwOexHL8JihSChoMGhXx6IlyzyAxmEQNi/NF9+AJo52B+7voK4Jk/W8xg0gSq+6/5vXQp
 DA4iO3eH4hot8oxspQqMLrlLDim95emRZpR+POp3c/iTfNzLSphYGsBDpeabx+lG9Io/bFX93qP
 tFswjUmMEr1k+eO4eUzwAj65MXM5UzT6ivbWNZ7FgrLmAm+rzux3DJ8oCjPrT3sU3yPy4lflqXi
 lAHsFc0P7tS4Ou6XqmAGYxB3dR+nd6HZaCoT1uS4+z/LTpLQlmb3yND9WNdGJJF9H3souykQKIN
 borpgy/tm+m8h+2A=
X-Google-Smtp-Source: AGHT+IFp1bNJyblbsoyQL09TuyAOe2p3NBG9IKGoaljgKk8vCB1hPBTsc9ZoAIqlUft2yRQeiP1bfw==
X-Received: by 2002:a05:6402:13cc:b0:61c:d118:618d with SMTP id
 4fb4d7f45d1cf-61d26ec5da2mr22559110a12.35.1757058481900; 
 Fri, 05 Sep 2025 00:48:01 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cfc1c7dfesm16101925a12.7.2025.09.05.00.48.01
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Sep 2025 00:48:01 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri,  5 Sep 2025 09:48:00 +0200
Message-ID: <20250905074800.469349-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250905074800.469349-1-thomas.perale@mind.be>
References: <20250905074800.469349-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1757058482; x=1757663282; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ytX6WYzNDSwE0fadVDB4TrxHHIHIwjeiNJS38P22ghM=;
 b=VNi8iZRhAX66mNPYwXIxoPv/WERHXtsIGydZD9ce/C5eSACzdc8Ayj4pnDdImmn6EQ
 ZGD+Ix4n/SBAOO3qM1QLsRDK37iHLcvErPijqgE5fcT7UK9FlKqaqCq4XcRrRlAQbBvf
 AkcZNRPTp+dl/UkiF6sZSQWKxuOnlfHQPrPvndJKzav7/VlwPWS3i5Khc/VsSJpnSeI1
 NWtJvIre3kPFEIhnM+7A8TViG0qTQpO+O3ojVpfawV97ukJbSwMit1I1f8ISlN9AUsJO
 Jd3wIxaUH10fQfsRdDLOc6XZGdLS9V05BeW9iWM/ZvcfU+JKkQym2Ck+iI9f+sb3e54L
 U86g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=VNi8iZRh
Subject: [Buildroot] [PATCH 2/2] package/iperf3: add patch to fix
 CVE-2025-54350
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following vulnerability:

    In iperf before 3.19.1, iperf_auth.c has a Base64Decode assertion
    failure and application exit upon a malformed authentication attempt.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2025-54350
  - https://github.com/esnet/iperf/commit/4eab661da0bbaac04493fa40164e928c6df7934a

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...-on-malformed-authentication-attempt.patch | 35 +++++++++++++++++++
 package/iperf3/iperf3.mk                      |  3 ++
 2 files changed, 38 insertions(+)
 create mode 100644 package/iperf3/0002-Prevent-crash-due-to-assertion-failures-on-malformed-authentication-attempt.patch

diff --git a/package/iperf3/0002-Prevent-crash-due-to-assertion-failures-on-malformed-authentication-attempt.patch b/package/iperf3/0002-Prevent-crash-due-to-assertion-failures-on-malformed-authentication-attempt.patch
new file mode 100644
index 0000000000..bcba77be21
--- /dev/null
+++ b/package/iperf3/0002-Prevent-crash-due-to-assertion-failures-on-malformed-authentication-attempt.patch
@@ -0,0 +1,35 @@
+From de932ea16bc959f839d28d370f0602de52c5def1 Mon Sep 17 00:00:00 2001
+From: "Bruce A. Mah" <bmah@es.net>
+Date: Tue, 24 Jun 2025 15:58:21 -0700
+Subject: [PATCH] Prevent crash due to assertion failures on malformed
+ authentication attempt.
+
+Reported by Han Lee (Apple Information Security)
+
+CVE: CVE-2025-54350
+Upstream: https://github.com/esnet/iperf/commit/de932ea16bc959f839d28d370f0602de52c5def1
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/iperf_auth.c | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/src/iperf_auth.c b/src/iperf_auth.c
+index 72e85fc9a..b9f2bc0f2 100644
+--- a/src/iperf_auth.c
++++ b/src/iperf_auth.c
+@@ -28,7 +28,6 @@
+ #include "iperf_config.h"
+ 
+ #include <string.h>
+-#include <assert.h>
+ #include <time.h>
+ #include <sys/types.h>
+ /* FreeBSD needs _WITH_GETLINE to enable the getline() declaration */
+@@ -152,7 +151,6 @@ int Base64Decode(const char* b64message, unsigned char** buffer, size_t* length)
+ 
+     BIO_set_flags(bio, BIO_FLAGS_BASE64_NO_NL); //Do not use newlines to flush buffer
+     *length = BIO_read(bio, *buffer, strlen(b64message));
+-    assert(*length == decodeLen); //length should equal decodeLen, else something went horribly wrong
+     BIO_free_all(bio);
+ 
+     return (0); //success
diff --git a/package/iperf3/iperf3.mk b/package/iperf3/iperf3.mk
index c5efb1d784..43f791b082 100644
--- a/package/iperf3/iperf3.mk
+++ b/package/iperf3/iperf3.mk
@@ -14,6 +14,9 @@ IPERF3_CPE_ID_VENDOR = es
 # 0001-Fix-off-by-one-head-overflow-in-auth.patch
 IPERF3_IGNORE_CVES += CVE-2025-54349
 
+# 0002-Prevent-crash-due-to-assertion-failures-on-malformed-authentication-attempt.patch
+IPERF3_IGNORE_CVES += CVE-2025-54350
+
 IPERF3_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
