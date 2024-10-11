Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48263D0EE1E
	for <buildroot@archiver.kernel.org>; Fri, 11 Oct 2024 18:08:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA62460624;
	Fri, 11 Oct 2024 18:07:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AhiNWJOMPqBH; Fri, 11 Oct 2024 18:07:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBE50608D6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBE50608D6;
	Fri, 11 Oct 2024 18:07:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4C8DD1BF57F
 for <buildroot@lists.busybox.net>; Fri, 11 Oct 2024 18:07:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 48EA684353
 for <buildroot@lists.busybox.net>; Fri, 11 Oct 2024 18:07:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uZeeWFLtP7DV for <buildroot@lists.busybox.net>;
 Fri, 11 Oct 2024 18:07:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12a; helo=mail-il1-x12a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4A54284347
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A54284347
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4A54284347
 for <buildroot@buildroot.org>; Fri, 11 Oct 2024 18:07:56 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id
 e9e14a558f8ab-3a3a03399fbso11530325ab.0
 for <buildroot@buildroot.org>; Fri, 11 Oct 2024 11:07:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728670075; x=1729274875;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IUXa/vHLvk+8U39WqdW1zTomMstswPEgWzrdxt3yUe0=;
 b=PkBIrH6573LErePZEVlXHiCaNZSqy6b1C4pGfeh211VOL5FI+DVXEfqn7Yl2xU+sTm
 smvt0fb9j6XiWV7fItgHATM5R1YKgbbwu6bNblU2b8JMnTt27agPO33SzLF2Gt+2h16/
 FZLsX/2qYqaFWXAYWQUWdizjq1OrVqeiEGVg0Z7ztJ7YpDo7rcTBFpBwbumyHxAn/nnF
 LUH1LGQbPghuuoAJcKMff4LmH1lRnwPSgqjJ/qDbr/zBndsNG1c2bM6rvptncwI553ex
 bLN7NPoNTTZzYyf6Ntwh5MvHQKcDAV9K4sWgjXs6Vnv7B8kY34KINDNp0WyQzR5KBeEW
 6Cjg==
X-Gm-Message-State: AOJu0Yxl2Blg28VuyntJk2FTLlFMQsq3FwmMSWtU1lZOfywZNjavlyaB
 1iopP3rmVtmYaf55c5iHqaLAW/kcIA3U1S8x6WSOH1ES7Wg3XfZhTiv5Qz6t
X-Google-Smtp-Source: AGHT+IHxOZcOf13z7nacSVewwurlVC8ZjpZj9Tt7BvWtIFI0oYV2t5dL0Zw4rLJDtOdh8poi/sQXHg==
X-Received: by 2002:a05:6e02:1885:b0:39d:2939:3076 with SMTP id
 e9e14a558f8ab-3a3bce159bbmr2876185ab.25.1728670075040; 
 Fri, 11 Oct 2024 11:07:55 -0700 (PDT)
Received: from james-x399.localdomain (71-33-159-223.hlrn.qwest.net.
 [71.33.159.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dbad9b1078sm735606173.27.2024.10.11.11.07.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2024 11:07:54 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 11 Oct 2024 12:07:52 -0600
Message-Id: <20241011180752.2769273-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728670075; x=1729274875; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IUXa/vHLvk+8U39WqdW1zTomMstswPEgWzrdxt3yUe0=;
 b=IicGjosUZbz/I6szAmGL3ABUJD2axyVr+0bFndOudYl40bYwcHDj48pEr7Wvii8+yu
 sTmD/wRpYqDRpFDYm9BrSBO9ILJWjsMQsl2xDer4W+F0qmTSAHCNofs6seCpxay5ErN3
 2zcqozqyxp9TdbpvSDG2F2u+FXi3tkfeEtfwNuEQR1JRyRDeGR7U5PjvlqdO0nEkrb7m
 Okr/D9oRMcnJCy9UISkC8QFcVNRoFRsPlnT38LfBPaXpetmRU413RHZlL62M+GlR3J94
 O+03KtthSFzGA8SqJzZSBfekn47YnwFgh1nfu5MkH7jhRkiEbZdSZY54pFBZowJWqH55
 oT4g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=IicGjosU
Subject: [Buildroot] [PATCH 1/1] package/python-charset-normalizer: bump to
 version 3.4.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-charset-normalizer.hash                          | 4 ++--
 .../python-charset-normalizer/python-charset-normalizer.mk  | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-charset-normalizer/python-charset-normalizer.hash b/package/python-charset-normalizer/python-charset-normalizer.hash
index 8ef0e3fed0..ebed9d19d7 100644
--- a/package/python-charset-normalizer/python-charset-normalizer.hash
+++ b/package/python-charset-normalizer/python-charset-normalizer.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/charset-normalizer/json
-md5  0a4019908d9e50ff13138e8a794d9e2b  charset-normalizer-3.3.2.tar.gz
-sha256  f30c3cb33b24454a82faecaf01b19c18562b1e89558fb6c56de4d9118a032fd5  charset-normalizer-3.3.2.tar.gz
+md5  8e0d0f33219087c2cd2d01b1d6ff11b6  charset_normalizer-3.4.0.tar.gz
+sha256  223217c3d4f82c3ac5e29032b3f1c2eb0fb591b72161f86d93f5719079dae93e  charset_normalizer-3.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  eb31a0c5a4fb09b8a4e32055d25c1e5f9c358a2752fef3cd720213d1ccfee241  LICENSE
diff --git a/package/python-charset-normalizer/python-charset-normalizer.mk b/package/python-charset-normalizer/python-charset-normalizer.mk
index 914b96eb69..ee04bf8968 100644
--- a/package/python-charset-normalizer/python-charset-normalizer.mk
+++ b/package/python-charset-normalizer/python-charset-normalizer.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CHARSET_NORMALIZER_VERSION = 3.3.2
-PYTHON_CHARSET_NORMALIZER_SOURCE = charset-normalizer-$(PYTHON_CHARSET_NORMALIZER_VERSION).tar.gz
-PYTHON_CHARSET_NORMALIZER_SITE = https://files.pythonhosted.org/packages/63/09/c1bc53dab74b1816a00d8d030de5bf98f724c52c1635e07681d312f20be8
+PYTHON_CHARSET_NORMALIZER_VERSION = 3.4.0
+PYTHON_CHARSET_NORMALIZER_SOURCE = charset_normalizer-$(PYTHON_CHARSET_NORMALIZER_VERSION).tar.gz
+PYTHON_CHARSET_NORMALIZER_SITE = https://files.pythonhosted.org/packages/f2/4f/e1808dc01273379acc506d18f1504eb2d299bd4131743b9fc54d7be4df1e
 PYTHON_CHARSET_NORMALIZER_SETUP_TYPE = setuptools
 PYTHON_CHARSET_NORMALIZER_LICENSE = MIT
 PYTHON_CHARSET_NORMALIZER_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
