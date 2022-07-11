Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E9CC433EF
	for <buildroot@archiver.kernel.org>; Mon, 11 Jul 2022 21:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4059B83F81;
	Mon, 11 Jul 2022 21:55:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4059B83F81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JNXwIhKy83fH; Mon, 11 Jul 2022 21:55:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6674383F72;
	Mon, 11 Jul 2022 21:55:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6674383F72
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3DE6D1BF397
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 21:55:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 105BE421B2
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 21:55:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 105BE421B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HojhLWk_dCip for <buildroot@lists.busybox.net>;
 Mon, 11 Jul 2022 21:55:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 779794219B
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 779794219B
 for <buildroot@buildroot.org>; Mon, 11 Jul 2022 21:55:41 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 h14-20020a1ccc0e000000b0039eff745c53so3775007wmb.5
 for <buildroot@buildroot.org>; Mon, 11 Jul 2022 14:55:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MhYiqC4xotKqTlcVRWqnhz2/Sj2cQdHhaY3gZqS6IWk=;
 b=nBfjJreQRxJasLm6pyPzLrUKtI5xnSUVHvEvC/l/Gb0jp2zfATWRoSXte2XCJmbL6x
 AuWB1AdhV8A0TNDfnAJcqxNIMTVJjNxUvQTJ7fOwofynnMR5kFxhM50YiemvGdz65fH3
 aZlLxgPJ0JztHHphQlgs0g0wY7Sycm2vYfHGLHQzcHtRWLRlHTYHI284zdWcyyug17oE
 rm0TPtclViM0sHK5Fb/Vd2GhjyiDRjyKhkmzEiEFFfupQu9AeXY83m9eGE66+nMi645Z
 9W9+uNpdzIU6BunjaY2QiwnmMXtaFYtRsM43+pIoYwaY9eoUCD73+aYo8CoUano763mi
 IHgw==
X-Gm-Message-State: AJIora8wilHp794ncn/icsWh6upP7WdsDSRBQf9GVh//Th06CgKUPaGt
 4JtTaDikkEVWM6PLYnLUMSEVUOz5OKI=
X-Google-Smtp-Source: AGRyM1sTV/9/Xk11NizagZOfCl+O/xRmEtULea2JfLhp0R4QYCoejmDX5JWumDhWgy3IXyAWPECVrg==
X-Received: by 2002:a05:600c:22d3:b0:3a2:d8e2:8f15 with SMTP id
 19-20020a05600c22d300b003a2d8e28f15mr412916wmg.177.1657576539232; 
 Mon, 11 Jul 2022 14:55:39 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 x5-20020adff0c5000000b0021d6d9c0bd9sm6677151wro.82.2022.07.11.14.55.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 14:55:38 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 11 Jul 2022 23:52:36 +0200
Message-Id: <20220711215236.978488-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MhYiqC4xotKqTlcVRWqnhz2/Sj2cQdHhaY3gZqS6IWk=;
 b=LJMFAE2+BI7vWq3tS41uQg3YRcCJAZ1r4uFo38JQyvjwdnr8/b1/3fulAwxzly9ulI
 SHCH3uAI1bjHqfdSHj50v2HSFS2qies5TbFn8Nhjt7uCZg2XXKKgc1fwrI3XErTbw9/G
 OTj98cHsuqUrLow16T+oCO6SrQsjNkBu1iqUQIs41OuoRB7VHDB6Iu+qJDuR0BtZQ7aK
 m1qJGAt367qEmUnaGxxnfzkMJhZVq/7PuCixwH+YjV8MF2qPHj1hWPKZZsK40vDs+mTS
 WvNH25YH4/Tth4dVLaUUhExv4Q0O5gqTN5rvhTf76JILblABaZuIvcLxzwHW1TcmFVDH
 xXYw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=LJMFAE2+
Subject: [Buildroot] [PATCH 1/1] package/mbedtls: security bump to version
 2.28.1
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

Fix CVE-2022-35409: Buffer overread in DTLS ClientHello parsing.

https://github.com/Mbed-TLS/mbedtls-docs/blob/main/security-advisories/advisories/mbedtls-security-advisory-2022-07.md
https://github.com/Mbed-TLS/mbedtls/releases/tag/v2.28.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mbedtls/mbedtls.hash | 4 ++--
 package/mbedtls/mbedtls.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mbedtls/mbedtls.hash b/package/mbedtls/mbedtls.hash
index 80ae173aff..38182fe119 100644
--- a/package/mbedtls/mbedtls.hash
+++ b/package/mbedtls/mbedtls.hash
@@ -1,4 +1,4 @@
-# From https://github.com/ARMmbed/mbedtls/releases/tag/v2.28.0:
-sha256  6519579b836ed78cc549375c7c18b111df5717e86ca0eeff4cb64b2674f424cc  mbedtls-2.28.0.tar.gz
+# From https://github.com/ARMmbed/mbedtls/releases/tag/v2.28.1:
+sha256  6797a7b6483ef589deeab8d33d401ed235d7be25eeecda1be8ddfed406d40ff4  mbedtls-2.28.1.tar.gz
 # Locally calculated
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index 8745ff33f4..af87d62b30 100644
--- a/package/mbedtls/mbedtls.mk
+++ b/package/mbedtls/mbedtls.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MBEDTLS_VERSION = 2.28.0
+MBEDTLS_VERSION = 2.28.1
 MBEDTLS_SITE = $(call github,ARMmbed,mbedtls,v$(MBEDTLS_VERSION))
 MBEDTLS_CONF_OPTS = \
 	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -std=c99" \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
