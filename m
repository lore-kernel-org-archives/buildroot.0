Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 169F0C282DE
	for <buildroot@archiver.kernel.org>; Thu, 13 Mar 2025 17:37:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D85AC83B8F;
	Thu, 13 Mar 2025 17:37:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SA8DRZWX4qdB; Thu, 13 Mar 2025 17:37:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD69783A82
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD69783A82;
	Thu, 13 Mar 2025 17:37:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 00E5EC8
 for <buildroot@buildroot.org>; Thu, 13 Mar 2025 17:37:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E408740AEC
 for <buildroot@buildroot.org>; Thu, 13 Mar 2025 17:37:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0xFc6ccY63Bl for <buildroot@buildroot.org>;
 Thu, 13 Mar 2025 17:37:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::f2f; helo=mail-qv1-xf2f.google.com;
 envelope-from=brandon.lumbra@sense.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6A2C140294
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A2C140294
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [IPv6:2607:f8b0:4864:20::f2f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6A2C140294
 for <buildroot@buildroot.org>; Thu, 13 Mar 2025 17:37:01 +0000 (UTC)
Received: by mail-qv1-xf2f.google.com with SMTP id
 6a1803df08f44-6dd1962a75bso10314886d6.3
 for <buildroot@buildroot.org>; Thu, 13 Mar 2025 10:37:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741887420; x=1742492220;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n++OlOPvXipo2MjVmkYOe1PJ8hnS0LlCr8+mTFlvnPM=;
 b=lo2Su8vrli7paxRXEZvTV2m+Hh8rQT9MXPquSNe4R1kMoy4I/3Q4jGrRG0/jJvKUvc
 AACswClIllgm0S6BodOPc/t7dTkToiAtI4I80ZY4D1Jh6WYPqo4R+oebmAHd1ZylrrIe
 qXhDPqK8rZ4X6wkmukn7MTXKTLGQRgilXB7iWjNDe2thvkAzPa+dH2Fhbv93GLn/RG3r
 TNDPumsTet5Q4uHAy6pd5lh/LPdRkXbE5GnZZrLoV3Pluahst9qainU9WeWO2tY3G5mo
 JTqLxiJNf1rtvH6VQgkMlq3PrGfAFQgasyOlZWAfmvW4qUyM/4lR11N3IvZxlLakRoq0
 RswQ==
X-Gm-Message-State: AOJu0YwmU+dQegKzMWe2SlwdF+UoFYFm0xdvvRzCdmwfKs/R4ooEZn5F
 soyfCRVC0MdQ/cZ6XDf++Zbi7xSyu4cwS9TY8LbyUOqm9vcIN2D7TzZa2BecpqXxi9dwwDvYqpa
 rI78=
X-Gm-Gg: ASbGncs/LMyZI52WOJVrvIp5U2zChjxdxBtCadviImU/FX4bqoZGOKrXHouPzwy3fDN
 Epv3j+cjw1LrzMaAx3IpXKjWziUahTeRXIGOJGYMXAQyEO9q38tfiRYsW8bi9t6r5IJsx66POdz
 QdBktD29/zJWOdUkauU3FB6Xrq5a1AG1hlnyTqCaLsQ63raHOrJDf8bIRQnxccLpoEVSgo3mFID
 UjRf8u3f9PGGu+Fu62nWDzFbCsp0Fssh3j93XFozlEQtZRX2BCpiR1p6fZUQtrL8MggbMlDo+TB
 kcHu0Z8+sLOrNfI/XvbQBANpwDSOWz9D+qdUGk4UgzBmjqTPUO9EPu77Pm5dnGSclzrG
X-Google-Smtp-Source: AGHT+IH9XNq8raVzt/tHf/gtPZxlrlAnlU/WmScEYSS/8/GaM0L28L4fqv+xpCrKULtRCGkHtRk8MA==
X-Received: by 2002:a05:6214:c26:b0:6e6:6535:17df with SMTP id
 6a1803df08f44-6eae79b883emr9563576d6.2.1741887419894; 
 Thu, 13 Mar 2025 10:36:59 -0700 (PDT)
Received: from brandon-sense.localdomain ([50.170.154.78])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6eae3c57becsm5479476d6.11.2025.03.13.10.36.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 10:36:59 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Brandon Lumbra <brandon.lumbra@sense.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Mar 2025 13:35:56 -0400
Message-Id: <20250313173557.517844-1-brandon.lumbra@sense.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sense.com; s=google; t=1741887420; x=1742492220; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=n++OlOPvXipo2MjVmkYOe1PJ8hnS0LlCr8+mTFlvnPM=;
 b=bKBPRGsq3Eam6msH7Fs+Qh1nFYrpsqeQwJ25SR9KIWzj3Owz4egIIa4o7vifxM4Dnk
 QbSmpbqsIjECIOudDWC7ST8Ey6gykp90wGh1WweKEns0WH1viZh3pIcCddbfBB4ZRzQ/
 CZ5UOl1op9Kz7+ofqkmleBoHoqiewLzdAGCCk=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=sense.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=sense.com header.i=@sense.com header.a=rsa-sha256
 header.s=google header.b=bKBPRGsq
Subject: [Buildroot] [PATCH] package/rt-tests: fix build with glibc 2.41+
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
From: Brandon Lumbra via buildroot <buildroot@buildroot.org>
Reply-To: Brandon Lumbra <brandon.lumbra@sense.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

glibc 2.41 adds sched_*attr, conflicting with rt-sched.h in the rt-tests
package. This commit resolves the conflict by applying a patch from
upstream which excludes the conflicting code when using glibc >= 2.41.
---
 .../0003-Fix-build-with-glibc-2.41.patch      | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 package/rt-tests/0003-Fix-build-with-glibc-2.41.patch

diff --git a/package/rt-tests/0003-Fix-build-with-glibc-2.41.patch b/package/rt-tests/0003-Fix-build-with-glibc-2.41.patch
new file mode 100644
index 0000000000..2bbfd93cd4
--- /dev/null
+++ b/package/rt-tests/0003-Fix-build-with-glibc-2.41.patch
@@ -0,0 +1,56 @@
+From 280e198c39d1b17d0491d7c4e7afda97ae6c8e6f Mon Sep 17 00:00:00 2001
+From: Yaakov Selkowitz <yselkowi@redhat.com>
+Date: Wed, 29 Jan 2025 16:46:11 -0500
+Subject: [PATCH] Fix rt-tests build with glibc-2.41
+
+The sched_*attr APIs were added to glibc
+https://sourceware.org/git/?p=glibc.git;a=commit;h=21571ca0d70302909cf72707b2a7736cf12190a0
+
+This fixes the build conflict in rt-tests with glibc-2.4
+
+Signed-off-by: Yaakov Selkowitz <yselkowi@redhat.com>
+Signed-off-by: John Kacur <jkacur@redhat.com>
+Upstream: https://web.git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git/commit/?id=d3a23a0cc76789c3083df3bad78982cd49bc4c5e
+---
+ src/include/rt-sched.h | 2 ++
+ src/lib/rt-sched.c     | 2 ++
+ 2 files changed, 4 insertions(+)
+
+diff --git a/src/include/rt-sched.h b/src/include/rt-sched.h
+index 80171c76e0ee..dfd7f45f51cc 100644
+--- a/src/include/rt-sched.h
++++ b/src/include/rt-sched.h
+@@ -42,6 +42,7 @@
+ #define __NR_sched_getattr		275
+ #endif
+ 
++#if ! __GLIBC_PREREQ(2, 41)
+ struct sched_attr {
+ 	uint32_t size;
+ 	uint32_t sched_policy;
+@@ -67,5 +68,6 @@ int sched_getattr(pid_t pid,
+ 		  struct sched_attr *attr,
+ 		  unsigned int size,
+ 		  unsigned int flags);
++#endif
+ 
+ #endif /* __RT_SCHED_H__ */
+diff --git a/src/lib/rt-sched.c b/src/lib/rt-sched.c
+index 8023bc70c473..2500abde26e4 100644
+--- a/src/lib/rt-sched.c
++++ b/src/lib/rt-sched.c
+@@ -14,6 +14,7 @@
+ 
+ #include "rt-sched.h"
+ 
++#if ! __GLIBC_PREREQ(2, 41)
+ int sched_setattr(pid_t pid,
+ 		  const struct sched_attr *attr,
+ 		  unsigned int flags)
+@@ -28,3 +29,4 @@ int sched_getattr(pid_t pid,
+ {
+ 	return syscall(__NR_sched_getattr, pid, attr, size, flags);
+ }
++#endif
+-- 
+2.47.1
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
