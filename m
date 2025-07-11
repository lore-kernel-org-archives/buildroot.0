Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E8DDC8303C
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 06:45:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3647E83DA4;
	Fri, 11 Jul 2025 06:45:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0wwXwS-pjiRZ; Fri, 11 Jul 2025 06:45:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6801F820D3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6801F820D3;
	Fri, 11 Jul 2025 06:45:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DA58C1E1
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 06:45:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB11C820D3
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 06:45:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a-3zd26_b19u for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 06:45:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2001D820A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2001D820A7
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2001D820A7
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 06:45:34 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-747c2cc3419so1687956b3a.2
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 23:45:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752216334; x=1752821134;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pvO0a39SYWlc9Jzu904DY+Nl6KumZTZQmke8emF4V1c=;
 b=xBfUKiKZOSSuXnbQ2F09UZCOKlMjS8+xoulLfPw8ooJ7FHBzbYaDty7LJ/QhBfClj8
 J2vfuIfpWutwyorMyxFGRPlw4HMkM4dTFKHGms0jQ2Zbgj2FsMbzSZ432rn136gjJh2u
 2NrKkQtZa5yKEc2xGt9CCE3KN+91JtgbO/yrqOaBazG+g8mOYyezTWfuNgAccIbgr+7y
 uryx7CkfrIglGBsf0/4rcqVtgjtCkI0ddax5bE27gyFLZwddIk1SctR/RQ6x0B9d+3fk
 dvdDRFW2XYmp2wNaPRSRG5hWOuCyl3Ds9AygDJn/17nuQuujrh8pZlwNAOKBo9I6MqxN
 Li0A==
X-Gm-Message-State: AOJu0YxLYEJKzSMlvhoMJyv91nBB85NmgoMIkvsomC/YMrURq4IUZfnU
 9GZDlEw4GPVQX1245yL1fHoBMsxB4xQ1Gmk0o4D/nqBUEI+VUZpSnI082JfuMw==
X-Gm-Gg: ASbGncuHM0YYqQTmYXb0dHhBOrkMA4VCyP0Q1rOawZrWtwSyaAQEYvOc1C0bNutoePj
 plrl3SBY3NDuHQfY+V5BmGJZIUG3Ji7j5W7LgspB0cJ6cIP2sYVyr4WUUYQOiOoNmKguxuhvEVq
 rWE0RhHof1w/iC58i4+QyXqP+kSZ9yIypsGUky5KnULupeJDd4eM1FuaZXg5wgNSZPdBiF6kO+H
 Nw1AwqqGmKki5p+OPjkBKl5inHGCSOt34LUVvTi21mR/jKwQkZvNV/B38eQzlKjhmhmgYTVCgYi
 OmaOSoF3V5v5sFqDiRk0wqdxRS0zg9n6gWvX0NP4Yt8ca7nignLaooQf1yGGF6jWOHXr/R3IMgo
 UJF5HbdvpM1M76GOuFMU=
X-Google-Smtp-Source: AGHT+IEljKLV+EVwQ1JAPmiOmctgO6estXTAnnZDJ8xIysNdT3e33ksIU/MShs4WMgEIVPR81YeBfQ==
X-Received: by 2002:aa7:8887:0:b0:74d:247f:fae4 with SMTP id
 d2e1a72fcca58-74ee0bb5748mr2869138b3a.4.1752216333829; 
 Thu, 10 Jul 2025 23:45:33 -0700 (PDT)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9e069b7sm4889736b3a.55.2025.07.10.23.45.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 23:45:33 -0700 (PDT)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>,
	Maxim Kochetkov <fido_max@inbox.ru>
Date: Fri, 11 Jul 2025 14:45:24 +0800
Message-ID: <20250711064526.456324-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752216334; x=1752821134; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pvO0a39SYWlc9Jzu904DY+Nl6KumZTZQmke8emF4V1c=;
 b=apbZbklvbgALQXYDvjgChm/UW4a3QU0TZ2QOfwtU7bmBCsbRxWpIimwgF3HBOFA7oe
 VE5+d8nT3Yuk6pCCh5uIIVRraVUVnT6QKayrt2FTKsdjJ48dcvVtdII1migFoy3uo2qt
 cjarRVZSwEEb+sMWWm9z1M0qK/0NJHCGWu3yNW56aZlpB2LW+tda/YgEm0W9PuBkI2Lj
 ljkzswR5VVicHRXgFnNVW8DW9OYVakU1lgJgeEnpHrWEoqebHT2eVNAdU/WNlHvlpOE3
 9ARZ8DKcHz+oFeq45G8KSPvoOVTzzG4HZOWVrbeqVQvTsbZtbBH/mcyUOaJN3BHEQXB3
 QC1g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=apbZbklv
Subject: [Buildroot] [PATCH] package/timescaledb: bump version to 2.21.0
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

Release notes: https://github.com/timescale/timescaledb/blob/2.21.0/CHANGELOG.md

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 package/timescaledb/timescaledb.hash | 2 +-
 package/timescaledb/timescaledb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/timescaledb/timescaledb.hash b/package/timescaledb/timescaledb.hash
index 440c5a1371..a1945c6ff3 100644
--- a/package/timescaledb/timescaledb.hash
+++ b/package/timescaledb/timescaledb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  31418d888c2a26cd034cd91fcd51be3bb0108d907de9bf9e8bfebfbf20af7766  timescaledb-2.20.3.tar.gz
+sha256  08e44c875618ed5ffa0d5b968b268d437952a3847403ef70a0bf44d9e59f3c30  timescaledb-2.21.0.tar.gz
 sha256  0378e0948feefd85f579319c74d6e2b671194037f550c7176ef26649d94c895b  LICENSE
diff --git a/package/timescaledb/timescaledb.mk b/package/timescaledb/timescaledb.mk
index 37c249ee9f..fcb766c042 100644
--- a/package/timescaledb/timescaledb.mk
+++ b/package/timescaledb/timescaledb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIMESCALEDB_VERSION = 2.20.3
+TIMESCALEDB_VERSION = 2.21.0
 TIMESCALEDB_SITE = $(call github,timescale,timescaledb,$(TIMESCALEDB_VERSION))
 TIMESCALEDB_LICENSE = Apache-2.0
 TIMESCALEDB_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
