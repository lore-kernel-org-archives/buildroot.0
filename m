Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2017EC87FCB
	for <buildroot@archiver.kernel.org>; Tue, 12 Aug 2025 07:52:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA69040F08;
	Tue, 12 Aug 2025 07:52:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g6MUfv6hwnbh; Tue, 12 Aug 2025 07:52:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8ABE40FC7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8ABE40FC7;
	Tue, 12 Aug 2025 07:52:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A9B9E158
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 07:52:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9BB3040FC7
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 07:52:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fh2g3YFRpGr3 for <buildroot@buildroot.org>;
 Tue, 12 Aug 2025 07:52:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::531; helo=mail-pg1-x531.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AEF1C40F08
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AEF1C40F08
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AEF1C40F08
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 07:52:41 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-879d2e419b9so3425939a12.2
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 00:52:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754985161; x=1755589961;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W1wHGy+27IvDsBZ458smA7FGY3HjfgzYrANa1wDI+28=;
 b=toK+I/G77cZ+TGhFxrbsq3vVrYqYT/3eoMPe2xUYNLlI3dqNb/HSshPkwjN66oKSSt
 f8332KqfwqLPuCWH30LXcPNi/tdZ6W3I3kM54Rq20fDBHr+BS5bcdKA+pF3yqQCXNTqu
 OHqF0vQUT8h6r7J4322F898Vb2+BE/0WT5QJdCMVX5JEnQ7ZiSSD4LlSfnZg8aaxvuek
 qgLsg7LSD+B75nPoe6SE0hrRN/10XXjZSA50QGjMmBGclf0Ml9POohJSkdHT8+dKE36f
 JDp2v9rpCx1rnlbnnfL4V0eiN1UI81VKNRpmA2A8+kbrHO088VJGz0nJ9AEz84DsyLm2
 ynMA==
X-Gm-Message-State: AOJu0Yx1XCZr0S44ol+hpr2hfLmaCp/681SoX0skb2yE0JWpLVbXQZ+S
 xm9r8kEHejcnOj43Zu8yNwpS8PwW+nZ3waaVW80AbzGSg2IdjldEiHIvg4OmpXXw
X-Gm-Gg: ASbGncukNS+Szy3KkWE0xjDvuGbs/A7hrHnV1BtzqR+8chs3RCHMVVSjC6inkcEnElV
 8hR6A3Cz/rXu/yqpn8kcSbO5Bhgy7BsLdryO8RuW1QAl1cpnQOr6CFgWiX38NrP1KSYjuTFtdON
 bbXTJtd2URBj1SyvBXPqXYny1S1uuu9+adtcS9z6jM+Nvl4dcGCTq/y6wnB1lWpcC7iI309U+BE
 52+3bjtJ1VeFqKBvJH8kHOkMyXJLjLGu/wS4HGbsHeW+p6Tw7cfSONFcJ66zcZZ3O+ZzU0BUZRs
 YHH8dhRSf3qDP3WzqqW0qS6bCk2G7YL9iNwZV0Keoyshw2JtR/sAY67j/1k23uwjnVt0rWAbAyJ
 OufPa/kR4t2XApAzWOJ8iGMuKNK+TBPQ6EH0VYwOsNltUDKzJlU4ZvkPWbHLWCbfw6WYiUrl/lQ
 vW6iE+gQ==
X-Google-Smtp-Source: AGHT+IFzR75fgB2o0W7WdRi6UNvdrHxHz+zBcCADS7k9q97jWSXVQXD75drAqHpiZjBKnKSeUEzgJg==
X-Received: by 2002:a17:903:247:b0:235:eb8d:7fff with SMTP id
 d9443c01a7336-242fc317145mr25945145ad.28.1754985160578; 
 Tue, 12 Aug 2025 00:52:40 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1ef6a8fsm290502725ad.23.2025.08.12.00.52.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Aug 2025 00:52:40 -0700 (PDT)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Tue, 12 Aug 2025 00:52:37 -0700
Message-Id: <20250812075237.1214602-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754985161; x=1755589961; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=W1wHGy+27IvDsBZ458smA7FGY3HjfgzYrANa1wDI+28=;
 b=JvlFiGKqbkuJvoKwv71Bii3cckEsWggemEbKY11gxCg3oR/TjSnKHYVLgsNt3P45hG
 +ROSZS3UfzZfONZAZxufm4nqhM4ifSRl8E7tnPQ/+JXWsLXlM4tRBmW9IHEo8ERopO0I
 lLAr/2bTxbleSrisT/9kdoFWTMfOiyHK66oIAA53Ec6WCO4fo0UTvRcXFOfq3UEugSCR
 uBrYm9OsVACKNxna1uAxpYutxv6eKpNwPCXU56JCU9fJUsqsGjoufca+mIesQ2L6B4kn
 yFQq1k3BuvQlaO6mwc409moSU6ErAnTOFK+L1InTu0tpvz7zF45iW+ZkZOhwnXxyI7Kt
 8qLg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=JvlFiGKq
Subject: [Buildroot] [PATCH 1/1] package/iperf3: security bump to version
 3.19.1
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
https://github.com/esnet/iperf/releases/tag/3.19.1

Fixes the following security issues:
- An off-by-one heap overflow has been fixed in authentication.
  CVE-2025-54349, ESNET-SECADV-2025-0003)
  https://github.com/advisories/GHSA-8xx8-qrh3-q8mq

- An assert in authentication has been removed. (CVE-2025-54350,
  ESNET-SECADV-2025-0002)
  https://github.com/advisories/GHSA-r6x8-74x9-5mc9

- A buffer overflow in the --skip-rx-copy option for zerocopy
  has been fixed. (CVE-2025-54351, ESNET-SECADV-2025-0001)
  https://github.com/advisories/GHSA-xjwm-4pfw-49g2

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/iperf3/iperf3.hash | 4 ++--
 package/iperf3/iperf3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/iperf3/iperf3.hash b/package/iperf3/iperf3.hash
index 1ffb2c6c02..3d9ff0cf5d 100644
--- a/package/iperf3/iperf3.hash
+++ b/package/iperf3/iperf3.hash
@@ -1,4 +1,4 @@
-# From https://downloads.es.net/pub/iperf/iperf-3.19.tar.gz.sha256
-sha256  040161da1555ec7411a9d81191049830ef37717d429a94ee6cf0842618e0e29c  iperf-3.19.tar.gz
+# From https://downloads.es.net/pub/iperf/iperf-3.19.1.tar.gz.sha256
+sha256  dc63f89ec581ea99f8b558d8eb35109de06383010db5a1906c208a562ba0c270  iperf-3.19.1.tar.gz
 # Locally computed
 sha256  7c9ba0385fcf35c4c9e08ad0c0cba72d4315f36f0f742fef4de826a28cc33a97  LICENSE
diff --git a/package/iperf3/iperf3.mk b/package/iperf3/iperf3.mk
index 69c4792f98..df6b32abc1 100644
--- a/package/iperf3/iperf3.mk
+++ b/package/iperf3/iperf3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPERF3_VERSION = 3.19
+IPERF3_VERSION = 3.19.1
 IPERF3_SITE = https://downloads.es.net/pub/iperf
 IPERF3_SOURCE = iperf-$(IPERF3_VERSION).tar.gz
 IPERF3_LICENSE = BSD-3-Clause, BSD-2-Clause, MIT
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
