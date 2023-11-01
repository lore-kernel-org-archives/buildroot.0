Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9038C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 18:16:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85F4981C93;
	Wed,  1 Nov 2023 18:16:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85F4981C93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e3N7nvb7Bwvn; Wed,  1 Nov 2023 18:16:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6763284BFE;
	Wed,  1 Nov 2023 18:16:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6763284BFE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 030F61BF59F
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 18:16:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D08AB704BB
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 18:16:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D08AB704BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i5aFhV0fyJ-B for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 18:16:08 +0000 (UTC)
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3B7C6704B9
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 18:16:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B7C6704B9
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2c514cbbe7eso1094151fa.1
 for <buildroot@buildroot.org>; Wed, 01 Nov 2023 11:16:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698862566; x=1699467366;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A0+d6DPrZCHjGMfAHXjWIWsJuwApyPSe9jINFcUVYPs=;
 b=sT5lJX2j6gDz6YFG+uI8LrRcxHgqg+c1QueEuGPukA5cotV9Xy7OTmWcwJDTxITVVi
 w0XaVEIjTan6uOL0m43WjFQby5Hqo1wEyorZwK+WtYuWFNURtQuILBQ/FKOcpQ3ganun
 A70KBWIjKn5Y41GBwZ+Neuyow7H4mYeLvTOUcf1rBSB/uz2pJhx6YPRScP+90DPxxDA6
 K/ZmA2zBObCI0gXf2zfIT47hXU720kcYBqAjEWWtvwyf9zC5vIBwYL5NvsF/EB0HtYFl
 2qLfnYYRIrV/PE5OZACJsIM9NAjj5kYbpJ0cuNbFkYWhrnbVWbUvsfIYzA/wEwrEldYY
 thkw==
X-Gm-Message-State: AOJu0YwSFXn/Fkx17SsztVSpOqiDSDHDbS0FcFFI8Kz3CLREYLSQJk1s
 gJqiyLT0uxaaFr9kCvVtBpH2kCdSg1g=
X-Google-Smtp-Source: AGHT+IFIYhliSGzyc1onczYKTtf2lx6AQfyowtdGffnaI1EJuWCqa48Ns7SvmtBoy0Ky0h8kUZu4fg==
X-Received: by 2002:a2e:b1c8:0:b0:2c5:d3e:2f46 with SMTP id
 e8-20020a2eb1c8000000b002c50d3e2f46mr11582008lja.11.1698862565505; 
 Wed, 01 Nov 2023 11:16:05 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 o8-20020a05600c2e0800b004053e9276easm461838wmf.32.2023.11.01.11.15.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Nov 2023 11:15:55 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  1 Nov 2023 19:15:46 +0100
Message-ID: <20231101181546.25564-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698862566; x=1699467366; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=A0+d6DPrZCHjGMfAHXjWIWsJuwApyPSe9jINFcUVYPs=;
 b=Ye7PwY9uKfRLxqjOJ5qx8NL2hMDbaakymaUGIaaq3XrGKyJYuNav3hcasyfvmg89L+
 PQ8rdgohePC2FX3zwQSqjEpCD6HKyjaxzxs3cT+nnwX+QT14RvlwORnvhCfl8NmxCSjz
 je7G08oQltvHDKuD2uG2hzYklrbyZMftYT6y6jM5liHBTrEDjVyNrtrJGTqGtLTj04Eb
 Se9aLrWkpxi2MWcic22CXDqdy7vbKdRToFnvidMTERkpOMexF5aKK+BbaAgeI3HCKxI/
 XdHnTXid8P2EuvjYdvDwOB8gkrCLRrAl3BFLmcRKd9ZN92LJ3NBvbzCGyB7i8yJBSREY
 8bRQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Ye7PwY9u
Subject: [Buildroot] [PATCH 1/1] package/python-web2py: security bump to
 version 2.26.1
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix CVE-2023-45158: An OS command injection vulnerability exists in
web2py 2.24.1 and earlier. When the product is configured to use
notifySendHandler for logging (not the default configuration), a crafted
web request may execute an arbitrary OS command on the web server using
the product.

https://jvn.jp/en/jp/JVN80476432
https://github.com/web2py/web2py/compare/v2.24.1...v2.26.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-web2py/python-web2py.hash | 2 +-
 package/python-web2py/python-web2py.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-web2py/python-web2py.hash b/package/python-web2py/python-web2py.hash
index 03c71db8a5..1b4d8f5632 100644
--- a/package/python-web2py/python-web2py.hash
+++ b/package/python-web2py/python-web2py.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256  db42d52097d43fa797c29f9ce1493d7356f192dd0c2590ec56f36022252c284b  python-web2py-2.24.1.tar.gz
+sha256  d5d79f6260ec9f53f90447ad59313a8fac0571fce0018aa5f6fcf95d28c04382  python-web2py-2.26.1.tar.gz
 sha256  2aae96826184a492bc799add49aed7b29036e7aba2d2294fb65053bd30fe55fe  LICENSE
diff --git a/package/python-web2py/python-web2py.mk b/package/python-web2py/python-web2py.mk
index 91c041f6f2..fe7774fc2b 100644
--- a/package/python-web2py/python-web2py.mk
+++ b/package/python-web2py/python-web2py.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_WEB2PY_VERSION = 2.24.1
+PYTHON_WEB2PY_VERSION = 2.26.1
 PYTHON_WEB2PY_SITE = $(call github,web2py,web2py,v$(PYTHON_WEB2PY_VERSION))
 PYTHON_WEB2PY_LICENSE = LGPL-3.0
 PYTHON_WEB2PY_LICENSE_FILES = LICENSE
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
