Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ADEDC47258
	for <buildroot@archiver.kernel.org>; Sat, 20 Jan 2024 20:26:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A06960F26;
	Sat, 20 Jan 2024 20:26:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A06960F26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7J-wfi7V-EJb; Sat, 20 Jan 2024 20:26:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8B7F60F14;
	Sat, 20 Jan 2024 20:26:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8B7F60F14
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D45181BF31E
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 20:26:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB8D842180
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 20:26:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB8D842180
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id doEK44y1T3cF for <buildroot@lists.busybox.net>;
 Sat, 20 Jan 2024 20:26:22 +0000 (UTC)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B0DD842178
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 20:26:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0DD842178
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3392b15ca41so244390f8f.0
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 12:26:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705782379; x=1706387179;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O4/hcYVRXc/KAx8936VWbBX1pdXNrT/6d+z+Ghd7gks=;
 b=qhJdUSk6AkzOQkupf+Wcq33aciCI3hFnizfy/w/jpGtJXF9XqEiOsx5WbJI8Ollgj+
 k/Hcc7aDDaO7BKA1QciiyDtLfOjpc6DyUC9B1OoP/ZPxO01pUFjyMEdlgfwCZHDJq+3L
 kK7iSPebAAM74aJFfBl/xNqNgSM3vONDgv3iPCU+ZvLW2tZygQYsqnEf4HtEr4nAmm0V
 RLL3O/MSQ3qK7wl97CJb0LxQ2qAj20ug8/+aM0cBDqnSlzC4pVlv24IqoOGDn2NYmutL
 b1j90XH4iX0ECoXmFT29vB8bl3Td1JnHXw1esByxKHYIKnj0rCtjsUwtZ9DfaLLBSeGt
 oUDw==
X-Gm-Message-State: AOJu0Yzd4Go3pZP24u4LYb/PyYT8s/N/WRuiBAyfOjmN9dhVC9vRlFcd
 aXxz7ealBmqd7YPL7ME9PmrNdKuAiUZaAaPUJvbXHYLe+Bffrbp/AiCc19gM
X-Google-Smtp-Source: AGHT+IHicWV/NMd+WcFz1KiJcuq+Je2RB9AyUwkyGnQ7mUtUxmSbpfLZAoxPUFVrKSE0VA8gprSPOg==
X-Received: by 2002:a5d:6107:0:b0:337:d0a8:176f with SMTP id
 v7-20020a5d6107000000b00337d0a8176fmr912815wrt.63.1705782378538; 
 Sat, 20 Jan 2024 12:26:18 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 a17-20020a5d5091000000b003392d3dcf6dsm602788wrt.0.2024.01.20.12.26.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jan 2024 12:26:18 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 20 Jan 2024 21:26:16 +0100
Message-ID: <20240120202616.57017-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705782379; x=1706387179; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=O4/hcYVRXc/KAx8936VWbBX1pdXNrT/6d+z+Ghd7gks=;
 b=RBCW29HcNZzwbxSlGI+IqWLMN+F0p26PRgMfOm4laNUBneLoHNgfm0yLAmUhG/cQbD
 kDDnMe8O3uXC9CzLHWkeQ52hCOpjQyfubYNr21WCiHPQVZKrVIdISoYR1cPX2HSS3mZf
 wmyV0p+797wgh/IkntFf0l8dNYzOPEu75THRvaidHa/Fjpw41K9nn6IGC7j3Lha9QAN2
 L8FZm5BX5J2akSoL+lNhHc4YB3kQmSKvjRRAQ/1NYOW6SmxCCQKUctv3iFaGwiOuIBcY
 8lp1kC65CE0cffegCzLzKanu29Y8kvf4uwHGxpIBrl6sIhxfI4Ux5BH/xrRCiti2uk8b
 e86A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=RBCW29Hc
Subject: [Buildroot] [PATCH 1/1] package/python-pycryptodomex: add CPE
 variables
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:pycryptodome:pycryptodomex is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/detail/2A88F7B5-C414-4104-9B59-A6E28A1E119A

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-pycryptodomex/python-pycryptodomex.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-pycryptodomex/python-pycryptodomex.mk b/package/python-pycryptodomex/python-pycryptodomex.mk
index 0d9855c602..bfb6acf7ba 100644
--- a/package/python-pycryptodomex/python-pycryptodomex.mk
+++ b/package/python-pycryptodomex/python-pycryptodomex.mk
@@ -12,6 +12,8 @@ PYTHON_PYCRYPTODOMEX_LICENSE = \
 	BSD-2-Clause, \
 	Public Domain (pycrypto original code)
 PYTHON_PYCRYPTODOMEX_LICENSE_FILES = LICENSE.rst Doc/LEGAL/COPYRIGHT.pycrypto
+PYTHON_PYCRYPTODOMEX_CPE_ID_VENDOR = pycryptodome
+PYTHON_PYCRYPTODOMEX_CPE_ID_PRODUCT = pycryptodomex
 
 PYTHON_PYCRYPTODOMEX_ENV = CFLAGS="$(TARGET_CFLAGS) -std=c99"
 HOST_PYTHON_PYCRYPTODOMEX_ENV = CFLAGS="$(HOST_CFLAGS) -std=c99"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
