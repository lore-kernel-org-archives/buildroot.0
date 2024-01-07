Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B802C47073
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 11:43:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37EDE40891;
	Sun,  7 Jan 2024 11:43:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37EDE40891
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QcD_mPWb_SYl; Sun,  7 Jan 2024 11:43:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78B6F40872;
	Sun,  7 Jan 2024 11:43:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78B6F40872
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D157F1BF292
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 11:43:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A9F5860881
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 11:43:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9F5860881
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PDnesWNH38eK for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 11:43:50 +0000 (UTC)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 851EB60838
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 11:43:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 851EB60838
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40d4a222818so10405705e9.0
 for <buildroot@buildroot.org>; Sun, 07 Jan 2024 03:43:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704627827; x=1705232627;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dGXqH7kamTd+QtNukpSPr0h34+nNUkPIQgYEypA3RAM=;
 b=WwnqtKvXj6U4tG+l40jilRQPUe/cE17u/kuA8UxmdgSzPTyqfRHhhxzVnz6fL0WjCo
 MBUCpdk45QhXn73l0gb5lC5XTRd39ZRmKPBHj4n58MEeI9v2PwIudKG40/Yj6Btj82P1
 sN4rQW4+8pSVGdkfNlyB1uG7XYIUj37K4VoQRkSfS+yxXrOrSYm50MGnDlp6SvNTIHG2
 nqJItIN2Jxgytd0rndAnsmu0pWc0z0JO1RcHp3DQQLPT8x5j/SM6MGJaQtWGAlYK9GFc
 ntTn8K2daKTK13jJrINsNHjWRAqvk9x/VaU7MyyHdSMiDF7zVspd3w61ep+vxMInSPZB
 0VWg==
X-Gm-Message-State: AOJu0YzpBnsSTfCURtludj/9vB9cGUeoHOk1m2Z+SvxdZDuH/NK57sX0
 aZZM0yGBCX3rWkJF9OrULGxOzMfujDY=
X-Google-Smtp-Source: AGHT+IHDoGbpqRrOIEAZfprwGhWajyRBnfE0MWgITgw8144qrg99ybGMR5eb3no12I8HmGmuuJLoZQ==
X-Received: by 2002:a05:600c:2319:b0:40e:3aa1:b897 with SMTP id
 25-20020a05600c231900b0040e3aa1b897mr1005329wmo.21.1704627827513; 
 Sun, 07 Jan 2024 03:43:47 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 f13-20020a05600c4e8d00b0040d887fda00sm7378684wmq.26.2024.01.07.03.43.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jan 2024 03:43:47 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Jan 2024 12:43:45 +0100
Message-ID: <20240107114345.2795252-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704627827; x=1705232627; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dGXqH7kamTd+QtNukpSPr0h34+nNUkPIQgYEypA3RAM=;
 b=ZW1nbAiF04SCWk8kIm0EdJD/FMxDIOu15SMsnFVOlA8/AOnMfh+YN4nuAc8XY4If8D
 2/5MoVD2PTUR8EQ+0J6NEnRO2iL16/XOm24dGWOdg2SaaLkc8hwPLkxz3B2y4FPOOECu
 xp9Ze9oZv0tVrqALa37qzTuGxG5z7T9XUsGC661CgawrY5RaegrwHAWuT9jN7DTOBVrv
 giVKJG49WL2Y48VLBPNJ0yl3DoOq28uGqP589U8bFxguk0PVOCb1VwxAdmkUVpgfraUD
 ajzMXWoY8GxJLkqcCY2IiUCXqbM4LYDyWVWd6z3bPuPxhq0bfGxwoBVJ2vze8OnXpQnX
 fW8A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZW1nbAiF
Subject: [Buildroot] [PATCH 1/1] package/python-bitstring: bump to version
 4.1.4
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This bump will fix the following build failure raised since bump to
version 4.1.2 in commit ce2bf7b96b9dba57bb31aca583283736af27afcc:

*** Error compiling '/home/buildroot/autobuild/instance-0/output-1/target/usr/lib/python3.11/site-packages/bitstring/plugin_test.py'...
Sorry: IndentationError: expected an indented block after function definition on line 6 (plugin_test.py, line 8)

https://github.com/scott-griffiths/bitstring/blob/bitstring-4.1.4/release_notes.txt

Fixes:
 - http://autobuild.buildroot.org/results/e6fac4cac16de94862e3b4697dd88e856bc9a398

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-bitstring/python-bitstring.hash | 4 ++--
 package/python-bitstring/python-bitstring.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-bitstring/python-bitstring.hash b/package/python-bitstring/python-bitstring.hash
index c2ff9a69d5..1889983f47 100644
--- a/package/python-bitstring/python-bitstring.hash
+++ b/package/python-bitstring/python-bitstring.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bitstring/json
-md5  1750c35e8e45f597725037d35eed9ba1  bitstring-4.1.2.tar.gz
-sha256  c22283d60fd3e1a8f386ccd4f1915d7fe13481d6349db39711421e24d4a9cccf  bitstring-4.1.2.tar.gz
+md5  3909415d89586edabd577b62b0d0c1be  bitstring-4.1.4.tar.gz
+sha256  94f3f1c45383ebe8fd4a359424ffeb75c2f290760ae8fcac421b44f89ac85213  bitstring-4.1.4.tar.gz
 # Locally computed sha256 checksums
 sha256  3705eed5a923f35d9bfaca1f10e9136cc84d6e576570aec661bda69991f129ea  LICENSE
diff --git a/package/python-bitstring/python-bitstring.mk b/package/python-bitstring/python-bitstring.mk
index 9a5d8dfe84..983491303d 100644
--- a/package/python-bitstring/python-bitstring.mk
+++ b/package/python-bitstring/python-bitstring.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BITSTRING_VERSION = 4.1.2
+PYTHON_BITSTRING_VERSION = 4.1.4
 PYTHON_BITSTRING_SOURCE = bitstring-$(PYTHON_BITSTRING_VERSION).tar.gz
-PYTHON_BITSTRING_SITE = https://files.pythonhosted.org/packages/23/fc/b5ace4f51fea5bcc7f8cca8859748ea5eb941680b82a5b3687c980d9589b
+PYTHON_BITSTRING_SITE = https://files.pythonhosted.org/packages/7f/07/0fd502a29127b968bada3d1824a8af997546d2b9ff73f00e800b3d9888cb
 PYTHON_BITSTRING_SETUP_TYPE = setuptools
 PYTHON_BITSTRING_LICENSE = MIT
 PYTHON_BITSTRING_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
