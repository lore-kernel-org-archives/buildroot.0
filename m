Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8CEDC43334
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 16:31:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AF43408B0;
	Sun, 19 Jun 2022 16:31:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0AF43408B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WKw81ODpp8IQ; Sun, 19 Jun 2022 16:31:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4BF540878;
	Sun, 19 Jun 2022 16:31:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4BF540878
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 62A611BF4E7
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 16:31:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3C4FC60E42
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 16:31:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C4FC60E42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1xo6MSP6g8YU for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 16:31:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CD9E60B9C
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0CD9E60B9C
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 16:31:38 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id s1so11622611wra.9
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 09:31:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qodFea8aMIbmc1ocBcwAaoufdpKzA/8Vd6ldq9O5hBU=;
 b=YxfU4OkQ3qcBLM61JarUcEoLRUNM2hrRPjB3hSVrnbLnJKYKVL9wRhlRM/1xxO9xMA
 P20T3+04ppSHCnnWPSE9M6E4zwK7KvDCVl8GW04BX2KMrKpISlhtZzyLpVCgiBjNQnsV
 GQVec5E47zXPxWhW5E7aiQW44DJ5vTg8eSFZWWMNocLR8u/jueCMPZHjOZK40Ml8ccKc
 D1DyzJwmnDrN/yWS9yOa8jzuVzzDTtUniuL/K1g1zlg6EQD2T7QqBGnl1w2KHs5LvkUK
 jbzN85BOEoT6t+TBlF9fP9ASC1UOT+D0DKHSwF0z1QWBsL91SPZf4MiuAclI1ysAbYu3
 ulZg==
X-Gm-Message-State: AJIora+RMbV+eIhyiSlMieLSUC8nPDnJfYHivkJGI1yL1/nTWT/79wZk
 wcBi5VCi3NZW8g92QYEqbFter74VLAY=
X-Google-Smtp-Source: AGRyM1sQBV9VJJK+YG+gA6WUyOUkmL+0ZAvOPPaRtEyYpS0cuxFGjSSr1sKzD6uhoSSbEuD3i6LgKg==
X-Received: by 2002:adf:e10c:0:b0:21a:1903:7ed with SMTP id
 t12-20020adfe10c000000b0021a190307edmr18874941wrz.437.1655656296824; 
 Sun, 19 Jun 2022 09:31:36 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 az10-20020adfe18a000000b00210396b2eaesm13133021wrb.45.2022.06.19.09.31.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jun 2022 09:31:36 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Jun 2022 18:28:47 +0200
Message-Id: <20220619162847.627063-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qodFea8aMIbmc1ocBcwAaoufdpKzA/8Vd6ldq9O5hBU=;
 b=FIQEtkD43oW+sgMU5auVwhGQazPY7GbY+rhDV6JXdcWaytilFeVwYKhbsvXTxglomo
 AVNorbrEkUwsFiWYc/uMBbz20OVHGJ1iZ8K9FfanUnmuh8FREblNvpxVgnZVrNyWAA7n
 TGyWE8r5hp2gJ2HwExF08TnqBhFSLKcvZ1IVtKchVqRBv1fPRNYOq1uZbymhQ9jM86al
 O/80KBAXivMdMlZ2CfsucFvD2zHuqPuh+fi4XSMlBHHb7SfyqjYNe/c03TWQt3tvqTfR
 B0GxKFQ2rdwJ5mbELxzSAXRWfKgkdbwL+9Hd5YwDU8Uq4xBFHjdi3jp8y2fgJSN/Cv46
 bpcQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=FIQEtkD4
Subject: [Buildroot] [PATCH 1/1] package/darkhttpd: add
 DARKHTTPD_CPE_ID_VENDOR
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:darkhttpd_project:darkhttpd is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Adarkhttpd_project%3Adarkhttpd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/darkhttpd/darkhttpd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/darkhttpd/darkhttpd.mk b/package/darkhttpd/darkhttpd.mk
index 56e5a6ecd6..bc68d43ef9 100644
--- a/package/darkhttpd/darkhttpd.mk
+++ b/package/darkhttpd/darkhttpd.mk
@@ -8,6 +8,7 @@ DARKHTTPD_VERSION = 1.13
 DARKHTTPD_SITE = $(call github,emikulic,darkhttpd,v$(DARKHTTPD_VERSION))
 DARKHTTPD_LICENSE = MIT
 DARKHTTPD_LICENSE_FILES = darkhttpd.c
+DARKHTTPD_CPE_ID_VENDOR = darkhttpd_project
 
 define DARKHTTPD_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
