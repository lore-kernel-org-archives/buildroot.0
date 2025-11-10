Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA08CCF9E3
	for <buildroot@archiver.kernel.org>; Mon, 10 Nov 2025 10:10:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB92580ADE;
	Mon, 10 Nov 2025 10:10:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4jH4dKpJX06d; Mon, 10 Nov 2025 10:10:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A59680AE7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A59680AE7;
	Mon, 10 Nov 2025 10:10:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9940DFA
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 10:10:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 80031404AE
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 10:10:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z898dyYWlHkF for <buildroot@buildroot.org>;
 Mon, 10 Nov 2025 10:09:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::529; helo=mail-pg1-x529.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A728C4044B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A728C4044B
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A728C4044B
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 10:09:59 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-b4755f37c3eso2165464a12.3
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 02:09:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762769398; x=1763374198;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/VlAhrPcId+U7BrB5aKy/GrJMw8Qkppknb+bruSuw8w=;
 b=PaQD9Q/Po8doTZVHnGAHG9bwQFVojGt5ManBkg590w6q3EuQQz889zXDaJXBquK2Fi
 JB6PgDo1375jq6BZGjen6fW8GPT8HrzQwgc38b6Uw62dFj86IWpB/Zsvolbu+f/iWMc+
 zfZ3UfQJAxOGMA1z8rwSBbOCDRYUT01RVic7BUYc0+cIpFcYpOhm4m14JPnqDQcHFSgZ
 K8TTOcASm3hIBCLZaQWHAF7ry2HUQ2UUlgt+1AccaxLxzggUWE44FRSF2I0Xb/lJyqMS
 Jmbv0XMKguvL8s+KATPEIhVhcNDa9LgTlK+oMPkfh+K+UPYzMUS4CQ6Aaq4ZEzHqV9FE
 gLtA==
X-Gm-Message-State: AOJu0YwGTIbmQcElgCGX7phvC8HLg/7VrBRZrkjM30LxxIAdg3nN9cPs
 hZnoNnUtZb+2DmgsHFQ16lX4vw9kZwS5k5V4M+1u9oqto1iImbXkpqtAVDGEL7wn
X-Gm-Gg: ASbGncuIvn7kgLdzdDByKjSTdHjyjvtkknxGaAl5HWdTmUrNia08EhGlfNHkDGYa4Tt
 D54DVhGhfqpzxBagn4n624msDPZrKLgQj6TFB8A325cqqKF22NbtmbeI1tj79/277SzM1/BTgtj
 41F1M8FSQzgbbsTAMaUj9kILDSV4lJiKLagCBH9A4GS/815QkE3SaYBso71UJT0Zu+om+9xCGfW
 MeDGSPJ9ETjmwEeSYuMJ2ZJchoa33vs3KpLavjLni2DFE90NJ2t9T50nKvq09WzHwIf+6VMsfUP
 mylRbxBYxD7XhEbeabyXnOIQU71YEeANHuvwYIaOboHLGkOOciagsH58B7OopUajq8S8O/gTEbL
 nZgew8CvtaaJiEYjVMjEiOg6PX+8eGsSRRf5nCuGGamJflfmpWIP3kYLTb6QCpYj6ak3dMFk8AY
 caxzYCdp6oR1kugQmkD8Hyi8kXnOFLzY6BEAoetBugqG3BkMbm3kolVFabm99ts/b0jg9Yzg==
X-Google-Smtp-Source: AGHT+IEHFr+oLwOapwYtAjbDLFd5DAbasj7ousg0VOC5NtNq4B2tTFlSJcaAjG5X78kzSbsFUhsJ7w==
X-Received: by 2002:a17:902:c94b:b0:294:9813:4512 with SMTP id
 d9443c01a7336-297e540dd6fmr105021585ad.3.1762769398494; 
 Mon, 10 Nov 2025 02:09:58 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29651c740a9sm140137655ad.53.2025.11.10.02.09.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Nov 2025 02:09:58 -0800 (PST)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Mon, 10 Nov 2025 02:09:54 -0800
Message-Id: <20251110100954.477496-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762769398; x=1763374198; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/VlAhrPcId+U7BrB5aKy/GrJMw8Qkppknb+bruSuw8w=;
 b=fYLTu1uCPVKUvKRYsBiBoqB4Z1ExpdOzgModIQUYrL7WrxgQmBeakpwEgzMG/TawQ0
 biOJ0duDOc9uWvk0YCaqrl86d7iRL6I/VOtOA6JgGuy0GBgW6XlNGuvv8Bws5oVh8vQp
 QxZrHr8KUJ3nQYW1d6eAR4/7Ex/oMvsnw8to3YZFJDdIFv+ityrTSkaEVY4SGtYTIXil
 8rsHWhvS3N7WwgbJQkX6GHLZZFvjiYw7f2pwsI+7NEhcIMxRAeW+VnRJdBpb4PqHbLAo
 g0Mnxkps+qiV1PNnayli/f1OxdvUEthJTa/E45mkILIMbpyBwjk9wvAIw4cFL7kmVu2P
 8rvg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=fYLTu1uC
Subject: [Buildroot] [PATCH 1/1] package/hwdata: bump version to 0.401
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
https://github.com/vcrhonek/hwdata/releases/tag/v0.401

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/hwdata/hwdata.hash | 2 +-
 package/hwdata/hwdata.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hwdata/hwdata.hash b/package/hwdata/hwdata.hash
index 20760d53d5..b96c36648e 100644
--- a/package/hwdata/hwdata.hash
+++ b/package/hwdata/hwdata.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  05d96821aaae04be4e684eaf9ac22e08efe646321bc64be323b91b66e7e2095c  hwdata-0.400.tar.gz
+sha256  e9ff93b9807cc014ed8f7f5cb5dc2c31e714058c82ddc59b7355f5c57c9b759e  hwdata-0.401.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  21d0406f93e884a050426ebc21931839a45d56bfcbcbfdda7686d583f36f107f  LICENSE
diff --git a/package/hwdata/hwdata.mk b/package/hwdata/hwdata.mk
index 2fef94a595..f826faf94e 100644
--- a/package/hwdata/hwdata.mk
+++ b/package/hwdata/hwdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HWDATA_VERSION = 0.400
+HWDATA_VERSION = 0.401
 HWDATA_SITE = $(call github,vcrhonek,hwdata,v$(HWDATA_VERSION))
 HWDATA_LICENSE = GPL-2.0+, BSD-3-Clause, XFree86 1.0
 HWDATA_LICENSE_FILES = COPYING LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
