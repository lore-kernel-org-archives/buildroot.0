Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC272C021B2
	for <buildroot@archiver.kernel.org>; Sat, 22 Feb 2025 13:31:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 974DE60B1D;
	Sat, 22 Feb 2025 13:31:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1G8eTXdNwRMo; Sat, 22 Feb 2025 13:31:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6EC360B2D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6EC360B2D;
	Sat, 22 Feb 2025 13:31:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D84C5D92
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 13:31:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA531400B5
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 13:31:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H6q1snAFqtY5 for <buildroot@buildroot.org>;
 Sat, 22 Feb 2025 13:31:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::730; helo=mail-qk1-x730.google.com;
 envelope-from=devin.buildroot@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7BC5E4003A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7BC5E4003A
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7BC5E4003A
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 13:31:38 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id
 af79cd13be357-7c07cd527e4so282404185a.3
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 05:31:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740231097; x=1740835897;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D978r9a8U/mg69B+zf+78ncPuyZTRtUah8AWYjiyZIQ=;
 b=Iel2y14+m1JrkMA41akH8guChyft+Ry+JKtabs3Uc9Qo66JRtWZ4Gqm3pEvvL1RWef
 f3MXEdIUk+yxR+MCFKXJNVMvRHvKQg7BVIlKq4HCCSMShpJ8+6Lo3FgIGHM5FTAPEzFt
 qg9MWBubrhNEsckl1Dipvh4MYWOMHhnL1/6QX5W64EM9XulfqJh4XhTr+XdZRn+xOgyo
 6bg1oWowbLCKCCPM2dFJfFu0SjGhSARxX4k4ycue2EgqtY7LiuRji02zNR7apgetPInv
 zOiDHatxOsLhO+go3miILMtRuBq6OHUZnm8rMDDCIW5RRvKJd7pOn9yo2mhgmmZyIYO6
 umsQ==
X-Gm-Message-State: AOJu0Yx900tLgLhSQX2tdBvvIvn8DdDXJsWAFnVgAletQ11mZWBnbI/Y
 32eR23/V76pB3VdBOF59oMl3+ktVRMG04VJFvkVwoS7+2S3NK1dWb0C0yZqTERA=
X-Gm-Gg: ASbGncvi5HT5JOcMjPk87GDvK98nOJHaLE8rqaeXU/FGFgEoh4VtpC/Ctk1aF8p+t3D
 I0xjD3QrcWVP7agcgfjM2X7OAAJ52sudgkTHoN9JQaw9OpQuLd4+Lj/KsGVZ3+Yff1F6vhwcUEn
 7gA6jBBgK7uAPPglr/03XD2xzVhzCuT/QIF8oJptJyC+N+CFgJGK7VZQcClD/aosvHysYkL2EwS
 z3xP1Yo257ngRj/y79ZETQp0Yuvs9L0HVEMasUXGTyq4Km17LgpCj+MlDp9qm1FwQkTHAlZezyu
 c7o2anoNSi6ONSAzED58eiper9GdFKc6ews+uJXaIbNHxPSJEWwV7QUSIrg/4Li0RxBMVcPR5XH
 nS+vYyONZdllDDDj9tN6IleDYYJsn+nO0W0Q5og==
X-Google-Smtp-Source: AGHT+IGUVZNb/mV+n0JDjq6aRk6a6Ys9XfV8x8GajTL60AM9HrG4G4+TLO0IIsn/TsANZvI0jzpOUg==
X-Received: by 2002:a05:620a:1b8f:b0:7c0:b368:5d8b with SMTP id
 af79cd13be357-7c0ceee5f8fmr889731885a.11.1740231096883; 
 Sat, 22 Feb 2025 05:31:36 -0800 (PST)
Received: from localhost.localdomain
 (vlnsm6-toronto12-142-117-124-97.internet.virginmobile.ca. [142.117.124.97])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7c0a63cdcd7sm653747185a.1.2025.02.22.05.31.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Feb 2025 05:31:36 -0800 (PST)
From: devin.buildroot@gmail.com
To: buildroot@buildroot.org
Cc: Philippe Proulx <eeppeliteloop@gmail.com>,
 Devin Steffler <devin.buildroot@gmail.com>
Date: Sat, 22 Feb 2025 08:31:27 -0500
Message-ID: <20250222133127.9445-3-devin.buildroot@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250222133127.9445-1-devin.buildroot@gmail.com>
References: <20250222133127.9445-1-devin.buildroot@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740231097; x=1740835897; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D978r9a8U/mg69B+zf+78ncPuyZTRtUah8AWYjiyZIQ=;
 b=UsAdntgMhKNP+hSxj5yObzo4Wx4EML7xB45cThbV4JTyblKe/xDwPIDrYxyDav28n7
 k56a14hH8aHZEupefwhz3Z8UDK/U0KvbNRlms5LkwLBMKs8ojWDHsOe61Uztrl+zAiAV
 wKhtDwB7Tqmk/60HwLxI8abRYfZ+RDOBvgb0k/PSGyXzOdySITawvu5akzzdsEgF6/E0
 lpeexEcomnTCw/XOL13n/9QVYTnWMj09Rt6QMzJqPzbZhpgUgKkDDEjrUYQ2U5vMxj2l
 +Eo9vEk0+rH1SLrrXMumqdJTBkBuvjgGCxCo3rkX2QFqxshMVy88A2bLdL4YETSZr6ZY
 Tprw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UsAdntgM
Subject: [Buildroot] [PATCH 3/3] package/lttng-libust: bump to version 2.13.8
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

From: Devin Steffler <devin.buildroot@gmail.com>

This is the third of three patches relating to lttng-modules 2.13.10 not compiling with buildroot.

Since I am submitting a patch to bump lttng-modules to 2.13.17 and lttng-libust is a tightly related package,
I am also submitting this patch to bump lttng-libust to 2.13.8 (the latest version at this time).

The chanagelog for lttng-libust 2.13.8 can be found here:
https://git.lttng.org/?p=lttng-ust.git;a=blob_plain;f=ChangeLog;hb=cc46a6a700f7bfb42fbe740340ef89bb7e2bf006

Signed-off-by: Devin Steffler <devin.buildroot@gmail.com>
---
 package/lttng-libust/lttng-libust.hash | 4 ++--
 package/lttng-libust/lttng-libust.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lttng-libust/lttng-libust.hash b/package/lttng-libust/lttng-libust.hash
index 42f2b372dc..bce5d303ea 100644
--- a/package/lttng-libust/lttng-libust.hash
+++ b/package/lttng-libust/lttng-libust.hash
@@ -1,5 +1,5 @@
-# From https://lttng.org/files/lttng-ust/lttng-ust-2.13.2.tar.bz2.sha256
-sha256  5667bf0269e1e62e2d9cb974c456ff86e0401bd7aa3bfc8d5fdb97233249eddc  lttng-ust-2.13.1.tar.bz2
+# From https://lttng.org/files/lttng-ust/lttng-ust-2.13.8.tar.bz2.sha256
+sha256  d4ef98dab9a37ad4f524ccafdfd50af4f266039b528dd5afabce78e49024d937  lttng-ust-2.13.8.tar.bz2
 
 # Hash for license files
 sha256  5b52242fd2045d62dd664c8358137b46c1e08efdba674c91cbfc06585efe1ce7  LICENSE
diff --git a/package/lttng-libust/lttng-libust.mk b/package/lttng-libust/lttng-libust.mk
index 7ead28052e..a51402d1bb 100644
--- a/package/lttng-libust/lttng-libust.mk
+++ b/package/lttng-libust/lttng-libust.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LTTNG_LIBUST_SITE = http://lttng.org/files/lttng-ust
-LTTNG_LIBUST_VERSION = 2.13.1
+LTTNG_LIBUST_VERSION = 2.13.8
 LTTNG_LIBUST_SOURCE = lttng-ust-$(LTTNG_LIBUST_VERSION).tar.bz2
 LTTNG_LIBUST_LICENSE = LGPL-2.1, MIT (system headers), GPL-2.0 (liblttng-ust-ctl/ustctl.c used by lttng-sessiond), BSD-3-Clause (snprintf)
 LTTNG_LIBUST_LICENSE_FILES = LICENSE LICENSES/BSD-3-Clause LICENSES/GPL-2.0 LICENSES/LGPL-2.1 LICENSES/MIT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
