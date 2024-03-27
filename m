Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C58C47DD9
	for <buildroot@archiver.kernel.org>; Wed, 27 Mar 2024 17:24:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75C108124A;
	Wed, 27 Mar 2024 17:24:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DCKGPmlyzvKW; Wed, 27 Mar 2024 17:24:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DA6C81272
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DA6C81272;
	Wed, 27 Mar 2024 17:24:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ED3811BF29D
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 17:23:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E68416069A
 for <buildroot@lists.busybox.net>; Wed, 27 Mar 2024 17:23:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y-LmEly0xHTx for <buildroot@lists.busybox.net>;
 Wed, 27 Mar 2024 17:23:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::133; helo=mail-lf1-x133.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5091C605C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5091C605C1
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5091C605C1
 for <buildroot@buildroot.org>; Wed, 27 Mar 2024 17:23:56 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-513d3746950so8730548e87.1
 for <buildroot@buildroot.org>; Wed, 27 Mar 2024 10:23:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711560234; x=1712165034;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A++sbe1WWlcg/XQIQf3DPpqAe3SFV40oSrvnwFtsaUQ=;
 b=RwO4xDomfdfaZSQ5x01b7L9D2hkJ/hGkQs0LnDMykA38VLiUlXWe0eGAI9pBX3C7LO
 1hjNctK8t9iryanDDIv/yjxSMluaqBHNu1t9GbEI8XKOsP3a2jOWUPUbiEKbILweumVL
 BIyZ3DyzcBfIEFtTrwAIOPL87L5JrLMfPBiuDkHeUf4pa+lyeh4FQpjBElbZbpuym7M7
 uByBFPsm/MHbKOKeMQwjSSlJvG6+JgHzBFXLnPSNoKyVT0fwBdVhjR90h1WKg2dyDA4P
 Pi6xwyGJxldCZCEnU6gwHG6PbbAtPpDIGLG7ZcvjEfoHY8O7Rm4kJNgUqBWNxlJOk3G8
 TSAg==
X-Gm-Message-State: AOJu0YxDtr/DoIJ59UV9iLu9AcyqGnmcRIPRu4j5Y1rv/VOjUBo2WLKT
 A5C5oXROlkIxHZvfej7mK1/+ZsHGEogqvoCe/tNZLSFmmLx9HGzo8mV0Ej6JNimnAiUClqNmVyJ
 n
X-Google-Smtp-Source: AGHT+IE10BtXH9vYZJ2EIdGUQXeJU54aSMuUMRIokOOyXhRfPqCgKjHqsqJH5SFUlkMC9WCVVGCh3Q==
X-Received: by 2002:ac2:4648:0:b0:513:e909:f234 with SMTP id
 s8-20020ac24648000000b00513e909f234mr60819lfo.57.1711560234487; 
 Wed, 27 Mar 2024 10:23:54 -0700 (PDT)
Received: from P-NTS-Evian.. ([2a04:cec0:1036:e822:923a:5222:7523:f9f7])
 by smtp.gmail.com with ESMTPSA id
 t13-20020a5d42cd000000b0033ec312cd8asm15428595wrr.33.2024.03.27.10.23.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Mar 2024 10:23:54 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed, 27 Mar 2024 18:23:51 +0100
Message-ID: <20240327172351.411598-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1711560234; x=1712165034;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=A++sbe1WWlcg/XQIQf3DPpqAe3SFV40oSrvnwFtsaUQ=;
 b=OEb2J6gOxuHkKnfYkC17rwn0bmoTDGjZ4RnUu/giQ6NxHjA1i19kItEnvqdyobebSG
 ZgduopH6xyvqkUiYk0OYwnGUJdbefBVrMNMJGYU8QK7k8zAAO10lvsHSKXC7MzMB1JF+
 z3hXEL0KJ5eu94+HGd2rdum24WVqNd6+TISOTtUt2QDlFzYvuJLeDKqgynQOHnfuqvu/
 rKZVaYy2rrNVPmYXZOb3mFwCochxdUtJe/7BpkQaAuYkMT9zQI/zywe8qbaFHoWkrYjh
 mzt4UXvcs29C4kDtWuNrjavChFG+8QTcGyFCB9JLDpHwd3rkpMzyigGNUjsYpVERyErw
 0FtQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=OEb2J6gO
Subject: [Buildroot] [PATCH] package/python-segno: add missing
 python3-{pyexpat, zlib} dependencies
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

The last version bump removed python-setuptools runtime dependency
but doing so also removed the python3-pyexpat and python3-zlib
runtime depdencies [1] that are actually direct runtime
dependencies.

[1] 081162580f99d1a68133f7f513bf2cd6d1b8b6b6

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/6477656982 (TestPythonPy3Segno)

Cc: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/python-segno/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-segno/Config.in b/package/python-segno/Config.in
index 7107e67443..e6080fd417 100644
--- a/package/python-segno/Config.in
+++ b/package/python-segno/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_PYTHON_SEGNO
 	bool "python-segno"
+	select BR2_PACKAGE_PYTHON3_PYEXPAT # runtime
+	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
 	help
 	  QR Code and Micro QR Code generator for Python.
 
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
