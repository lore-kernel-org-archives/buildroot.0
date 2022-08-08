Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E561AC25B0D
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 08:12:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 52DF04058B;
	Mon,  8 Aug 2022 08:12:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52DF04058B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N_1XaP77P0Hj; Mon,  8 Aug 2022 08:12:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5707F40329;
	Mon,  8 Aug 2022 08:12:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5707F40329
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6B6AD1BF591
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 08:12:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 404C482735
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 08:12:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 404C482735
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aG8K6ekar7WC for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 08:12:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 440C08275C
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 440C08275C
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 08:12:04 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 17-20020a05600c241100b003a536b6d536so1899004wmp.2
 for <buildroot@buildroot.org>; Mon, 08 Aug 2022 01:12:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=UfbWSsM9inRttm+fFQuCiuzFd9SuxY6ncW0J++vADpY=;
 b=v1mUMMJ/spLjO2dXVzXDcBLC9rPrbeJmHUaZzSNlSH5ZLhBlTZnvTepsiVQO2rBTM5
 9emPkf6178oCVSI4FJKuNW2LPivJK6h3bIZhIC/9eA4fu9lAjGgo/I80h50c4YMbvfNV
 /8gPC6cFn2EW/7ZCpZFQ22HNEQ7AmMGabXUDRazuxrOyeley5nWjoQa3s5VkbZrB2ab3
 E/kPvy5viSwQ3szF0stZPRHCiRhh/4mKMvXjTa7GpM4dKSbRvG0kWAyLxBqByheducYd
 a1k5kr498+VZ0bRbu/HlwxJkIrIKheYb73pykPyyFDClgaDO7Fsu+UhCnY62SkkbGgs/
 IKwg==
X-Gm-Message-State: ACgBeo2okTXyFwgoPG/athqDhmW2fcmzRHFdF0i1W1WuN8lnJbAFTY6v
 32MIO/4Bo9QM5V7Tx2ockKd+p8XfcL4=
X-Google-Smtp-Source: AA6agR7EvaAU+UJvfuR6tv1/FKSSeZ1ts3ljL+sEFtxmIpo+HuSmDjpVhtr7N8WKUQTtJzQ9k9CFvg==
X-Received: by 2002:a1c:2542:0:b0:3a3:2dcd:8736 with SMTP id
 l63-20020a1c2542000000b003a32dcd8736mr17027768wml.57.1659946322110; 
 Mon, 08 Aug 2022 01:12:02 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 u18-20020a5d4352000000b0021d69860b66sm13019569wrr.9.2022.08.08.01.12.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 01:12:01 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  8 Aug 2022 10:11:41 +0200
Message-Id: <20220808081141.582053-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=UfbWSsM9inRttm+fFQuCiuzFd9SuxY6ncW0J++vADpY=;
 b=N1DYS6Kb+TXcO52l4xf5qikcOUyvX53/7evOoA2b3DbgCqYPGiIAf6baoX7Ytz9viF
 hDMahaDWiA33Rx9QGXPiWgyur0rtsznFAUWCmSIXvWlfloiXWmTRWvDDprNb5BcqYZ/Z
 fU557e7uiZGZbvGj0GaO+49rPDIMEAE/ByvUOHNEDjoV+PN/B7Tt25ey6QYF3bpSLxEe
 BxG++a6NeOoBNw2hEJ5dqS0e1Qg3BrKOtT246f4o07whlxb+yFSskpUG6iRYnnxGCUDY
 rfIf4lnGertHyCmIHxp5QwybfUXTHDd6PgVoVAzrENeHYbwlpgdmpUs5GexmxIDq1X2T
 Ci7w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=N1DYS6Kb
Subject: [Buildroot] [PATCH 1/1] package/wolfssl: security bump to version
 5.4.0
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following vulnerabilities:
 - [High] Potential for DTLS DoS attack. In wolfSSL versions before
   5.4.0 the return-routability check is wrongly skipped in a specific
   edge case. The check on the return-routability is there for stopping
   attacks that either consume excessive resources on the server, or try
   to use the server as an amplifier sending an excessive amount of
   messages to a victim IP. If using DTLS 1.0/1.2 on the server side
   users should update to avoid the potential DoS attack. CVE-2022-34293
 - [Medium] Ciphertext side channel attack on ECC and DH operations.
   Users on systems where rogue agents can monitor memory use should
   update the version of wolfSSL and change private ECC keys.

https://github.com/wolfSSL/wolfssl/releases/tag/v5.4.0-stable
https://www.wolfssl.com/docs/security-vulnerabilities/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wolfssl/wolfssl.hash | 2 +-
 package/wolfssl/wolfssl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wolfssl/wolfssl.hash b/package/wolfssl/wolfssl.hash
index 63eebf93bb..01b21596e7 100644
--- a/package/wolfssl/wolfssl.hash
+++ b/package/wolfssl/wolfssl.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  409b4646c5f54f642de0e9f3544c3b83de7238134f5b1ff93fb44527bf119d05  wolfssl-5.2.0.tar.gz
+sha256  dc36cc19dad197253e5c2ecaa490c7eef579ad448706e55d73d79396e814098b  wolfssl-5.4.0.tar.gz
 
 # Hash for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wolfssl/wolfssl.mk b/package/wolfssl/wolfssl.mk
index 58b6f296ab..536fd863fe 100644
--- a/package/wolfssl/wolfssl.mk
+++ b/package/wolfssl/wolfssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WOLFSSL_VERSION = 5.2.0
+WOLFSSL_VERSION = 5.4.0
 WOLFSSL_SITE = $(call github,wolfSSL,wolfssl,v$(WOLFSSL_VERSION)-stable)
 WOLFSSL_INSTALL_STAGING = YES
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
