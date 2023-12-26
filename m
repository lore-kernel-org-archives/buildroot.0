Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84DD8C46CD4
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 11:27:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15AB5408A9;
	Tue, 26 Dec 2023 11:27:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15AB5408A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n5Y_AaXsbmYZ; Tue, 26 Dec 2023 11:27:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5534840895;
	Tue, 26 Dec 2023 11:27:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5534840895
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 009901BF309
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 11:27:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DAB3A60A5C
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 11:27:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DAB3A60A5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c9atUpsbTJ2f for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 11:27:16 +0000 (UTC)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7961F6002E
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 11:27:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7961F6002E
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40d5adef341so2649005e9.3
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 03:27:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703590034; x=1704194834;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r6o/gClmyWhQQjv/SuXUipFjWMZDHXB3dGLfQ31n42c=;
 b=qb1aYSbFoNYUyqrAqgb7EP6cOt/vTIwpRRHjzWWmCa3K9MiYQ3odjXf57qlAsqOiO4
 kYFmAUgKK3bAWxguOW+HKF4cgt47EBXt9Ov7BGGbxSIeEwISe3vJhgp/327OuuoGDXup
 u687PyxIJoM5GAU44V7sUqJ2EcdJ/5BQivFRnTONoGyrRUKeqxGn9XGRBw56e1kvdrzI
 zzR9Qi0dUrdDOg/fhjAIZ5RWfoSdoDOCXFk9Kk4w4uew0iDxqOhKKJMrNKBP/NxpmW+t
 1qUta42EJ80byPrl+NChDcMqA8+O5cwXneccOPqhYjZRVbVxSmDnlC6bEe1Gqj62dBJi
 e9NQ==
X-Gm-Message-State: AOJu0YyqlaW2apC5LSrjz1AiDf/Bmh78rTVJphXWZqJwFDsG/28Kr72I
 t0tEQepUBzJYgv/J1Lri0w2KgcPEMI4=
X-Google-Smtp-Source: AGHT+IH2Dy2KvYWQlypqo3HAfxLQEulqu52tZZmCbawEKJP9M/woXEtHaIk430eDnoB5Cxe3SRnZzQ==
X-Received: by 2002:a05:600c:2a4a:b0:40d:3c5b:1b58 with SMTP id
 x10-20020a05600c2a4a00b0040d3c5b1b58mr1924220wme.258.1703590033494; 
 Tue, 26 Dec 2023 03:27:13 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 hg12-20020a05600c538c00b0040c41846923sm27737333wmb.26.2023.12.26.03.27.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Dec 2023 03:27:13 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Dec 2023 12:27:11 +0100
Message-ID: <20231226112711.12319-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703590034; x=1704194834; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=r6o/gClmyWhQQjv/SuXUipFjWMZDHXB3dGLfQ31n42c=;
 b=dLEi5SHhWYChUXTjusJj4L6K1S4mzqB9UUyKdINCHWbWn5uCeMxFNUe0wXdVMExsaz
 5XQBzErGo/BmvuxcnTTcAxJTP070z0slD157Q/JcXuZwU0fe2yXORM+C2DJ9c3x34ajC
 aKLGrcSc6tCn97ILJOjBX4In1od212+zYrHwYuDbxgqK6tSi5tImIooMnw3CrTmRxTQd
 qJYQtG9uDxGY7cszvN7vVTxoDrbdscUzMw8y01q5YAwlJch82DEWyRSqN+Vr5F5iYWS2
 fE2N8S0CTqJtTly0or0SeghC+wx7frJ+Fkx7pFgTeTZg4xRqL11fwVZibjdEIo7zla7I
 qjCw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dLEi5SHh
Subject: [Buildroot] [PATCH 1/1] package/python-uvicorn: add CPE variables
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

cpe:2.3:a:encode:uvicorn is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/detail/D3AA1B54-4363-4E52-90AB-01DC2080D950

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-uvicorn/python-uvicorn.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-uvicorn/python-uvicorn.mk b/package/python-uvicorn/python-uvicorn.mk
index 887e4ac390..04e6dd66a7 100644
--- a/package/python-uvicorn/python-uvicorn.mk
+++ b/package/python-uvicorn/python-uvicorn.mk
@@ -10,6 +10,8 @@ PYTHON_UVICORN_SITE = https://files.pythonhosted.org/packages/e5/84/d43ce8fe6b31
 PYTHON_UVICORN_SETUP_TYPE = pep517
 PYTHON_UVICORN_LICENSE = BSD-3-Clause
 PYTHON_UVICORN_LICENSE_FILES = LICENSE.md
+PYTHON_UVICORN_CPE_ID_VENDOR = encode
+PYTHON_UVICORN_CPE_ID_PRODUCT = uvicorn
 PYTHON_UVICORN_DEPENDENCIES = host-python-hatchling
 
 $(eval $(python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
