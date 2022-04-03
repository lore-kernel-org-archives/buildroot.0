Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05AEDC433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 22:21:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E15F408A5;
	Sun,  3 Apr 2022 22:21:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dVUF6vdO7Vrs; Sun,  3 Apr 2022 22:21:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A2C7F405DF;
	Sun,  3 Apr 2022 22:21:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 49A641BF350
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 22:20:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 45DEF4157C
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 22:20:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iERlxuPXK5c9 for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 22:20:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [IPv6:2607:f8b0:4864:20::f2d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 78BFF41507
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 22:20:31 +0000 (UTC)
Received: by mail-qv1-xf2d.google.com with SMTP id hu11so6198307qvb.7
 for <buildroot@buildroot.org>; Sun, 03 Apr 2022 15:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MXeo8sNhQDbRJF5hb0lotUkYdAKM9Bm6cuXuAkf/KGU=;
 b=opIIGXv0rpEnKlzv9f1hgndmBAOmPmdwJEoRKZ2+jOD0J8/22vvcrGmc/xUhWD3eQr
 Acfi+IjKyl9MMuqmRYi9nOco+s1kT2TozDzKqj7gQCXlFnmgVDZ0uBBDTH3zY4RxI069
 GRBx8qMi5RKcuaFIYYucIAFmcAoUZuw0CgLADLHjm4NzHsjDGCn+0/T5fECYuihq09iL
 6hrwB6GKB0wlvtO5uoHHm9ebzxmqNqDFmIbgwEPh22hb41y8KLbE3W6c87vUo1IwH0Kw
 RjOEmb7NfAvkkCPnuFaxL/F7yjJj5m908q+VbkL33eukJjVnQ9t0CV/4LWXL+YHwcA4x
 4AMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MXeo8sNhQDbRJF5hb0lotUkYdAKM9Bm6cuXuAkf/KGU=;
 b=SAciVwqRJhzBcIV0MC5j30H0t6ORW/ASUpa4Fa3dthriMez1dH1y69FEyjhDaQ/5ux
 J87dJ6mDs+YE4lVtLIJQVNG1KQdtsKIpBvXra+xO98qm7AAldeZQraCh7hS6fldxZSrx
 XHlTcK3ArIco43eIWafS8/SRFbHM7T+7M6obHV0+l1xTe60Ih+1QBF+BdP5wU5r6/onq
 yjmffrAsZ7jr8PXVuXI8V9bVsUoB/0uq3Y8WKwJ7MOylJlTsf9rRvEYwUuHATS+VjfLy
 YgkyJYoS3CqfvHtMxjWVKgYjQwJFw68n0/SyJVoc1AgverqeidUUs7POwfxghu/sKjc/
 OugA==
X-Gm-Message-State: AOAM531VRF4EnVP563AROEmffFzFpbA7ztIE6SwPaLmxbnOhAFmgw35N
 bW3lyr8SD8P1LKgAcZwJUxBFDtBHA9g=
X-Google-Smtp-Source: ABdhPJzW/VX6HdVcA+pPYNPaW5IvkueQ3D2dc1UTpVih2sHk6qvm2047yj/aS6gQBuDhZ2UPt8SRlw==
X-Received: by 2002:a05:6214:2585:b0:441:558d:d154 with SMTP id
 fq5-20020a056214258500b00441558dd154mr14997114qvb.99.1649024430265; 
 Sun, 03 Apr 2022 15:20:30 -0700 (PDT)
Received: from localhost.localdomain
 (cpef832e4b04a98-cm589630c62f8f.cpe.net.cable.rogers.com. [174.116.183.78])
 by smtp.gmail.com with ESMTPSA id
 d21-20020a05622a101500b002e07151139fsm7472717qte.17.2022.04.03.15.20.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Apr 2022 15:20:30 -0700 (PDT)
From: Emile Cormier <emile.cormier.jr@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Apr 2022 19:19:51 -0300
Message-Id: <20220403221953.1158787-4-emile.cormier.jr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220403221953.1158787-1-emile.cormier.jr@gmail.com>
References: <20220403221953.1158787-1-emile.cormier.jr@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 4/6] package/python-twised: added conch and
 serial support
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
Cc: Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Emile Cormier <emile.cormier.jr@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: ecorm <ecorm@users.noreply.github.com>

The conch subpackage is required by python-crossbar.
Added the serial subpackage while I was at it (not required by
Crossbar).
Signed-off-by: Emile Cormier <emile.cormier.jr@gmail.com>
---
 package/python-twisted/Config.in | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/python-twisted/Config.in b/package/python-twisted/Config.in
index 8596025e9c..c0acf35560 100644
--- a/package/python-twisted/Config.in
+++ b/package/python-twisted/Config.in
@@ -29,4 +29,16 @@ config BR2_PACKAGE_PYTHON_TWISTED_TLS
 	select BR2_PACKAGE_PYTHON_PYOPENSSL # runtime
 	select BR2_PACKAGE_PYTHON_SERVICE_IDENTITY # runtime
 
+config BR2_PACKAGE_PYTHON_TWISTED_CONCH
+	bool "Conch support"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography
+	select BR2_PACKAGE_PYTHON_APPDIRS # runtime
+	select BR2_PACKAGE_PYTHON_BCRYPT # runtime
+	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
+	select BR2_PACKAGE_PYTHON_PYASN1 # runtime
+
+config BR2_PACKAGE_PYTHON_TWISTED_SERIAL
+	bool "Serial support"
+	select BR2_PACKAGE_PYTHON_SERIAL # runtime
+
 endif
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
