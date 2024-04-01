Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1097CD1288
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 23:40:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 723304073B;
	Mon,  1 Apr 2024 23:40:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MUDgS9c_tAtN; Mon,  1 Apr 2024 23:40:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59D0F40750
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59D0F40750;
	Mon,  1 Apr 2024 23:40:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3DAA11BF2F0
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 23:40:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 36B9A40750
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 23:40:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CbHkIF__nRte for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 23:40:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5F8C94073B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F8C94073B
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5F8C94073B
 for <buildroot@buildroot.org>; Mon,  1 Apr 2024 23:40:17 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-7cc77c19a19so213842139f.2
 for <buildroot@buildroot.org>; Mon, 01 Apr 2024 16:40:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712014816; x=1712619616;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vxasYMFMZLKVYopn1ZQVLkFAB9IAtj0z4zT/5G7t0GE=;
 b=ZaXRI4WaAjpycyj2HH2mu1Ha+Q/HEb8CoK8UgdRpqdMc+fAkLw4lkCG1H0FMOVCaqJ
 6ZCvA8k4Aas3wRwji4S2ulE3ZEzdOk81vS1mR2uztJel/EuV9pSPtncmeNP3jB6OQByV
 3W4gB94tmfxfmaV2qYLE0AvW1MZ7Hcmy1DoZ+Nfti9QKFKyZuuvKE1WQ6mmKS+zcmTVz
 59LIehVfvi82wOWskudxRRHAaBzXnfV2NZ6RCTjReypDmY8WF+Yq3AfDvwUaOs2u4hI6
 P6XiQ03ZvErEEToPzcVx+w5efQrQ6RHl2YgWaP9/lLk/ife+bldhJAEQDN3wta70BA5w
 2jtg==
X-Gm-Message-State: AOJu0YzQ+NV0tn2rKoOl7gMFDGYdM8gSPbB+IbX45MSlFyiG+p74bV2p
 XzR+gBIzsuodmeI0z4N2zD7uA/1PAJwnN9hsN1ATDRYG3R5eBfjJd5TW9lFR3krvJg==
X-Google-Smtp-Source: AGHT+IFu9Q1yjE0EX3RenuSGXcMNSLcSG/deSMbW33KRuCbSTSSmni6Q+VVS21IFeR2OQBq8PZ+W2w==
X-Received: by 2002:a05:6602:2bed:b0:7d0:d281:77f9 with SMTP id
 d13-20020a0566022bed00b007d0d28177f9mr2887574ioy.16.1712014816197; 
 Mon, 01 Apr 2024 16:40:16 -0700 (PDT)
Received: from james-x399.localdomain (71-218-245-145.hlrn.qwest.net.
 [71.218.245.145]) by smtp.gmail.com with ESMTPSA id
 em6-20020a0566384da600b0047c08df15basm2836859jab.173.2024.04.01.16.40.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Apr 2024 16:40:15 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  1 Apr 2024 17:40:12 -0600
Message-Id: <20240401234013.3570820-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712014816; x=1712619616; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vxasYMFMZLKVYopn1ZQVLkFAB9IAtj0z4zT/5G7t0GE=;
 b=HK7LK95sHZuh4zFZC/aRyCuU4iL/TXvGidnhd0unfN3Q7KTPI2D4FoSooExynT09/Z
 gOweAXP5LayDq0IU3xhIHZ3sLq2Mlmlu+VaS1Hw3IU1gjwy/5Wsmn8y9TvkFpb6Dfr9v
 N27gR4+mUtqvwa6DrK3jtRUHheAAJaEz07FSPacdAUejSdLKxOdd4YUQ++Gg5g4p/PO1
 v6kMfrP47kH+WNSdFKswWwiwbXeI7OCFaFCxlq7y2EoK4U4zqG/nuzjDNNN95cARl9a2
 TWHPNncKP65WoSXN0NmOKlQWRuit1lIt7kHekKLpDXaAxVihn5kpnUCr0jpPmlPJixEr
 xlhw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=HK7LK95s
Subject: [Buildroot] [PATCH 1/2] package/libxcrypt: support host package
 build
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
Cc: Sen Hastings <sen@hastings.org>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is needed by host-systemd.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/libxcrypt/libxcrypt.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libxcrypt/libxcrypt.mk b/package/libxcrypt/libxcrypt.mk
index 9ad030fbd2..e24bc2e847 100644
--- a/package/libxcrypt/libxcrypt.mk
+++ b/package/libxcrypt/libxcrypt.mk
@@ -18,3 +18,4 @@ LIBXCRYPT_CONF_OPTS = --disable-werror
 LIBXCRYPT_CONF_OPTS += --disable-obsolete_api
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
