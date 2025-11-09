Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68BA2CCFA1A
	for <buildroot@archiver.kernel.org>; Sun,  9 Nov 2025 16:02:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3682A80E51;
	Sun,  9 Nov 2025 16:02:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g4yKkVbRXXL6; Sun,  9 Nov 2025 16:02:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58F56811CD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58F56811CD;
	Sun,  9 Nov 2025 16:02:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D27C1CD
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 16:02:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5EF25607B3
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 16:02:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yfmLVPw9nTdV for <buildroot@buildroot.org>;
 Sun,  9 Nov 2025 16:02:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 49520605C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49520605C6
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 49520605C6
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 16:02:10 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b72bf7e703fso402904566b.2
 for <buildroot@buildroot.org>; Sun, 09 Nov 2025 08:02:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762704128; x=1763308928;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sXavHMQeDWPNKUrO0/z4UWitTTO1CVND0Vphrla+MrM=;
 b=pbvQCw2TFARlsxV6BiVq2MnuJAgstX154ujXTUqq8x4rdfY1Tj9vsDbRYTenPJHOnN
 zsg0C/WZ++yzfqLdu8gSMoz2mmsoREtFcwoMU0o5T480tP9svfIwkKLE6Hpm+e5fMPoK
 qiuv2znKITr6oUsyUzT3bifip6x4nODzxJIKAit/plpCqekBEDo3cIut+NYD4FPd2BRZ
 ZxFgY0Nmz2aOs5FoAdURWx0m1QxERQWyU7i6jONgkTTr5LHZYmi5VLBJKfj//+jGTpnl
 ayZYoLVwXkuXD6g5ROzEYBj5EyGNafjS/JMbIebyFiwmFv3vq54MHLMP+Q8t6r+UbZ+Y
 TYFA==
X-Gm-Message-State: AOJu0Yw452JdM8ssVWC2sGkv3YF0D4FMkXPREH+gSA9CtXf4sKdvsCDy
 mayliz+r0mSqDB7yi+p1ssQv6b5kPccEiCIXBEzLPDu9/8ngrm1jnSg5IIVxw8c6jDu8b3NxbQ3
 Q//Yy
X-Gm-Gg: ASbGncu8WHM4NXM8IiGoPhfbaZ3HdJBOorkVzKp6ZEi5i6scElprTc0fzTrZ8DZfXPV
 7NRirn0oQREDZcWJGowvOKuC3nFlva+fXP1jD7vf/1EGqq2cprMZkvSqA6SJx89S/UhJob1LFFJ
 EVoqivR3s4i2H5rmIdIcJuBSF1Z6Pi2KZ1iQvec7j1NPKEHXNbjOch2CLdGLR1jhBhcZmfF5mZQ
 tyPQfdqW/HmbTROXTu0ZZeUpn34Htt+0n4lr7l4Qgzz/UPRwbjMltv+18dPM0CN16Ot52gqzjE5
 4CQJtMkn6WYwcNhA+jDCEQfaesZL7AFqRxaM9yme7wHqtYrxuGmqsWs3X5Q4WPF2URMT8zXZgSD
 68J/sBCJowPOnGxc43myzvAtaR4GGo9isCNkqqjRr33hBVUCqfAypZpJ/GOjKQfUcfAg0vdKT2h
 P7ig/P7LtX9rKWbmxGV4q5rS6aXfrPH0WuzmDkI5u5wIof1ph/SyFsehiyrDAbzkxH8wBhYkePh
 cSijYgOauUhR+4hdVSCvemsXkyGfLZqAVgi5V0JxAkyqfEY3w==
X-Google-Smtp-Source: AGHT+IFn2fOn2Ajch5EltqQZwpv9a4sEF1EU9Z8ZObFeHSuOSRRHU6g5I1PI2WVA3f3nCpcewngarw==
X-Received: by 2002:a17:906:eece:b0:b72:5fac:d05a with SMTP id
 a640c23a62f3a-b72e04e3de2mr508499666b.37.1762704128070; 
 Sun, 09 Nov 2025 08:02:08 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-62-211-171-160.retail.telecomitalia.it. [62.211.171.160])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bf97d43bsm866256366b.45.2025.11.09.08.02.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Nov 2025 08:02:07 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sun,  9 Nov 2025 17:02:05 +0100
Message-ID: <20251109160205.612498-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1762704128; x=1763308928;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sXavHMQeDWPNKUrO0/z4UWitTTO1CVND0Vphrla+MrM=;
 b=P608tSBHphljijvtn36FQw9Yzv8SZQO8rZky5s2nHXsXY25snSK734mJ9/meqWdWKA
 BP1N5HxXby60QG+HMdrco4Bj5YZk02BgRvA+1ZhCHAmzQ5L1BfhwkUARKNtvpTdKXvlK
 OeokDP1iMkjJq6RLwOOQso6PcXOOoyOtpxJLA=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=P608tSBH
Subject: [Buildroot] [PATCH 1/1] package/darkhttpd: bump to version 1.17
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

The license hash file changed because It was added copyright notice
taken directly from darkhttpd.c.

Release notes:
https://github.com/emikulic/darkhttpd/releases/tag/v1.17

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/darkhttpd/darkhttpd.hash | 4 ++--
 package/darkhttpd/darkhttpd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/darkhttpd/darkhttpd.hash b/package/darkhttpd/darkhttpd.hash
index 84a787eebaeb..4e90ae722e1f 100644
--- a/package/darkhttpd/darkhttpd.hash
+++ b/package/darkhttpd/darkhttpd.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  ea48cedafbf43186f4a8d1afc99b33b671adee99519658446022e6f63bd9eda9  darkhttpd-1.15.tar.gz
-sha256  1ecf63e8f84fd60ac7215e04195b9a61dcb47176ea65df26547582027f6c1dee  COPYING
+sha256  4fee9927e2d8bb0a302f0dd62f9ff1e075748fa9f5162c9481a7a58b41462b56  darkhttpd-1.17.tar.gz
+sha256  b1e109687717a71d7f65355b0ec9f61aa02263c3cf66e23f7b33e6f9abdbce5f  COPYING
diff --git a/package/darkhttpd/darkhttpd.mk b/package/darkhttpd/darkhttpd.mk
index 956ef4042cfb..ca8495f5c404 100644
--- a/package/darkhttpd/darkhttpd.mk
+++ b/package/darkhttpd/darkhttpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DARKHTTPD_VERSION = 1.15
+DARKHTTPD_VERSION = 1.17
 DARKHTTPD_SITE = $(call github,emikulic,darkhttpd,v$(DARKHTTPD_VERSION))
 DARKHTTPD_LICENSE = ISC
 DARKHTTPD_LICENSE_FILES = COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
