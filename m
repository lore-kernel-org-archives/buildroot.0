Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E7EC4167B
	for <buildroot@archiver.kernel.org>; Wed, 29 Nov 2023 17:27:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F4EB81517;
	Wed, 29 Nov 2023 17:27:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F4EB81517
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z5cGQ9QrQySq; Wed, 29 Nov 2023 17:27:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F9918437F;
	Wed, 29 Nov 2023 17:27:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F9918437F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B84381BF31E
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 17:26:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 91C7461528
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 17:26:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91C7461528
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nAexTzt0KDwq for <buildroot@lists.busybox.net>;
 Wed, 29 Nov 2023 17:26:42 +0000 (UTC)
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7561E614FA
 for <buildroot@buildroot.org>; Wed, 29 Nov 2023 17:26:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7561E614FA
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-50bc59115c2so70168e87.2
 for <buildroot@buildroot.org>; Wed, 29 Nov 2023 09:26:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701278800; x=1701883600;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dc+pYYBT+157aUpsh4EzXATMY/zKSp6u2yxAIqC+0ts=;
 b=hRDUIprr8wnRXEmTqlY9RHtvxOryjCNYQQOtG5iifMjnZORN0my9hjAfD0zSsMBVyZ
 VttgtgbI6kMr3DJAoBhDZGBNEstWultuQouTKfpqJxTFcGwOt363McmpZJLuC6c+akyI
 kek+XgyCu04n4jolLAToLoeCHlLChMGF6NSvP+3b3FPVNzBrTbour2fxdaw2BoIr0qy7
 TMwi4TxoqSXfgddy4Z/hQrwQmJ+I4u3M9fw+JGuW/oOQPLfs94B1UZiXi6AGe7Ia7Vfv
 7+UwEfQ3WHuAb6Lc0nIV4lyNfFKSc9W+ws46d9iRyNyKu7PdggzdQm4W9eDE7oRErhgW
 hBTA==
X-Gm-Message-State: AOJu0YwgdO3em0/jB4oCsgaSWlLjsDxIzV1L6shm6BU3h66TI/0fWm8G
 q42NbpeChg4b8euVj3T1upjTR6aFr0Z6gAvfI1PTSQ==
X-Google-Smtp-Source: AGHT+IEZ9G7PexzwZP7PI8+trPHslc+pcGsJg+kHoNUhdbXPVSz8VIA7zd/bxBFSMiNE80lrHXAVbQ==
X-Received: by 2002:a05:6512:2244:b0:50b:bd7a:abbc with SMTP id
 i4-20020a056512224400b0050bbd7aabbcmr5035953lfu.66.1701278799951; 
 Wed, 29 Nov 2023 09:26:39 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-95-244-100-54.retail.telecomitalia.it. [95.244.100.54])
 by smtp.gmail.com with ESMTPSA id
 dv19-20020a170906b81300b009a9fbeb15f2sm8104620ejb.62.2023.11.29.09.26.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Nov 2023 09:26:39 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 29 Nov 2023 18:26:07 +0100
Message-ID: <20231129172615.1683565-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129172615.1683565-1-dario.binacchi@amarulasolutions.com>
References: <20231129172615.1683565-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1701278800; x=1701883600;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dc+pYYBT+157aUpsh4EzXATMY/zKSp6u2yxAIqC+0ts=;
 b=SW4E8OB4oU7iypMM2DWvDd95FVMK0Mp9BwM4yud9UhrVh07sV7NFc3zwl8ns8Au1pk
 xNouvlut6R0PDsCLiBT4WQwxyrzXNdanP9FynGuUnHQ4vtVFAhH8hCo6XdZtoI42FShd
 PwCenlv2goGLgfqZ2uQxDbnZ7EU2SpgaZbnFw=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=SW4E8OB4
Subject: [Buildroot] [PATCH 03/11] package/python-jsonschema: add host
 variant
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
Cc: michael@amarulasolutions.com, Asaf Kahlon <asafka7@gmail.com>,
 Xuanhao Shi <X15000177@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Recent version of U-Boot use binman to provide a mechanism for building
images, from simple SPL + U-Boot combinations, to more complex
arrangements with many parts. This package is required by binman.

Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/Config.in.host                         | 1 +
 package/python-jsonschema/Config.in.host       | 6 ++++++
 package/python-jsonschema/python-jsonschema.mk | 6 ++++++
 3 files changed, 13 insertions(+)
 create mode 100644 package/python-jsonschema/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index c80842c33a2f..5d2121de02a4 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -85,6 +85,7 @@ menu "Host utilities"
 	source "package/python-cython/Config.in.host"
 	source "package/python-greenlet/Config.in.host"
 	source "package/python-iniparse/Config.in.host"
+	source "package/python-jsonschema/Config.in.host"
 	source "package/python-kflash/Config.in.host"
 	source "package/python-lxml/Config.in.host"
 	source "package/python-pyyaml/Config.in.host"
diff --git a/package/python-jsonschema/Config.in.host b/package/python-jsonschema/Config.in.host
new file mode 100644
index 000000000000..fd275a41b200
--- /dev/null
+++ b/package/python-jsonschema/Config.in.host
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HOST_PYTHON_JSONSCHEMA
+	bool "host python-jsonschema"
+	help
+	  The host implementation of JSON Schema validation for Python.
+
+	  https://github.com/python-jsonschema/jsonschema
diff --git a/package/python-jsonschema/python-jsonschema.mk b/package/python-jsonschema/python-jsonschema.mk
index dee87e8f9d9b..6f2206f3a03c 100644
--- a/package/python-jsonschema/python-jsonschema.mk
+++ b/package/python-jsonschema/python-jsonschema.mk
@@ -15,4 +15,10 @@ PYTHON_JSONSCHEMA_DEPENDENCIES = \
 	host-python-hatch-fancy-pypi-readme \
 	host-python-hatch-vcs
 
+HOST_PYTHON_JSONSCHEMA_DEPENDENCIES = \
+	host-python-hatchling \
+	host-python-hatch-fancy-pypi-readme \
+	host-python-hatch-vcs
+
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
