Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 366C7C48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 21:06:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF22C60B79;
	Tue,  6 Feb 2024 21:06:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EEy-mqRCcWUM; Tue,  6 Feb 2024 21:06:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EAE9760FD6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAE9760FD6;
	Tue,  6 Feb 2024 21:06:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4F7A41BF400
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 21:06:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4854E405D1
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 21:06:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zAh9PzGKCsUh for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 21:06:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CC1E0401B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC1E0401B1
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CC1E0401B1
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 21:06:46 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40fc549ab9bso42105685e9.0
 for <buildroot@buildroot.org>; Tue, 06 Feb 2024 13:06:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707253604; x=1707858404;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=G1hVoKc1rQ0HwuFhoVbTKQrSZYkeA9nyx6cwZZHMlAI=;
 b=b5O59so0YT+ntKWeY89CpyyhOiRpwwm7vpvMMdnP7mP9X1TM3btuCGNLL4h5CrWgZG
 hN00UgrHnL4YagOfxv9wB7NSvJxJNIDMu4zdrkG2BP1cmXV1sVr7RghdGjFiZEMZqwCN
 bavWDA1GKOhJeOEicOmnCmfDmMDKrS6oqVjmd+xqPhaq6VL4tr/72QtwnmeXclwiP2o9
 P2CGdesmOxWleEvHNsalqkIL3u41GMfTG9fwlJwgLXMUhIlNMoThmTe5ksARq8z5enSv
 C7YHJMF9S2xyixuISmgpzKiKOmULE7LIQKw55EdCLTdaXcbgQR7rzHKIVywftnfS6cno
 g0Pw==
X-Gm-Message-State: AOJu0YzJ6YeQpWLFwex5pH+SKGwxHVrxgrM58d41Dl+KHx48DcU4KRI/
 gr+AuV8aGbWNSOyA763GFgmgr7rUSesJ72GSp8Fn8ouFMESMnybcjkdZ/lij7Io=
X-Google-Smtp-Source: AGHT+IHvVJJJQ2uqeBvT4tQFEeZJIr7mbFpsl4tBt+h0OaHUKiRa9rbXYT4DMZAZ+x4Ij7UGY/5bAg==
X-Received: by 2002:a05:600c:3551:b0:40f:dd7c:9e1d with SMTP id
 i17-20020a05600c355100b0040fdd7c9e1dmr3273037wmq.19.1707253603708; 
 Tue, 06 Feb 2024 13:06:43 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCWe0FLFoA1FvRfrRogM4cat5QmiCAmN7cn3LZDWdK6WjZGTFDiv3XlLRz3LnFl0ZceXwhhUM/JXESQaMvO8xR3APyUWP19vjBWFvUP9rhLa28cJdxOcQUk5jmDF7WaZA5TBHzwdG+JBHacG11uWkDX8lY/k7R6JHjVpHJ6r3hRkJjhD4vcFD9sDZkmxkmrKZslMUBXalWO8X0sGQg==
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 g15-20020a05600c310f00b0040fd0f7d267sm3084619wmo.44.2024.02.06.13.06.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 13:06:43 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  6 Feb 2024 22:06:41 +0100
Message-ID: <20240206210641.878279-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707253604; x=1707858404; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=G1hVoKc1rQ0HwuFhoVbTKQrSZYkeA9nyx6cwZZHMlAI=;
 b=ImvM8n7F7jkp/uSDZdrLhiL/1q9Hk8DyWX3InaBOO+w+fpDzED0HA27B7Ylye/2Ye1
 e+wJ6FUUCbFr+iV9y6vd2xnomCqvhpWNhajESsyy+KQtt0e99+45lnFtjdKuXiYwJRKd
 r8Q+Dkn7Eu1Bf8UwJVagbX/HTPu/opOU3Z31Id0lFDltREmreV/gzzmwyPabqWQ6nEfr
 91yEZCF+VxP8Kcs6hyJkbD/V3AAK01OAvmi47HFLA82hAykyAbFXMaQZemCtOBfXwKyS
 neObKEM0kPfaymZ9Sznq9YkaKRQ7hqlVDieUCo16+PUtGqisIVQFbraJdrd818U2RzjD
 wvxw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ImvM8n7F
Subject: [Buildroot] [PATCH 1/1] package/python-esptool: add CPE variables
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:espressif:esptool is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/detail/AC284820-5731-4100-91BC-F50FE078848E

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-esptool/python-esptool.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-esptool/python-esptool.mk b/package/python-esptool/python-esptool.mk
index f5aaface74..648748237d 100644
--- a/package/python-esptool/python-esptool.mk
+++ b/package/python-esptool/python-esptool.mk
@@ -10,5 +10,7 @@ PYTHON_ESPTOOL_SITE = https://files.pythonhosted.org/packages/1b/8b/f0d1e75879de
 PYTHON_ESPTOOL_SETUP_TYPE = setuptools
 PYTHON_ESPTOOL_LICENSE = GPL-2.0+
 PYTHON_ESPTOOL_LICENSE_FILES = LICENSE
+PYTHON_ESPTOOL_CPE_ID_VENDOR = espressif
+PYTHON_ESPTOOL_CPE_ID_PRODUCT = esptool
 
 $(eval $(python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
