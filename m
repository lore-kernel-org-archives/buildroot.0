Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E89C4707C
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 03:17:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F197D83E4C;
	Thu, 11 Jan 2024 03:16:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F197D83E4C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X2-tATamjEFd; Thu, 11 Jan 2024 03:16:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4202D83DE1;
	Thu, 11 Jan 2024 03:16:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4202D83DE1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0E8011BF3EF
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 03:16:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D6B73613DF
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 03:16:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6B73613DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id US_Xmn54BgiU for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 03:16:53 +0000 (UTC)
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 14BEF611CE
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 03:16:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14BEF611CE
Received: by mail-il1-x129.google.com with SMTP id
 e9e14a558f8ab-3606f507efeso23689245ab.3
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 19:16:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704943011; x=1705547811;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CCGP28p8T0WRBRTIKEzC9y8Df4jjHbC/3b1Pc43rXHY=;
 b=s/r0U5dCvDrCqpb+WvK9NU2pgtYYlHsyP5ntwxTnCXr+K5fMVELadWXgQ+d+nD6SSU
 Avr7pqYIZnzzDLhJrYrD7uZf46AR3/jH8/ineIvQtPHKy0FUM4JE7KrdBCcguoMtgTgg
 qF0vN9GGvMaGJCBzjboOdqsbJHdRJXvjP3ko1yEGjRwuxXav4g9B8aHBHwFnx9zZn428
 XNxL8FZau8acJUBgz7XCTEQbWFIoAMVxt5BoLtNm1Gi5ENKnldMLFSQu0vnuyaaPGl2p
 BGaENHFusd9JJhm7ZvzMqNn5f3z6L3ZBv/xFv3NtpA1klW3S4ARcXra7W2vbD6FZha91
 gheA==
X-Gm-Message-State: AOJu0YyszeJ4GdbTznabyudMyMrqQcWjK2E9nCW6ZLlH368FPv0B0dKU
 d/Py/NEIhzmaLs87acOAyDYVwLzP3VKjOw==
X-Google-Smtp-Source: AGHT+IFpxAQBxVBbhcENa9Uc3izKx8G9LJVBqHkdwTnw1zYk8X2MnziVqBO5FfDwViPqJtobM0LdAQ==
X-Received: by 2002:a05:6e02:1c28:b0:35f:da1f:5e98 with SMTP id
 m8-20020a056e021c2800b0035fda1f5e98mr701283ilh.32.1704943011513; 
 Wed, 10 Jan 2024 19:16:51 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 br8-20020a056e0223c800b003606bd62e3fsm21067ilb.38.2024.01.10.19.16.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 19:16:51 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 20:16:49 -0700
Message-Id: <20240111031649.2684726-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704943011; x=1705547811; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CCGP28p8T0WRBRTIKEzC9y8Df4jjHbC/3b1Pc43rXHY=;
 b=k/+dVR+N4PpXr2wII3QHBYnoqs/edyZLAyP3iO8nwlV0C8GLxZcFOAlxmWkHlblR4g
 JhrP/5S1ulnk1p8sgBn5misbNYdSginA6UscuwSxEb/OAUdlSRfsKvC4x5RmM5WO/KVB
 MY9lIqtK1UeQ1wq0K+z+r7a7ge/leLUIhaIBAARe/EH1RqfB5/HDOpw/xRKERwMIuGn2
 hVm70TKxKRPav7YhbR9dkyjUB7r/dCvu+shduI75+2FGXvrrq3s/rY/77TqYb50j/AK0
 Of+hU4ZLccAED+se2toB/n+efe237TGf08xRXXj81UzezjBmp3HeCOjk5fxPwh+22Mv9
 vLCA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=k/+dVR+N
Subject: [Buildroot] [PATCH 1/1] package/python-pytest: bump to version 7.4.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

Drop no longer required python-py runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pytest/Config.in          | 1 -
 package/python-pytest/python-pytest.hash | 4 ++--
 package/python-pytest/python-pytest.mk   | 4 ++--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-pytest/Config.in b/package/python-pytest/Config.in
index c8f9a6eb5b..b42457e67d 100644
--- a/package/python-pytest/Config.in
+++ b/package/python-pytest/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_PYTHON_PYTEST
 	select BR2_PACKAGE_PYTHON_INICONFIG # runtime
 	select BR2_PACKAGE_PYTHON_PACKAGING # runtime
 	select BR2_PACKAGE_PYTHON_PLUGGY # runtime
-	select BR2_PACKAGE_PYTHON_PY # runtime
 	select BR2_PACKAGE_PYTHON3_PYEXPAT # runtime
 	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
 	help
diff --git a/package/python-pytest/python-pytest.hash b/package/python-pytest/python-pytest.hash
index 7f79b94d8d..e710003535 100644
--- a/package/python-pytest/python-pytest.hash
+++ b/package/python-pytest/python-pytest.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytest/json
-md5  8620558e8971b11207b2d6b083906cf9  pytest-7.4.2.tar.gz
-sha256  a766259cfab564a2ad52cb1aae1b881a75c3eb7e34ca3779697c23ed47c47069  pytest-7.4.2.tar.gz
+md5  e2ac4c70861f26d735b64e5687bb218e  pytest-7.4.4.tar.gz
+sha256  2cf0005922c6ace4a3e2ec8b4080eb0d9753fdc93107415332f50ce9e7994280  pytest-7.4.4.tar.gz
 # Locally computer sha256
 sha256  ca836a5f9ecca3b2f350230faa20a48fb8b145653b5568d784862df864706b9b  LICENSE
diff --git a/package/python-pytest/python-pytest.mk b/package/python-pytest/python-pytest.mk
index 326d951a32..3170a1a9db 100644
--- a/package/python-pytest/python-pytest.mk
+++ b/package/python-pytest/python-pytest.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTEST_VERSION = 7.4.2
+PYTHON_PYTEST_VERSION = 7.4.4
 PYTHON_PYTEST_SOURCE = pytest-$(PYTHON_PYTEST_VERSION).tar.gz
-PYTHON_PYTEST_SITE = https://files.pythonhosted.org/packages/e5/d0/18209bb95db8ee693a9a04fe056ab0663c6d6b1baf67dd50819dd9cd4bd7
+PYTHON_PYTEST_SITE = https://files.pythonhosted.org/packages/80/1f/9d8e98e4133ffb16c90f3b405c43e38d3abb715bb5d7a63a5a684f7e46a3
 PYTHON_PYTEST_SETUP_TYPE = setuptools
 PYTHON_PYTEST_LICENSE = MIT
 PYTHON_PYTEST_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
