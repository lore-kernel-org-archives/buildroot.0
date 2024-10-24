Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE7E3D0BB5E
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 05:33:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81F4F812A5;
	Thu, 24 Oct 2024 05:33:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eCwSsyFNuBcd; Thu, 24 Oct 2024 05:33:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9782B812A8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9782B812A8;
	Thu, 24 Oct 2024 05:33:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C71C42073
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 05:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A81EF6088E
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 05:33:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i3iOnpD6nA_z for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 05:33:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9FA6360837
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FA6360837
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9FA6360837
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 05:33:52 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-83aad8586d3so20594339f.1
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 22:33:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729748031; x=1730352831;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GTT7KJkCWJYkS+Q2ESEL0/8j9hmBOBr9RjqPd0eP7gk=;
 b=dhNz/K9g8BSu0cDFDRjrvQixqvOgTm4BN8a+BtqP2L7hYeK9Lya235mzEBSPm9hulX
 Teeb2yRRIvmjdkXcZlGpvJbIzLPLhFd8HfwQ7/Mkx831Z71lkAsi/g2NwKoWvWWzwL6a
 s5n6jEE4sShXOq8oxj0DAtPC5UsDpFj5cdf3yDnehm8sPwSqFdawXkCYkvUs1591wT1I
 1vPRv3l9htZeVH2kXlXgFwcHpA5hdKVStB+2sOR7r/gdv3yojUrV87VtpnC4LKn3rZ1x
 +MnJ4SA1ateD6JxKLsvHAMLnc1/mjbAyjJz0I1SzONZk+WWMT00f8IV56CND7zOY1MEp
 +5EQ==
X-Gm-Message-State: AOJu0YyEiOIuygF+83jSva0tEYZg42Olp2TtVZYmokRArlcc3MWDJVZh
 uy37JW1PWp5kxeFyMyJ6W6lNHENpvcDZns3/1/RGXCd33hpwvCgIu0nrsQ==
X-Google-Smtp-Source: AGHT+IGb23H61qGGqVkZ++Ol7pQaU7VLfWNbUQY+94SIAk6bg5u30lSw7DryiHhFVqX4Cc2xEBZbQw==
X-Received: by 2002:a05:6602:6c12:b0:83a:63f4:ad73 with SMTP id
 ca18e2360f4ac-83af6161ae4mr525220039f.4.1729748031205; 
 Wed, 23 Oct 2024 22:33:51 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dc2a631e42sm2548279173.154.2024.10.23.22.33.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 22:33:50 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 23 Oct 2024 23:33:47 -0600
Message-Id: <20241024053347.3404234-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729748031; x=1730352831; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GTT7KJkCWJYkS+Q2ESEL0/8j9hmBOBr9RjqPd0eP7gk=;
 b=f3GVIcNxARRJchqZRTWKd5s/JIZSykhPG8wNd4bdBEEYyWxWeWCu7gmwT/+U9URklT
 PIR4QMOQ06CRbxN8k1O+zZ9Cy4oyPbgMpsEJtGqfsKmHuK619+jJTkQvLQPrfFVA9+SH
 vhjQ++8hZ91KP90bWsnUc7eGh6MkjurNPeKBnw5ILxE6vnFhOZA7P7d0v9SsGG/xHPZd
 xvx/Gg8fO6pxl8oRx3UFTM1TlCy6ktaTdWYyaJSxi1h9/oCEwaAWFPg6LifZBlAzzTxH
 vw2YDrPJed2RcKqxgBh00DH9XcAKZQi8TYMDdfuN6WGUaxstvUHvx9cg3wLkTq4ExrYW
 ZrFw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=f3GVIcNx
Subject: [Buildroot] [PATCH 1/1] package/python-jsonschema-specifications:
 use hatch setup type
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use the new hatch setup type which automatically pulls in the
host-python-hatchling dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-jsonschema-specifications.mk                | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/package/python-jsonschema-specifications/python-jsonschema-specifications.mk b/package/python-jsonschema-specifications/python-jsonschema-specifications.mk
index 5abf236cbd..4637c14f04 100644
--- a/package/python-jsonschema-specifications/python-jsonschema-specifications.mk
+++ b/package/python-jsonschema-specifications/python-jsonschema-specifications.mk
@@ -7,16 +7,12 @@
 PYTHON_JSONSCHEMA_SPECIFICATIONS_VERSION = 2024.10.1
 PYTHON_JSONSCHEMA_SPECIFICATIONS_SOURCE = jsonschema_specifications-$(PYTHON_JSONSCHEMA_SPECIFICATIONS_VERSION).tar.gz
 PYTHON_JSONSCHEMA_SPECIFICATIONS_SITE = https://files.pythonhosted.org/packages/10/db/58f950c996c793472e336ff3655b13fbcf1e3b359dcf52dcf3ed3b52c352
-PYTHON_JSONSCHEMA_SPECIFICATIONS_SETUP_TYPE = pep517
+PYTHON_JSONSCHEMA_SPECIFICATIONS_SETUP_TYPE = hatch
 PYTHON_JSONSCHEMA_SPECIFICATIONS_LICENSE = MIT
 PYTHON_JSONSCHEMA_SPECIFICATIONS_LICENSE_FILES = COPYING
-PYTHON_JSONSCHEMA_SPECIFICATIONS_DEPENDENCIES = \
-	host-python-hatchling \
-	host-python-hatch-vcs
+PYTHON_JSONSCHEMA_SPECIFICATIONS_DEPENDENCIES = host-python-hatch-vcs
 
-HOST_PYTHON_JSONSCHEMA_SPECIFICATIONS_DEPENDENCIES = \
-	host-python-hatchling \
-	host-python-hatch-vcs
+HOST_PYTHON_JSONSCHEMA_SPECIFICATIONS_DEPENDENCIES = host-python-hatch-vcs
 
 # This is a runtime dependency, but we don't have the concept of
 # runtime dependencies for host packages.
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
