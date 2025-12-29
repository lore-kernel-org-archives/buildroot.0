Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C03E8FDB1
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 05:57:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9102C60774;
	Mon, 29 Dec 2025 05:57:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qfgDgCmF7BiT; Mon, 29 Dec 2025 05:57:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4C1D6078B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766987876;
	bh=zr2EOVXsY9lQuF96CdVkt1UyEFeElY9T5OnyQLwgnhQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=LVq6nFqur/yFdeRomOdZI7xxKKHjiqdBiqraOHmzZLVX3L35KzPBHQt0oVOr89tv4
	 F6xy8Pbl5HJXq0X6TU7DYVLe1dKLEGuh/qZoZBDUTbKY5lSKmbYHb26Ud85KnBl7tX
	 AKvGWdKcaVAiLvjEnEVKmpYzfioUsTsxLAOR3fWcGtX6JrnyzKP7m2PjC+09pj95wQ
	 IUn4zurJGVe1oCGEs18urMUe6CnCi3F+3JT82EXQX51jUxr3DnKocSgh12qydoQ9X5
	 tFTWF1J3WTnGhWTYLuTc3ig68LADGWnAh1v0x2LsiOS3NwYqM1tQscgOOwzixitT5x
	 owF001W0/mnQA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4C1D6078B;
	Mon, 29 Dec 2025 05:57:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 21DECB9
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 05:57:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0809B4075E
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 05:57:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YYUxCBcOJ144 for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 05:57:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::2d; helo=mail-oa1-x2d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3723740297
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3723740297
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3723740297
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 05:57:54 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-3ec96ee3dabso6829201fac.1
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:57:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766987873; x=1767592673;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+yd8/c7Ns1jITC/f6EDIBdvoIRut0Rp/sZz+pJI6o8E=;
 b=s039TwXKLxv/E2tsZk/ERILAx8G6Fpf1c+3PvlmKpJ+MWPVYmWshYsOzcgWgC926yz
 6oeHqr9YBs4QGveF3CWvz2hbs9hchk9ZkWjHcyUKVtKytffd4BNt+Pn/UvhXHX8Y7XF2
 YOvgb+wefWFcCOrmyoVlyc7LYezOYlOlicANVb2anBgBUMpayzu59jpuP4S3z13oCNN9
 zaeyOM+h936LIteSjcCStmW4ycefGGn3M4FDGuKtWwAm0gE10Js8ny0GWTrKUlgmhzDr
 lIepS3ExmmTexlR9adojLsemdT9tWgkGBYnyPBgWM+U4c83sS4lw0OjtxYtgYywTlBCy
 Xd8g==
X-Gm-Message-State: AOJu0YyMAgcRWcQtBPYdVY/KWbPv5uTA0GyDw9L6O2EG5uBUZcpqspKm
 fRle+0WNXTOrJ23D6FAP/rLxC4wMq335ANodzqgTVP6lt1cB9n35rYmac3EylWPI
X-Gm-Gg: AY/fxX6tbzPjeKBezCeh2E0knaJ1CiE/XkJbLAeptkjnBuVGodoRfm2uN+JgdOPqkZG
 DglvOP3TU5bGjbNrEjh+qJQK7AgCmkvrZgyxEyS4/rIki5o6TqDZK/DHDwyV2lr4VcWnklmtRM3
 5bPZJWmJ+Dcl2iH8MJ7vGcW+1DUCOFUmYTIQfK6oJOZ2L0+Zg+GoMZ/CfOQX+TpR2JE0Qt5ekyr
 VBu1l8NGNq907g34CansvtBF3Yoxj6jQIYcBUwDTJyHEiqE323BkH244RDQt6CVsq4opUtvcYJl
 LSBwUj2vc/WYUVFseYwRc4toZ+EfTFCkp6viswpiHy+/FZvpDK0XeK1nOL9REGE3CyKXz+Zcawb
 9gaeuR7Z6P3XC/TamgvIPbuvhI4ryRmC8tezQvQPyG9RU2lcEidSrXIK5yjqrnQCZae0K/UHado
 ke3reIM8tGGhn/M6YIWrkdj+yxzhzH20jvnRcSPc9iaVGX0OFvm7Cbl5pqLQJJ6+NAkemDx+GB+
 IjsVGgGKLYOXgTvneIc/kduE+3Lr92cqk3xS+Rwd8HsXaatMjaQk7k=
X-Google-Smtp-Source: AGHT+IFW0uCgL2EpiJI7gal+dCG3CngPEh0t3RjaoC+sk6EeB0ifyTzmdjtvWjgQtF43GD3Ue0ZWWg==
X-Received: by 2002:a05:6870:959b:b0:3ec:575f:5601 with SMTP id
 586e51a60fabf-3fda588886emr16339272fac.40.1766987872719; 
 Sun, 28 Dec 2025 21:57:52 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-3fdaab65749sm18151672fac.11.2025.12.28.21.57.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Dec 2025 21:57:52 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 22:57:25 -0700
Message-ID: <20251229055725.3515099-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766987873; x=1767592673; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+yd8/c7Ns1jITC/f6EDIBdvoIRut0Rp/sZz+pJI6o8E=;
 b=JlU2yqR75sSV8onK9d1kM/JQU1hzlf5GoGw4WSwBSSPKjeNDZG1MSB9g+GdG5a7XFm
 jyeCh5stZVv1uDfg8WVxY9jX35d2hJmK25kBYDOKCAaJswZPwrzN31zMzeOfVAVwcgpy
 /od2EXP9nkQW6TpCUog6RV/q33PnZvHfxEwRKcZ1Uarc9UH5oVIL1vHEZqCramsaQcx5
 WGZ79LvOkrR9LlWOTPITYqY/0eRyehgfM/5PmDmozd+PnCeKBedXLQEHAQsHO6icNxYq
 LieHUg5WUEMMWrJRaAGDdE2gcZXgBbowZKye0q2ONEYzE0IDuXQN4dsUR3kqle8DdLN/
 VftQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JlU2yqR7
Subject: [Buildroot] [PATCH 1/1] package/python-fastapi: bump to version
 0.128.0
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
 package/python-fastapi/python-fastapi.hash | 4 ++--
 package/python-fastapi/python-fastapi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fastapi/python-fastapi.hash b/package/python-fastapi/python-fastapi.hash
index a514fe09e7..4c87c1a909 100644
--- a/package/python-fastapi/python-fastapi.hash
+++ b/package/python-fastapi/python-fastapi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fastapi/json
-md5  b2126a9a8e4645e94cf07190d9a37bdd  fastapi-0.127.0.tar.gz
-sha256  5a9246e03dcd1fdb19f1396db30894867c1d630f5107dc167dcbc5ed1ea7d259  fastapi-0.127.0.tar.gz
+md5  eb8cc0ba48ade2ac08bf55c880a69fdd  fastapi-0.128.0.tar.gz
+sha256  1cc179e1cef10a6be60ffe429f79b829dce99d8de32d7acb7e6c8dfdf7f2645a  fastapi-0.128.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4ec89ffc81485b97fec584b2d4a961032eeffe834453894fd9c1274906cc744e  LICENSE
diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
index 36b892c060..7f2ee7dd64 100644
--- a/package/python-fastapi/python-fastapi.mk
+++ b/package/python-fastapi/python-fastapi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FASTAPI_VERSION = 0.127.0
+PYTHON_FASTAPI_VERSION = 0.128.0
 PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
-PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/0c/02/2cbbecf6551e0c1a06f9b9765eb8f7ae126362fbba43babbb11b0e3b7db3
+PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/52/08/8c8508db6c7b9aae8f7175046af41baad690771c9bcde676419965e338c7
 PYTHON_FASTAPI_SETUP_TYPE = pep517
 PYTHON_FASTAPI_LICENSE = MIT
 PYTHON_FASTAPI_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
