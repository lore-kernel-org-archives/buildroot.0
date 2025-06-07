Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEF2AC61CE8
	for <buildroot@archiver.kernel.org>; Sat,  7 Jun 2025 02:15:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 568BA40906;
	Sat,  7 Jun 2025 02:15:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3oHibndRiHFL; Sat,  7 Jun 2025 02:15:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75BB040924
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75BB040924;
	Sat,  7 Jun 2025 02:15:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 86764C8
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 02:15:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 757D24057D
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 02:15:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AntmXIotwx2l for <buildroot@buildroot.org>;
 Sat,  7 Jun 2025 02:15:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B2E4A40578
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2E4A40578
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B2E4A40578
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 02:15:49 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-22e16234307so23732735ad.0
 for <buildroot@buildroot.org>; Fri, 06 Jun 2025 19:15:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749262548; x=1749867348;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Yh5KwgFXrpY6W8ZZqG7Akcc5t6lirH+FWH7UWGDNfFc=;
 b=K+SxDJsmTLBTlZDEX+Pu6fYy6DGmMIMtgyKnfzGXKRKYwFAJFPTD1jAAU/Jlf9t/bO
 pF99a9EeiGPKEBO/4AHeVyql4W/hdinhoHVoufDUwQlR7u6iyBAYpSiGjF0Iq8WS+gb7
 8IWDQyuinHAwDX/8b67bZci8YzY3fLZiz9B6KgmQH+fzGmKh7gQNc6HWKFC8tJHttc3R
 tkETUIK53cH92XqODwEggycyJkcD1eglPW1Mgi7P6TcwHhzTK+3kAIZxFt6PMCSuWRrc
 Uh5Dg+KSb+l+yymLDpxkbkSrj28VfYcmnPjGuR3MkJ1ZYFnkIu6ccaPo2vlxoHb4q9KG
 Hz6g==
X-Gm-Message-State: AOJu0Yzv1yxxfL5/Hhc/j6oYRyrAGaJZACnGTOk+9LducIDekMbDbIYv
 QwB9pZQoXTuJ4NxJZGEOxLB5vKUYnv9sns1hKg5DsniNJFyogsmUWGucr7u7pIa9
X-Gm-Gg: ASbGncujbqUERtiR7gCWcONe6d1ztbR1Q+4jqCFIjGeKO5RuJuMDq54OrRiJ25HysKg
 +iS+DhGKqcZ3zkDdiXnaEmugsPnL28nWHg0F70UfKkwLXvicuwi4R6K1CNv2pgMsTsu++p0Sm/c
 JxqMMYhpWXm/+DvJlwYw7lTB/pdC0RpWIHF/AdLVETbHCRhFV4LPE/mnhH+lS4mbDKzKCfS2QJI
 Yse4kCaRY0vkG8OX0J0L1CCfebPuEyP8PY+qxW/EstxcrufAGgLzZjjx/7WwPWLCapsB8QKYnl4
 4Fzbl5o3BkUswV/ssZrrcOczWSL3fXW6dvBMEXknDf7hnrpxEN8f2CqqClyu9TYkE2jc3QZUlgP
 L4b9fUyMnF48wvFx4UWOv7fATZHwaoJuSIsmg5pCuJbo3IFPQmRB97dvaspg=
X-Google-Smtp-Source: AGHT+IG6Y0PDkziH0C1MX1I+v/nM+Jjoa9CuSXDBwDoPH1kH13be2vOXxbrEJWlSggz8Y58rEOG+qw==
X-Received: by 2002:a17:902:c941:b0:234:986c:66cf with SMTP id
 d9443c01a7336-236020d715dmr82886795ad.16.1749262548310; 
 Fri, 06 Jun 2025 19:15:48 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23603078045sm18901795ad.38.2025.06.06.19.15.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jun 2025 19:15:47 -0700 (PDT)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Cc: Kadambini Nema <kadambini.nema@gmail.com>
Date: Fri,  6 Jun 2025 19:15:44 -0700
Message-Id: <20250607021544.32303-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749262548; x=1749867348; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Yh5KwgFXrpY6W8ZZqG7Akcc5t6lirH+FWH7UWGDNfFc=;
 b=WVQITvgrC5AFoj77p0TeYCqX/Ngzwv7YkKMpN/F1BXfaWpIrXBhWiR1MlNRY2C4QvK
 UWt8v6lHUn0FArrrKCU9RM5xpe8noxJzZG4fulzyVTyGXrY4Pcw8fKp4i7mYWNeCEn5w
 PJUtVnYG39FJMcyTRQgufp056um49tJHFY3lUeCqpe+WMvFnmj/5JTkCJUme2l9MjCgN
 kN1+t3O+jomMxkOx4/yigwNACFhYm4Tt39uPA5kcmwbYPIDyV2J/7jTzE3xXeZXnWLMC
 mgR0uyJxkxFMVt98oqfsXe5bkwu2TMUM4JGGs6aXkfA2JIvWAlXxsm+TQU+I3H4Rf/EY
 u2AQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=WVQITvgr
Subject: [Buildroot] [PATCH 1/1] package/valgrind: bump to version 3.25.1
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
https://sourceware.org/git/?p=valgrind.git;a=blob;f=NEWS;h=741329a681708fb01f6451e775471fbbe13904f7;hb=4441567fbec8c263e1624b49ba86572d4cccfccd

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 package/valgrind/valgrind.hash | 4 ++--
 package/valgrind/valgrind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/valgrind/valgrind.hash b/package/valgrind/valgrind.hash
index af45bce9a5..848421f091 100644
--- a/package/valgrind/valgrind.hash
+++ b/package/valgrind/valgrind.hash
@@ -1,7 +1,7 @@
 # From https://valgrind.org/downloads/current.html
-sha1  5939b8360d272e89bc7b2fcf5213e57a2080afaf  valgrind-3.25.0.tar.bz2
+sha1  4d2cc4d527213f81af573bca4d2cb93ccac7f274  valgrind-3.25.1.tar.bz2
 # locally computed
-sha256  295f60291d6b64c0d90c1ce645634bdc5361d39b0c50ecf9de6385ee77586ecc  valgrind-3.25.0.tar.bz2
+sha256  61deb8d0727b45c268efdc1b3b6c9e679cd97cbf5ee4b28d1dead7c8b7a271af  valgrind-3.25.1.tar.bz2
 
 # License files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index 791ba2b504..73568932a0 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VALGRIND_VERSION = 3.25.0
+VALGRIND_VERSION = 3.25.1
 VALGRIND_SITE = https://sourceware.org/pub/valgrind
 VALGRIND_SOURCE = valgrind-$(VALGRIND_VERSION).tar.bz2
 VALGRIND_LICENSE = GPL-2.0, GFDL-1.2
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
