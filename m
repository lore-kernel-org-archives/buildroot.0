Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 223EBE7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 18:27:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D413980883;
	Sat, 11 Jan 2025 18:27:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4e0QFgojYelH; Sat, 11 Jan 2025 18:27:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDD8C808AE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDD8C808AE;
	Sat, 11 Jan 2025 18:27:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E402940
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 18:27:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 062A74013D
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 18:27:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZCkKwfFZ5e_G for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 18:27:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12f; helo=mail-il1-x12f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C6F2540017
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6F2540017
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C6F2540017
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 18:27:38 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id
 e9e14a558f8ab-3a777958043so10785035ab.2
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 10:27:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736620057; x=1737224857;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RbKN6vcPXcnqFVJDB80DgxMy4iPIJs7d5+SRuG0/v20=;
 b=a+4mBsvsehSfYRn3GkJFTzafckGIpljeAY/UbDckaqQYNRpDDjYQHmnBCbY3MdFZdy
 pEi30f478r43kuAWX4I5hs15060CYTUKIowazMw/w13GCu7JXiaOFHn87Wz9r5WDA5YZ
 WcTlOga7Ys2OVKB/KcEqT82xmQbdZZbTrIIINr8EeX5/ScMqA22ldP9yflB694lFm9bx
 E31xiu+5Md3uUcsgvsVXi9XtS9bp7TGQ6EuhIDO4OLKNnWSk7ktLFq3hVpGGzHeN6nZa
 8WxKrR4/3Q+bddpHBnxkLFOI9ACxrG26LnbnN6V90DbF0gLrxhVu4TPDZI1yzQLpY4xD
 q7zw==
X-Gm-Message-State: AOJu0Yz+n9xXyTeMIsZlXfMDNuHwWos+eLrMpuq/U4Ajnov8dBAe48Nw
 DQieWaPr9JVp32BXxZgEbPEVmbqEVCltnVGeCLbAOGaZn8lAbQaE14EZPzC4c00=
X-Gm-Gg: ASbGncvjyykd1VFqZyLd6c6cjJhxs0DYNGFmbLcxzFlzBlBlkf39tZYeDoUTiBg9Dj6
 FMYt52c1CnA7bCOZRWnUOgPZjgQypgctVEjMHZehKvA65TcqvKqZhvIpnw4w8he5Xzf+z6tZzjg
 IwNJ+m3humBBeSUSb80fUX5FVAx0t+j7RFd6kHvzcKhLzYKxKCq34Ny0Tv1VcZpuPxdXMNHPuEr
 bqwZB6Bt556No3BiJAJUBBSmVQSICOiNnZWst2wQMUJU0RxdlSOHM8XFGVotJ2X9TlFqYN1+gpn
 QIuPZ0/4xkjdMBcMVeFyN7gK4haJqWw=
X-Google-Smtp-Source: AGHT+IFUU/le30uK8zrxrVMJmM6MazLlRwI5hMc2+kQbbM5jfdjRRew4FTTl41sVV5sSFCd/LDrngQ==
X-Received: by 2002:a05:6e02:3188:b0:3ce:6b10:1805 with SMTP id
 e9e14a558f8ab-3ce6b10190bmr2821075ab.21.1736620057552; 
 Sat, 11 Jan 2025 10:27:37 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ea1b5f93desm1680025173.14.2025.01.11.10.27.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 10:27:37 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 11:27:35 -0700
Message-Id: <20250111182735.2934677-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736620057; x=1737224857; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RbKN6vcPXcnqFVJDB80DgxMy4iPIJs7d5+SRuG0/v20=;
 b=d9jRw/2R0Qw8X6uAlwW+Q4IV3ps8xY7LkLCIut+kHoP50s488EZQhZ1l/MZ/cA0pvI
 nzdmUCCSBbo/jDepfPbntji2iB4aDfhaoNLFz9k2ajtCnwrv/7U+SQeAjYU6iOGXimJW
 7KULe+RoA7ZINtdNxhq5Frgm+yBUMjY7nOv4/JRp/8GFJeFnThBK18Uiy34AnrTtuB86
 yOsW1H+DCfBMAr/Sx1cWvAZ8Npk8hhcz64BxehNZC19zjylZRYz6xfKzXamopGmC/98H
 ABLwHAbh2ObjHQL9d+uZqkGurXUuaI1XacwiLSNqtiTvc7aou5pXXtq+QxWg5zoxppbU
 qTag==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=d9jRw/2R
Subject: [Buildroot] [PATCH 1/1] package/python-tortoise-orm: bump to
 version 0.23.0
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-tortoise-orm/python-tortoise-orm.hash | 4 ++--
 package/python-tortoise-orm/python-tortoise-orm.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tortoise-orm/python-tortoise-orm.hash b/package/python-tortoise-orm/python-tortoise-orm.hash
index 2297290616..649e268cb5 100644
--- a/package/python-tortoise-orm/python-tortoise-orm.hash
+++ b/package/python-tortoise-orm/python-tortoise-orm.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tortoise-orm/json
-md5  21f9f3624ef82b3b9c23ed1fb7d70766  tortoise_orm-0.22.2.tar.gz
-sha256  f1e808bc27265b3e4682dae89b725a66d8311cc20c206d512c57dd8a1c78096b  tortoise_orm-0.22.2.tar.gz
+md5  455b03a55fd090b65ebaa497c770be09  tortoise_orm-0.23.0.tar.gz
+sha256  f25d431ef4fb521a84edad582f4b9c53dccc5abf6cfbc6f228cbece5a13952fa  tortoise_orm-0.23.0.tar.gz
 # Locally computed sha256 checksums
 sha256  f955d347b975d5867ee364f978476b3012878a706d468571b9758cac74de6041  LICENSE.txt
diff --git a/package/python-tortoise-orm/python-tortoise-orm.mk b/package/python-tortoise-orm/python-tortoise-orm.mk
index 6bd1276bd1..e5970bdb41 100644
--- a/package/python-tortoise-orm/python-tortoise-orm.mk
+++ b/package/python-tortoise-orm/python-tortoise-orm.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TORTOISE_ORM_VERSION = 0.22.2
+PYTHON_TORTOISE_ORM_VERSION = 0.23.0
 PYTHON_TORTOISE_ORM_SOURCE = tortoise_orm-$(PYTHON_TORTOISE_ORM_VERSION).tar.gz
-PYTHON_TORTOISE_ORM_SITE = https://files.pythonhosted.org/packages/5c/19/c32752a3042580b40300aeffa48859e087a023114f50a2846ba95c26c87d
+PYTHON_TORTOISE_ORM_SITE = https://files.pythonhosted.org/packages/1b/6e/c23d788524750d84c75864eac0176f57c07a5316b36cc467d2914a109bef
 PYTHON_TORTOISE_ORM_SETUP_TYPE = poetry
 PYTHON_TORTOISE_ORM_LICENSE = Apache-2.0
 PYTHON_TORTOISE_ORM_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
