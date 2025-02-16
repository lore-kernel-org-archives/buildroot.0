Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEF27C02198
	for <buildroot@archiver.kernel.org>; Sun, 16 Feb 2025 15:35:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2832B60A6A;
	Sun, 16 Feb 2025 15:35:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VcWfH7iofQfb; Sun, 16 Feb 2025 15:35:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B664660B4A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B664660B4A;
	Sun, 16 Feb 2025 15:35:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C03B0C8
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 15:35:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B077780EAB
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 15:35:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ptXYv2H-ZKW7 for <buildroot@buildroot.org>;
 Sun, 16 Feb 2025 15:35:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::92c; helo=mail-ua1-x92c.google.com;
 envelope-from=gilles.talis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C118A810F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C118A810F4
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com
 [IPv6:2607:f8b0:4864:20::92c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C118A810F4
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 15:35:03 +0000 (UTC)
Received: by mail-ua1-x92c.google.com with SMTP id
 a1e0cc1a2514c-868e8ce3f73so987578241.3
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 07:35:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739720102; x=1740324902;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YsqNk+KkVgxAikyjhbENddk0Th+SteMUMYCPAnVkLXo=;
 b=OS9jGx5kpfTTg6ESX17iYp2KIJ0BMdBPwJJ5cuRK/brJSU9YaI+nFnVz1c9sCwHEzf
 00xNmQnczlYcorsyEa4TCpqQ8334IT13AQGvyWSBcgBPEJVmVTQYgVw+UGDAOvFfTxxD
 zAxdqI3STLrkOllH7/P9meu6FXv9U9P3w2YaVHt0hysSaK7OWelkBEMjpePHkJPujCcq
 kbgcg44nF1zJGqyC8Mp9HkVxh8bixAQd8VhyraPiL07Bu17c6zUP41pRMw37f3IMuauj
 S5OhJeE1J6MeWCrr3FTvKQH4gAeApHtd+BzK0GIxjTHs7S0tEWuAeR8HEldP59oN51eR
 xEJA==
X-Gm-Message-State: AOJu0YwZMNPKthdhTm9VgtJ1AcLAL1/Q5DfEebN5B3aA6URjcTanL2kZ
 gXZ4fdXnIaTM7z7m3AheHRqPBPhQRG4hi9MqYrURrU1CY33V9jbuM5Tu2QHS
X-Gm-Gg: ASbGnctdPp1cqYHmei96zv+6sUaCFpBw17ZaO2btuXTg8bXxsYLuYXZqO6IYyEDAMz5
 NHgyMRBqOxfSFAF6rp6A0IVCkadX6nL6jBF+7UVNYReYg+vL9iym+RJZ2deiSq1aX6OYysxitoF
 8QhtM6hWk1xXL6sZLz+vJpbNSxBCNZHJsADeUO/HKGcq7z6wRqk94c3r6EsbaDwsdFu/m9mcK9m
 ItmULNlqusuU+88j7JQZXsBJBAZPq+9M7gd4fb7CUVzXiN1kSkU6eBQjmwx7UGBVSPf1aUxqN9I
 fx7Kp2SjNXF6SXbJLhcA0ny7S3zm5TpxOoeL
X-Google-Smtp-Source: AGHT+IFH/lC3ezjRfyJd8pil2GVI99hWUMe2NQBlTaem3RzzQiMVQk9tXzcypLN6rGpiTPpfVuX70g==
X-Received: by 2002:a05:6102:80a3:b0:4bb:c8e5:aa79 with SMTP id
 ada2fe7eead31-4bd3fc9f720mr3829026137.8.1739720102122; 
 Sun, 16 Feb 2025 07:35:02 -0800 (PST)
Received: from localhost.localdomain
 ([2605:59c0:148d:1710:69c6:af1e:5931:a271])
 by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-868e8548ae3sm1528875241.2.2025.02.16.07.34.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Feb 2025 07:35:00 -0800 (PST)
From: Gilles Talis <gilles.talis@gmail.com>
To: buildroot@buildroot.org
Cc: Gilles Talis <gilles.talis@gmail.com>
Date: Sun, 16 Feb 2025 11:34:36 -0400
Message-ID: <20250216153441.2706067-2-gilles.talis@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250216153441.2706067-1-gilles.talis@gmail.com>
References: <20250216153441.2706067-1-gilles.talis@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739720102; x=1740324902; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YsqNk+KkVgxAikyjhbENddk0Th+SteMUMYCPAnVkLXo=;
 b=J+rq56EcLPKdoq0AgwlZusC1JSoamGXBRyLhgDPDq5v02r4LcAW70gVl5OAJrl57vC
 56F5dnXOqgerJyXhQBqKcPQB93IGCa9GAG6uhtW6ZJnWhTWy1+mZzagYuFiTk5y2YuGZ
 wH2pXNP9KAdMTFik5z1Q1tz9iUYbg2DeN+sDvwZw15aJg8i+3H16Kp2k8RKeBn357lPH
 zewW5hLTGVsH4RQD71Me9om2WaYLeAnWlqkDz0uyFOllR3+eNgmFZ7VwKWI+fSuxEfFj
 re38bPMz5+Wr0m9xrirVJPtmOPoUIat8F1fTT97K1wQF6QhnRgHbJ1QJ+2K3/CkHsand
 V9xA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=J+rq56Ec
Subject: [Buildroot] [PATCH] leptonica: bump to version 1.85.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Change log:
http://www.leptonica.org/source/version-notes.html

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/leptonica/leptonica.hash | 2 +-
 package/leptonica/leptonica.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/leptonica/leptonica.hash b/package/leptonica/leptonica.hash
index 3416cfeb39..698342ae99 100644
--- a/package/leptonica/leptonica.hash
+++ b/package/leptonica/leptonica.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256  2b3e1254b1cca381e77c819b59ca99774ff43530209b9aeb511e1d46588a64f6  leptonica-1.84.1.tar.gz
+sha256  3745ae3bf271a6801a2292eead83ac926e3a9bc1bf622e9cd4dd0f3786e17205  leptonica-1.85.0.tar.gz
 sha256  87829abb5bbb00b55a107365da89e9a33f86c4250169e5a1e5588505be7d5806  leptonica-license.txt
diff --git a/package/leptonica/leptonica.mk b/package/leptonica/leptonica.mk
index 0e902c6488..58db93d34c 100644
--- a/package/leptonica/leptonica.mk
+++ b/package/leptonica/leptonica.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LEPTONICA_VERSION = 1.84.1
+LEPTONICA_VERSION = 1.85.0
 LEPTONICA_SITE = https://github.com/DanBloomberg/leptonica/releases/download/$(LEPTONICA_VERSION)
 LEPTONICA_LICENSE = BSD-2-Clause
 LEPTONICA_LICENSE_FILES = leptonica-license.txt
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
