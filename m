Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29542D68BE7
	for <buildroot@archiver.kernel.org>; Sat, 16 Nov 2024 18:29:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CABE141C3A;
	Sat, 16 Nov 2024 18:29:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ALsrTu2cZeyh; Sat, 16 Nov 2024 18:29:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADF4D41E98
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADF4D41E98;
	Sat, 16 Nov 2024 18:29:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E26DBB14
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 18:29:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C148C608CD
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 18:29:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YdhaAXd9Bsz3 for <buildroot@buildroot.org>;
 Sat, 16 Nov 2024 18:29:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A62026070E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A62026070E
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A62026070E
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 18:29:28 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a9ed7d8c86cso355762966b.2
 for <buildroot@buildroot.org>; Sat, 16 Nov 2024 10:29:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731781766; x=1732386566;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=exlLiCxS+sC0jtc7FWW1gFz+Cw1ZPIEUgpGMiC1vCNg=;
 b=KYgQVQDEWxdSqV734UmisWEvZL/zvtNeQvV6k3bJWLsgVJWmutbooNLMUy4iGep8ln
 Z9Kokwr9t9ckbMEOnFod5T+Y6HEp5iFBvsOoEQaC2IkeOwUk8t24aGm1vNZtvRDDrwPd
 QtaNDWAmZdIBE9q8+x/5FQBIbQNHd5O/vlVKQRXo6lgNgC1GQ1AhRuMD//aRK746YJ0X
 LS9wY4C6HckfWwNSE+NOt54ygmTCQAEmftQ5MAXZilUxOfe793pm7XwzKlpGoGzkiAm7
 V394kxHD3AtUbPuwZgUM+N7ifjpwob2a5EQj9clZzX7CeJSvotVSNQymR9ekg2X2Te8I
 9DCg==
X-Gm-Message-State: AOJu0Yz5Np27fHGsQmOWMHaHoTtlZikKt/X5gU1QRKM51drp4mKecWMp
 V3b5T/ZyAWKdwzHElXWsdR/54GOvBP2Jce+tLm9y+vFsoaMIcjURva8FsfcEEhZBQroeTrmCKlQ
 +
X-Google-Smtp-Source: AGHT+IFburvQL0ietlKVSHIw8AIMJncMkaBU2ZBYUbLlHb6UlPChG6zSKCLw3+Uw2eRsB9FkK4DwtA==
X-Received: by 2002:a17:907:930e:b0:a9e:b150:abea with SMTP id
 a640c23a62f3a-aa48354cdaemr650252966b.52.1731781766505; 
 Sat, 16 Nov 2024 10:29:26 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-54-94-193.retail.telecomitalia.it. [82.54.94.193])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20df568easm332405366b.73.2024.11.16.10.29.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Nov 2024 10:29:25 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Sat, 16 Nov 2024 19:29:19 +0100
Message-ID: <20241116182919.4169370-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241116182919.4169370-1-dario.binacchi@amarulasolutions.com>
References: <20241116182919.4169370-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1731781766; x=1732386566;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=exlLiCxS+sC0jtc7FWW1gFz+Cw1ZPIEUgpGMiC1vCNg=;
 b=j0EyykAHIkhgTy+N34BSITFKqwj89gHsrYCwKL61E0/QxRa+jiDOY0dHT+wzXOyXV1
 hQKE1/p8l/TCWT2UzGWyV7WbU58hsDx/rMGTVvK/qgZRdC/bvNcwhR4i+1kgK3QyUQfO
 mHZALn7zT018CZA6Et8ohzbTFs67caO6Tr0No=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=j0EyykAH
Subject: [Buildroot] [PATCH 2/2] package/armadillo: bump to version 14.0.3
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

Release notes:
https://arma.sourceforge.net/docs.html#changelog

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/armadillo/armadillo.hash | 2 +-
 package/armadillo/armadillo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/armadillo/armadillo.hash b/package/armadillo/armadillo.hash
index 4e8652192303..d94218d91d54 100644
--- a/package/armadillo/armadillo.hash
+++ b/package/armadillo/armadillo.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  248e2535fc092add6cb7dea94fc86ae1c463bda39e46fd82d2a7165c1c197dff  armadillo-14.0.2.tar.xz
+sha256  ebd6215eeb01ee412fed078c8a9f7f87d4e1f6187ebcdc1bc09f46095a4f4003  armadillo-14.0.3.tar.xz
 # License files, locally calculated
 sha256  3ddf9be5c28fe27dad143a5dc76eea25222ad1dd68934a047064e56ed2fa40c5  LICENSE.txt
diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
index 608f8fb229f2..e2d7c3968f2a 100644
--- a/package/armadillo/armadillo.mk
+++ b/package/armadillo/armadillo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ARMADILLO_VERSION = 14.0.2
+ARMADILLO_VERSION = 14.0.3
 ARMADILLO_SOURCE = armadillo-$(ARMADILLO_VERSION).tar.xz
 ARMADILLO_SITE = https://downloads.sourceforge.net/project/arma
 ARMADILLO_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
