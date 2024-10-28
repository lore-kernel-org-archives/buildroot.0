Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E3FAD1358F
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 00:37:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 174D2812B9;
	Mon, 28 Oct 2024 00:37:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mP-5n1IVf5gA; Mon, 28 Oct 2024 00:37:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE11E812E1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE11E812E1;
	Mon, 28 Oct 2024 00:37:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 206A1AEE
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 00:37:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B4E4605A3
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 00:37:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z26oHKSrxJd5 for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 00:37:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0A6D76076C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A6D76076C
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0A6D76076C
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 00:36:59 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-83aad4a05eeso145689439f.1
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 17:36:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730075819; x=1730680619;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MASnCCpGkpcChzTbp6Ox2aAj9YG+BGzyviOV/JVUt1o=;
 b=X19cbneDc0lC0oG2Dn+hhkqYQOM6GuXXisy30tUPrjzEwMzCpSp1SQ3V8z1J2iACWE
 88YjDCr1rCIZjCiOplfXfwST6Bvw3JpqUDMMjBDEj35GzLkZrTb9ySxZIRPOUv1kpXDc
 Uy6rOp9zk4mhuppaxyblr4YQAFJoh7nR8HMyqm7ZxrX210Q3V4bvvbV0E4wDVBPB08AQ
 q46h5XH2jRn1JBhNKc+BfUbv3bP0IBJf5bGJih6UdivwE2v0/RzrQvTv1+hTmXzn8XvC
 ubFjtBjTfdUsc7lrIKsICGr372YFOJB0jdT4S1cY8eZRATU6e8eLJ3WImuIFdJTVgrf5
 7CmQ==
X-Gm-Message-State: AOJu0YwfwLOjT0z+akpGpHzRuuu9r+uotu8WaLjqgIi9JG4OwAQ6f5cp
 77UfFNlu2WR9WC3DAAqF39dUNk3b5OU8T1QdXBzOrQ5e4tYKe8ij9QQGCA==
X-Google-Smtp-Source: AGHT+IHo06H99OMBk0+WnbarfFNGxrnX35MHgekH++K6EasswrhGtMaWuSb3b+fiSuDmyRyO7PlPYA==
X-Received: by 2002:a05:6602:6d03:b0:83a:b500:3513 with SMTP id
 ca18e2360f4ac-83b1c40858cmr507412939f.8.1730075818742; 
 Sun, 27 Oct 2024 17:36:58 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dc72784e31sm1371781173.152.2024.10.27.17.36.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2024 17:36:58 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Oct 2024 18:36:56 -0600
Message-Id: <20241028003656.4107603-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730075819; x=1730680619; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MASnCCpGkpcChzTbp6Ox2aAj9YG+BGzyviOV/JVUt1o=;
 b=PzUU0WnivIsWb0FiJHcY2qLTs7wa7ZO3NUni91y+HyPhspuIXLIkJq9mFcrvI7oA5u
 vyuSDAowX/sTvyI938zMydiUa6ZNCVWfyNotUKeL8bgT7Nbtz7Q0Np8+equ3/AXc+ypg
 GGUSq7X5lFHaHRlF1VaS5YvnpLfJUp5pJz5qtQYnhx04iBfJ1FPZS3PdOr3Hhp2/RNSc
 Myw635gQI9lGM+8T1xtItMPvLQyyRBVyyeyBjvzgJFKFXKxHxNR7Ym4rwW8wemooxSL+
 Z315oVmG5A14FmbIrbsG9q24Wwmk9QOS5QzW/V3hxekyXiQ0AZxyj+thbu3XPwk5fisX
 prXw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=PzUU0Wni
Subject: [Buildroot] [PATCH 1/1] package/python-starlette: bump to version
 0.41.2
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-starlette/python-starlette.hash | 4 ++--
 package/python-starlette/python-starlette.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-starlette/python-starlette.hash b/package/python-starlette/python-starlette.hash
index 22b4f05f7c..f422e6cfe0 100644
--- a/package/python-starlette/python-starlette.hash
+++ b/package/python-starlette/python-starlette.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/starlette/json
-md5  c7bea1bc676a8e9adce0214bf632f67b  starlette-0.41.0.tar.gz
-sha256  39cbd8768b107d68bfe1ff1672b38a2c38b49777de46d2a592841d58e3bf7c2a  starlette-0.41.0.tar.gz
+md5  97321ad76438c1106ddd817baddcda06  starlette-0.41.2.tar.gz
+sha256  9834fd799d1a87fd346deb76158668cfa0b0d56f85caefe8268e2d97c3468b62  starlette-0.41.2.tar.gz
 # Locally computed sha256 checksums
 sha256  dcb95677a02240243187e964f941847d19b17821cf99e5afae684fab328c19bf  LICENSE.md
diff --git a/package/python-starlette/python-starlette.mk b/package/python-starlette/python-starlette.mk
index 92c9ebb16b..3caa136987 100644
--- a/package/python-starlette/python-starlette.mk
+++ b/package/python-starlette/python-starlette.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_STARLETTE_VERSION = 0.41.0
+PYTHON_STARLETTE_VERSION = 0.41.2
 PYTHON_STARLETTE_SOURCE = starlette-$(PYTHON_STARLETTE_VERSION).tar.gz
-PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/78/53/c3a36690a923706e7ac841f649c64f5108889ab1ec44218dac45771f252a
+PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/3e/da/1fb4bdb72ae12b834becd7e1e7e47001d32f91ec0ce8d7bc1b618d9f0bd9
 PYTHON_STARLETTE_SETUP_TYPE = hatch
 PYTHON_STARLETTE_LICENSE = BSD-3-Clause
 PYTHON_STARLETTE_LICENSE_FILES = LICENSE.md
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
