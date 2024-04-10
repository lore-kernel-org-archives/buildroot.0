Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D500CD1284
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 22:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54BDF60EA9;
	Wed, 10 Apr 2024 22:18:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oqI5sm2Iy1_J; Wed, 10 Apr 2024 22:18:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 429AF600CC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 429AF600CC;
	Wed, 10 Apr 2024 22:18:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DEA5B1BF40A
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 22:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CBCF04058D
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 22:18:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F_-6IUbBT7d4 for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 22:18:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A6F774059D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6F774059D
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A6F774059D
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 22:18:10 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-417d029bee7so1976055e9.1
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 15:18:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712787488; x=1713392288;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WOKvoHw6OptGtL43GHUNO60x7QhDuzzCGDTmgzVMSUQ=;
 b=tSMrsCIAavctHfHBIIXQIQ7sRBtKuu60sJ4fa8TCX60uJXvbQsy+Uyz+TdSSompZ6o
 nZrVpdNhJkYt9CLaRn7F33hD5uwhcRHBBP+qaWKFttjAU9zj2ePdrU2Z0wTf9TCkQqU2
 vQ5tXinyRGvV8zs/DadAx744NzDqgpOl5DbRV6mjrwAMYAfMaePsJmlUWUW8kK1hj+Gs
 MSsA2R/zviwQeF/AfyA9DKdrfheF8fQNVTeCHQHLDaSDWSTUbzx3UTRL/F3ycZMsBKXr
 PB1ekog+elTKMewQnPksKSm13xAorR0KltcH5m4uMMHlRvV1I7n+Tk5EiMrjN25CS76b
 fCwA==
X-Gm-Message-State: AOJu0YxB+3Rdh+z9w2EqIEn+5nzAWNgLJU7/Tb/QgqGOJ33Wz1hKNCof
 nE7anYhKifa9ZpV+hKaYmXuWUyVd9idtk3L2yofsP9QnMHUx0m+s+VpN6lhZN7/kG/qXEH6jh/0
 i
X-Google-Smtp-Source: AGHT+IH6SQTTwBrJRWeRbBH/eDnAJR1QuEDvMd0nUqGtMV5GbZbOOd9h5DNbOBaPEAlPjs8LIjA8QA==
X-Received: by 2002:a05:600c:1994:b0:417:451f:4f4e with SMTP id
 t20-20020a05600c199400b00417451f4f4emr2019541wmq.0.1712787488378; 
 Wed, 10 Apr 2024 15:18:08 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 n21-20020a05600c3b9500b00416928e239csm354025wms.35.2024.04.10.15.18.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Apr 2024 15:18:08 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Thu, 11 Apr 2024 00:18:03 +0200
Message-ID: <20240410221806.89203-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1712787488; x=1713392288;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WOKvoHw6OptGtL43GHUNO60x7QhDuzzCGDTmgzVMSUQ=;
 b=D4z4V0HtCnMDGRECzQqaQG74W3wgeyOi6Q8luQ2D8dy9BttK8zrKfebyQOtHmlMQ3Z
 SXw+dD5gAJXgkWWf3vQeLQDNad5zAJepIYUSni/OeOkCMI3ynRABrMzmLK+kDdtRBbLx
 0eshZUztgSrt6gvmOmtUfCHzOrXRZEC5zm/TDMeY8ZURqRhOEt1rOntcHmLAOLxmepdp
 OAWSyrR26L9rlOCu2Bk8YjN52l1siFmyoCn69dBhKMdly37HXQ+5JZokZCFR5jhHwMYE
 ywHmFHvIQqWlv/lrCSMHjTU7nbjeMOKd0nmyGu31h1pG/RrHJSwThhNNpuWDwAZHamYw
 iBIw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=D4z4V0Ht
Subject: [Buildroot] [PATCH] package/python-pypng: add missing python3-zlib
 dependency
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
Cc: Romain Naour <romain.naour@smile.fr>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

png.py import zlib [1] so python3-zlib needs to be installed at
runtime.

[1] https://gitlab.com/drj11/pypng/-/blob/pypng-0.20220715.0/code/png.py?ref_type=tags#L185

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/6477656971 (TestPythonPy3Qrcode)

Cc: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/python-pypng/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-pypng/Config.in b/package/python-pypng/Config.in
index c1ed405615..952b46c2c5 100644
--- a/package/python-pypng/Config.in
+++ b/package/python-pypng/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_PYPNG
 	bool "python-pypng"
+	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
 	help
 	  Pure Python library for saving and loading PNG images.
 
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
