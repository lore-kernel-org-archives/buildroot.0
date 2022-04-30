Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF44C433EF
	for <buildroot@archiver.kernel.org>; Sat, 30 Apr 2022 19:33:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8DDE60B6A;
	Sat, 30 Apr 2022 19:33:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iH8uI1t8wwPJ; Sat, 30 Apr 2022 19:33:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1FC560AA8;
	Sat, 30 Apr 2022 19:33:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 063AB1BF429
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 19:33:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F196F4023F
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 19:33:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 01M87g6_QG0R for <buildroot@lists.busybox.net>;
 Sat, 30 Apr 2022 19:33:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E8F92400F1
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 19:33:35 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id k2so14802501wrd.5
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 12:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jeqcaOMADQxNglQqFL5q3iGGoznUoCKv7bLXckkVk8I=;
 b=D7CXrUu/lXZpwMLZSgViBXA95sS8EPoNpv8+5KDaT11pN54cA9Xk16WdoD5j35fXOT
 jY5J6icu6F0Aa9RU9+UQ/vm+nRBkDmcihLMWgByNyt8a9Y5Hi0TBT21gxHHwYEfkuBPh
 2dNGQXS/odg0ZqPptJzRpjD5nT7C6mfgxwwUutXtZ7d+lGuJDoYBk6njxC0RSL1z/erm
 VNjMwzCvj8r1gxFt8n0GI3CtyRKgCjoruHwVV9Yq4bm+me+x7U9ON217RQH/FMmAzp0y
 92dw+yqeFCOOeMJbetRmxbvxhCdaMsJ6sGMETxQHkfFXQ8T1uZEsAkN3hJUPzVGL48Qg
 YKbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jeqcaOMADQxNglQqFL5q3iGGoznUoCKv7bLXckkVk8I=;
 b=Jm2qmC7Rb7p7rj6HKAhWL9HanTledT14yBCfKTua0qrRxnIOsCKZf/FwCONeSHQXlc
 2Bi550ge9wJvsTxfM/Q18unIUDFq9/TWlu/mO3FjllXyhsXTIB+YqMwdWR/W4W1NClRx
 lQp2LAb3ScBLU2ZPVxFCt1ZJkD4G6YmfXrCwPov7R1qpmqPR2D++2p1fSzoSEI4Qiij9
 6Vlus24MzScekysba0/IMTqjqJyhBwoNcCPUO7Qpr2fBOu7RpBySnqZh2tTuQznjOEq7
 WSKkcCpgj23K1dRWq2UdvPoitpJvVOl9yLc1PRN7DmpVGIGI+8JlPnJjbhea3zdPdNnv
 avJg==
X-Gm-Message-State: AOAM5320vR5O2Xd0R6U7A997rR6qpaidt+sJ9WyaRsP0R7HvIAmg4PMe
 YiD72I7JOc86E3SxD0gH8S4LV8GVYhA=
X-Google-Smtp-Source: ABdhPJzjyklhH86LNSID8pkThqjwKt5SqXg6gUTwVUIhIhHLSvk8WX0tiBo2GY7szhPg0cjZ5ZUxAA==
X-Received: by 2002:a5d:44cf:0:b0:20a:c5d2:b6c3 with SMTP id
 z15-20020a5d44cf000000b0020ac5d2b6c3mr3843178wrr.177.1651347213804; 
 Sat, 30 Apr 2022 12:33:33 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a1c7309000000b003942a244ed2sm2432342wmb.23.2022.04.30.12.33.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 12:33:33 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 30 Apr 2022 21:29:20 +0200
Message-Id: <20220430192920.2367644-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/oniguruma: bump to version 6.9.8
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/kkos/oniguruma/releases/tag/v6.9.8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/oniguruma/oniguruma.hash | 4 ++--
 package/oniguruma/oniguruma.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/oniguruma/oniguruma.hash b/package/oniguruma/oniguruma.hash
index 3a6112e832..89befe7dbf 100644
--- a/package/oniguruma/oniguruma.hash
+++ b/package/oniguruma/oniguruma.hash
@@ -1,4 +1,4 @@
-# From https://github.com/kkos/oniguruma/releases/download/v6.9.7/onig-6.9.7.1.tar.gz.sha256
-sha256  6444204b9c34e6eb6c0b23021ce89a0370dad2b2f5c00cd44c342753e0b204d9  onig-6.9.7.1.tar.gz
+# From https://github.com/kkos/oniguruma/releases/download/v6.9.8/onig-6.9.8.tar.gz.sha256
+sha256  28cd62c1464623c7910565fb1ccaaa0104b2fe8b12bcd646e81f73b47535213e  onig-6.9.8.tar.gz
 # Hash for license file
 sha256  70ba5469ea0bab6e18a32d7009068f996503168d27be57747e08da34337ff26f  COPYING
diff --git a/package/oniguruma/oniguruma.mk b/package/oniguruma/oniguruma.mk
index 31c8d8e512..f5ac810c10 100644
--- a/package/oniguruma/oniguruma.mk
+++ b/package/oniguruma/oniguruma.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ONIGURUMA_VERSION = 6.9.7.1
+ONIGURUMA_VERSION = 6.9.8
 ONIGURUMA_SITE = \
 	https://github.com/kkos/oniguruma/releases/download/v$(ONIGURUMA_VERSION)
 ONIGURUMA_SOURCE = onig-$(ONIGURUMA_VERSION).tar.gz
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
