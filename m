Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCA07C54E49
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 13:37:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A549834F7;
	Fri,  1 Mar 2024 13:37:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e_tGLIc0Bu_K; Fri,  1 Mar 2024 13:37:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DB4B8350A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DB4B8350A;
	Fri,  1 Mar 2024 13:37:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BC28E1BF2C1
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 13:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9539F821C5
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 13:36:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g8rbddxuPoV3 for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 13:36:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 10A4E821CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10A4E821CC
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 10A4E821CC
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 13:36:37 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-56647babfe6so3297301a12.3
 for <buildroot@buildroot.org>; Fri, 01 Mar 2024 05:36:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709300196; x=1709904996;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z3Q/wuxFxK4SmABXHjNOnLoxUJ4jdyrHmdgqUlzC5c4=;
 b=VJlrSB6VCi9uii1h2uUSYwKUyicbMg+zpzJBt1E0EP0rLhmcUhAgc4nNPzqX9JkKsn
 yCNGiAV6269T5aWXDpsZyo7IzrH5tWM7HeW7Mpbofx+camPUT9q7IEnLTcXaKWmIyn8u
 W8WTAnrhLu8eSFk4IiqUF76slGDkNzXsjNX2fhgU1mW57xJR7+A6CKl4nzB+dIGaUAE4
 ufjXol/CZl4QWXHJOMsd185gPOWNU1CrBTTm00K5Neb1ZLv/mO7Ue4apiYf2wVuAXQ6g
 AkECbH8DK4uKntYJRaAo2I8MBEz078TSs0j3GyXNcebwpbBRXEdd/TwkcFVsQILGz9hr
 xNEA==
X-Gm-Message-State: AOJu0YwiKXl1bxLlB1c0ljCtYqd0fZRQnnnZlnYv3xPheScGYU3MzAam
 sqBhA7zFae/o2y1RkA/m1rBO2xPBzd0fEdyprV20iUIJJw/3LNc2uqGiNjwzsPbHBj3NBMu2GWG
 PVGY=
X-Google-Smtp-Source: AGHT+IGtSp5Xhjzi6Djov1ZLWAxE0rN4Ah4g9hxP11gsv76S1vUu8kKdNfSWtPlJ+YXR5jED7CR7GQ==
X-Received: by 2002:a05:6402:603:b0:565:7ce5:abd5 with SMTP id
 n3-20020a056402060300b005657ce5abd5mr1480860edv.18.1709300195801; 
 Fri, 01 Mar 2024 05:36:35 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:5260:58bc:42cc:9d46])
 by smtp.gmail.com with ESMTPSA id
 q28-20020a056402033c00b005659ea1caf0sm1566608edw.6.2024.03.01.05.36.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 05:36:35 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri,  1 Mar 2024 14:36:06 +0100
Message-ID: <20240301133620.3547430-10-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240301133620.3547430-1-dario.binacchi@amarulasolutions.com>
References: <20240301133620.3547430-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1709300196; x=1709904996;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z3Q/wuxFxK4SmABXHjNOnLoxUJ4jdyrHmdgqUlzC5c4=;
 b=BFbxg7LspB9X9cT0hVKU3/J0ZWkAQu26Rb8n5+1TnoyuQWERPYbmwuqp74+KDsg4nM
 2smvN7r2U6HrcTW4rnDVCRZeC+68ixfdV7F3+KJwoNBQgIl+8c8zXxIcXfNTJ2JYTHHh
 xuGzIKNSk5oo0ybru2D2BUqsYJzqQIdp9Plns=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=BFbxg7Ls
Subject: [Buildroot] [PATCH v8 09/23]
 package/python-jsonschema-specifications: add host variant
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@smile.fr>, Andreas Dannenberg <dannenberg@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Recent version of U-Boot use binman to provide a mechanism for building
images, from simple SPL + U-Boot combinations, to more complex
arrangements with many parts. This package is required by binman.

Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Co-developed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v6:
- Add runtime dependencies
- Add SOB and COB tags of Romain Naour

no changes since v3

Changes in v3:
- Drop Config.in.host

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../python-jsonschema-specifications.mk                | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/python-jsonschema-specifications/python-jsonschema-specifications.mk b/package/python-jsonschema-specifications/python-jsonschema-specifications.mk
index 40879898c9d4..653c839bb450 100644
--- a/package/python-jsonschema-specifications/python-jsonschema-specifications.mk
+++ b/package/python-jsonschema-specifications/python-jsonschema-specifications.mk
@@ -14,4 +14,14 @@ PYTHON_JSONSCHEMA_SPECIFICATIONS_DEPENDENCIES = \
 	host-python-hatchling \
 	host-python-hatch-vcs
 
+HOST_PYTHON_JSONSCHEMA_SPECIFICATIONS_DEPENDENCIES = \
+	host-python-hatchling \
+	host-python-hatch-vcs
+
+# This is a runtime dependency, but we don't have the concept of
+# runtime dependencies for host packages.
+HOST_PYTHON_JSONSCHEMA_SPECIFICATIONS_DEPENDENCIES += \
+	host-python-referencing
+
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
