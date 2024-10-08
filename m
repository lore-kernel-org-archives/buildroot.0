Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B527CEFC56
	for <buildroot@archiver.kernel.org>; Tue,  8 Oct 2024 20:26:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09C8C60770;
	Tue,  8 Oct 2024 20:26:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xivOR6U-hv4P; Tue,  8 Oct 2024 20:26:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1912760776
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1912760776;
	Tue,  8 Oct 2024 20:26:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7017C1BF31C
 for <buildroot@lists.busybox.net>; Tue,  8 Oct 2024 20:26:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C55A404C9
 for <buildroot@lists.busybox.net>; Tue,  8 Oct 2024 20:26:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xScyEsHJHCLc for <buildroot@lists.busybox.net>;
 Tue,  8 Oct 2024 20:26:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F021740499
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F021740499
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F021740499
 for <buildroot@buildroot.org>; Tue,  8 Oct 2024 20:26:17 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-37d2ddb61c8so1052001f8f.2
 for <buildroot@buildroot.org>; Tue, 08 Oct 2024 13:26:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728419176; x=1729023976;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CvR5kKAHNqzjqVH8amCVR9qTM34pm5/acV38Wi9IovQ=;
 b=AlX2/zxq1LDhcSPXBaVSGxo2+KypqbXfNesVR5YBJn6n9Xzxt67t6dYlMZdXNp0gIR
 /KdHxjDefLPhVtGfd6JKzbdWyfreF/Z3dZmer6BjyCfyXVbTYdPqpUuDVU5xoT+1vEOU
 P/P2IY4HP3mdCQnRTjXisFM4nMZQWOGqh10O3YbyOHb6nrKRK23o9WX2EpbYtMuKckYa
 CvM+AuO0dOlvkSvKZ++YtAHXOwxXo5vGXFpyeVVtr5B7gAtrLsALPZYgH2RLifOGjdu+
 NbuTTvG7CiKI/0xQgg2XDT1GQQpPdmgxr3GiA0ez7vgkfmEPbA1shZoVCYrZkbrGhbWq
 6GMA==
X-Gm-Message-State: AOJu0YwOSs7rTiB8am/YyKCoHfYCO0Dsq2TA0+USWAser7YEl8J8wKgw
 M13ltvLtqwakFvKH+HJDyroQ0BmBmTau0mt4uUMYyDfHePQWyv70U9K7EyAIxUazl3/twMIO3Ff
 Ev8M=
X-Google-Smtp-Source: AGHT+IENOpWKAhpd5DinOmkjBhkkZqz/YplOVGgfgw6/M5S+bQj1jA6lofXLS8ozpH42Rum6mTH93g==
X-Received: by 2002:a5d:5189:0:b0:37d:2e65:f9f3 with SMTP id
 ffacd0b85a97d-37d3aa3de6fmr75592f8f.15.1728419175685; 
 Tue, 08 Oct 2024 13:26:15 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.41.106])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d1695eee7sm8793948f8f.82.2024.10.08.13.26.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2024 13:26:15 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  8 Oct 2024 22:26:08 +0200
Message-ID: <20241008202609.3832478-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1728419176; x=1729023976;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CvR5kKAHNqzjqVH8amCVR9qTM34pm5/acV38Wi9IovQ=;
 b=SjRPOMqDx0bGFpogx80yP09GmSIPu1LVSiyLkdGaLb6PudfNzVWqMI3SWBd4qV5LgJ
 PiSasMwNPgirqIK8gDoDs9mNKxw/nTy+84nxYOc+WdvtC52hA4aU6MXco9bDuZzI0vUg
 1Bs0ZsZLOUSFAwlmd5NZrMW836bYduRxWyL7w=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=SjRPOMqD
Subject: [Buildroot] [PATCH 1/2] package/acpica: switch to github
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
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As reported in [1] the traditional acpica.org website releases might get
delayed due to website publication process, and indeed, on GitHub, the
latest released version is 20240927, while in [2] the 20240827 version
appears. Furthermore, in [2], explicit reference is made to the GitHub
URL for direct access to the public ACPICA git repository.

[1] https://github.com/acpica/acpica/releases
[2] https://www.intel.com/content/www/us/en/developer/topic-technology/open/acpica/download.html

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/acpica/acpica.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/acpica/acpica.mk b/package/acpica/acpica.mk
index a3d682257d62..5b1dfbbba2e7 100644
--- a/package/acpica/acpica.mk
+++ b/package/acpica/acpica.mk
@@ -6,7 +6,7 @@
 
 ACPICA_VERSION = 20240321
 ACPICA_SOURCE = acpica-unix-$(ACPICA_VERSION).tar.gz
-ACPICA_SITE = https://downloadmirror.intel.com/819451
+ACPICA_SITE = https://github.com/acpica/acpica/files/14718333
 ACPICA_LICENSE = BSD-3-Clause or GPL-2.0
 ACPICA_LICENSE_FILES = source/include/acpi.h
 ACPICA_DEPENDENCIES = host-bison host-flex
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
