Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 893A2C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 04:37:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 32F70401C2;
	Sun,  5 Nov 2023 04:37:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32F70401C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hqWfaUay03IW; Sun,  5 Nov 2023 04:36:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 08D2B4042D;
	Sun,  5 Nov 2023 04:36:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08D2B4042D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ED60B1BF5A0
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 04:36:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D3A2F60E4E
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 04:36:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3A2F60E4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mQuLNwk8yZOx for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 04:36:55 +0000 (UTC)
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D524560BB0
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 04:36:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D524560BB0
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-7a669a4ec51so127065039f.3
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 21:36:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699159013; x=1699763813;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xtJA9W7AsFC1ajRTaN2tVWB/eYVqLKEGwVk/0tipM2k=;
 b=p/rjtpsi3kvjDjpv5ilt/Op9UVPLfBx16+8DV8XJEbWYMzvUeRSBYhDY/mpbOTKd1k
 wL2hLNEtEXMbGJtPNdo+S0rl5Kx/JraId9RVtFvyU9O2WSocBjmeC1K17Daqxl2Y+H80
 0CaiwrqmUaTZWq9lH7Mr0YjXPtjdUvtDoROg0V97iBrE/Lj/pS2DV2KXrOPDJOI8Umd+
 mm4jIhSXmFG2D3BbAwL4p6OqK8g5TeQYFpS+78RE2D1jqK635C9clHCxEE32DkDZ8VS+
 +jJo4fl6NbAN9h1x0DaqSQB7/DSV+/RWWB5p4DUYfaaED6l+KFX2oxqFrXg6WQt+NFE4
 Ic7A==
X-Gm-Message-State: AOJu0YwyEKJq4nhHfWmUawI2dPZjKfHpBfDddt9R90GCUjgS4zIBcTAv
 DVJuXZ2VyfhshXFhwsbMA5Ts0na44wE=
X-Google-Smtp-Source: AGHT+IGUQKY7aN8ukt2KQmqOF4l+lFLViFdX5MiWzPBOAKRC2a7pSI1+7hWFHshVGM1UE4LWlXw+/w==
X-Received: by 2002:a05:6602:2e8f:b0:7a9:63ff:29ff with SMTP id
 m15-20020a0566022e8f00b007a963ff29ffmr35115139iow.7.1699159013427; 
 Sat, 04 Nov 2023 21:36:53 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 ft7-20020a056638660700b0043cbc7f9958sm1346618jab.110.2023.11.04.21.36.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 21:36:53 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 22:36:51 -0600
Message-Id: <20231105043651.2813029-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699159013; x=1699763813; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xtJA9W7AsFC1ajRTaN2tVWB/eYVqLKEGwVk/0tipM2k=;
 b=Ek3fxjsM8WE4aXqIXWhl/DxLCIVnoSDVSVYGj8ZXaT5wuia1uHL/pNKYCaA1HeRc2E
 tunhBFeP6o5Tls1mNlGbYH8bEnMTzdkXWvwqv0Ej2uouM2YIhHc/ujbWOFXZHS858/kD
 zLsHfg+qOQQkXV0iJ+2Pvyo4TWQRya2YEmCLzT/t7E+SuDF49qr0OlejWTihGD7dZy5c
 4EupJ4pTYb+ln6QtsRGjSlgU1bU2Dskt75CSUjJUJUPyS9z5oBQb17dCWWRgM4yexaP7
 R9DzuFjvKGGoZW58BItQtyXzBlVZreP8oT+rcQpOOZAWoDQofHMidHoOmAQ9O9Wd3dX0
 Hl9g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Ek3fxjsM
Subject: [Buildroot] [PATCH 1/1] package/python-dataproperty: bump to
 version 1.0.1
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
 package/python-dataproperty/python-dataproperty.hash | 4 ++--
 package/python-dataproperty/python-dataproperty.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dataproperty/python-dataproperty.hash b/package/python-dataproperty/python-dataproperty.hash
index 3edec5cc8c..ee5644a7ff 100644
--- a/package/python-dataproperty/python-dataproperty.hash
+++ b/package/python-dataproperty/python-dataproperty.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dataproperty/json
-md5  8c8864a1dc456d25456b5c4de99a3fb6  DataProperty-0.55.0.tar.gz
-sha256  73ccf10f8b123968210438a1a1aa859ea6d5a16b4e1f4d307da7a81b838e79fa  DataProperty-0.55.0.tar.gz
+md5  aca50cd5f543b7831d8a48ab1c02a152  DataProperty-1.0.1.tar.gz
+sha256  723e5729fa6e885e127a771a983ee1e0e34bb141aca4ffe1f0bfa7cde34650a4  DataProperty-1.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  a93d75bcb0774e2990106380cadad6dcb2de193c55d435ffc56ba345a08b1dc2  LICENSE
diff --git a/package/python-dataproperty/python-dataproperty.mk b/package/python-dataproperty/python-dataproperty.mk
index 0feef55310..6cac4f27e5 100644
--- a/package/python-dataproperty/python-dataproperty.mk
+++ b/package/python-dataproperty/python-dataproperty.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DATAPROPERTY_VERSION = 0.55.0
+PYTHON_DATAPROPERTY_VERSION = 1.0.1
 PYTHON_DATAPROPERTY_SOURCE = DataProperty-$(PYTHON_DATAPROPERTY_VERSION).tar.gz
-PYTHON_DATAPROPERTY_SITE = https://files.pythonhosted.org/packages/85/6e/627eba99858c486c5b82468e4aaf60808c2e35d1bb768ee5da712b6fe9be
+PYTHON_DATAPROPERTY_SITE = https://files.pythonhosted.org/packages/48/e2/31ffb67d2a9ab4ff70b106e08ad01a3e7696f8d409457042d1eb18244f82
 PYTHON_DATAPROPERTY_SETUP_TYPE = setuptools
 PYTHON_DATAPROPERTY_LICENSE = MIT
 PYTHON_DATAPROPERTY_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
