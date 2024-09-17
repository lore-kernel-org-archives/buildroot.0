Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2A61CAC5AA
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 22:06:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FFC580EDD;
	Tue, 17 Sep 2024 22:06:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lyuegtHMDo5E; Tue, 17 Sep 2024 22:06:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A46280F02
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A46280F02;
	Tue, 17 Sep 2024 22:06:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 18E961BF316
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 22:06:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 07A7980EDD
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 22:06:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NyML5ok9l7-Q for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 22:06:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::129; helo=mail-il1-x129.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0402C80EC1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0402C80EC1
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0402C80EC1
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 22:06:52 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id
 e9e14a558f8ab-3a09a62e5deso17024185ab.1
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 15:06:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726610811; x=1727215611;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Hl9gObm1+b27cOHO1pd2wxIAUcOL7DbeHYagBLx9Gg8=;
 b=gRd31pnm1Rvi4XZnZDhSMJzedepZ4RapbDMPzF1iz0pebAy8pyHoaNE/DVS08OAB5P
 1LUk/SgLBSdr9bARHO3rMrgIFCwvceQKY2SRoquCSDeeZXvJLYo91D7BlcwfvbXExaI8
 Dg36Q89Slyu7JnXpzEl/GA34JEwhxctFAvXoi/IMc3MLgVjyn438A/EYMVsPNVAXdGVh
 +zNBBYUH7378Kyx7gcliz061WHqcWGFDItlZjR5lgVGNS43Yvs/VQ/mIOr9oRRNH2zv3
 UIJFc5pKlEo7d/IthAm5lJFKM0qOFAiYxlV9Kr7rKK3gah8v2NMYvcKBoPWEDTISXMKX
 KXMQ==
X-Gm-Message-State: AOJu0YzDo6cBWNfLBtcEERWNSqythbwBVl2p+F2YkRh16J9Txgv1CcyW
 SzTIAdVuCnOuUIYYWQ+zvj/x8gGNc1EO3QcSyTiu5PyWnvk92T6rSpe6nw==
X-Google-Smtp-Source: AGHT+IFlyB9s5nAeIYiC/kNyi01Nu0TRscK8QG1IZLmmLcGdDincTh1R4I1wQpasOREd1rO6Wv++CA==
X-Received: by 2002:a05:6e02:1c2b:b0:3a0:4b2d:7371 with SMTP id
 e9e14a558f8ab-3a08495a3c1mr168016365ab.26.1726610811632; 
 Tue, 17 Sep 2024 15:06:51 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ebf4633sm2198592173.4.2024.09.17.15.06.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 15:06:51 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 16:06:49 -0600
Message-Id: <20240917220649.106611-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726610811; x=1727215611; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Hl9gObm1+b27cOHO1pd2wxIAUcOL7DbeHYagBLx9Gg8=;
 b=kxC84d+m/z0jkHCVIkewh/r9epwXjFIsycnWD0nL4jx4GwR2dOKzDr9f/VclULvEDX
 awMV6zvMeG0H402Zo27BuRftLIYzHQE6upjaWqRAh9DnfWY9gvvG9wnULLCjmXGShB9c
 sPf4iVhqiPJvRazyDhPZY8EdkpTkK9p4PIOHGUgYeUY6/HCqn3XdZHUAWAM8D9wrQiTX
 2+tuLrWD2K8wwRFK1SZKR4z7g8HDTic/y1fMy5rZedfBYULd3QdPFuBn/H7KyvdU92xC
 y/NebRPozDYOMuzOXD7PIajE/CURE3hp4qFkmhLyZWunGaP+9PFhHpleHNBVpbUKHof5
 VigA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=kxC84d+m
Subject: [Buildroot] [PATCH 1/1] package/python-pyicu: bump to version 2.13.1
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
Cc: Bernd Kuhls <bernd@kuhls.net>, James Hilliard <james.hilliard1@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pyicu/python-pyicu.hash | 4 ++--
 package/python-pyicu/python-pyicu.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyicu/python-pyicu.hash b/package/python-pyicu/python-pyicu.hash
index 01d4bf7fdf..74eb1fe1b9 100644
--- a/package/python-pyicu/python-pyicu.hash
+++ b/package/python-pyicu/python-pyicu.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyicu/json
-md5  a4411ff1ed8a09e3e9c1d0d02dc89ad8  PyICU-2.12.tar.gz
-sha256  bd7ab5efa93ad692e6daa29cd249364e521218329221726a113ca3cb281c8611  PyICU-2.12.tar.gz
+md5  5a1f54231db3dcd3230a80b40e8013cd  PyICU-2.13.1.tar.gz
+sha256  d4919085eaa07da12bade8ee721e7bbf7ade0151ca0f82946a26c8f4b98cdceb  PyICU-2.13.1.tar.gz
 # Locally computed sha256 checksums
 sha256  00da5bf22f2386c4f6f07c734490e9b818c4dcf70e6ca49f594e9cec636b9c40  LICENSE
diff --git a/package/python-pyicu/python-pyicu.mk b/package/python-pyicu/python-pyicu.mk
index 50962f601e..6652268df4 100644
--- a/package/python-pyicu/python-pyicu.mk
+++ b/package/python-pyicu/python-pyicu.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYICU_VERSION = 2.12
+PYTHON_PYICU_VERSION = 2.13.1
 PYTHON_PYICU_SOURCE = PyICU-$(PYTHON_PYICU_VERSION).tar.gz
-PYTHON_PYICU_SITE = https://files.pythonhosted.org/packages/c8/25/38a2104fd48373cfd4eac5104f104ef486f61527e48d627de74794354a2c
+PYTHON_PYICU_SITE = https://files.pythonhosted.org/packages/60/b8/1540a0a0cd74aa878749d442e19916df946e3b187c9965a991ddc77cc39c
 PYTHON_PYICU_LICENSE = MIT
 PYTHON_PYICU_LICENSE_FILES = LICENSE
 PYTHON_PYICU_DEPENDENCIES = icu
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
