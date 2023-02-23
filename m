Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2CBFC61DA4
	for <buildroot@archiver.kernel.org>; Thu, 23 Feb 2023 09:53:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7066582199;
	Thu, 23 Feb 2023 09:53:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7066582199
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2m7WFasNzEvV; Thu, 23 Feb 2023 09:53:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A095D81FD9;
	Thu, 23 Feb 2023 09:53:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A095D81FD9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A0B671BF584
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 09:53:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A26581FD9
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 09:53:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A26581FD9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4mZMKP_XWOm8 for <buildroot@lists.busybox.net>;
 Thu, 23 Feb 2023 09:53:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 565FF81E3E
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 565FF81E3E
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 09:53:01 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id t15so10282333wrz.7
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 01:53:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yudn/5PFn4y45bLDoobbCyB+YTiLF4WA3f5hIj+zFwE=;
 b=Bo9cryaC7iB4Sy+4zGwMuOV3o3UZDCybrxfeqtY4oxET3iRUXVYdQNu+wv632RK65d
 pD/2hQztu8b/CHBjehhkxn1AILFWK5j3OloYim9QMLtW1HWc4HDVYv551jrTN1LEGria
 upysAjlqBjNIapn0mXJstsDhk2kz6MPsdoWJqsrH5cpV5PBptbomhzFaWmpjqqqsVP1/
 BvsY6iJmTttaWJJcLtmpB54aUXf4MzHRjeFH61XSi8uqhyhutVgzyezXU1jh4rDrR7oV
 33Ykl4DSu268v3SDGZvCm8vsqHxoGkTr+1Lc2nd5CZOkYolbZQm7JJ6UEjZUj2WvCiCs
 klxg==
X-Gm-Message-State: AO0yUKXL//+TA4Qmf1E0R9taxWMXskycHSW39gV2wvSqWFKMAU/CPKEA
 S4t0PewTX50ElcN7kj3W8l6CLnO4VMc=
X-Google-Smtp-Source: AK7set8AYWsDUF/ygc4zqAnuPP5DT2AxjPi7CAqxAPa5r6hk1+adniSsDVwHxBiH6ECSfPMNYDUNRA==
X-Received: by 2002:a05:6000:12d2:b0:2c5:60e6:eac with SMTP id
 l18-20020a05600012d200b002c560e60eacmr9292219wrx.24.1677145979136; 
 Thu, 23 Feb 2023 01:52:59 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 v15-20020a5d678f000000b002c6e84cadcbsm7989146wru.72.2023.02.23.01.52.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 01:52:58 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 23 Feb 2023 10:52:54 +0100
Message-Id: <20230223095254.9141-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yudn/5PFn4y45bLDoobbCyB+YTiLF4WA3f5hIj+zFwE=;
 b=lYniK+r4a5imVcDMNpujMYakUHSVCF/axaUXU5BnTppSkUIpfGfYnFTf3Md6gJuPJy
 qvIqwf/v3cUq/7AmTXt4dInfMG0Q7R8YYaepht3nTJRlRUifDPRMBL8oNpikBqV9Roxj
 +GbyyPksMoUafK7vkjEJ7Pz3x/ugkHYqvnONGOHJUxklQwa1YTSLZSLhkQjZgcG1dQ8t
 xFhRhrkpZK6RazObQURZekwTlAuNseccNF2yJPZh28aF1EHVkjq6YSMNpgKMz0iH+Kgo
 GKjIq0PxHs0/u/BoDxGUqYC6DkQSNFDyMQTNw2jwcpJfHDzFIGYB3hHNF2+TQAYmWUdJ
 Uy/g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=lYniK+r4
Subject: [Buildroot] [PATCH v2,
 1/1] package/audit: force arm mode instead of Thumb mode
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure:

/tmp/ccY5gl3z.s:2145: Error: selected processor does not support `mcr p15,0,r2,c7,c10,5' in Thumb mode

Fixes:
 - http://autobuild.buildroot.org/results/9d18a0d360b2e2f9e87c55daedda62d6ce198bb9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Yann E. Morin):
 - Update BR2_PACKAGE_AUDIT_ARCH_SUPPORTS

 package/audit/Config.in | 8 +++++---
 package/audit/audit.mk  | 7 +++++++
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/package/audit/Config.in b/package/audit/Config.in
index 6e5761533f..89341dfe31 100644
--- a/package/audit/Config.in
+++ b/package/audit/Config.in
@@ -1,9 +1,11 @@
 # audit has some builtin per-architecture system call tables
 config BR2_PACKAGE_AUDIT_ARCH_SUPPORTS
 	bool
-	default y if BR2_aarch64 || BR2_arm || BR2_armeb || \
-		BR2_i386 || BR2_powerpc || BR2_powerpc64 || \
-		BR2_x86_64
+	default y if BR2_aarch64
+	default y if (BR2_arm || BR2_armeb) && \
+		(BR2_ARM_CPU_HAS_ARM || BR2_ARM_CPU_HAS_THUMB2)
+	default y if BR2_i386 || BR2_x86_64
+	default y if BR2_powerpc || BR2_powerpc64
 
 config BR2_PACKAGE_AUDIT
 	bool "audit"
diff --git a/package/audit/audit.mk b/package/audit/audit.mk
index cbb174b980..af81dabac0 100644
--- a/package/audit/audit.mk
+++ b/package/audit/audit.mk
@@ -15,6 +15,13 @@ AUDIT_INSTALL_STAGING = YES
 
 AUDIT_CONF_OPTS = --without-python --without-python3
 
+# src/libev has some assembly function that is not present in Thumb mode:
+# Error: selected processor does not support `mcr p15,0,r3,c7,c10,5' in Thumb mode
+# so, we desactivate Thumb mode
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
+AUDIT_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -marm"
+endif
+
 ifeq ($(BR2_PACKAGE_LIBCAP_NG),y)
 AUDIT_DEPENDENCIES += libcap-ng
 AUDIT_CONF_OPTS += --with-libcap-ng=yes
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
