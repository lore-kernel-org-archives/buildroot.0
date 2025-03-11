Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34DB9C282EC
	for <buildroot@archiver.kernel.org>; Tue, 11 Mar 2025 10:12:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66C9C40C7A;
	Tue, 11 Mar 2025 10:12:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JWhZEBLxRnon; Tue, 11 Mar 2025 10:12:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28CE040CB1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28CE040CB1;
	Tue, 11 Mar 2025 10:12:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8042D1C8
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 10:12:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 62CED40582
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 10:12:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9jD3np3EcXqY for <buildroot@buildroot.org>;
 Tue, 11 Mar 2025 10:12:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com;
 envelope-from=daniel@0x0f.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C3F1940116
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C3F1940116
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C3F1940116
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 10:11:59 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-22337bc9ac3so98906015ad.1
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 03:11:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741687918; x=1742292718;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IvMmTr3OTQDLfpYz+7D/JQTseY9yEyWp6zhYOjsGpsQ=;
 b=uyA0/df3PHM0aGPSswHMheBjEBfOiKSYnFC7NHPRf8I2XGY5e1HIeC5ba+FPCqL9yU
 982cdk18Ou6LUsf29CxSGON63hlYjKFBRPmAzNI4lyRqKKWwnZXJj9d0M/NJAnL3KfM6
 ZNtFGCe0GpwtPEXobpNG/HJchgRbBRFrH1HVz8AvgZqY2qqaE98TojKgKX1iPEp5PCtk
 5Ga8v8JSm/aSyj3/7sMNpV0ALlKxDj17dVStdz/zpKEp2soQzFDl7dLviMR4gS59ovsV
 X2lr0ZT51qKuy9/1nXD52zPQJSbWrVtrBjqeWmuGfTcSweWKhUUBvejhlQVKyHcL/QsW
 W6Zw==
X-Gm-Message-State: AOJu0YyjO4fYMAT1e3VmpRN//9HVzz1t82qgCYhC4iumrlY5YGrK/YcR
 9/UnnwDQWDWqrGyAFoU3PAM6Pwvwp05Dx3ytBFDRqxBhY4xslyQQIXF8qe5HFw+tQA6IKt/751a
 C+eg=
X-Gm-Gg: ASbGncvDkL68C3N8wc4bFUH6+dON1omG3SKLTDe5MEeSWUmcjROFhVfZ+W+H49YylHb
 Jt1kkxgWMXXzctn30FvpitZfj1uIr5vVxTrUkF/yISKoaQ1Fyx7PN9vlTsYTa8vbjE4mro3ZgRR
 UItnk7m43azZKKi033yqIY5V/Cm7Oy4x42FP94Z28/MtKIfpY8JUA6Ge5e2X27HZyvc/NOCuIFt
 QRJoGiABnpxpEpdcZslXK17WDs72DIUfyCIhlRr0/+Exuln/PRP+EEbsp8baS+jp355sMudR4Sm
 ooyfezs+4LLfcPwjF4NgDCfRsXhTzvaPPMYyyX6V8pgwPd0RKqbSGkazgVocaVNehFU=
X-Google-Smtp-Source: AGHT+IFk+LU+Zu24Ff59sNOha14yb6pjPeNi7te/BOQtDdRDMeb1qx4LF9AUCTEXdHE6d28yg9yDOA==
X-Received: by 2002:a05:6a00:99c:b0:736:4644:86e6 with SMTP id
 d2e1a72fcca58-736eb7fe8c7mr4362934b3a.12.1741687918649; 
 Tue, 11 Mar 2025 03:11:58 -0700 (PDT)
Received: from shiro.work.home.arpa. ([2400:4162:2428:2ffe:cd1:9323:d48c:3544])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-7369b4febf3sm9823302b3a.162.2025.03.11.03.11.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 03:11:58 -0700 (PDT)
From: Daniel Palmer <daniel@0x0f.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Daniel Palmer <daniel@0x0f.com>
Date: Tue, 11 Mar 2025 19:11:53 +0900
Message-ID: <20250311101153.3567108-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=0x0f.com; s=google; t=1741687918; x=1742292718; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IvMmTr3OTQDLfpYz+7D/JQTseY9yEyWp6zhYOjsGpsQ=;
 b=A0FqAJDtP710bUePMx8kbzlL5T/JWhTYMOepjJ3ZT9jUpFuQa/knAOhRFgqdIam5Or
 UeX7XSMIvEUnJTZ/fXVmXl8PBqmFh8nSVaQVyvDu3wuL4e7MLe5rJq7h+C8UrfQF6F6p
 GyCVIxHQvIypLQwAa3bLrW6GRNAOvAL1bjwQk=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=0x0f.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256
 header.s=google header.b=A0FqAJDt
Subject: [Buildroot] [PATCH] package/musl: Add upstream patch to fix
 building strace on m68k
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

Currently it's not possible to build strace on m68k when using
musl because the version of musl in buildroot doesn't have the
m68k specific definitions of POLLWRNORM and POLLWRBAND.

This is already fixed upstream so manually apply the patch
until the next release.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 package/musl/0006-m68k-fix-poll.patch | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 package/musl/0006-m68k-fix-poll.patch

diff --git a/package/musl/0006-m68k-fix-poll.patch b/package/musl/0006-m68k-fix-poll.patch
new file mode 100644
index 000000000000..45d5dcede459
--- /dev/null
+++ b/package/musl/0006-m68k-fix-poll.patch
@@ -0,0 +1,25 @@
+From b09e3174a695d1db60b2abc442d29ed3f87f0358 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Wed, 7 Aug 2024 08:51:03 +0300
+Subject: m68k: fix POLLWRNORM and POLLWRBAND
+
+As noted in commit f5011c62c3 ("fix POLLWRNORM and POLLWRBAND on mips")
+m68k uses a different definition.
+---
+ arch/m68k/bits/poll.h | 2 ++
+ 1 file changed, 2 insertions(+)
+ create mode 100644 arch/m68k/bits/poll.h
+
+(limited to 'arch/m68k/bits/poll.h')
+
+diff --git a/arch/m68k/bits/poll.h b/arch/m68k/bits/poll.h
+new file mode 100644
+index 00000000..00063f41
+--- /dev/null
++++ b/arch/m68k/bits/poll.h
+@@ -0,0 +1,2 @@
++#define POLLWRNORM POLLOUT
++#define POLLWRBAND 256
+-- 
+cgit v1.2.1
+
-- 
2.47.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
