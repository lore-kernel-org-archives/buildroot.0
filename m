Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A2D9D10BF5
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 11:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2D0640643;
	Sat, 26 Oct 2024 11:01:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2AAiYy5tYY7n; Sat, 26 Oct 2024 11:01:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA94640768
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA94640768;
	Sat, 26 Oct 2024 11:01:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BA14C5C52
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 11:01:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9ADBB6061F
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 11:01:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eQRHRDBH1CCk for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 11:01:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E385860608
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E385860608
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E385860608
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 11:01:06 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43161c0068bso27253925e9.1
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 04:01:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729940465; x=1730545265;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MQkk87gD6zLFwaQaO+n7dXrGHiqYZcAe9ioCA6H7t5Y=;
 b=fg/xwezr5l3b4CM+MFtdJEf89RSJlcaM7zn+xaBPNxcrVLMY9w8EzLs6cd5+rnFYVW
 2ObLd8eiYQizwXoKOnTxdBtir108X9OanM3KlyLkNMGQaesV7bYDSDkW/gHvFPijr37L
 r3Pw+Dgf7m1pxmw3jky5KDHKocn1BiIWUxJG+IoQTD45szYrgl+wQ+8aTdjirmjdCVHf
 XoZlBOMv0lvUkuxZt6xXf6F4kMfFfLZvhd0NGVjsvGLhfbW5fd6An191mY66mvYEvOM0
 dND6xFlkfFUOoQUEyPdwThv5iFtIju+Quzt3ojVvXcWmPSraucTlvjCUUfxhJJUc+UKG
 epjA==
X-Gm-Message-State: AOJu0YxdOGE0T9RmXTjMkDOVNqwMGi+BjZIRVDsk74k0uFSNWFKQnVQl
 fFtcNq7e/gb6Q9BQAwRmwjnq6NNDkk+m+ulPWdlRloVUYVJeK64CxbzgzoKNWL9BcWlhueA7t/f
 S
X-Google-Smtp-Source: AGHT+IGahoQc4vkCoyeUMNL9Azq6ANJdSoI0ftzGmBRrOjAG2PMvAWWCw5S1f3NagXY7NbhF2Zzzwg==
X-Received: by 2002:a05:600c:5118:b0:431:3a6d:b84a with SMTP id
 5b1f17b1804b1-4319ac77f17mr15492865e9.4.1729940464810; 
 Sat, 26 Oct 2024 04:01:04 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43193573cf8sm44846235e9.7.2024.10.26.04.01.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Oct 2024 04:01:04 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Sat, 26 Oct 2024 13:00:57 +0200
Message-ID: <20241026110059.3204413-3-romain.naour@smile.fr>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20241026110059.3204413-1-romain.naour@smile.fr>
References: <20241026110059.3204413-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1729940465; x=1730545265; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MQkk87gD6zLFwaQaO+n7dXrGHiqYZcAe9ioCA6H7t5Y=;
 b=NDk/AsOsipdToCi+ERUcDnPJMpCbcUdwCgIk6evnm5N//3z0C0yTrrJFHYdCSw3GZU
 GlDT2Ipz5pu0HKQDR/Nv44yAvXC3lt3D0788u+Kz4S6J9W0koVjSZoNdSDYUF3zvul8/
 8+MmHC4n+zsp4gCjsozreCgl/qy9xkRwoPqZ8=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=NDk/AsOs
Subject: [Buildroot] [PATCH v3 3/5] package/qemu: remove leftover
 QEMU_IGNORE_CVES from Qemu 8.1
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Theses CVE are no longer listed by pkg-stats:

  https://nvd.nist.gov/vuln/detail/CVE-2023-4135
  https://nvd.nist.gov/vuln/detail/CVE-2023-3354
  https://nvd.nist.gov/vuln/detail/CVE-2023-3180

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/qemu/qemu.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 16cff13d18..a2d164d189 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -17,12 +17,6 @@ QEMU_LICENSE_FILES = COPYING COPYING.LIB
 #       individual source files.
 QEMU_CPE_ID_VENDOR = qemu
 
-# Need to ignore the following CVEs because the CPE database does
-# not have an entry for the 8.1.1 version yet.
-QEMU_IGNORE_CVES += CVE-2023-4135
-QEMU_IGNORE_CVES += CVE-2023-3354
-QEMU_IGNORE_CVES += CVE-2023-3180
-
 #-------------------------------------------------------------
 
 # The build system is now partly based on Meson.
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
