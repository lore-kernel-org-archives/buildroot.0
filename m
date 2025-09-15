Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E13CDCAC597
	for <buildroot@archiver.kernel.org>; Mon, 15 Sep 2025 23:13:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 633CC60C2A;
	Mon, 15 Sep 2025 23:13:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lB0W6w78FEY0; Mon, 15 Sep 2025 23:13:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8878260C27
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8878260C27;
	Mon, 15 Sep 2025 23:13:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7333912D
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 23:13:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D0AC8135A
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 23:13:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pzj_9WdqLga2 for <buildroot@buildroot.org>;
 Mon, 15 Sep 2025 23:13:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::130; helo=mail-il1-x130.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 857F081351
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 857F081351
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 857F081351
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 23:13:32 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-42403719c73so20396495ab.0
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 16:13:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757978011; x=1758582811;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3rkz1D0jmIa0Z9neDm3PzI+CeJd2jikwZWlaMldhm28=;
 b=vOoMIobevXqy4gJboEUorFOMB1ALJtMxPUNDk9L/E9VcfHZj9Ro4lertXOkgAqyAaB
 Temz+xBCoeJ9FFLoJKFJ5A8NvhwsS6FTcpu/kJ6IizqVnirg0PDnmALK8XBihfH55oza
 uCkKlTpPL6EGNPWbWE1W7LsCKr4c+OzE1/rGsSH6xMrcHK+9K3//jq0ifhk5Gke49SKl
 lJzVLaCfXqcYbjCqYxShcUmxgaILbwJeYe43XTdxKdG5xrhKa3c1R9PboQLkSb5i3yGS
 e1CKqmobvol0ONyqSJCUZuGa8lhxiAZvgeJxk/lGvfRagwx273CshBumfnKjkNquG3Yv
 ftUg==
X-Gm-Message-State: AOJu0YxiQq3CLjpSxsbOp4R+WqkKo0jocLY0QcQru4KGSBJIB6CPEm//
 xdstIlaDADOItrB8D541CbNJNCj5+6VxGvOtOxH5LMTIkNwKJaetD90VgCgGuw==
X-Gm-Gg: ASbGncvBQJHn7HjlGsfTtqhr6gwld6/56QgGctfluw+LD9DoTVkxEAIJizqVX3+1KTf
 Bbx1mHve5aRcUEq81AMKpLwyhlOJ0r7fwGhN+NPqSU5jAMPJ4Qvd/S/dKXiXKhMZ7Hk9lp+75Iu
 Jt9AWeVDS/Upd0pt5KHRqpljN+MMnReo/ISVsm0k2ZnduwGx6uiWDWijMR352cuNuOvoX+DFiaI
 KpC4eZF1xxjqE4c2zl8BLScLO5GvfQ0+qqMTG94WuxnM6qVhSu5ctbcDHF6eY+xGOTQ8zRNKXb4
 EXogciTIabpG46lPsxKfvmSObS+CXG9crFALb30Rs43Rz6maxhoHYsMYLJe39GyLbcof1WNvEts
 IuUwoKkuycOhO6pXbibrvCAp2OhKj6NCZ0eRDbD9tkCSW25w/XW1TTE/JYh8tyIC5cko9v+WvJ4
 uqSnS0re8YpjE=
X-Google-Smtp-Source: AGHT+IEwbl8vChve73Wnixf8eutkNziyrOi81wyHMD639jYAR4p1jSSE2JFF85RBJRV8n3J9RVIhoQ==
X-Received: by 2002:a05:6e02:1a8e:b0:424:4c7:b6e8 with SMTP id
 e9e14a558f8ab-42404c7b9f3mr43581215ab.5.1757978011108; 
 Mon, 15 Sep 2025 16:13:31 -0700 (PDT)
Received: from james-x399.localdomain (71-218-100-179.hlrn.qwest.net.
 [71.218.100.179]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-511f2f32facsm5265751173.19.2025.09.15.16.13.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 16:13:30 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Sep 2025 17:13:05 -0600
Message-ID: <20250915231306.2142460-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757978011; x=1758582811; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3rkz1D0jmIa0Z9neDm3PzI+CeJd2jikwZWlaMldhm28=;
 b=bdtbmZ1sZ05ON3ElprVdxQQwk12YcLS67uABOVxBuQyxXPpv14KraPbRvnXoM0mnng
 LxNj+ZMpqG0UZVpq0GF0tIRI7ghi0RkJhSiIOLcU9sOiy3MwWcn7J97ddF8mlPhqOEa0
 YH+qSnAi524+gKzgKzh7N/9jNErHz0psfCoxJqy60jhGvtzgsnMcrywgFVIVD69V26bQ
 UeYN7+OaTnHDHCPIhiCwKlR9AbFHjZQXMa57r7SN6sHabCkncDhK/9iGfu1GE9I9IV2e
 Vz9Vs4a9rh13NnwEMAswRr82I00G1YlZbQmx9MBxiA8D16kpxpDz1FfwvTMzjtSB2Zyi
 P6YA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bdtbmZ1s
Subject: [Buildroot] [PATCH 1/1] package/python-cryptography: bump to
 version 45.0.7
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add host-pkgconf dependency which is needed for finding openssl.

Set OPENSSL_NO_VENDOR=1 in the environment to ensure we use the
system openssl library.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-cryptography/python-cryptography.hash | 2 +-
 package/python-cryptography/python-cryptography.mk   | 8 ++++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/python-cryptography/python-cryptography.hash b/package/python-cryptography/python-cryptography.hash
index 148e28aa9d..02b2b891e2 100644
--- a/package/python-cryptography/python-cryptography.hash
+++ b/package/python-cryptography/python-cryptography.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  fee8ee88b2661e0cfcb14285abd3cf292d36aa6ee72e9f76d0c0d8ad010e1c27  python-cryptography-44.0.1-cargo4.tar.gz
+sha256  9c070a97c37b4cc487737fa7a1fec27c2d44ba54c39f1c2cc558b2b9878283f9  python-cryptography-45.0.7-cargo4.tar.gz
 # Locally computed sha256 checksums
 sha256  3e0c7c091a948b82533ba98fd7cbb40432d6f1a9acbf85f5922d2f99a93ae6bb  LICENSE
 sha256  aac73b3148f6d1d7111dbca32099f68d26c644c6813ae1e4f05f6579aa2663fe  LICENSE.APACHE
diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index fd2c3d7a50..8455c4b9ac 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CRYPTOGRAPHY_VERSION = 44.0.1
+PYTHON_CRYPTOGRAPHY_VERSION = 45.0.7
 PYTHON_CRYPTOGRAPHY_SOURCE_PYPI = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
-PYTHON_CRYPTOGRAPHY_SITE_PYPI = https://files.pythonhosted.org/packages/c7/67/545c79fe50f7af51dbad56d16b23fe33f63ee6a5d956b3cb68ea110cbe64
+PYTHON_CRYPTOGRAPHY_SITE_PYPI = https://files.pythonhosted.org/packages/a7/35/c495bffc2056f2dadb32434f1feedd79abde2a7f8363e1974afa9c33c7e2
 PYTHON_CRYPTOGRAPHY_SITE = $(PYTHON_CRYPTOGRAPHY_SITE_PYPI)/$(PYTHON_CRYPTOGRAPHY_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_CRYPTOGRAPHY_SETUP_TYPE = maturin
 PYTHON_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3-Clause
@@ -15,13 +15,17 @@ PYTHON_CRYPTOGRAPHY_CPE_ID_VENDOR = cryptography_project
 PYTHON_CRYPTOGRAPHY_CPE_ID_PRODUCT = cryptography
 PYTHON_CRYPTOGRAPHY_CARGO_MANIFEST_PATH = src/rust/Cargo.toml
 PYTHON_CRYPTOGRAPHY_DEPENDENCIES = \
+	host-pkgconf \
 	host-python-cffi \
 	host-python-setuptools \
 	openssl
 HOST_PYTHON_CRYPTOGRAPHY_DEPENDENCIES = \
+	host-pkgconf \
 	host-python-cffi \
 	host-python-setuptools \
 	host-openssl
+PYTHON_CRYPTOGRAPHY_ENV = OPENSSL_NO_VENDOR=1
+HOST_PYTHON_CRYPTOGRAPHY_ENV = OPENSSL_NO_VENDOR=1
 PYTHON_CRYPTOGRAPHY_BUILD_OPTS = --skip-dependency-check
 HOST_PYTHON_CRYPTOGRAPHY_BUILD_OPTS = --skip-dependency-check
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
