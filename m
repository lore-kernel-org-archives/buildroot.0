Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67673E77188
	for <buildroot@archiver.kernel.org>; Thu, 19 Dec 2024 01:48:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC8C4850AC;
	Thu, 19 Dec 2024 01:48:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JB5znkhDSyVc; Thu, 19 Dec 2024 01:48:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2CD0850AA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2CD0850AA;
	Thu, 19 Dec 2024 01:48:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3CC95CE
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 01:48:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D1DA414F5
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 01:48:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6OjY-Ldg5_-o for <buildroot@buildroot.org>;
 Thu, 19 Dec 2024 01:48:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2e; helo=mail-io1-xd2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D86C341521
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D86C341521
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D86C341521
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 01:48:42 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-844df397754so11127239f.2
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 17:48:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734572921; x=1735177721;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yTGlxSn6OIHQwyGxgER2z0EmHso64flXlq1C2YSUcSo=;
 b=toa+H4ba4jqYTxL8t/6sqf2MI53yDyA7uKRpuklJPEbCCrVkTppvoLu4b5oZBPhVxU
 U+3x0TW7vgA9IRKN/1JZbaU+DYvhw/AzZNoF7XNWkTT04+BNYu+RxP1f0AzwJgWU5d60
 9Hh1MJ9j1NbafQXdGnhlOKggKvYt/w6m+fCG86rxv3AwLRZ4RaVJqrk2+23GWMUIUNOI
 KXC5D9wIcgXCAhmLEDBMtRFp1eit337Al5kx8D/1y80EsHNParFxrMLOFlaO7Z091IGC
 Fj4EnNX7KOuXB1vZPB7GAz3R+jRnwY5aKAYxe/9wornhl4tMeWersVJVxZXlLb8VSGuM
 GycQ==
X-Gm-Message-State: AOJu0YwFDW6CWw9UoMPG3PgPViRvQp7mCnINoAEMkAueQoOB2G3DmV9L
 VHeEn0HyGg48gKA3O/6wor0odI5dctFy3FlBtXO79mIn7/bhVcMX7WGh9fkll/c=
X-Gm-Gg: ASbGncsDoe0yGimd94FqSJEipcubq/Rzjc8q1+pXh2+idR10OUJeQflMiwRyiNRQp8q
 EaFeYMgoFEAi8V2dK5Rc+GQ4NlO3gapiGxw5bB8X7xCzYIbzIcJKnae+g5LIab6SPNtlo4e2hL/
 dN1Iy498t/ssea1zKM5xssqL50xyev2THkNkrnMbKFn/JlzdUiHV2sVX9herYBxN85/Cc9i9zG5
 UfsCmQA4e8U03p7PW62x6EfQ7TrNC4uCspGWwjEHAgd5nKsnxMmA84ZXp3zUydK9bBwOEkvsI92
 rQbZnYm18QXCLnWyLguO2CT8SdIFeO2QpQ==
X-Google-Smtp-Source: AGHT+IGLDzuoiZxRg7HHvg7mqxZOjlHBYUPUDTNZRAMRNQIW7055fZtyWH55FNQcOhDfevLVtIv/nQ==
X-Received: by 2002:a05:6602:15cc:b0:843:ec8d:be00 with SMTP id
 ca18e2360f4ac-84758601dd3mr487126539f.13.1734572921552; 
 Wed, 18 Dec 2024 17:48:41 -0800 (PST)
Received: from james-x399.localdomain (71-218-105-232.hlrn.qwest.net.
 [71.218.105.232]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4e68c1deed2sm39341173.135.2024.12.18.17.48.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 17:48:41 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 18 Dec 2024 18:48:38 -0700
Message-Id: <20241219014838.260211-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734572921; x=1735177721; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yTGlxSn6OIHQwyGxgER2z0EmHso64flXlq1C2YSUcSo=;
 b=WK6hPuwuwiZrGgpvozOz7PsSBIVHUNjvBjEDTVedmXgPBLPZt8ofHUj7kT8p9p9PWF
 Yi2YVlQXi3rR+qnQBIE8slsC7jnKmiB4WcTYxS01xq2xIZGhPA/YBHtUa68HCT8Kf/D4
 BUyGJWmsnWUeXRs8NJ5DifIPO+/zq09+oRUpAUpHnmnEWpdq8UubIzRHVgxEQ1VC/auv
 +sNidxgu/BAFBVtj8hKRtSt93pdL9O/Kg3LeXc/eTc5gNyjG6h7bSxaVH5qzwEbru3AF
 lN930Lx8XTVKK5G0aOnXDA72/Nkxuwa4CKNl97OVAUq8QvQ4J+3TvcSYfrfqyQdwiFgW
 ZA6w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=WK6hPuwu
Subject: [Buildroot] [PATCH 1/1] package/python-dbus-fast: bump to version
 2.24.4
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
 Marcin Niestroj <m.niestroj@grinn-global.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-dbus-fast/python-dbus-fast.hash | 4 ++--
 package/python-dbus-fast/python-dbus-fast.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dbus-fast/python-dbus-fast.hash b/package/python-dbus-fast/python-dbus-fast.hash
index 4234fc0501..1a618f6060 100644
--- a/package/python-dbus-fast/python-dbus-fast.hash
+++ b/package/python-dbus-fast/python-dbus-fast.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dbus-fast/json
-md5  3d7ef3e3ae2691d45dcf3d07511eca4f  dbus_fast-2.24.3.tar.gz
-sha256  9042a1b565ecac4f8e04df79376de1d1d31e4c82eddb6e71e8b8d82d0c94dd3d  dbus_fast-2.24.3.tar.gz
+md5  fc28b83adf21cb05b3286ff3d69aab76  dbus_fast-2.24.4.tar.gz
+sha256  58f97e8342d6cd11ebb2c8ac959c5bb342eb83e29180528690b323a5a5def41c  dbus_fast-2.24.4.tar.gz
 # Locally computed sha256 checksums
 sha256  c37e9c75110e01d1f0c5360dc7d7776a30ac5f70d2440db214423e4b7a77a6af  LICENSE
diff --git a/package/python-dbus-fast/python-dbus-fast.mk b/package/python-dbus-fast/python-dbus-fast.mk
index 60d0b7e9af..2a9da7d780 100644
--- a/package/python-dbus-fast/python-dbus-fast.mk
+++ b/package/python-dbus-fast/python-dbus-fast.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DBUS_FAST_VERSION = 2.24.3
+PYTHON_DBUS_FAST_VERSION = 2.24.4
 PYTHON_DBUS_FAST_SOURCE = dbus_fast-$(PYTHON_DBUS_FAST_VERSION).tar.gz
-PYTHON_DBUS_FAST_SITE = https://files.pythonhosted.org/packages/0a/37/a27e7f2dc6a18b5dcee70ffb08013a33770c2154a51fb5e2c04a7f4169fa
+PYTHON_DBUS_FAST_SITE = https://files.pythonhosted.org/packages/1f/91/b04e2dca706bddcd419352b5f623e8860c04adf2dd6ceef6116df4de4f6a
 PYTHON_DBUS_FAST_SETUP_TYPE = poetry
 PYTHON_DBUS_FAST_LICENSE = MIT
 PYTHON_DBUS_FAST_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
