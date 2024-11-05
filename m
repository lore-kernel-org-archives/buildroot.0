Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D813D31769
	for <buildroot@archiver.kernel.org>; Tue,  5 Nov 2024 17:29:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BD0F4053C;
	Tue,  5 Nov 2024 17:29:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F_zjDGnE5J94; Tue,  5 Nov 2024 17:29:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D288440513
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D288440513;
	Tue,  5 Nov 2024 17:29:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 117C13B
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 17:29:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E6F8C80A4C
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 17:29:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id grm5I1KbybMF for <buildroot@buildroot.org>;
 Tue,  5 Nov 2024 17:29:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d31; helo=mail-io1-xd31.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E8EDA808A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8EDA808A5
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E8EDA808A5
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 17:29:38 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-83ab00438acso976739f.0
 for <buildroot@buildroot.org>; Tue, 05 Nov 2024 09:29:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730827777; x=1731432577;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gGmydMeyLqI9cipUYR2awZmj5vbRde5EDoFs20NQSCc=;
 b=Q6WJ9Nx6XZyrHyAQM0Ln1Q4NXBkVEM1AEwcjMYzuIh6/wmbYo9neBm6ZkEH4zYB/DG
 GCx3KXJ6joVD/JolwbPZLjBNVkrpg0gEnDf9N6Arlufp58CjB8Pl2/9IWWlodHc8dqy5
 NI6b+Mrmt9twh7v9HOapuo4EVVzL11s1ra2N4dXKJpespW+ouw9cNOhz79HO+0Nihsih
 dG5bBPz1TOocUD7K0s6tUpmU+5B+0B2xb9fQQphjfFU2ljQB26ofvUB1+dUeOWGDdyb4
 0N+cdXuC82ut4KjV48IA41ZcTONlKHblxSIZpLNgXuLsXNl9K1zvjPRKTzrZ3h6Fj2e/
 xzTQ==
X-Gm-Message-State: AOJu0YzM54D/F5bGESGr1Poa9PdBGSQjKg/W7jLtxsUltZ/eonlCQFcv
 Eezz9VNHbx3w2g1E09R9KlNGMo9giitQ6+11ECcv4PP2I/MwvGNs8JNBdQ==
X-Google-Smtp-Source: AGHT+IGSvgxkuTetCPR2F4iH7/lIViovFgzKFZm/GpGDjdkug3NIfQIwkThwNDThcM2sEEcTo4sSwA==
X-Received: by 2002:a5e:9405:0:b0:82c:ec0f:a081 with SMTP id
 ca18e2360f4ac-83b7131b2c6mr1329696539f.4.1730827777342; 
 Tue, 05 Nov 2024 09:29:37 -0800 (PST)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4de049c8498sm2494596173.157.2024.11.05.09.29.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 09:29:36 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Nov 2024 10:29:35 -0700
Message-Id: <20241105172935.1391069-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730827777; x=1731432577; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gGmydMeyLqI9cipUYR2awZmj5vbRde5EDoFs20NQSCc=;
 b=LW7j6HSovWjpWaae2EYSofEJX1GcLISLSmE0ddTA4Ph1ZKhZcty0thjIsgq99UIuSj
 gfTLQwuAwByShpkcdzUKH/mNmO48Z4we8mB5Z+C9Xl5eWZgE6SJtV8iRvdGqYDqq//1j
 +wTHrf3BvmNeJlCrS6i9tE27NZpzaddbpMQf62d9i1vBIIV6WSrGC592EX0XZlS6xXhl
 5BkWAe/P66xfP55ohFc28fJesUNMgFaPy15tJ520wnr95r+CM6+XmJdJ5gLsSWdkpNAN
 Rufomixh1zp4GIA+QSj9fUUMA7bRzXo9ti/BlP4vP0S3PrHHsrmt3pXipZIBNiuCm4tY
 6S/w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=LW7j6HSo
Subject: [Buildroot] [PATCH 1/1] package/python-dbus-fast: use poetry setup
 type
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use the new poetry setup type which automatically pulls in the
host-python-poetry-core dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-dbus-fast/python-dbus-fast.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/python-dbus-fast/python-dbus-fast.mk b/package/python-dbus-fast/python-dbus-fast.mk
index 359a69784a..60d0b7e9af 100644
--- a/package/python-dbus-fast/python-dbus-fast.mk
+++ b/package/python-dbus-fast/python-dbus-fast.mk
@@ -7,13 +7,12 @@
 PYTHON_DBUS_FAST_VERSION = 2.24.3
 PYTHON_DBUS_FAST_SOURCE = dbus_fast-$(PYTHON_DBUS_FAST_VERSION).tar.gz
 PYTHON_DBUS_FAST_SITE = https://files.pythonhosted.org/packages/0a/37/a27e7f2dc6a18b5dcee70ffb08013a33770c2154a51fb5e2c04a7f4169fa
-PYTHON_DBUS_FAST_SETUP_TYPE = pep517
+PYTHON_DBUS_FAST_SETUP_TYPE = poetry
 PYTHON_DBUS_FAST_LICENSE = MIT
 PYTHON_DBUS_FAST_LICENSE_FILES = LICENSE
 PYTHON_DBUS_FAST_ENV = REQUIRE_CYTHON=1
 PYTHON_DBUS_FAST_DEPENDENCIES = \
 	host-python-cython \
-	host-python-poetry-core \
 	host-python-setuptools
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
