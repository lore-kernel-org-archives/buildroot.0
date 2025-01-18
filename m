Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70BF4C02185
	for <buildroot@archiver.kernel.org>; Sat, 18 Jan 2025 09:31:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 362BC4291D;
	Sat, 18 Jan 2025 09:31:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9RVqSK_IlSF7; Sat, 18 Jan 2025 09:31:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8287426AE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8287426AE;
	Sat, 18 Jan 2025 09:31:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B9F1569
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 09:31:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A771F70500
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 09:31:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MuM7kvXFGHKY for <buildroot@buildroot.org>;
 Sat, 18 Jan 2025 09:31:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B9AA6704FA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9AA6704FA
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B9AA6704FA
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 09:31:01 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-21670dce0a7so65922925ad.1
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 01:31:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737192661; x=1737797461;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EgkeJATZpZu1l7jrNz8DvDSCtQcJ6PDIAU/0Q1KM7Lg=;
 b=GNvVKQTTtmvTl793F/iFLeXrKetCWSb+KaDJxV/Ng22hY35xD0dTsUysatkCOFHs4V
 f+bZqhrrv5wc1+T7TDTJfL6zCOiq5ET09zjw2gMPAuqSIkp0FE+S46xsmpWm4GplLW3O
 Dk/U4RP0cZgO6qO2rwsEwvR6El42wnKOV3GEVOEfPRLoBjEfvLVLFcU1rlI6GXJJH/qh
 yl4xmT3nyW5DAbbvplbd9EvRxzXYjLR0E5vx1qfn4H1RRd6sRMWOft4W4MFkvHB/d+Dk
 tRSs3uvACHDqIVAuD/MX+H8FRO1jhVc321dgO43olS5UU0qcS066uBNZP7mk0HnhMauP
 5CJQ==
X-Gm-Message-State: AOJu0YxzslnWzPQ8duRg9dQUK6dSrEBgCGy0CZj5Jxm2yj9CDA+Tai6U
 pzXhJx0SeTETmvReJVQrxE9VPb001BqpHFoxWJYUox+fIV4Y3SBnQ5F4fq25
X-Gm-Gg: ASbGncvVlw6FKlfr09lsRh2CYjDS57pAtBhyB6UXphI8AahAmKnsQNneGKuP5Kn53pD
 8EOBVtgOhF/TpLFMXhEFdv6pXIh+DQQ1thWiPHP6y4qxyBXtJIApFRUbXVVlwggCglbG0FEHzGO
 FISYXSg7MvcTzmAlWBujsVHmb9I05s9D7RMOOOGyEk36opwTjiKx86oqpMix6BgJipZEpHulhL7
 xFKj0xml8oCc5PiuPMdDk/xtkD41Z0T0Vu1foftOaPu1ZQJIL/4yytMi3baNcow1HrMjqLqGHqb
 U/peA01vhbDF1ZSIgg1XlKZwC4yLy167jIogu+acGnTwSXs1LoAfcA==
X-Google-Smtp-Source: AGHT+IFB+3QxWXNx+sSLtdd/3c0n1LJa6Dv77XoQWHe9AVBb5rqywwZ9noTGi1iFcwTEbcllb6uYZg==
X-Received: by 2002:a05:6a20:a10c:b0:1e1:9ba5:80d8 with SMTP id
 adf61e73a8af0-1eb215ec495mr8639036637.33.1737192660722; 
 Sat, 18 Jan 2025 01:31:00 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72dab7f0436sm3325017b3a.22.2025.01.18.01.30.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jan 2025 01:31:00 -0800 (PST)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Martin Bark <martin@barkynet.com>, Richard Braun <rbraun@sceen.net>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Sat, 18 Jan 2025 01:30:49 -0800
Message-Id: <20250118093049.878701-2-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250118093049.878701-1-nemaakhilesh@gmail.com>
References: <20250118093049.878701-1-nemaakhilesh@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737192661; x=1737797461; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EgkeJATZpZu1l7jrNz8DvDSCtQcJ6PDIAU/0Q1KM7Lg=;
 b=Pc3r9mv0QBO8OLnSa5r5pKUdrSm2+8UtRfdPckVNtz+wYXQpw/3Arw1hbt58nc/fyw
 8S8sOOZCnxfbAmbEfEOUQGEwbEVYLD5T1UoJ3afuDWRKcIyp7h6E+ge9eK58s8NSxiUV
 I/ha+JA20GRKAWNDhDGzdHpvW31FEBc+FJ4cIcbqkfAZZDLCkOF5NrvpZAljltxaMshA
 PjKIGHxzF3VrOO28RohaO7x2uNx1GMb/cFBeoKXf0kAsKdzpNyeRhGMVnvXDHCTarYRT
 6vPkYWuwUyY50Cr2iR2r9KQYad3xvgN3RbrGqWzkGrPf2/KMU48v2lX8sST/VvcfbS7v
 YgeQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Pc3r9mv0
Subject: [Buildroot] [PATCH 2/2] package/tzdata: bump version to 2025a
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
https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/MWII7R3HMCEDNUCIYQKSSTYYR7UWK4OQ/

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/tzdata/tzdata.hash | 4 ++--
 package/tzdata/tzdata.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tzdata/tzdata.hash b/package/tzdata/tzdata.hash
index 3f84ec4f87..d347bc4560 100644
--- a/package/tzdata/tzdata.hash
+++ b/package/tzdata/tzdata.hash
@@ -1,4 +1,4 @@
-# https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/IZ7AO6WRE3W3TWBL5IR6PMQUL433BQIE/
-sha512  0d86686e215672343debb3471b7e7ccb8a27f063f085c9b532d5e0470377843daa0dfb6aee0db4fb9068dd52810c69aeee914a1a7c7e603fdecda7e855020193  tzdata2024b.tar.gz
+# https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/MWII7R3HMCEDNUCIYQKSSTYYR7UWK4OQ/
+sha512  93b8f939d39bdfe451e262666f9099c529c96c49d14c08e3611560ca660e12e16d08a22b145d615e00570fb194881618d6f9a0a617c119ab447be03279d747c3  tzdata2025a.tar.gz
 # Locally computed:
 sha256  0613408568889f5739e5ae252b722a2659c02002839ad970a63dc5e9174b27cf  LICENSE
diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index ba53ae7c38..46c65707a7 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TZDATA_VERSION = 2024b
+TZDATA_VERSION = 2025a
 TZDATA_SOURCE = tzdata$(TZDATA_VERSION).tar.gz
 TZDATA_SITE = https://www.iana.org/time-zones/repository/releases
 TZDATA_SELINUX_MODULES = tzdata
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
