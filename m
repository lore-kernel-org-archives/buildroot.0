Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D22B7D6A249
	for <buildroot@archiver.kernel.org>; Thu, 14 Nov 2024 22:34:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48ECB408C4;
	Thu, 14 Nov 2024 22:34:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1bits6JC9ADf; Thu, 14 Nov 2024 22:34:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F5CA408C2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F5CA408C2;
	Thu, 14 Nov 2024 22:34:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C4B621ED5
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 22:34:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D576F408C1
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 22:34:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dsBf1xjXmoju for <buildroot@buildroot.org>;
 Thu, 14 Nov 2024 22:34:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8330F408C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8330F408C2
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8330F408C2
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 22:34:02 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4316cce103dso12740015e9.3
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 14:34:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731623640; x=1732228440;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zrHl5YtHas66SWt8/fL446fnyyLFUXqpuqvs/RNIwLQ=;
 b=Prk+5btRyU8eeyS/XcM3SV6pUrs7h4rJtGPcjp7jxsPR8XYFIH/x0Ae4fbmCO8Oqnp
 eQdlIZcxVmSYxlV4Km5wbLkilJkFHl/NVzcUmvKA7zyqviqwPx0dbwX+tNuoyNCwPcso
 1eomSHM9VU4uvTU5nwWplagaQMIKRQWYq+Pfkqu2yl7u7C+JhjuJiC0+1VHrH+mu2Ep8
 Pi7ctxcbIAQHR/ZstBkyA6ikPoakervKxlecvFX8tcGMDz+cioLqohQMxCcCNaQOjjLA
 L8JO2IkT9gXg8cqCtJI+ISWI3F33dFU2I5QzAqRwGf5CTPJ2mSetqKZR9fRxanBFcKq6
 4MBw==
X-Gm-Message-State: AOJu0YwaKzQyeGSzHJ+SQLGsF7w/oupo6uw6si2VK5GljqB2bSBfAj+T
 ZP/RJH4kzy8pDWD7HXV360UZkRaLnhybYUUcZ/oXA1Z1oUFVynns0Uq7LQ==
X-Google-Smtp-Source: AGHT+IGrHWSfW2kSO4rWXUFmdYkGDdJ23K0VQKwdwYEvkJByKv+oq75xoTrt3ManaLeBzkPL3j8r0g==
X-Received: by 2002:a05:600c:34d0:b0:431:6083:cd30 with SMTP id
 5b1f17b1804b1-432df7229f6mr3590885e9.6.1731623640314; 
 Thu, 14 Nov 2024 14:34:00 -0800 (PST)
Received: from x230.suse.cz (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432dab80a28sm34718095e9.24.2024.11.14.14.33.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2024 14:33:59 -0800 (PST)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 14 Nov 2024 23:33:56 +0100
Message-ID: <20241114223356.1629969-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731623640; x=1732228440; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zrHl5YtHas66SWt8/fL446fnyyLFUXqpuqvs/RNIwLQ=;
 b=KoPy4LMvlNPvkDyspEjlMszensDcVlaXvhGxWFFd+mzjEPK2iuEP6sUTI9nwevQ47T
 o56uX99YM8jvfsVhqQpPBqZ3oGsSBVrRnu55iLkxsBLbKiD+8ZOOhiXsi+EMSNJSfHsT
 zNeUKkiYYh7vRcepJ/6Y9rCLbhm0J28k23RMhVAeklDTHx+UO6UUrMhmljjGcL4JmE3w
 hjCLZ6cWcg4MRC+aJSKrXQROMXGj8I6LP79jZ8q3xcxYC2dg/8zPmmjKgfH78EFHie7Z
 oankCsmesSGyM90EdZjjmYe65nQ1z8QA4yJqlGGDf1Cfg4OGtMqo39/ae0Gx9P/MQrW7
 AyYg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=KoPy4LMv
Subject: [Buildroot] [PATCH 1/1] package/ltp-testsuite: bump version to
 20240930
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
Cc: Petr Vorel <petr.vorel@gmail.com>, Julien Olivain <ju.o@free.fr>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Hi,

Tested:
                    bootlin-armv5-uclibc [1/6]: OK
                     bootlin-armv7-glibc [2/6]: OK
                   bootlin-armv7m-uclibc [3/6]: SKIPPED
                     bootlin-x86-64-musl [4/6]: SKIPPED
                      br-arm-full-static [5/6]: OK
                             arm-aarch64 [6/6]: OK

Kind regards,
Petr

 package/ltp-testsuite/ltp-testsuite.hash | 4 ++--
 package/ltp-testsuite/ltp-testsuite.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ltp-testsuite/ltp-testsuite.hash b/package/ltp-testsuite/ltp-testsuite.hash
index 03aa586156..41915cd817 100644
--- a/package/ltp-testsuite/ltp-testsuite.hash
+++ b/package/ltp-testsuite/ltp-testsuite.hash
@@ -1,4 +1,4 @@
-# From: https://github.com/linux-test-project/ltp/releases/download/20240524/ltp-full-20240524.tar.xz.sha256
-sha256  2b7c07bb281b7ec49981eeb06c4b66f147b103977254632678d384034f6e9663  ltp-full-20240524.tar.xz
+# From: https://github.com/linux-test-project/ltp/releases/download/20240930/ltp-full-20240930.tar.xz.sha256
+sha256  3e9e806405aa602e2d21d221d885fd4914ff2da23eb8bba3d0f0f468bdf60238  ltp-full-20240930.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index bbeb80c732..417052eae7 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTP_TESTSUITE_VERSION = 20240524
+LTP_TESTSUITE_VERSION = 20240930
 LTP_TESTSUITE_SOURCE = ltp-full-$(LTP_TESTSUITE_VERSION).tar.xz
 LTP_TESTSUITE_SITE = https://github.com/linux-test-project/ltp/releases/download/$(LTP_TESTSUITE_VERSION)
 
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
