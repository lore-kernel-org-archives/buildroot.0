Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C201CAC592
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 20:28:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E435661202;
	Tue, 16 Sep 2025 20:28:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TOVQSUNQmigi; Tue, 16 Sep 2025 20:28:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D92C611D7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D92C611D7;
	Tue, 16 Sep 2025 20:28:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 07EE112D
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:27:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2DD041C7F
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:27:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TE-istZplCFm for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 20:27:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D5B4B418D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5B4B418D4
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D5B4B418D4
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:27:48 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-45dde353b47so36002655e9.3
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 13:27:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758054466; x=1758659266;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X4s30r5HrzS2T6WqpUhGtL5t9u0BfUwtiSSXW2IrJEg=;
 b=w9zTVY5BlC51Mo5ZSc9pvdWVKtWUws1CLpJwOx77t6OAdl8V5j7COaU6ASJ2j8F/R5
 4+KREKWdjXQ5y6IUYsLTSMzwfjEZVVuI7clXBBQeIGOy12RKz/d9917AAUpWd0HljgJ2
 WHBUwCVgmuUhB+7f7pxfWtK6JQAZjNvzKQKt2hpwGv02jjU8+GI/IG5ThLEgOpTaz2Jc
 zA7hWvN4VQ90eDqDVs6PcZch5UeIkurH1vNZjPhKEzTyaUHO45P+wCtIcD3vp7YXHx3v
 9VVYqYvdEMuN+pMp2d2QpSUgELBcUlIOENASEGjnbWECPa3iyIVjyn+X6qoLJdL8oHdG
 b9/g==
X-Gm-Message-State: AOJu0Yw9jlEbYsSLa4uC8b3Kb/roA1h4ZmnDv7ulNtvRBkdGe6MoBpeV
 QslmGUAMZjMBIDa/RAxw11WZY0Jb70RSb7Yb4+X4kDUfW7bdHy+9F09KFXUPBEJ0ZcsvN2h1Aqa
 9LPe90B0=
X-Gm-Gg: ASbGncsm4by3OizNfvxTVJOD3gYgXq0tAkbvHxK2jkIK64NR9pJP5P9eDlZ5JKKEbsq
 bNktEPMOL4y60SHNYB4eG3NqS2jE0bKTgiR98Cd8xGj5G+Z3pmju7gaZM/nXH0xLZIoDbsNTB92
 XuDOBgwP24Rr2SPziPjPoijlLrZ766aWjCbhwYMW6QkjDTVMv+BDWoNJkLHP4bK/XZyXOaa7NMe
 aW6VNIdX/U23U2wrxEt/RYHdltTxoTEKxQr0aZjSJaB9ACW43QwqLx22NU/dxPsOTxs/djxvUAK
 lPOoU7brXNX0wQcWZm5ep//gVtDuBwNVbQwsgofEs+mMgpagxiFLDWZAy4I37+gDGbZAhQbtDig
 QfqWzbrNRbYsYfco=
X-Google-Smtp-Source: AGHT+IEE+NSn6cveI6N74owPzPdFrIPGCX20q64vRxI7kwOkKsDrsgiQ5PS/A6ds/7RaFsrY8DQ7Wg==
X-Received: by 2002:a05:600c:5755:b0:45b:71ac:b45a with SMTP id
 5b1f17b1804b1-45f211d5128mr131039675e9.11.1758054466499; 
 Tue, 16 Sep 2025 13:27:46 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3ec22b16adesm5497723f8f.13.2025.09.16.13.27.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 13:27:46 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 16 Sep 2025 22:27:35 +0200
Message-ID: <20250916202735.1121872-12-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250916202735.1121872-1-thomas.perale@mind.be>
References: <20250916202735.1121872-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758054466; x=1758659266; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X4s30r5HrzS2T6WqpUhGtL5t9u0BfUwtiSSXW2IrJEg=;
 b=Qo3jd+RIPANsCdxQTMt501oPAI8ep8AFHzUxs3Su9e19+6PiPcPT5PO+mBGtKAHzef
 t4wSqdYHtEF4bsPW2DhiCE9Ds3JOU3l9D08OfC0l0asTJ1a/Wuxm7uQDigbaWnWJ33sR
 oFhuRy1UUuBKii02N34No/IDRwOghqbfE2DUUFHCmr0p7aczcKewZiPX7GAHzbI3kwFb
 dQJMcZSt87SNNIHEx9KInveQbjgIy3IU69jads5lh6FAMkJsPpTKx3Lo4eF+KwwjZ9TA
 CTP7OTzduRSYZx+NjP+HqgcuPB0jCLCj14QDJD5C8I/rCC3SOdz9kNRSVoy7BUL1fLrf
 1VPg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Qo3jd+RI
Subject: [Buildroot] [PATCH 12/12] package/zziplib: fix deprecated CPE
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: Michael Fischer <mf@go-sys.de>,
 Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Codina?= <herve.codina@bootlin.com>,
 Anthony Viallard <viallard@syscom-instruments.com>,
 James Hilliard <james.hilliard1@gmail.com>, Petr Vorel <petr.vorel@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The CPE 'zziplib_project:zziplib' is deprecated in favour of
'gdraheim:zziplib'.

See https://nvd.nist.gov/products/cpe/detail/FB4124F9-087E-454D-B5D4-642FF08B23A8

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/zziplib/zziplib.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zziplib/zziplib.mk b/package/zziplib/zziplib.mk
index 0ef53436d2..ba902b84fd 100644
--- a/package/zziplib/zziplib.mk
+++ b/package/zziplib/zziplib.mk
@@ -8,7 +8,7 @@ ZZIPLIB_VERSION = 0.13.74
 ZZIPLIB_SITE = $(call github,gdraheim,zziplib,v$(ZZIPLIB_VERSION))
 ZZIPLIB_LICENSE = LGPL-2.0+ or MPL-1.1
 ZZIPLIB_LICENSE_FILES = docs/COPYING.LIB docs/COPYING.MPL docs/copying.htm.md
-ZZIPLIB_CPE_ID_VALID = YES
+ZZIPLIB_CPE_ID_VENDOR = gdraheim
 ZZIPLIB_INSTALL_STAGING = YES
 ZZIPLIB_CONF_OPTS += \
 	-DZZIPDOCS=OFF \
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
