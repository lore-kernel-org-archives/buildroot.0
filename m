Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D8E9C61DA4
	for <buildroot@archiver.kernel.org>; Thu, 23 Feb 2023 14:06:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFA5341BAF;
	Thu, 23 Feb 2023 14:06:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFA5341BAF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q_AvU_MNd3xg; Thu, 23 Feb 2023 14:06:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C86B3418FE;
	Thu, 23 Feb 2023 14:06:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C86B3418FE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4629C1BF4E3
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 14:06:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E01141142
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 14:06:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E01141142
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q7qK3FUvMAOy for <buildroot@lists.busybox.net>;
 Thu, 23 Feb 2023 14:06:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1660C41135
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1660C41135
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 14:06:12 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id j3so7017639wms.2
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 06:06:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dd2tUfUWvzh+H4Pd7rL/VDp8EWjbPF2INoQFAH2fHng=;
 b=jkjOD04IpYIylFKPTCX0K1I1vJP0RNswtUR4ErIMFII968Bn1cjA1MnfvKsK83xsYK
 utfSbVakne91cYl//YxHwkNWUmQ2yOilnRlZpXeFWtE9hN2YMBSeFT/knVOhhuO/MZBj
 brh6EIs0G7xa+jYgVXOdtfKOQau/Kdm2mIdmYCbWKJILh3jL9s93TJdXAQ8Zs21oEn0/
 g+7HdzJH+HdepaaBBCrsvyrGIdE9QJhk58AvztjnxYQbqlO/MikFIuWdAPpyZ+f0hfL2
 jrbvlBhyZce3dsHYKvQFzA2KED2K9DhV5Lq7Dy/KQssa9ePfzMpoenHbz0HuGUZW8QPG
 OTqQ==
X-Gm-Message-State: AO0yUKUtyNBJGV+hiEXlyRtJL5LMAJCCtYPlDaU7oMC/qGuzhRglq9mH
 b+3UBZcWwufQeK5CVHZxYKmi8CGGDCw=
X-Google-Smtp-Source: AK7set+YRo0HZ8eSeDdQIdAuBwyO2uA380Xvu1Ligo4T0uZhmLdN1NijOYh13cu2W+RVIpUbDYR3Lw==
X-Received: by 2002:a05:600c:4495:b0:3ea:bc08:ae27 with SMTP id
 e21-20020a05600c449500b003eabc08ae27mr849959wmo.29.1677161170628; 
 Thu, 23 Feb 2023 06:06:10 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 o10-20020a1c750a000000b003e7c89b3514sm8234652wmc.23.2023.02.23.06.06.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 06:06:10 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 23 Feb 2023 15:06:06 +0100
Message-Id: <20230223140606.208040-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dd2tUfUWvzh+H4Pd7rL/VDp8EWjbPF2INoQFAH2fHng=;
 b=FCRrKIxDEXNIrB5Rf8NZXJCq/wVf1ptfI/MBGYsULDzqCXhJ6gyFzXbjNRO4hr9g/I
 v0oEMA3LqEh9PKAABiq4jqHmXv8BR/wLVN/uhINB7B+shNUOde6RcuWmbmScwvUdjnrK
 8A8NzLv/jefawQ0pfKueb6bSFr+12KpjMfHZ6NucAoXTShxkedDVmn9uqtLijBJJm3En
 Se2LV5YOM3NLGh7bLvNF7JF0cFewqbS926/pMrNTh7Uz9R/FMKnBYjjWh68Q330t4TQE
 gLvsuQu1zg+hD5Ve477mERsAM064hM5LpMauXZLPATOUA29uAX/T2CautZRi/nmB7eG1
 Iy1g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=FCRrKIxD
Subject: [Buildroot] [PATCH 1/1] package/erlang: fix build with libressl >=
 3.5.0
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
Cc: Will Newton <will.newton@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with libressl >= 3.5.0 raised since bump
to version 3.5.2 in commit 8b216927db080b38fdbf1f8b025b6f90a89d4bc2:

api_ng.c: In function 'EVP_CIPHER_CTX_copy':
api_ng.c:392:28: error: invalid use of incomplete typedef 'EVP_CIPHER_CTX' {aka 'const struct evp_cipher_ctx_st'}
  392 |     if ((in == NULL) || (in->cipher == NULL))
      |                            ^~

Fixes:
 - http://autobuild.buildroot.org/results/90f7365d8477d35fca452b7b3f38babba086375e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...0003-crypto-Fixes-for-LibreSSL-3-5-0.patch | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 package/erlang/0003-crypto-Fixes-for-LibreSSL-3-5-0.patch

diff --git a/package/erlang/0003-crypto-Fixes-for-LibreSSL-3-5-0.patch b/package/erlang/0003-crypto-Fixes-for-LibreSSL-3-5-0.patch
new file mode 100644
index 0000000000..84c75fef83
--- /dev/null
+++ b/package/erlang/0003-crypto-Fixes-for-LibreSSL-3-5-0.patch
@@ -0,0 +1,30 @@
+From 8e5170d79e387d7e898d948a78e0c70407a4030c Mon Sep 17 00:00:00 2001
+From: Hans Nilsson <hans@erlang.org>
+Date: Mon, 14 Feb 2022 15:51:35 +0100
+Subject: [PATCH] crypto: Fixes for LibreSSL 3.5.0
+
+[Retrieved (and backported) from:
+https://github.com/erlang/otp/commit/8e5170d79e387d7e898d948a78e0c70407a4030c]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ lib/crypto/c_src/openssl_config.h | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/lib/crypto/c_src/openssl_config.h b/lib/crypto/c_src/openssl_config.h
+index 6fdd049fb30a..39e4b2d9d7c0 100644
+--- a/lib/crypto/c_src/openssl_config.h
++++ b/lib/crypto/c_src/openssl_config.h
+@@ -122,7 +122,14 @@
+ # endif
+ #endif
+ 
++#ifdef HAS_LIBRESSL
++# if LIBRESSL_VERSION_NUMBER >= 0x3050000fL
++#  define HAS_EVP_PKEY_CTX
++#  define HAVE_EVP_CIPHER_CTX_COPY
++# endif
++#endif
++
+ #ifndef HAS_LIBRESSL
+ # if OPENSSL_VERSION_NUMBER >= PACKED_OPENSSL_VERSION_PLAIN(1,0,0)
+ #  define HAS_EVP_PKEY_CTX
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
