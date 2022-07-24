Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0D3AC43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 02:25:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 613DB841C5;
	Sun, 24 Jul 2022 02:25:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 613DB841C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mAiRWP8xloc8; Sun, 24 Jul 2022 02:25:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64CA4841AA;
	Sun, 24 Jul 2022 02:25:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64CA4841AA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6AACE1BF4E7
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 02:25:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4FB8540374
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 02:25:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4FB8540374
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vMbiHCMGPF7V for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 02:25:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A1DB40156
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8A1DB40156
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 02:25:15 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id e69so6343747iof.5
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 19:25:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K1mf8hN4fSeaDewHfB3kKJ8ki9yZtk9gsu/B7SAHVpI=;
 b=QndZavvldq0wc5JwuuJKs3GcvBUuCLInohUSKxpXlnaA1R5CLozYsvYx66+Ol3Uel4
 9ZrMb6Rc+sT/pVBwSqgh1IIpj/oUOgYZdViscTfHjkG1PN6ORzPM9IcOx9fjzUllg9Wt
 13lNc0uNEXpLUidwRCOuwureBdfUTsLSEzft9JrVQ5LLWjT5A8d5X++59JsNTzYVsjTV
 IRvpgzvFAIllZ3ILTooLsogJV4uw8IRMIXZgt0SmFRhPYSTq2yRKD9lsNu0HpwNHCMqq
 KFXrK7wSnwv8A/UAUNh9XBp8eahlExdYzLuHsXqSAK7r8jirhitNQsmQV2iPmREhqaEl
 X+iQ==
X-Gm-Message-State: AJIora/8uf0IGbdNyIcIRXFUniqIxrYJ2RUezPqiFCcCMfKTcOzWpPcX
 hBharrMiADVzL0duLG0smZuCg5+tQ0rzaQ==
X-Google-Smtp-Source: AGRyM1uEQorCODRkBFkFo3GV8V5m3mXfnuq0otEgITgGvfADzHoDofJhidwnn5kXINWXtnhUoFbVPw==
X-Received: by 2002:a05:6638:4518:b0:341:5f30:8df2 with SMTP id
 bs24-20020a056638451800b003415f308df2mr2567477jab.177.1658629514494; 
 Sat, 23 Jul 2022 19:25:14 -0700 (PDT)
Received: from james-x399.localdomain (71-33-133-32.hlrn.qwest.net.
 [71.33.133.32]) by smtp.gmail.com with ESMTPSA id
 f41-20020a0284ac000000b0033f3fcba96bsm3844408jai.100.2022.07.23.19.25.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 19:25:13 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 20:25:12 -0600
Message-Id: <20220724022512.1018861-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K1mf8hN4fSeaDewHfB3kKJ8ki9yZtk9gsu/B7SAHVpI=;
 b=A3Vl8foVrRrLGLci7hoPVAYWfZX/39wjpISvPAIwB8RTj2b1gxKDP2jMCZC9cTYahx
 Z5t1bYzklB/7J4LWvzGjv04gAcgXoXiRbtPtMOPK13uLfRuwrKRAZXiXYeO1XZ+lXfEM
 RQ3gYRoKRmgKP2QpALszgtSA7UDdDmtbSkB7Z/XZ24HPc0q8uYcViYGHitI5hEll5FjV
 J15TIvDymTYSYhPdFKeEeTkPb/MOc06pomRSDtil4rUo6ZAaqr5w9yHZZrbMIJVrAfDH
 ColWE7e+AZWRLqlqim0SlE7gmdDOBfhtVkqQOsnWAEWk2dMsWWgMg+WrQWHvgdbBSoYV
 0dBg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=A3Vl8foV
Subject: [Buildroot] [PATCH 1/1] package/python-charset-normalizer: bump to
 version 2.1.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-charset-normalizer/python-charset-normalizer.hash  | 4 ++--
 .../python-charset-normalizer/python-charset-normalizer.mk    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-charset-normalizer/python-charset-normalizer.hash b/package/python-charset-normalizer/python-charset-normalizer.hash
index da540bbb8f..8aefddbbf1 100644
--- a/package/python-charset-normalizer/python-charset-normalizer.hash
+++ b/package/python-charset-normalizer/python-charset-normalizer.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/charset-normalizer/json
-md5  f6664e0e90dbb3cc9cfc154a980f9864  charset-normalizer-2.0.12.tar.gz
-sha256  2857e29ff0d34db842cd7ca3230549d1a697f96ee6d3fb071cfa6c7393832597  charset-normalizer-2.0.12.tar.gz
+md5  c1be418ec00773d84d793f23b2bbc3cd  charset-normalizer-2.1.0.tar.gz
+sha256  575e708016ff3a5e3681541cb9d79312c416835686d054a23accb873b254f413  charset-normalizer-2.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  eb31a0c5a4fb09b8a4e32055d25c1e5f9c358a2752fef3cd720213d1ccfee241  LICENSE
diff --git a/package/python-charset-normalizer/python-charset-normalizer.mk b/package/python-charset-normalizer/python-charset-normalizer.mk
index 0742fac639..c313d4cbce 100644
--- a/package/python-charset-normalizer/python-charset-normalizer.mk
+++ b/package/python-charset-normalizer/python-charset-normalizer.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CHARSET_NORMALIZER_VERSION = 2.0.12
+PYTHON_CHARSET_NORMALIZER_VERSION = 2.1.0
 PYTHON_CHARSET_NORMALIZER_SOURCE = charset-normalizer-$(PYTHON_CHARSET_NORMALIZER_VERSION).tar.gz
-PYTHON_CHARSET_NORMALIZER_SITE = https://files.pythonhosted.org/packages/56/31/7bcaf657fafb3c6db8c787a865434290b726653c912085fbd371e9b92e1c
+PYTHON_CHARSET_NORMALIZER_SITE = https://files.pythonhosted.org/packages/93/1d/d9392056df6670ae2a29fcb04cfa5cee9f6fbde7311a1bb511d4115e9b7a
 PYTHON_CHARSET_NORMALIZER_SETUP_TYPE = setuptools
 PYTHON_CHARSET_NORMALIZER_LICENSE = MIT
 PYTHON_CHARSET_NORMALIZER_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
