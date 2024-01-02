Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13467C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 13:26:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C610408B1;
	Tue,  2 Jan 2024 13:26:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C610408B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vtTQgoQe6Kh7; Tue,  2 Jan 2024 13:26:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A19C040649;
	Tue,  2 Jan 2024 13:26:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A19C040649
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BBC6C1BF314
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 13:26:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 953BA40908
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 13:26:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 953BA40908
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gp-NV0EF-iom for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 13:26:23 +0000 (UTC)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 84A96404F5
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 13:26:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84A96404F5
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3368b9bbeb4so8806804f8f.2
 for <buildroot@buildroot.org>; Tue, 02 Jan 2024 05:26:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704201981; x=1704806781;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=niWv84JyUC0hzkWNj6C/ti/Ayh4OcHQ5nKnOXopU38k=;
 b=r10XDmwmjnCgvmKe1aMVZvkN+RgcywQk8usFQ7l3shWSfm36fPLPdQvK8rCjPsYnyD
 6CFSyexLu9YFMj9QC+0V4wElsOmdN2c6UP/PRlnE60lP0Q/jUYaHNdwCnb0kQ1vqfsza
 O7ilxnZNDMfYDVOFU2/KWYvPSqD7JREoX/MgBTDnw07uuAzu44Ghe0rVohn4JJiG1ex7
 kup98CgtpyK6PjfdanrnqpV9v9EA9YhoPKWyUh6UCrUYlH2RluAfFgdYNoHZj3Pt9elb
 fYgMt2r2wzpBBU6p6gdi+YChYw6YXodsnuPNYgx+9ribhxsr2kbgVlvV3sQ0jvEnyMJJ
 cszQ==
X-Gm-Message-State: AOJu0Yx7T1IwqX5xyQl1hYCFLB97CI7L1I2/uxm9wdZJ/p6e3I7OT0Q3
 Uq/CbS4VsuusuQ8v/ifgBzUFO4KKGB0=
X-Google-Smtp-Source: AGHT+IE0vR0aURYLOBzQB8F0qA0gqkzH/CC0G5ccX8+mu6SQV/Nmt5duntM7fr8QnMd3y+0V/T6ZRg==
X-Received: by 2002:adf:f241:0:b0:336:f372:2572 with SMTP id
 b1-20020adff241000000b00336f3722572mr2794037wrp.213.1704201980602; 
 Tue, 02 Jan 2024 05:26:20 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 z5-20020adff1c5000000b003366e974cacsm28453414wro.73.2024.01.02.05.26.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jan 2024 05:26:20 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  2 Jan 2024 14:26:18 +0100
Message-ID: <20240102132618.1255329-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704201981; x=1704806781; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=niWv84JyUC0hzkWNj6C/ti/Ayh4OcHQ5nKnOXopU38k=;
 b=UEOWXRaIBnOcymqp0lDwFKisNNCiaWbteKD9fC+QHfM36UtCmTxaaqZFZNDC7kWVRX
 P2FBaaznP1KN0p+9qpmUVj3kwp1VoQKjgoLZ1F0BDfmeE9yVxGrtgdDa0K0sshTajLmn
 bc+q7JYJTkLtMQLQYG8X+7mAtR1rrEXtPuyrSC/qqnF/ckA4okJ/aNqbSaNGF78JJmu5
 UE9hvY1fydCQ7iH/aLXmN0OF04EWcUuHCY51km+8Jj/zvyhlHwJjjLAQ+KVRMsDCo57S
 1UzHkMts0dHSNuLuFcFYRkr9RxOiDhO56XZBlVxC3Uuvso4ATLr3gnOy6reEL/v9vDaU
 esDQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UEOWXRaI
Subject: [Buildroot] [PATCH 1/1] package/python-pysensors: add lm-sensors
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit c8ff8d41c06f6b1cbc5cf8702a516411084ead16 forgot to add lm-sensors
dependency resulting in the following build failure:

  File "/home/buildroot/autobuild/instance-2/output-1/build/python-pysensors-0.0.4/setup.py", line 3, in <module>
    import sensors
  File "/home/buildroot/autobuild/instance-2/output-1/build/python-pysensors-0.0.4/sensors/__init__.py", line 20, in <module>
    raise ImportError("can't find the sensors library.")

Fixes:
 - http://autobuild.buildroot.org/results/acd8583fb635ea27811405a2478182ddcd5642f7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-pysensors/python-pysensors.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-pysensors/python-pysensors.mk b/package/python-pysensors/python-pysensors.mk
index b38c47f0c8..6999ee3fa3 100644
--- a/package/python-pysensors/python-pysensors.mk
+++ b/package/python-pysensors/python-pysensors.mk
@@ -9,5 +9,6 @@ PYTHON_PYSENSORS_SOURCE = PySensors-$(PYTHON_PYSENSORS_VERSION).tar.gz
 PYTHON_PYSENSORS_SITE = https://files.pythonhosted.org/packages/76/31/d3383a192f31ce1d79f27ec3d047cca23dd82a1bf0939e774386aba37cf5
 PYTHON_PYSENSORS_SETUP_TYPE = setuptools
 PYTHON_PYSENSORS_LICENSE = LGPL-2.1
+PYTHON_PYSENSORS_DEPENDENCIES = lm-sensors
 
 $(eval $(python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
