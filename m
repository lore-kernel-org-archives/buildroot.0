Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9239BC87FCB
	for <buildroot@archiver.kernel.org>; Tue, 12 Aug 2025 07:43:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CED46143C;
	Tue, 12 Aug 2025 07:43:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0nRadNhTbNcl; Tue, 12 Aug 2025 07:43:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61F3B61422
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61F3B61422;
	Tue, 12 Aug 2025 07:43:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D40AB158
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 07:43:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D0F9884523
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 07:43:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nxybafbwossk for <buildroot@buildroot.org>;
 Tue, 12 Aug 2025 07:43:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D55368451C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D55368451C
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D55368451C
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 07:43:37 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-321c3eeea7bso236003a91.1
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 00:43:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754984617; x=1755589417;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/y9s+1GH715i+/HPGMZ5knK8byVFxpyL1YUhG1DGMUQ=;
 b=wJKboZ+55qin8mkuGOjGUQf7ayM8a4kYZV1qA6KNeNTQxsHAv2EusRiflYOi7c5vH6
 wuxAPft8yZ/pLFdZSms/3HiJhjqhmLEOhKVNRFZM/bfYvUSPQUmmAPSDRaUC6Sw4Eoem
 a+VaNJZ/jJEYUnqp05ZF2bcehpKu6PgBYoQ+vngq24Lmcz63D0jZ7wC6mroBganvtYaI
 ZV9aeAoRZzg99UwMzfvvDIK6HctKEVWJUo0Xj1j/+1r6QYheePtQSwIf+qMVL3Yl5xbc
 WWEMPY1/CAsS9jHNI1Atg6OqIZ1DMzj07P6k3c1UAaQbqpC28OXXLWDrdkIRR4LsmJhW
 2M9A==
X-Gm-Message-State: AOJu0YzqDscoyV/pmD3cdkYM8mlRYUlU8rDeE+/eq1DG204BNRpO2g0B
 E3oKyx9MwHuNwBg6SC5U26+phEUEhnDylYrKV7FjjPQdQtYX5E28GpmPjqIVmWpP
X-Gm-Gg: ASbGnctJE/QD/K4wMlrVqUuf/gDliwhucC0Ge/6kK0KA55hZ4S0AvNBeitLJLCU9W0l
 kzLKfd8ITvn5k2jNZwI0a1KwdFcAEIVsexCw6naSkQN1B+pEUU5KR7Zczx2rnGB+tgfW2E+mihH
 WGg4OTQCgna3WP2eYcBxsotB6KsV1KRKJ03UIQL7hZ/aqMKIDCmQb8ZlI2zKtaWUyps7fV4sbCF
 cdn435acsScOXjMNvZopdb92cSBq6a/FyL1ITYQPG0ySs4F9B7MO+1GE2mJ0FWvml6DSGu+msRl
 QZTGEh4JCjSCjPKEMch1vISmmfXoenpYzkSvaeveXsG3u3tioMf9LhIOMqkwWgXCh7570GZcBQ6
 XQCCDzTGzJTVxtB6G4FG3uhWHkvZoPA7D3RlOpBLqbGiNcj61keUDi91Z/e+R+dozpdhQnz4pQO
 LJFXjCVg==
X-Google-Smtp-Source: AGHT+IF/swggK/H8cwYRr0veGxM7YtcKjw9Q20vqwIMS0I1M3MLv9EtQOky3GmI3oenmZHeKWCec0g==
X-Received: by 2002:a17:90b:55cd:b0:312:1c83:58e7 with SMTP id
 98e67ed59e1d1-321b3e81bb1mr7347309a91.1.1754984616737; 
 Tue, 12 Aug 2025 00:43:36 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31f63ee4f42sm33954888a91.23.2025.08.12.00.43.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Aug 2025 00:43:36 -0700 (PDT)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Petr Vorel <petr.vorel@gmail.com>, Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Tue, 12 Aug 2025 00:43:33 -0700
Message-Id: <20250812074333.1208878-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754984617; x=1755589417; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/y9s+1GH715i+/HPGMZ5knK8byVFxpyL1YUhG1DGMUQ=;
 b=K/o0fyLxzUDF6t8odhJDFV+sU6NGKhwT2cxVMj890+E6imvvXIcZKAWV7O1xEQUweR
 ci4AYgdWD2vruq/pfy0YVmnD7W9scgBh2cID/2IuaJaeJkhKHTQlE6MgMduBTlG8U88M
 tOwMqPG9RnpWu/R3EMISydv74CazPuj94UnO8GFa2QKZOFiyjWrjzQY7u56RcizF2Sf1
 5uMUTRxnVm7gGiJkURu5jBJniJP5QuXadqZu+eE1r1wkG6WCjEFoapwUUWkvnfFBjlgK
 +AcvqXNe/VXJB6ccPgspnJfYkr3DpgYKtyY6pbjaGUTLKwStSyXthgQQ9WQPs9LTKV3o
 PCvA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=K/o0fyLx
Subject: [Buildroot] [PATCH 1/1] package/iproute2: bump to version 6.16.0
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

Release announcement:
https://lore.kernel.org/netdev/20250803143154.2d700ad4@hermes.local/

Changelog:
https://github.com/iproute2/iproute2/compare/v6.15.0...v6.16.0

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/iproute2/iproute2.hash | 2 +-
 package/iproute2/iproute2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
index 69de2917cf..eef0f7353a 100644
--- a/package/iproute2/iproute2.hash
+++ b/package/iproute2/iproute2.hash
@@ -1,3 +1,3 @@
 # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
-sha256  8041854a882583ad5263466736c9c8c68c74b1a35754ab770d23343f947528fb  iproute2-6.15.0.tar.xz
+sha256  5900ccc15f9ac3bf7b7eae81deb5937123df35e99347a7f11a22818482f0a8d0  iproute2-6.16.0.tar.xz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index e3076a59a8..de8dbcf97f 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPROUTE2_VERSION = 6.15.0
+IPROUTE2_VERSION = 6.16.0
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
