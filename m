Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A059DC004D4
	for <buildroot@archiver.kernel.org>; Thu, 19 Jan 2023 09:59:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F5E3419A8;
	Thu, 19 Jan 2023 09:59:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F5E3419A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OWqd6bEHzrld; Thu, 19 Jan 2023 09:59:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D39841972;
	Thu, 19 Jan 2023 09:59:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D39841972
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2D90F1BF95F
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 09:58:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1745740C46
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 09:58:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1745740C46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OFSPfFAcUjzC for <buildroot@lists.busybox.net>;
 Thu, 19 Jan 2023 09:58:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7BE6140AD5
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7BE6140AD5
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 09:58:51 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 m3-20020a17090a414300b00229ef93c5b0so633828pjg.2
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 01:58:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OrsaZPliqZvvw38oEKTtX8OSMz0IzhYjOioUTmx0s2Y=;
 b=1RvSGUeprIZ7g7Hx8RcDwm6FTKRy0VAELyLTHnIZN+J9XFe+RTBin7O3G2Q181M4n9
 hKhRwjF3KfQ15KuEyw7wmpI2GjvKFT+Ux3MvgqmykhCBSNLErUamQp56AxYz4qoUWEwa
 zhOXm27e6Bu47qOML95xuA+nftim2tB5fmPkOm0Ju6RfVzJGfg4w5Sw7Ec6Oy94LJEWB
 FWqKlUzdsjHNYxvNxu/jypupEhEsCZ+YkwY3tlrfZJBe7tzVXSlaQjUV9/r6Nnaz/Qf2
 Xa9m3Vmpu1W/oy/RE6ryKjUXoLQcQudws4clQiTkCTrx4qacuYD8hV1lYcgvOitn5J+m
 dARA==
X-Gm-Message-State: AFqh2kq9zx4ez6ZJayy6W8RJeeu6VXJAyiItYN0gdUefAyWpNg8sL6xU
 attx63vwlpkoIubfNMq8poXVHIRkdv7xdA==
X-Google-Smtp-Source: AMrXdXsE4moQU7SNZr+yuvOhLJW/8roz6RriRnsx8bSlaievLE2vPpD1qXpsQ8eO/lmI7wCP/vL3tQ==
X-Received: by 2002:a17:90a:7404:b0:229:7b2d:c13 with SMTP id
 a4-20020a17090a740400b002297b2d0c13mr11251905pjg.19.1674122330498; 
 Thu, 19 Jan 2023 01:58:50 -0800 (PST)
Received: from debian.. (subs02-180-214-232-69.three.co.id. [180.214.232.69])
 by smtp.gmail.com with ESMTPSA id
 p6-20020a17090a74c600b002260c751b00sm2707384pjl.23.2023.01.19.01.58.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 01:58:50 -0800 (PST)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Buildroot <buildroot@buildroot.org>
Date: Thu, 19 Jan 2023 16:58:42 +0700
Message-Id: <20230119095842.445227-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OrsaZPliqZvvw38oEKTtX8OSMz0IzhYjOioUTmx0s2Y=;
 b=Opli9bW7WEfoAxC5Sn17GMCfAPifulxiNH/TLi2brrLWeYLlP8XhM69mLgUaHqGsqd
 RTjIxYY5OBjebM1+hhv3KsknZCvyCAopqMjhyI9kb1uIur9d95hTxQ2FUVmMdX2Z+mZr
 vl6oi/MED4nnr4DOO+TVjz3ZLY92/PzgAxhlx+8kUWFiUvO2Bj2fW9S/wUeLax6VRjxS
 rr4Bhm+C6ozAj8w02VOnUHmDoeuhu4jUIrvqsITy77SAxaPif6Mmw4mmX1KB3QwXloDd
 wGOXFafqWggsF3WBsoSr2NkejTZ9ga5FqgApCu/CSWE8yAkZ8Aqy76AbPptuQ3mwdGKB
 LaMA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Opli9bW7
Subject: [Buildroot] [PATCH] package/git: prefer OpenSSL SHA-1 and SHA-256
 implementation
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
Cc: Bagas Sanjaya <bagasdotme@gmail.com>,
 Matt Weber <matthew.weber@collins.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Git is shipped with its own implementation of SHA-1 and SHA-256.
However, when OpenSSL is available (BR2_PACKAGE_OPENSSL=y), it is
preferable to leverage the OpenSSL version of these hash algorithm
instead. --with-openssl configure flag doesn't enable that, though.

Set OPENSSL_{SHA1,SHA256} make variable when OpenSSL package is
selected.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 package/git/git.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/git/git.mk b/package/git/git.mk
index 9918d4c1ef..916ccc0cf3 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -16,7 +16,9 @@ GIT_DEPENDENCIES = zlib $(TARGET_NLS_DEPENDENCIES)
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 GIT_DEPENDENCIES += host-pkgconf openssl
 GIT_CONF_OPTS += --with-openssl
-GIT_MAKE_OPTS += LIB_4_CRYPTO="`$(PKG_CONFIG_HOST_BINARY) --libs libssl libcrypto`"
+GIT_MAKE_OPTS += \
+	LIB_4_CRYPTO="`$(PKG_CONFIG_HOST_BINARY) --libs libssl libcrypto`" \
+	OPENSSL_SHA1=YesPlease OPENSSL_SHA256=YesPlease
 else
 GIT_CONF_OPTS += --without-openssl
 endif

base-commit: c77c66b7df478f508b8f2affa7a64795504db699
-- 
An old man doll... just what I always wanted! - Clara

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
