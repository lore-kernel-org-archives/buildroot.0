Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D38C5B555
	for <buildroot@archiver.kernel.org>; Mon,  2 Jun 2025 17:29:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 734A381FDE;
	Mon,  2 Jun 2025 17:29:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k2P2aATAhLwx; Mon,  2 Jun 2025 17:29:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A81E081E88
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A81E081E88;
	Mon,  2 Jun 2025 17:29:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 376871F7
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 17:29:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D7D041E4D
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 17:29:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qBKxMT8k9TBZ for <buildroot@buildroot.org>;
 Mon,  2 Jun 2025 17:29:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4308B40AC3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4308B40AC3
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4308B40AC3
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 17:29:16 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3a507e88b0aso1338604f8f.1
 for <buildroot@buildroot.org>; Mon, 02 Jun 2025 10:29:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748885354; x=1749490154;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xqsHGcyMP9bAMzit2EJKCHaZ5b0hV1+Yt9S50bKj+bk=;
 b=SBr2ZZ4RlRMngjkEtBz1Obs/baIxfveOYNAijcIAWKFguHiq5NzCCmugdQK2cp2rrk
 fPesD9wB5E5fWi5W51IY2dNOU9adtHstP4EOYhZ+rEuKa1ME5QBHsbOQKsNxyl2e1cua
 Lb8XGB4X4x3REzU202o4pks3Q5xL2w5gSIELXxCwIP1l2lmFWfHHxHO99mPEkryfOXpv
 XryjdTOQNJvsxqu/5FgPc6qCXoYB68KymALDAjpRhibykCokkE8R7oeZXkOL8/Sa+zMa
 9Lvm4uVve+zimtKB0WMTAaCmSRdzjHy8PRC2XKPKwZKcQ75urhYNd2ZIfA8ilafAvemW
 cbBA==
X-Gm-Message-State: AOJu0Yx+jxNoUDms0NZr9VJCcn1v/biVq0B/5h1oiIURUh+a6jsFa/F0
 j2Jg3DQr8bLPxLm9bLKWTE4eVzaQEkuNn2fM4cRbWfly42L3ASS9liCOzXs5YA==
X-Gm-Gg: ASbGncsK8SRVLzmt6GRIDA/nOmH0+poou86fZDhKoirQKPW3yHPfsS5nCHsLxYeqyRb
 2CBgA7vyR3Zm3pXSF144jukvD6AfAIruQuVNRui9kx9EahE/1wfORNZO9gw//F7qC9OUK/AQxrm
 shmQmDmUzEarDk9HXf426/jDLZRMv+ElELqrx1QE9qJxLcTyRDTU3KUN/HQsBhAOORE6LEE+Etu
 m8ffGWdGOUQHLxo1QvDknBsjAaspAARc550zR1sFNIipEFts0Xm8OIB3zuJ6sEm/GbCUfwFIY8h
 I4sIEfZBXCFzyXvztZzL4EdgTmf43JgBQK9f4iXe0BuJhoRSv8MnKL+ylPfX/6JYiw==
X-Google-Smtp-Source: AGHT+IE8g+p+5AEP4ut8YknTmJSDNblsuuws1WVc7/52UxEAkpThat3tdjM5i+JeU7DdSTNI4diLpw==
X-Received: by 2002:a5d:64e6:0:b0:3a4:e68e:d33c with SMTP id
 ffacd0b85a97d-3a4f89daad8mr11109653f8f.47.1748885353904; 
 Mon, 02 Jun 2025 10:29:13 -0700 (PDT)
Received: from x230.suse.cz (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4efe740bbsm15635915f8f.54.2025.06.02.10.29.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jun 2025 10:29:13 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Cc: Petr Vorel <petr.vorel@gmail.com>,
	Julien Olivain <ju.o@free.fr>
Date: Mon,  2 Jun 2025 19:29:08 +0200
Message-ID: <20250602172908.515944-2-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250602172908.515944-1-petr.vorel@gmail.com>
References: <20250602172908.515944-1-petr.vorel@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748885354; x=1749490154; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xqsHGcyMP9bAMzit2EJKCHaZ5b0hV1+Yt9S50bKj+bk=;
 b=jJag3ViB2ln1bEmEGUoEmz3oWF20Bwh3vDOPhWON/4j2XvlFiwNhCY8bvRkDAWofRN
 g20EmU2MByu1arkcdYETgWvGy9iN4w4w+nfnU9ACl9SMk886Ni3mnx78FhgG9loVlbqK
 P/7Wm5p0Oav5OjEZUo8Xv5rZn79mw4LNLsYVe8rugN1Vpa6GtRH4si84ItjGnYsWzZDM
 +hYvjK9sJqDE499/1tcUmccJRypPsn+08FfVXv9hlCG7x8wTb7oSS7MxKkHz+5ZpYm6J
 Fdgd68s7nkuhMaXrQawdf1uDOG6I1UftXlCW5XdLXsnTOWgE+ZSD/ozDUeHJZRLXr27I
 X+pQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jJag3ViB
Subject: [Buildroot] [PATCH 2/2] package/ltp-testsuite: bump version to
 20250530
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

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 package/ltp-testsuite/ltp-testsuite.hash | 4 ++--
 package/ltp-testsuite/ltp-testsuite.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ltp-testsuite/ltp-testsuite.hash b/package/ltp-testsuite/ltp-testsuite.hash
index 688346fef2..8ffde75e37 100644
--- a/package/ltp-testsuite/ltp-testsuite.hash
+++ b/package/ltp-testsuite/ltp-testsuite.hash
@@ -1,4 +1,4 @@
-# From: https://github.com/linux-test-project/ltp/releases/download/20250130/ltp-full-20250130.tar.xz.sha256
-sha256  02e4ec326be54c3fd92968229a468c02c665d168a8a673edc38a891f7395ae10  ltp-full-20250130.tar.xz
+# From: https://github.com/linux-test-project/ltp/releases/download/20250530/ltp-full-20250530.tar.xz.sha256
+sha256  27586ba78eac1e40cd422add2842f1ad70f09fea55da3bd6a25e10feb786d4f2  ltp-full-20250530.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index f5d577e444..1a401c0421 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTP_TESTSUITE_VERSION = 20250130
+LTP_TESTSUITE_VERSION = 20250530
 LTP_TESTSUITE_SOURCE = ltp-full-$(LTP_TESTSUITE_VERSION).tar.xz
 LTP_TESTSUITE_SITE = https://github.com/linux-test-project/ltp/releases/download/$(LTP_TESTSUITE_VERSION)
 
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
