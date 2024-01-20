Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D151FC47258
	for <buildroot@archiver.kernel.org>; Sat, 20 Jan 2024 20:34:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 635F460F25;
	Sat, 20 Jan 2024 20:34:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 635F460F25
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DDibQ2ZcgrSc; Sat, 20 Jan 2024 20:34:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1F7460F07;
	Sat, 20 Jan 2024 20:34:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1F7460F07
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C7D891BF31E
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 20:33:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A1C2A60F07
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 20:33:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1C2A60F07
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rEiffvftDDp1 for <buildroot@lists.busybox.net>;
 Sat, 20 Jan 2024 20:33:58 +0000 (UTC)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C267F60806
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 20:33:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C267F60806
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40e8801221cso18249645e9.1
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 12:33:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705782835; x=1706387635;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sUjb//QbQuuiSgD+ppBUbFV6I41dxJSSYGrBeoS8hgE=;
 b=drBeeKbdNYGYc0H87DdcRseZfkSEUyTsO39t/w3+6vQLI36vV0+oxTyfO/YQ5foE8n
 OGE6DIcTz9k6qtAGDNPqN3NTkrS1K7b6Lz7XkdKRYkPWQpiQYcGY7tPA+CtA/kvqmlFM
 8+e5Q95T31XqqYE1Vjp2uViIfkcrH4rnAKUe+xEo3Z/e8tVr5V2w3MkpiAdYyICFJty3
 RLxlPCGwksnVjhKME4uMlzZCy5LtmuZvvsNXAUw6CVkz9pTwc6Tazw6/5SmfyZzP8NKL
 q/RxxB345I8Rz1gldIm4mEEa4gWfhKz9hkugU79MxTBQ91J+Ed4tRLCr7KO4wlC7xGso
 WwbQ==
X-Gm-Message-State: AOJu0YyW0xhl++UMJ+fzyUGH4IX7LRu9Qq2vywj21EqVHz+JzG4Tj2EU
 Gl0+L9ZXfOSuL/9t6hd1ZWMrH13UV17jBHOusPpq4trejGi9A6oO5KSuwQVz
X-Google-Smtp-Source: AGHT+IGxu2wwR/68ngltEh2rUaSjBcVg8Cv1iyRmrsq4+B37tH35pNBBtlx85Q3GFXAQ/iXQLMO4zQ==
X-Received: by 2002:a05:600c:4583:b0:40e:5059:3e57 with SMTP id
 r3-20020a05600c458300b0040e50593e57mr1265919wmo.26.1705782834694; 
 Sat, 20 Jan 2024 12:33:54 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 p16-20020a05600c469000b0040e39cbf2a4sm37925682wmo.42.2024.01.20.12.33.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jan 2024 12:33:54 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 20 Jan 2024 21:33:51 +0100
Message-ID: <20240120203351.61397-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705782835; x=1706387635; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sUjb//QbQuuiSgD+ppBUbFV6I41dxJSSYGrBeoS8hgE=;
 b=M+QnGAI6R20108dUo+kzC1uWEUr+fQ70TkmmpIMRwHjvFSKBRUUJX9jL+4JUGuqRXa
 9vWZz/fpmK+z+HgaUqStXIyxx7z+bTPiSYgBQa65UIPUraamK/ulhP4sd3h2Smq27CwP
 2yXGjnonbOVGQX5+1W1Uuo+lBOss5NGbjaRBFiQyn7NA9SBMpM5ev56cItGCQNWYRXOJ
 e+11TmCVWvNjIgvDEWpxiHyKh+bSfSWSOWuuRz8C7dUjAnq3tAUcTn5lQO6NQJYcdksV
 KuxVOTs9w8IHfK4ymTBoMRsNsD6wcI511n0JeabNEF1gO30kbCanZ3hvDLDy0OUMg9+c
 3EHg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=M+QnGAI6
Subject: [Buildroot] [PATCH 1/1] package/python-oauthlib: add CPE variables
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:oauthlib_project:oauthlib is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/detail/204A2244-7F74-4AAE-BA8E-E9FE707EC833

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-oauthlib/python-oauthlib.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-oauthlib/python-oauthlib.mk b/package/python-oauthlib/python-oauthlib.mk
index 1e49487d6a..eb0ccbf46f 100644
--- a/package/python-oauthlib/python-oauthlib.mk
+++ b/package/python-oauthlib/python-oauthlib.mk
@@ -10,5 +10,7 @@ PYTHON_OAUTHLIB_SITE = https://files.pythonhosted.org/packages/6d/fa/fbf40010379
 PYTHON_OAUTHLIB_SETUP_TYPE = setuptools
 PYTHON_OAUTHLIB_LICENSE = BSD-3-Clause
 PYTHON_OAUTHLIB_LICENSE_FILES = LICENSE
+PYTHON_OAUTHLIB_CPE_ID_VENDOR = oauthlib_project
+PYTHON_OAUTHLIB_CPE_ID_PRODUCT = oauthlib
 
 $(eval $(python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
