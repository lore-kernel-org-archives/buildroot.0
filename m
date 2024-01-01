Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5188C47073
	for <buildroot@archiver.kernel.org>; Mon,  1 Jan 2024 21:59:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E23D408C0;
	Mon,  1 Jan 2024 21:59:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E23D408C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hFYX71rZIXS5; Mon,  1 Jan 2024 21:59:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E383408E0;
	Mon,  1 Jan 2024 21:59:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E383408E0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2587F1BF20D
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 21:59:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 02E90408E0
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 21:59:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02E90408E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bYZ61qcKq_4b for <buildroot@lists.busybox.net>;
 Mon,  1 Jan 2024 21:59:37 +0000 (UTC)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 880AB408C0
 for <buildroot@buildroot.org>; Mon,  1 Jan 2024 21:59:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 880AB408C0
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40d5f402571so53547855e9.0
 for <buildroot@buildroot.org>; Mon, 01 Jan 2024 13:59:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704146374; x=1704751174;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HFhcVgKjKfca+w80TCj+iOOyf4P4Htpq6zg2AgF+LVM=;
 b=Onf6EiFCHpjbLXTze3RMEN5mButv7a1Q/et68Paq4t8j+l03/O1nGwJRFv7+bul6kw
 muArHApYsWWFQQebk6J6n2LDEDzrKoX4If2fjFsoJynAknFY8/ErBldh1HKDujYF9G/S
 pVzQye3WJ3hMCJ1XxAtcPc2uv03fs8VMoDg812PAZFHek58JOKKPjt4JmX4oelrteKlB
 ZSb6HmAOwDZ8LaB+sCpzt5Qu3wERhTMLUXaUqQenSGVgXCcmB9XUM1rOvdVZZDuDYUcX
 G9nqbz80/exSIcJM0JKxeg0e8hwaEAo8x55GFl6+Ywl0rQC5HAoVh4o25Whe/pmiLD5e
 BFzQ==
X-Gm-Message-State: AOJu0YwBm7Zo/zhb+HpzRoRiY4Za4mnJ5ItOX0UHgwnFbJebssoCTApO
 kmdnnMeoKm6rFwMPDl1nVysIOQatd/Q=
X-Google-Smtp-Source: AGHT+IHzE4DfG+6zQg6JzCpO1wQ2yde5GS2QDhVCFWI3YC9b+29FKz1HMg3ZtHG3ejFeD4WVwKyJtQ==
X-Received: by 2002:a05:600c:4da1:b0:40d:3c4e:a5a4 with SMTP id
 v33-20020a05600c4da100b0040d3c4ea5a4mr8529015wmp.96.1704146374408; 
 Mon, 01 Jan 2024 13:59:34 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 fb8-20020a05600c520800b0040d87b9eec7sm6296712wmb.32.2024.01.01.13.59.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jan 2024 13:59:33 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  1 Jan 2024 22:59:31 +0100
Message-ID: <20240101215931.4304-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704146374; x=1704751174; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HFhcVgKjKfca+w80TCj+iOOyf4P4Htpq6zg2AgF+LVM=;
 b=h19tAlApma3TRZY7ARXkD2oXK8P3PHrRi64axpU/XfBwH6pTbSeIE8ch/bGPlD6umd
 M5Qgl7U1WFXW2YC59BAQEzupa6+oHJzFkwViDK54tlymuaAcL/GvUoMIvOKBUYj1djlM
 g1QqGSg+1MtJd5h4IZgsrDgnELhewgUZUtjF/9WYvlj0ZM28DLziZGxGYBlV9p0eUJwh
 HT4+iNq9LcnqXRS1ZINF025csc9ZTkKj0l8+9RuqKrNK6B+fzwVhDa4v6eOTnnNkYbnC
 d2ffxJeZQu5KA6f3NY3Ci7imnsEPDhToqX472C0UP6kC6ZArtDfkUmkiPAHabxabX3B3
 a1Bw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=h19tAlAp
Subject: [Buildroot] [PATCH 1/1] package/domoticz: bump to version 2024.1
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

openzwave is not a dependency since
https://github.com/domoticz/domoticz/commit/62c95f24305f18734cf5ebb3f6517b225fddc36f

https://github.com/domoticz/domoticz/blob/2024.1/History.txt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/domoticz/domoticz.hash |  2 +-
 package/domoticz/domoticz.mk   | 12 +-----------
 2 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/package/domoticz/domoticz.hash b/package/domoticz/domoticz.hash
index b54d0229fc..546177332e 100644
--- a/package/domoticz/domoticz.hash
+++ b/package/domoticz/domoticz.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  32bcf49df8c80c470352e63004a82d9601b90ccf406096099656250a4515ac28  domoticz-2023.2.tar.gz
+sha256  9effa792f856d8d9036c53b9ae500ee3bffa1488addf9d6f1fe4bf960f73f740  domoticz-2024.1.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  License.txt
diff --git a/package/domoticz/domoticz.mk b/package/domoticz/domoticz.mk
index 3fbff5f4d8..d0856b71af 100644
--- a/package/domoticz/domoticz.mk
+++ b/package/domoticz/domoticz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOMOTICZ_VERSION = 2023.2
+DOMOTICZ_VERSION = 2024.1
 DOMOTICZ_SITE = $(call github,domoticz,domoticz,$(DOMOTICZ_VERSION))
 DOMOTICZ_LICENSE = GPL-3.0
 DOMOTICZ_LICENSE_FILES = License.txt
@@ -53,16 +53,6 @@ else
 DOMOTICZ_CONF_OPTS += -DWITH_LIBUSB=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_OPENZWAVE),y)
-DOMOTICZ_DEPENDENCIES += openzwave
-
-# Due to the dependency on mosquitto, domoticz depends on
-# !BR2_STATIC_LIBS so set USE_STATIC_OPENZWAVE to OFF otherwise
-# domoticz will not find the openzwave library as it searches by
-# default a static library.
-DOMOTICZ_CONF_OPTS += -DUSE_STATIC_OPENZWAVE=OFF
-endif
-
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
 DOMOTICZ_DEPENDENCIES += python3
 DOMOTICZ_CONF_OPTS += -DUSE_PYTHON=ON
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
