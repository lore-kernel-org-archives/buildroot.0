Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35ABDD1266D
	for <buildroot@archiver.kernel.org>; Wed,  3 Dec 2025 05:02:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 745AF40A1D;
	Wed,  3 Dec 2025 05:02:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hgSBr24tBZY7; Wed,  3 Dec 2025 05:02:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 420F0409F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764738161;
	bh=vMVCJ/6tr5/1BmtIcuI5h5vGQlw4VWS3q/jcQ1ezXdw=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IlwTmggrPsZP8mMGJIWKHBAE666qUK8gyqTieCegVMV7+i5leS9DFOvrQ02OGOEke
	 AqxWimykofGTkk1k+lUYkoLjDyvJPbRbXccEA7ggPq4sutu/VVaSmnXnm8iTJhN8mZ
	 0zzuodQZTLPBursKYnZiZFO8gYaYQUfZuV2QCCx7hD28+VETt9dT5eY0LpyGshHgvw
	 e2vM5iESPN3bW0x/LyaU/oIYwWP2UL33G7LOMUwwn6D9GDEPBW5ZiBUblLKirCz9C4
	 udTa7iwSZ1w91ya9dSvp6XlLFTByHP1RdLEWU74amjdmCQVEjMt1KyUpfZWh4ba9Hd
	 d7vHToi1R9wSw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 420F0409F3;
	Wed,  3 Dec 2025 05:02:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 46D0FE7
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 05:02:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 38939614D3
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 05:02:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4RF5w9S5QFID for <buildroot@buildroot.org>;
 Wed,  3 Dec 2025 05:02:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 704916141F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 704916141F
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 704916141F
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 05:02:39 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-7bb710d1d1dso9673702b3a.1
 for <buildroot@buildroot.org>; Tue, 02 Dec 2025 21:02:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764738158; x=1765342958;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zuTAl6Biedv0MreKwYw0I5rDWLxlyFCbexujZXyjPZw=;
 b=t6++tnj03I738UsC8j2PYYKlDst9GmqTr2DQwRZcZCw2qHUcvLfmsJz8gyTDfi3ECG
 Gp8zK75mkF76Gw5OhfUix2yDHoNKz62Uu7tH0GTv5ip74flHLIL1dr6FbMv+wcWbFrd1
 5WD6r0zhnZN7WylK1iGSvzKZ0TOKfF26/7WYD+UUxNUzAeNK5EvWJyrrWJhlxVdaLrY1
 FPYoIU/2zOJaD4jYO4G+2m1c2tw8opQTZZB6b13NgiV3bppgPEyGHztBV282vjGReoYE
 tsOixlWw8UErVL2se5X0j+UMrLGBPWN2Ra29pnDREERQKrUh5c8BhT3nnKHAG3pBOYy6
 MCuQ==
X-Gm-Message-State: AOJu0YyQZHAKDuwmpLjWBcnqp9mHpqGALasDlyohKXOqedeOUIJFi3pU
 9mdNkIUbD+t0d6Me716G7Pzs8w3MamdQSEQvdUGRaNdoFK3pBs3TXL85nSivMA==
X-Gm-Gg: ASbGncsDs1KjKvx0XfNLAARwda3QoNOW/arcMMR5fS6Zf38ZV6nwwC5mSRXBnfa8g/5
 41V9pc6Rb+ubcbfl/Em7URa8gh6PMjxBEjflcbJifsgrCWlCuRQ4zaNoseueX9cQl2iUy4yZ+qG
 BQo1fdPfP5EkGU2iBfkchMa5xpoJQQzyFWMX5AOSScz8ygYTQ+gVadfWtnS8omMGXUqLd/5hxTQ
 B7bSLcLCSoxq61brZG/CY19ctGmIUig34oi4KTwsMB8XMjF2HWMrG+YbSY0ou2KS/jdDoXtym0v
 9ddlgDD+RfJe7fvpnUPRCSrTDKj8IrvKL4a/NDm2BrbnwC5TTMHpaoOfTqLN+UO8AePkGijvAie
 ZRx5C27eDNrXzbunUEfsu/S/GjfcRI9Jh95mUa4qWtbjVrPe+NzxNw1fmRZz8DJvvaMdYMseb1u
 WAlUNAAGymVOtIrYMcMPbfGCkrsXuXPKu+8CkxVOnuPuIApNqTukJQfJdCMLQ444GA2WXXdnSon
 too024cWQHhbBc64aFVQa6AU3YZFQ==
X-Google-Smtp-Source: AGHT+IHUXVREEeYVSwT00FfG/xDiwlHcCjksXIdUYqfhkG9/Kugmu0tG+EeGZeyXZjEYSSQBCVNdXA==
X-Received: by 2002:a05:7023:b87:b0:11b:869f:742a with SMTP id
 a92af1059eb24-11df0c5553amr898422c88.1.1764738158406; 
 Tue, 02 Dec 2025 21:02:38 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-11dcb03cc7dsm83811904c88.5.2025.12.02.21.02.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Dec 2025 21:02:37 -0800 (PST)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Kadambini Nema <kadambini.nema@gmail.com>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Tue,  2 Dec 2025 21:02:34 -0800
Message-Id: <20251203050234.56665-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764738158; x=1765342958; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zuTAl6Biedv0MreKwYw0I5rDWLxlyFCbexujZXyjPZw=;
 b=WjDwN9/f6vl13yKRwcVExyY4wCZup2SUWifIGh9G2naMRkWGSYclrUlDalC6GIPdWN
 QIkSzZoaQFVXcq/Vvw+dIL57LRSERPjHLZUFi4dILZq1VqLaBBwxTmPatAYub9EeSFkE
 vsCqKrzD3XmXxf0OYjoFw7sk0kD4gIOcG0OyPrxadYfL0Plat2MEtLC6w3+5cUJirCWy
 c7VMeyQSM2iyjL6LGjlf9Znn+XRNRUWUrnTT27cyNNoRjSt9Kw757xzLMWeeEffziVOM
 N+f7P2TwQbxKg+agiXCrV797Tm9mnxG0tEwCRtuWoFEqA/5ISPenfYv59CmBWs8V3u22
 Yy7w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=WjDwN9/f
Subject: [Buildroot] [PATCH 1/1] package/ustreamer: bump version to 6.42
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

Changelog:
https://github.com/pikvm/ustreamer/compare/v6.41...v6.42

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/ustreamer/ustreamer.hash | 2 +-
 package/ustreamer/ustreamer.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ustreamer/ustreamer.hash b/package/ustreamer/ustreamer.hash
index 9084f9109e..e2196b5b77 100644
--- a/package/ustreamer/ustreamer.hash
+++ b/package/ustreamer/ustreamer.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  592fab2eb10ccb768e19b4e6631e1279d415f23d268a4b45b9d440378beaa570  ustreamer-6.41.tar.gz
+sha256  40c10b522c34bcb95bda9844a5a2a06173fea9a5d948882d70740cbe1fe7a8b4  ustreamer-6.42.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
diff --git a/package/ustreamer/ustreamer.mk b/package/ustreamer/ustreamer.mk
index ef5ac09eeb..bf87dc8abd 100644
--- a/package/ustreamer/ustreamer.mk
+++ b/package/ustreamer/ustreamer.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-USTREAMER_VERSION = 6.41
+USTREAMER_VERSION = 6.42
 USTREAMER_SITE = $(call github,pikvm,ustreamer,v$(USTREAMER_VERSION))
 USTREAMER_LICENSE = GPL-3.0+
 USTREAMER_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
