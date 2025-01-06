Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D19E77197
	for <buildroot@archiver.kernel.org>; Mon,  6 Jan 2025 02:47:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05FFE8114A;
	Mon,  6 Jan 2025 02:47:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wm9zzOP49b6N; Mon,  6 Jan 2025 02:47:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 256858114D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 256858114D;
	Mon,  6 Jan 2025 02:47:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id F03216B
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 02:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB20B400F9
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 02:47:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fuBPT7jfdh69 for <buildroot@buildroot.org>;
 Mon,  6 Jan 2025 02:47:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A5359400EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5359400EF
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A5359400EF
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 02:47:02 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-2ee709715d9so15888246a91.3
 for <buildroot@buildroot.org>; Sun, 05 Jan 2025 18:47:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736131622; x=1736736422;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RpkCX68b5ZijETCkij/8yC1ZPXjbUI9mR6nZ4LExuN0=;
 b=k2eA/DV7HdeaA9cj4cRirk2Xz/+/KWtFVJY2zTT/ZOOQO2/cUHCQuhMyfxjNwwU3eW
 kaUBfK932wrC0A/lWJbs52yNFhlKgNi30wdkxZNXLyTtOFB8ORtcWK4Lu7iQ44kuKgXp
 m5lhPmLVvrVh/EVv6IMQvZ6w7OARedneHtMJyF+SVowLOuSuA/dL+LgqN7JJqRU+yy9K
 vqGfFqnQvP4wb+GTjd9PdhP3ivr52TeqNW5bSVF6uzbmaNP5oHIKAHG1ahVE3jxO7pbO
 cSUSPBwhB+Z9hjG5i6M/hDgyAnczWVaMm1KmRMEhgpAfTqSgrIFnftLSqy44+3HRCMoT
 gCnA==
X-Gm-Message-State: AOJu0YxalJ1iISnHDqxoznt0Jy1v8CY8lzMCCNGv43+F/P2L3IlgwTfn
 I3QUFxSSOd9Ngx0bQ/IX0G0Kg9VD9PM5wDA/MYElrKQolweytH3+oCJCqA==
X-Gm-Gg: ASbGncv9usAXzaDqbW+F4jVYhLkEmj3sZKjuudoAy4N0RLS8zMVjf+CVtv+75uc2uWE
 gWk9UlCz31Tso+DBSMigj5mjYQWR/tN0CoIzdNLm+X5SZeWSNLKizLZb6ssAp1ZX6TWoOjTpdZ3
 D704h251ltN4F9BpgnNOv41DRAhA/6iaLUlmuDIrC2tY1mTeJs/0+0wua3Qes2CAUpzV6cQO/4D
 GsigLuVOkOhohfKMz6TkQ4uqCOBUGutXYdYyFfUeyKZho2k+J08iTbwCOvvQ+nRN/BjkhnOMMRw
 bxJvYEMHmIZ/UaFWR4togfHfFJ8mRx3/glud8JtW
X-Google-Smtp-Source: AGHT+IG6OVdHp5kwBUnxOdmsVkE7hgGEsQcgTxbsbXc198nd1vNxkH5lgfSkm8An+QLX/sOsV4CigA==
X-Received: by 2002:a17:90b:134b:b0:2ef:316b:53fe with SMTP id
 98e67ed59e1d1-2f452e4d0e5mr72864170a91.22.1736131621563; 
 Sun, 05 Jan 2025 18:47:01 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f2ee26fdfdsm34678441a91.52.2025.01.05.18.47.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jan 2025 18:47:01 -0800 (PST)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Sun,  5 Jan 2025 18:46:26 -0800
Message-Id: <20250106024626.151525-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736131622; x=1736736422; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RpkCX68b5ZijETCkij/8yC1ZPXjbUI9mR6nZ4LExuN0=;
 b=XVwMfq4sIV7lTceEcgqTgBcdAXeN7PpWQKZSpRzo6qHWXIFgj5G9HSoSedaBNoxCp3
 Lj1rFRFOG9YlpR/CIUvgitzbD28Skqrqh4BRJEfQg1s5R2UgwL0HB+tbclLVr9AieHhk
 tOd7rzuSBCrYGwV0Mk2uHY/Z4uL76tMKvQmsq6gV3AdETy5jRvrlK6KcMqOR9+L9em2U
 57pSNefVEtcnpantns/QSPusxgPIXm3V3Qu7pv/ku433q0jdnrrjL6xYNj/W6m8ERG0d
 Pq5OsAtEmFta5BudAEq+2nwl2ncPnQV0gR+Asy9MbXtxENnT/6uK7ttYTpjbuXXbLX1W
 zUQg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=XVwMfq4s
Subject: [Buildroot] [PATCH 1/1] package/iperf3: security bump to version
 3.18
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

Fixes CVE-2024-26306.
https://github.com/advisories/GHSA-2w89-5px3-fvx6

Release notes:
https://github.com/esnet/iperf/releases/tag/3.18

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/iperf3/iperf3.hash | 4 ++--
 package/iperf3/iperf3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/iperf3/iperf3.hash b/package/iperf3/iperf3.hash
index ee0149daed..585edbab1b 100644
--- a/package/iperf3/iperf3.hash
+++ b/package/iperf3/iperf3.hash
@@ -1,4 +1,4 @@
-# From https://downloads.es.net/pub/iperf/iperf-3.17.1.tar.gz.sha256
-sha256  84404ca8431b595e86c473d8f23d8bb102810001f15feaf610effd3b318788aa  iperf-3.17.1.tar.gz
+# From https://downloads.es.net/pub/iperf/iperf-3.18.tar.gz.sha256
+sha256   c0618175514331e766522500e20c94bfb293b4424eb27d7207fb427b88d20bab iperf-3.18.tar.gz
 # Locally computed
 sha256  3dc3e2076dd9cdea2b66d8fe213997ff25fb6171594f055b59fe25321b438f6f  LICENSE
diff --git a/package/iperf3/iperf3.mk b/package/iperf3/iperf3.mk
index 1d2b57208a..744ee070a4 100644
--- a/package/iperf3/iperf3.mk
+++ b/package/iperf3/iperf3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPERF3_VERSION = 3.17.1
+IPERF3_VERSION = 3.18
 IPERF3_SITE = https://downloads.es.net/pub/iperf
 IPERF3_SOURCE = iperf-$(IPERF3_VERSION).tar.gz
 IPERF3_LICENSE = BSD-3-Clause, BSD-2-Clause, MIT
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
