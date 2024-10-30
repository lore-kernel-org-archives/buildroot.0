Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31A27D5CCB3
	for <buildroot@archiver.kernel.org>; Wed, 30 Oct 2024 15:11:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C16EC40564;
	Wed, 30 Oct 2024 15:11:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L4fvb07g5Oiw; Wed, 30 Oct 2024 15:11:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CCD7405A1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CCD7405A1;
	Wed, 30 Oct 2024 15:11:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 25569494E
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 15:11:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 11C7F60687
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 15:11:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PuXpvFoflCAQ for <buildroot@buildroot.org>;
 Wed, 30 Oct 2024 15:11:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3E0F0605AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E0F0605AD
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3E0F0605AD
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 15:11:33 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-20c767a9c50so62911475ad.1
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 08:11:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730301092; x=1730905892;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PXMIha0reATw9y+almrjiHWG/wiiHcNTbBr3y0o7/mk=;
 b=BLEv+Kb+8/pVkQ+hWPbgrys9GwYd5mH+QlHKKXrmdXhXiThexAIesf3GCtiv7rG7po
 txbjyfMPtD1YVg+NOw68J2rpViGz7tXMR1qS0ys4ljUDvFjzQQD620YAZ6adtNZfHnvY
 W+03cPCok4P2cb2Qhzz0TRBK0M5fVSe3wpoOUk3jSHc5JljNGFEJXIlBuV7uvcaM127m
 58Yjimnp6tEwYaCl7TZ5pls/MmgvTnns0oD7lF6L4dSznfy8JilNPoAEYvIwiilnfLN2
 oeESkhI/p2SQ2l1+xUi3je2rke28r3TE4BFHmkRffYMP+85fL7dwsTQoQX5weLSnyIrz
 GPdw==
X-Gm-Message-State: AOJu0Yw5FxNrRFKFKYN9WtK2qmKcaKA3WGahhP4msdAgzswtFw+lI3Le
 6MHajTZpUd+GZjDJmRonj0+O8Be8Xh1uqhgtkTEWqlY4REk1j0lUBKKDY44r
X-Google-Smtp-Source: AGHT+IHlCM5mtBCkPXaQc421RetLmtFThbLgwNQQR5OW6n388jZKTcGDMzRzXQezg7sY77snrZ+IHg==
X-Received: by 2002:a17:902:d2d0:b0:202:cbf:2d6f with SMTP id
 d9443c01a7336-210c6cd8978mr233622125ad.57.1730301091982; 
 Wed, 30 Oct 2024 08:11:31 -0700 (PDT)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-210bbf6d311sm81489025ad.81.2024.10.30.08.11.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2024 08:11:31 -0700 (PDT)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 30 Oct 2024 23:11:24 +0800
Message-ID: <20241030151126.2525261-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241030145910.2523465-1-fancp2007@gmail.com>
References: <20241030145910.2523465-1-fancp2007@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730301092; x=1730905892; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PXMIha0reATw9y+almrjiHWG/wiiHcNTbBr3y0o7/mk=;
 b=YNVV1Ui6b41SeZYUZLfQfoAwPUxEmmNjOIfjExDjKw+LeItr945WHlZpx7xaGwn0nu
 tfyhcNCD86cUzn1J32aAIJDUsXgIFrfQ7RxoEzQoJ+3lGiDWKuTU4J1M//W51z6+SFK4
 VqFMfTTKLI8EQT4961YYJQ7dC552kSEkFG87beOxirN4zV/PLUjdilvgtHEfYzfgBtct
 lZvMf+/3AM4UNjH73hvxSB+VvXDDZ6ACkw7rMXnUR1uoKzIlV90ARYQql4eiockV3Pdf
 lkLzs0L23+zwA41o/2gtkHZCyEiirK7/TIQnsD3fiBox/VBq+2FcrwkLJxuhEtvX8jUa
 PcuA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YNVV1Ui6
Subject: [Buildroot] [PATCH v2] package/python-psycopg2: add config
 dependencies from postgresql
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Scott Fan <fancp2007@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Also update site url to https://github.com/psycopg/psycopg2/

Signed-off-by: Scott Fan <fancp2007@gmail.com>

---
Changes v1 -> v2:
  - update site url in the Config.in file
---
 package/python-psycopg2/Config.in | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/python-psycopg2/Config.in b/package/python-psycopg2/Config.in
index 4aa86c7690..6b07b0c06c 100644
--- a/package/python-psycopg2/Config.in
+++ b/package/python-psycopg2/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_PYTHON_PSYCOPG2
 	bool "python-psycopg2"
+	depends on BR2_USE_MMU # postgresql
 	depends on BR2_USE_WCHAR # postgresql
+	depends on !BR2_STATIC_LIBS # postgresql
 	depends on !BR2_OPTIMIZE_FAST # postgresql
 	select BR2_PACKAGE_POSTGRESQL
 	help
@@ -21,10 +23,11 @@ config BR2_PACKAGE_PYTHON_PSYCOPG2
 	  customized thanks to a flexible objects adaptation system.
 	  Psycopg 2 is both Unicode and Python 3 friendly.
 
-	  http://initd.org/psycopg/
+	  https://github.com/psycopg/psycopg2/
 
-comment "python-psycopg2 needs a toolchain w/ wchar"
-	depends on !BR2_USE_WCHAR
+comment "python-psycopg2 needs a toolchain w/ dynamic library, wchar"
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
 
 comment "python-psycopg2 can't be built with Optimize for fast"
 	depends on BR2_OPTIMIZE_FAST
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
