Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 578BAE77199
	for <buildroot@archiver.kernel.org>; Thu,  9 Jan 2025 20:11:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B8894049E;
	Thu,  9 Jan 2025 20:11:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6GrP5KR8hkSr; Thu,  9 Jan 2025 20:11:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B822340684
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B822340684;
	Thu,  9 Jan 2025 20:11:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B4E11942
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 20:11:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ADA3540A1B
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 20:11:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F5taDFiO8R8m for <buildroot@buildroot.org>;
 Thu,  9 Jan 2025 20:11:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12e; helo=mail-il1-x12e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 84041408C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84041408C8
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 84041408C8
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 20:11:03 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-3a9c9f2a569so7866345ab.0
 for <buildroot@buildroot.org>; Thu, 09 Jan 2025 12:11:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736453462; x=1737058262;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X3baykGGHGSA75K9eFFYQi2/tmLcNJV50192t8+RBhg=;
 b=GhxMNLIrI8PGc6y0N0PK4TG2zYln6b3jj9PzHL9rTbC42shPBzUrjdUpfyBYWJAuSN
 Tm/sLShwDfBXI9uDEDK+c5b7hFUrzZUErk07nD7qUoScdasd2Zw0Rv9l9UYqcRSeKuwa
 kW8aIAMwGDr2XaCFgHetA6jFBODmsH5Pvl89aEIOSmJpLL5AmuyRasx05ntj+rTKONmA
 m/WH2vXIiDn9qK+oiJczXMzc7vRvJ15SfMKIojZh8SPy6CNnA/5kOCUffJ/49rOVNzLw
 e0jypZzt4EcKus2b9pefwrqjb3EcBiC2z4xP9XapXqbHlekA8bHx55in4b+eTdUrmHnX
 4Tqg==
X-Gm-Message-State: AOJu0YyIdWNFu7YfAgIE+sIq0Ri+DYQK3/DtVmiHfGX4NiLTA/SSR+Pm
 t30WeuM8hSabDXfK4YahOxIbbK/zdF1H0B5Ww+twQIWhp2vUQmU368Uda67TTVQ=
X-Gm-Gg: ASbGncu68Ys/dJHIqWc3ARauSJcBtrhnxa9W4JnGdz3HYD5Izic8E31DkaKAyH1pr5E
 OJvsfhKzwZrBhyAKuWrWqWKuOVMe3oTdJA5ROkCDwXao0oMQwQjmX9LQVzIF3+PGSiolEMPEKVi
 Al6GkOEl54dPipZlUS2CFqm+hcf1rgkDkjDlFzKgXpOjILvus3zK7FiXz3669aBqh8blBWBfX6p
 pIfKuPufwBH9hvPjlMwWWM/lPHndXVxPY81AzKei8zqe44sxHoeJupZl8ehfeigiaSNKTGQYxco
 bNLymwY2EMn9EnsLXoxOH/sVAWzbwcQ=
X-Google-Smtp-Source: AGHT+IH8gHhmwd1VNWJtBxnTpZRef02RGYRMYJ0jSseeFmSozAyNea3RUpY/NffCJdZF3bAOgBAGmw==
X-Received: by 2002:a05:6e02:1c41:b0:3a7:dfe4:bd33 with SMTP id
 e9e14a558f8ab-3ce3a87a5cemr66461205ab.6.1736453462085; 
 Thu, 09 Jan 2025 12:11:02 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ea1b717838sm479399173.102.2025.01.09.12.11.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 12:11:01 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  9 Jan 2025 13:10:54 -0700
Message-Id: <20250109201054.2382903-5-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250109201054.2382903-1-james.hilliard1@gmail.com>
References: <20250109201054.2382903-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736453462; x=1737058262; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X3baykGGHGSA75K9eFFYQi2/tmLcNJV50192t8+RBhg=;
 b=SWjd8pdXtS52w1SJ6CF5YayvpfEHsTaWBPn1YezhAmMMpNDq8oeLoZmcgtn07wVTNs
 97AKSvXlqgM3NQNuBSeMTIV6EoRuQVukCgVDoJe2Ml6NGu3ZMlq8WEdPYzhal1/bREHt
 XxaDlAchT7BY264WcLhUJlWkKZw3lDZdobJx4WwE/Na0gh5ixF9XWQ1F4IjIO8EN+y+T
 cfW5MbBvMXGpDz0+G3zl8KGoSjc9CWXb+swIv8sv/dDCsjTjoYzBv7JVWfmXo78EhYdc
 tWRoRqwdTi8WCiizfPXrHmVAgxvIZJPlVEyFn6nHQeKfaqxpgP45Mc55lBmO5q8pgFAP
 KHhg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=SWjd8pdX
Subject: [Buildroot] [PATCH 5/5] package/python-charset-normalizer: bump to
 version 3.4.1
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add new host-python-mypy and host-python-setuptools-scm build
dependencies.

Set --skip-dependency-check due to unnecessarily strict mypy
version limit.

Set CHARSET_NORMALIZER_USE_MYPYC=1 in env so that mypyc optimizations
are enabled.

License hash changed due to year update:
https://github.com/jawah/charset_normalizer/commit/deed20577ba5358bb9624c17e6c8aa6ab26f6e08

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-charset-normalizer.hash                    |  6 +++---
 .../python-charset-normalizer.mk                      | 11 +++++++++--
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/package/python-charset-normalizer/python-charset-normalizer.hash b/package/python-charset-normalizer/python-charset-normalizer.hash
index ebed9d19d7..0518440057 100644
--- a/package/python-charset-normalizer/python-charset-normalizer.hash
+++ b/package/python-charset-normalizer/python-charset-normalizer.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/charset-normalizer/json
-md5  8e0d0f33219087c2cd2d01b1d6ff11b6  charset_normalizer-3.4.0.tar.gz
-sha256  223217c3d4f82c3ac5e29032b3f1c2eb0fb591b72161f86d93f5719079dae93e  charset_normalizer-3.4.0.tar.gz
+md5  1d808eb9efaf70bf0ec3b800f3c7dca8  charset_normalizer-3.4.1.tar.gz
+sha256  44251f18cd68a75b56585dd00dae26183e102cd5e0f9f1466e6df5da2ed64ea3  charset_normalizer-3.4.1.tar.gz
 # Locally computed sha256 checksums
-sha256  eb31a0c5a4fb09b8a4e32055d25c1e5f9c358a2752fef3cd720213d1ccfee241  LICENSE
+sha256  6d0d41bfe170ac6c7dc248c9a63e254d0fb45a60d50a8257d0af92c6e249b887  LICENSE
diff --git a/package/python-charset-normalizer/python-charset-normalizer.mk b/package/python-charset-normalizer/python-charset-normalizer.mk
index ee04bf8968..64a82dd016 100644
--- a/package/python-charset-normalizer/python-charset-normalizer.mk
+++ b/package/python-charset-normalizer/python-charset-normalizer.mk
@@ -4,12 +4,19 @@
 #
 ################################################################################
 
-PYTHON_CHARSET_NORMALIZER_VERSION = 3.4.0
+PYTHON_CHARSET_NORMALIZER_VERSION = 3.4.1
 PYTHON_CHARSET_NORMALIZER_SOURCE = charset_normalizer-$(PYTHON_CHARSET_NORMALIZER_VERSION).tar.gz
-PYTHON_CHARSET_NORMALIZER_SITE = https://files.pythonhosted.org/packages/f2/4f/e1808dc01273379acc506d18f1504eb2d299bd4131743b9fc54d7be4df1e
+PYTHON_CHARSET_NORMALIZER_SITE = https://files.pythonhosted.org/packages/16/b0/572805e227f01586461c80e0fd25d65a2115599cc9dad142fee4b747c357
 PYTHON_CHARSET_NORMALIZER_SETUP_TYPE = setuptools
 PYTHON_CHARSET_NORMALIZER_LICENSE = MIT
 PYTHON_CHARSET_NORMALIZER_LICENSE_FILES = LICENSE
+PYTHON_CHARSET_NORMALIZER_DEPENDENCIES = host-python-mypy host-python-setuptools-scm
+PYTHON_CHARSET_NORMALIZER_BUILD_OPTS = --skip-dependency-check
+PYTHON_CHARSET_NORMALIZER_ENV = CHARSET_NORMALIZER_USE_MYPYC=1
+
+HOST_PYTHON_CHARSET_NORMALIZER_DEPENDENCIES = host-python-mypy host-python-setuptools-scm
+HOST_PYTHON_CHARSET_NORMALIZER_BUILD_OPTS = --skip-dependency-check
+HOST_PYTHON_CHARSET_NORMALIZER_ENV = CHARSET_NORMALIZER_USE_MYPYC=1
 
 $(eval $(python-package))
 $(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
