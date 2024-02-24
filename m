Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED2DDC54E41
	for <buildroot@archiver.kernel.org>; Sat, 24 Feb 2024 20:57:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B5CDC405A1;
	Sat, 24 Feb 2024 20:57:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dl8H8-0RoPaQ; Sat, 24 Feb 2024 20:57:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2ABB40603
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C2ABB40603;
	Sat, 24 Feb 2024 20:57:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6729F1BF276
 for <buildroot@lists.busybox.net>; Sat, 24 Feb 2024 20:57:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5597040611
 for <buildroot@lists.busybox.net>; Sat, 24 Feb 2024 20:57:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5ni5JgCm1CCj for <buildroot@lists.busybox.net>;
 Sat, 24 Feb 2024 20:57:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 94EE740522
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94EE740522
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 94EE740522
 for <buildroot@buildroot.org>; Sat, 24 Feb 2024 20:57:38 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-512f59e51d8so346821e87.2
 for <buildroot@buildroot.org>; Sat, 24 Feb 2024 12:57:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708808256; x=1709413056;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6GAmi/O0DEAilIwmHqE7GxRSrTaugNHqHhinoRUgGlQ=;
 b=HDexHuCytshrwSJHkPeKDxwrF+XTqH4arcO7acvfs75vYjUGUMr6QAyijlGW+LtY0P
 AbzjHhWwG3kxakmx+aw7CQgSxMXx10fB40AMuBUbzJ928DBG1FbjcWg+Ze9FLoSVg1Hc
 qVifwS3G20l3OKTVsn2Kvw/B2WyD35OoYdj1Iup+fmKJ0UI6G06j4VSPMiKDuCjv67yO
 ber6R+sbTNONo3eZlOjgGEBRL8TzwMGHabr3/yO44+ztVdxu7V8uJqy6RTOHWtbQVJFU
 UeZxP2E15QjYiG1Byd9lmGe9CjayGVqNEj+EMcgRIQxSmflWu43X3njDUgZCOJKo8e8D
 zJkw==
X-Gm-Message-State: AOJu0Yz5RPTfMojxLHA/K5YFgottu29FgDjwpckf0srCEWYeviua7JKW
 1X86+oYGvkz05itou6iSOVFGknmPVp9h99+O2Pq5WPfnb5xy6Zt/WB553KJ0F574NsO7VxiVmv+
 W6yg=
X-Google-Smtp-Source: AGHT+IEflRuDIrBtNVPkrOG4bI2rBDE/MT7cbKvnECXJR/LxKgMGmXTsj/gmP32zyKj3wdsCU9ihVg==
X-Received: by 2002:ac2:5e9b:0:b0:512:db76:4e16 with SMTP id
 b27-20020ac25e9b000000b00512db764e16mr1809692lfq.4.1708808255908; 
 Sat, 24 Feb 2024 12:57:35 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-5-96-195.retail.telecomitalia.it. [87.5.96.195])
 by smtp.gmail.com with ESMTPSA id
 tk6-20020a170907c28600b00a4306ac4c77sm425506ejc.197.2024.02.24.12.57.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Feb 2024 12:57:35 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 24 Feb 2024 21:56:44 +0100
Message-ID: <20240224205654.1546744-8-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240224205654.1546744-1-dario.binacchi@amarulasolutions.com>
References: <20240224205654.1546744-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1708808256; x=1709413056;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6GAmi/O0DEAilIwmHqE7GxRSrTaugNHqHhinoRUgGlQ=;
 b=HQtNX4mCaNa1aQ4wjHVZwriP435MqHYaIK3k/+c9V5khD/K3WDGNuYXpLW08h73ECZ
 K5OpTARpQMydiJG60H6vvakfDF+WkVAgZ8oQ0iYrurKDjGPuvPMJ7Yc9fDBCjG5KrE63
 17hq1nEF15fvEKA6o6esoah59wjyBDS3ViMqE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=HQtNX4mC
Subject: [Buildroot] [PATCH v6 07/16] package/python-rpds-py: add host
 variant
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
arrangements with many parts. This package is required by binman

Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

no changes since v3

Changes in v3:
- Drop Config.in.host

 package/python-rpds-py/python-rpds-py.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-rpds-py/python-rpds-py.mk b/package/python-rpds-py/python-rpds-py.mk
index 80670f2e4fde..cee2ff290a4e 100644
--- a/package/python-rpds-py/python-rpds-py.mk
+++ b/package/python-rpds-py/python-rpds-py.mk
@@ -12,3 +12,4 @@ PYTHON_RPDS_PY_LICENSE = MIT
 PYTHON_RPDS_PY_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
