Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 890FDC3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 04:11:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BA2681296;
	Sun, 18 May 2025 04:11:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mW1iXnVmaxP8; Sun, 18 May 2025 04:11:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0730C8134A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0730C8134A;
	Sun, 18 May 2025 04:11:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 89F30DF
 for <buildroot@buildroot.org>; Sun, 18 May 2025 04:11:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A9F440890
 for <buildroot@buildroot.org>; Sun, 18 May 2025 04:11:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2577KufzqOce for <buildroot@buildroot.org>;
 Sun, 18 May 2025 04:11:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EEDB7406EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EEDB7406EC
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EEDB7406EC
 for <buildroot@buildroot.org>; Sun, 18 May 2025 04:11:20 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-742b614581dso1672659b3a.3
 for <buildroot@buildroot.org>; Sat, 17 May 2025 21:11:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747541480; x=1748146280;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y88wK0SguxzdPEk3OiE13w4JLl/F5pDNlPFfWmg4W1g=;
 b=K6UqshkdC6UShH+Vw+zjkdSsQ0ew8aQYUkebcru/3X4jSm0jEpSJMDcTSb0iqJFURj
 fwmcDfRYQIf4HDK8cDh4mwpesWNPZa51nDUiMK0mzLYL7Q5ZBX9EN1kpKFCksWKutthP
 ue53VOCpIJ2XxZFuBonfX1Ap9fhaa/RUTGPcccNlafXMNqeJRA3Qh8QPRX9IsERCZq0H
 I03W9Y/QecouQwup6NJjRLPg7qt3EMDAzqXCwpezD4+jD8cskki7S0TCjBes98KDvTcs
 wS0nDatjImoHGy1C/KUgNbSXBddjSnR2ygdH6Rr4q+bA8Q36wQwzuQz6c+IW/Je3EJwZ
 UEDg==
X-Gm-Message-State: AOJu0YzkFVTn6ZZY2DkqlI/XvQbYtmFeHmnFgKyxaRe+xda2B0aS4CB9
 g8fPhMbRKPhitTUGemoQuepkrDztmbWJolWRFuZJ7DU5PvWyjCUGp4eW98ai85J8
X-Gm-Gg: ASbGnctJyvVYhex8tz0EuthigBuWQq02btw88nf7ET76Lv1iacAm1myWpdqqJ7yH1tH
 E652t0huYMqBlN1rW8nOO7R66I3Kyj7wbBd0cmEBF9cWue056Yoax5j+8sr75z73qNHOAdFuWIr
 52wlReoZHKEgjPOdM0FcVsuZsX7W2ULLTnaepkvjyleW8HtihGX/J3Kx9BlJ8eAMEGdG0PPu4YV
 RWSAAVfrcDk4A4HBq4xNrCgWvMPyAkjawDtkAgrny7wLWb4nN6ubbud4pi85Yf6rt/mYFeF3KNq
 aeO2V5p0/r1ziAQ/7sYnkhFcTf4tXgFp2RxQiRjA94jQmSPMzPV93DqceC2Jc0nZCOKo/RIev2q
 XPfGEGMWMoZILWTrHIT92pFn3Y7MC4jZpS1ScWg==
X-Google-Smtp-Source: AGHT+IGVzYPayN/SDlmwBZsV3ZeVX/BSuIoDR/9q6MJIuOW/GAKw6PZzYh5BcVhH4dsuGketY/zHRQ==
X-Received: by 2002:a05:6a00:a81:b0:742:9f58:ccce with SMTP id
 d2e1a72fcca58-742acce364cmr10623805b3a.12.1747541479688; 
 Sat, 17 May 2025 21:11:19 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-742a9875e08sm4036649b3a.133.2025.05.17.21.11.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 May 2025 21:11:19 -0700 (PDT)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Cc: Kadambini Nema <kadambini.nema@gmail.com>
Date: Sat, 17 May 2025 21:11:15 -0700
Message-Id: <20250518041115.115022-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747541480; x=1748146280; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Y88wK0SguxzdPEk3OiE13w4JLl/F5pDNlPFfWmg4W1g=;
 b=ncQi4SI/JBPq0pBcNn/dANrnsnf/ebFJOcxvlMDOaTBJO8Z+XCtoB1mO22XG5/qB5N
 ai1LouPJol5euKfKMenD+VZFL3PBDoLF0CY34hyRJUv5DwThnk/IaA714j5lW3iXit9h
 TACnuFd0Y4o9ZTte8rDNC6rCfx8vr6DOGeL7iZZ69298iR+WGX9/GEmDE1s5i+JzMjz3
 baGHcj7st1/JtXlnGYYchibyrTAwJQM4EkiAElUAE9oQOCdAg17GyZnGqy9Su5ueqZ0K
 fYDFcOa0d/eKCetJ83PVeLkKaJVF+VSKCXrzjBtdCH8kufd2/bzSO5hoYu6hD70Tp81j
 glqQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ncQi4SI/
Subject: [Buildroot] [PATCH 1/1] package/valgrind: bump to version 3.25.0
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
https://valgrind.org/docs/manual/dist.news.html

Rebased patches for the new version.

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 package/valgrind/0001-workaround-SIGSEGV-on-PPC.patch         | 2 +-
 ...Define-PTRACE_GETSIGINFO-on-PowerPC-when-not-availab.patch | 2 +-
 package/valgrind/valgrind.hash                                | 4 ++--
 package/valgrind/valgrind.mk                                  | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/valgrind/0001-workaround-SIGSEGV-on-PPC.patch b/package/valgrind/0001-workaround-SIGSEGV-on-PPC.patch
index 8a6003cbae..7bc0dd02c6 100644
--- a/package/valgrind/0001-workaround-SIGSEGV-on-PPC.patch
+++ b/package/valgrind/0001-workaround-SIGSEGV-on-PPC.patch
@@ -16,7 +16,7 @@ diff --git a/coregrind/m_machine.c b/coregrind/m_machine.c
 index 6110c93..298a00e 100644
 --- a/coregrind/m_machine.c
 +++ b/coregrind/m_machine.c
-@@ -27,6 +27,10 @@
+@@ -25,6 +25,10 @@
     The GNU General Public License is contained in the file COPYING.
  */
  
diff --git a/package/valgrind/0002-Define-PTRACE_GETSIGINFO-on-PowerPC-when-not-availab.patch b/package/valgrind/0002-Define-PTRACE_GETSIGINFO-on-PowerPC-when-not-availab.patch
index 44adfc4190..5e168ad506 100644
--- a/package/valgrind/0002-Define-PTRACE_GETSIGINFO-on-PowerPC-when-not-availab.patch
+++ b/package/valgrind/0002-Define-PTRACE_GETSIGINFO-on-PowerPC-when-not-availab.patch
@@ -19,7 +19,7 @@ diff --git a/coregrind/vgdb-invoker-ptrace.c b/coregrind/vgdb-invoker-ptrace.c
 index d65f59a..bdefac2 100644
 --- a/coregrind/vgdb-invoker-ptrace.c
 +++ b/coregrind/vgdb-invoker-ptrace.c
-@@ -72,6 +72,12 @@
+@@ -81,6 +81,12 @@
  #   endif
  #endif
  
diff --git a/package/valgrind/valgrind.hash b/package/valgrind/valgrind.hash
index 203a0770e1..af45bce9a5 100644
--- a/package/valgrind/valgrind.hash
+++ b/package/valgrind/valgrind.hash
@@ -1,7 +1,7 @@
 # From https://valgrind.org/downloads/current.html
-sha1  6fc0470fedc0d85dae3e042297cabd13c6100749  valgrind-3.24.0.tar.bz2
+sha1  5939b8360d272e89bc7b2fcf5213e57a2080afaf  valgrind-3.25.0.tar.bz2
 # locally computed
-sha256  71aee202bdef1ae73898ccf7e9c315134fa7db6c246063afc503aef702ec03bd  valgrind-3.24.0.tar.bz2
+sha256  295f60291d6b64c0d90c1ce645634bdc5361d39b0c50ecf9de6385ee77586ecc  valgrind-3.25.0.tar.bz2
 
 # License files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index f0638f464b..791ba2b504 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VALGRIND_VERSION = 3.24.0
+VALGRIND_VERSION = 3.25.0
 VALGRIND_SITE = https://sourceware.org/pub/valgrind
 VALGRIND_SOURCE = valgrind-$(VALGRIND_VERSION).tar.bz2
 VALGRIND_LICENSE = GPL-2.0, GFDL-1.2
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
