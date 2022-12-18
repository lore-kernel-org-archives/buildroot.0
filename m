Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BD17C4332F
	for <buildroot@archiver.kernel.org>; Sun, 18 Dec 2022 11:39:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB37560B57;
	Sun, 18 Dec 2022 11:39:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB37560B57
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dHQ3RKs2qpWp; Sun, 18 Dec 2022 11:39:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED51B60B5D;
	Sun, 18 Dec 2022 11:39:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED51B60B5D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 81FC11BF2A2
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 11:39:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6851B403FF
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 11:39:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6851B403FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x29GOs9SKWOt for <buildroot@lists.busybox.net>;
 Sun, 18 Dec 2022 11:39:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1FBD7400D3
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1FBD7400D3
 for <buildroot@buildroot.org>; Sun, 18 Dec 2022 11:39:00 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id v7so4730720wmn.0
 for <buildroot@buildroot.org>; Sun, 18 Dec 2022 03:39:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gnhGYGTpQ/vA5C94i9tVMtA6NLM2Nq3VhtPimYO+3FI=;
 b=xU7MwYH3ipSCDPVqq1rylSeoXtyVUlMQ+0mFX3i+2MLGPBx0nQ9mvtK+Ovd0/7NuCU
 bjDmwhxLWu7HDYQl9Gtl/ApBgGIbmv/g/S5eFo2Jp94f7qYTdcL1mb27NKdVQBDdAB0C
 DyZjso1UHoHgugDEo3JrGiQ07R2EXMzB7bsUpJkFXx4G3wyuX8V/2F7fakHlDjMHf+c6
 Td3QeEf8RnQLQ7F1Gukp0YwfO2bDdn+saDqghlOuitbsPKYgJqjlYvuOvgV7fLUjbqdE
 oI1yFAN1ozLRG8rjpDLxCGXvN45edpCH8MzX/BL8TWNPJWTTeuuEUT/e8iIaDd5T9nMY
 rWZw==
X-Gm-Message-State: ANoB5plYp0BbQOS0tYLJOom3FW0i2Tq8aHo7KvOsPgmfJNvPfK1JWbKY
 E+zOenzVPlr/KDCrdNKZAGaTyC5GZxw=
X-Google-Smtp-Source: AA0mqf7kOUxAsXgUCYRTgVX88Q/zv9gtg2M81SiRSfVL2DS3Hl/COK6Q4WtfgGiKUysvestcKc97UA==
X-Received: by 2002:a05:600c:3d06:b0:3c6:e60f:3f55 with SMTP id
 bh6-20020a05600c3d0600b003c6e60f3f55mr30089140wmb.12.1671363539027; 
 Sun, 18 Dec 2022 03:38:59 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 z19-20020a05600c221300b003a3170a7af9sm8640498wml.4.2022.12.18.03.38.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Dec 2022 03:38:58 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 18 Dec 2022 12:38:56 +0100
Message-Id: <20221218113856.217724-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gnhGYGTpQ/vA5C94i9tVMtA6NLM2Nq3VhtPimYO+3FI=;
 b=BYyj1s/wYUiiHrQ778XxSfMNfsYyyB0lAXkAjlmQkyLzr4aTcScByQzAVWuUH5bTRS
 0XrUF/ZClfqoIkUfVU2J/WC3+9LEfyz3HxfKnfb7Tl07gTEOvpWqgtmXdDwSoZvlE+6U
 pnYUAi2sCrhsDNA1V2CKruLpH4AcWTYHBwYJtAnIfOL8UdB0Sfz5ZClEhpLt7eV0aYoe
 CU9FnvdG0OzoOKTL0t65Qd/0Zn+c+OJOTSiIhWMvlpmTXrWitw/41iQbNA7GCmtKRU9A
 kW6WE7FLKNFFl1wFOGrmsSr9ZgyjLlkd+e+qKz4GvbiSKzl9/l8i9EP2AIrDuKNct8WX
 GdXA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=BYyj1s/w
Subject: [Buildroot] [PATCH 1/1] package/domoticz: bump to version 2022.2
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/domoticz/domoticz/blob/2022.2/History.txt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...e-EnOceanRawValue.h-include-stdarg.h.patch | 33 +++++++++++++++++++
 package/domoticz/domoticz.hash                |  2 +-
 package/domoticz/domoticz.mk                  |  2 +-
 3 files changed, 35 insertions(+), 2 deletions(-)
 create mode 100644 package/domoticz/0001-hardware-EnOceanRawValue.h-include-stdarg.h.patch

diff --git a/package/domoticz/0001-hardware-EnOceanRawValue.h-include-stdarg.h.patch b/package/domoticz/0001-hardware-EnOceanRawValue.h-include-stdarg.h.patch
new file mode 100644
index 0000000000..bc3e60023d
--- /dev/null
+++ b/package/domoticz/0001-hardware-EnOceanRawValue.h-include-stdarg.h.patch
@@ -0,0 +1,33 @@
+From 6296d7112089a0f3bfb3056f6d9637e13ce4ce83 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 18 Dec 2022 12:27:38 +0100
+Subject: [PATCH] hardware/EnOceanRawValue.h: include stdarg.h
+
+Include stdarg.h to avoid the following build failure on uclibc:
+
+In file included from /home/fabrice/buildroot/output/build/domoticz-2022.2/hardware/EnOceanRawValue.cpp:2:
+/home/fabrice/buildroot/output/build/domoticz-2022.2/hardware/EnOceanRawValue.h:109:83: error: 'va_list' has not been declared
+  109 | uint32_t SetRawValuesNb(uint8_t * data, T_DATAFIELD * OffsetDes, int NbParameter, va_list value);
+      |                                                                                   ^~~~~~~
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/domoticz/domoticz/pull/5472]
+---
+ hardware/EnOceanRawValue.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/hardware/EnOceanRawValue.h b/hardware/EnOceanRawValue.h
+index 84f38d17a..df858f27d 100644
+--- a/hardware/EnOceanRawValue.h
++++ b/hardware/EnOceanRawValue.h
+@@ -1,6 +1,7 @@
+ #ifndef _SetGetRawValue
+ #define _SetGetRawValue
+ 
++#include <stdarg.h>
+ #include <stdint.h>
+ #include <vector>
+ #include <stdio.h>
+-- 
+2.35.1
+
diff --git a/package/domoticz/domoticz.hash b/package/domoticz/domoticz.hash
index 9de241015c..c439238800 100644
--- a/package/domoticz/domoticz.hash
+++ b/package/domoticz/domoticz.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  8282cb71c924b6ef92503976d50f966f2c785eab8f8cffa1136ac133f0241157  domoticz-2022.1.tar.gz
+sha256  8f84098bb64bec12ff7aac5f1fb6b6230a88c5781c2b75bc89861caea73cbccf  domoticz-2022.2.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  License.txt
diff --git a/package/domoticz/domoticz.mk b/package/domoticz/domoticz.mk
index bc4a2def41..451021150b 100644
--- a/package/domoticz/domoticz.mk
+++ b/package/domoticz/domoticz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOMOTICZ_VERSION = 2022.1
+DOMOTICZ_VERSION = 2022.2
 DOMOTICZ_SITE = $(call github,domoticz,domoticz,$(DOMOTICZ_VERSION))
 DOMOTICZ_LICENSE = GPL-3.0
 DOMOTICZ_LICENSE_FILES = License.txt
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
