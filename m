Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C8F1CA1010
	for <buildroot@archiver.kernel.org>; Fri,  5 Sep 2025 07:48:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BA8540A4B;
	Fri,  5 Sep 2025 07:48:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vC0OwLGs6zOf; Fri,  5 Sep 2025 07:48:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 693E240AFC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 693E240AFC;
	Fri,  5 Sep 2025 07:48:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DF0D71E0E
 for <buildroot@buildroot.org>; Fri,  5 Sep 2025 07:48:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D0F0A40A2F
 for <buildroot@buildroot.org>; Fri,  5 Sep 2025 07:48:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WHxKQO1X3xSN for <buildroot@buildroot.org>;
 Fri,  5 Sep 2025 07:48:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 08863408A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08863408A6
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 08863408A6
 for <buildroot@buildroot.org>; Fri,  5 Sep 2025 07:48:38 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-45b9853e630so16923625e9.0
 for <buildroot@buildroot.org>; Fri, 05 Sep 2025 00:48:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757058517; x=1757663317;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ytX6WYzNDSwE0fadVDB4TrxHHIHIwjeiNJS38P22ghM=;
 b=dAQMJhi1Eg9JYa0B66jiyuN26/ahQku7DZ4UQ+Hr6lEnSOz+4lcaL4TWhocjFRPzFm
 Npj20SXwobb1nVmpM5MIhJkIeFQo20nqmO57Rq7SEKDI8cMBZK/yZQptH6gFf+8w4Eak
 dAUSyJaOTmLRMxFwlkm7RR8z3a2J4B+TSl5e/v0KZ9fGFCUZmE0b+HkQN8P6e9+rrjlo
 XjQavNz9NowZSy+qS2I6CZ15J6GaRlrT8pDW78phNrg5h8AT+/6tu/KLLUhBGVepcnFn
 2KZIwAEdVG9zA6/VLif3vIYJDq5w2jzU5hPYU3nuMDqYEhWktcoT1SKGabNdnDXbYlcy
 YQ3w==
X-Gm-Message-State: AOJu0Yz7GCZwDlz13HJfnC48F+/XG5sPT4mi9ukEpmTjlodDiHRbRsir
 PaCEnvDZVobRseuUSwiCJFCi7NuParfGy7Nn7xwR0g5yIiU1gJccWYqm/dKoGmfFn4sKfjlrxq5
 Xr0DMgkE=
X-Gm-Gg: ASbGncsivRmdl3lK7b5a1ipzHPWoLDy1nS+5+ECbWCBRo+M0+n8WROpNTeKUwJ954kd
 xr3/c6tIL5Lfvem6gdkn1bmVkoysOTcEYsBc46knPfK7R/+gc1HJs92QYj2xIL1vJ6T2/9NvErR
 ft7CK1/DChsZHuMdBIMKB/qMgZ6A2xzLtZLVsyWPUdi9W0+vvqHyEz4Ej7b7WVebB/sPsM9Tj6a
 IpTbJ7GGYBehflHbBKELDo9FFY2SFUFCgrx0n5ZTqlvNH030tatA8Sp2RKMnLmOCo5C1aLTSye9
 eQOspE5aQlaQ/UxYd/92q1U42ynyZEwiKcIlbumLEFzCwJaQo5P/thubwQO69Vey3NQQ/dTTa/j
 gYUFZXa/j6i409aQ=
X-Google-Smtp-Source: AGHT+IEaC/mKZl4OdkxuYF5Ukr39QPqljFZi3a77ocxkfDE50c9Y4I9QrkLlZgeL+aZSox9S2TRBDA==
X-Received: by 2002:a05:600c:3b98:b0:45d:d9d1:80a3 with SMTP id
 5b1f17b1804b1-45dd9d183dbmr7736555e9.37.1757058516743; 
 Fri, 05 Sep 2025 00:48:36 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b7e50e30asm319307115e9.24.2025.09.05.00.48.36
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Sep 2025 00:48:36 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri,  5 Sep 2025 09:48:34 +0200
Message-ID: <20250905074834.470035-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250905074834.470035-1-thomas.perale@mind.be>
References: <20250905074834.470035-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1757058517; x=1757663317; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ytX6WYzNDSwE0fadVDB4TrxHHIHIwjeiNJS38P22ghM=;
 b=Tx/QS6/n+WCzA6FtpNmc9WFaZPn4tGddlxv7Ql2tmU0y8ue/N8Od6u+tVvlnF2YQ5b
 dYkL2BxmMW299lslAkFNoEvFDUn9y/OkanRqLujKIOrY9W8AlOsd/ox8BbFBkYk5jh8Y
 V+UGJfW3B905xtl8mSSa6PdgcgnCpTZszyR+CtjM4ZhvGl3vYnb+AHEvZVa/Ku8OIdhe
 3genSupw/+ueFpQbVOushxyNm4rLUnlvNJrT+UYqcNBIiIbdr0zlXMKpY2mYiu+ywkjO
 3Vf+Y42NCb5Xs0sadYjDT2A4xZF3QjnS+WpwILu9waF7QVI9NRJRZYxupBDUeDf97r8v
 C1tw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Tx/QS6/n
Subject: [Buildroot] [2025.02.x,
 PATCH 2/2] package/iperf3: add patch to fix CVE-2025-54350
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
