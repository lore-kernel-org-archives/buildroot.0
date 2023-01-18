Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF87C32793
	for <buildroot@archiver.kernel.org>; Wed, 18 Jan 2023 17:37:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB9E0820CF;
	Wed, 18 Jan 2023 17:37:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB9E0820CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3c68ZHL0ln1E; Wed, 18 Jan 2023 17:37:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07A72820C2;
	Wed, 18 Jan 2023 17:37:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07A72820C2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DABC31BF2B5
 for <buildroot@lists.busybox.net>; Wed, 18 Jan 2023 17:37:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B4C9140B1D
 for <buildroot@lists.busybox.net>; Wed, 18 Jan 2023 17:37:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4C9140B1D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l9dRmUrJZcbB for <buildroot@lists.busybox.net>;
 Wed, 18 Jan 2023 17:37:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8DE2E4057A
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8DE2E4057A
 for <buildroot@buildroot.org>; Wed, 18 Jan 2023 17:37:25 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id z5so33663817wrt.6
 for <buildroot@buildroot.org>; Wed, 18 Jan 2023 09:37:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oBjZv8sLQ/Z97sifVf73cMA2elqO2R3qMmgRNFAaBJQ=;
 b=N8dFYWztJ1RgKWefy9oYeEaYGEaZDK8mS5UntIHGo27HZA2sxVwOnWy05xhE4RZXGf
 rZ3vK5nxbOsmvJ+A+rYKs4RRmKhI5Al9/iALFNPWpZTMXqm0hwlp+ynSbmCrjueF/3//
 t4/d64w3lLwm7APsah2nvaTak8pA+L1Sv8Hm3ockH8KhsffCIogC4jK3XqcJ23pRbh9X
 nIiBm7U+pUJFqo092jQPbbCgaVNKov//bOLOgP04e86QyIw1SaSIN9DHnikThcxxAAoV
 eIdmBqmU+RKlpu/l09Ff+QuUKw2E+1mOETGuHPz/ckbycXtgkY9lDgb4o7w6z0zsMnWn
 SQPw==
X-Gm-Message-State: AFqh2kot5twZ8gBTTAScsMUVxMHTilyza22R8f1K53BMRmxvSxUXdIQh
 J/Y2z6/5O0sGWYvKDn9axBARXPc6wzA=
X-Google-Smtp-Source: AMrXdXuQ/0lWSLsASx/rNm+eQQjBWH6SgkaiygxekoVnXtDegjn9zdjjuDojDsuGpR+2fzzn7kmxJg==
X-Received: by 2002:adf:fc86:0:b0:2bc:8360:885 with SMTP id
 g6-20020adffc86000000b002bc83600885mr7132557wrr.21.1674063443255; 
 Wed, 18 Jan 2023 09:37:23 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 f3-20020adfdb43000000b00236883f2f5csm32324783wrj.94.2023.01.18.09.37.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 09:37:22 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 18 Jan 2023 18:37:18 +0100
Message-Id: <20230118173718.207535-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oBjZv8sLQ/Z97sifVf73cMA2elqO2R3qMmgRNFAaBJQ=;
 b=X2SGDC3l3yBnQaL3sijuM+G+KLM1DcnTvDFLaZiNBnGfXE+QOmlKKg9n7Dbm3OOBLV
 X6hpiF+PtEHz5QxGpSsDYyO2c1/XLUavQgUUW0evlN+mnuhyeU46ENOjkaIa8gYe4O51
 RmCA3XmO1/llwBtB6bXUuWLGIYINuwoQbz/c970aSMb2tc+R1rno8EUENWsphJN0313o
 QrbngSlLROlBg8+LR9NoXa1oxKOhi45DLg5sAiFfiZ3Yo1Ds48+TbaQbnfSzFmKsH+at
 f+m8ZmAQwmMYyuDA8F5OuxVpGT7aII7sooHB7/ONflSmLbqnDwU1nYSzEncKX816L++O
 XnAg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=X2SGDC3l
Subject: [Buildroot] [PATCH 1/1] package/proftpd: disable sftp with libressl
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

sftp doesn't build with libressl >= 3.5.0 resulting in the following
build failure since commit 8b216927db080b38fdbf1f8b025b6f90a89d4bc2:

mac.c: In function 'init_mac':
mac.c:189:3: warning: implicit declaration of function 'HMAC_CTX_init'; did you mean 'HMAC_CTX_new'? [-Wimplicit-function-declaration]
  189 |   HMAC_CTX_init(hmac_ctx);
      |   ^~~~~~~~~~~~~
      |   HMAC_CTX_new
mac.c: In function 'set_mac_key':
mac.c:435:14: error: storage size of 'ctx' isn't known
  435 |   EVP_MD_CTX ctx;
      |              ^~~

So disable sftp with libressl as no feedback was received on
https://github.com/proftpd/proftpd/pull/1481

Fixes:
 - http://autobuild.buildroot.org/results/a16ccd7cc78eb63de06a6d738fccc6b947da13e7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/proftpd/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/proftpd/Config.in b/package/proftpd/Config.in
index 83094028a0..aed1958b8d 100644
--- a/package/proftpd/Config.in
+++ b/package/proftpd/Config.in
@@ -29,7 +29,8 @@ config BR2_PACKAGE_PROFTPD_MOD_REDIS
 config BR2_PACKAGE_PROFTPD_MOD_SFTP
 	bool "mod_sftp support"
 	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160 if BR2_PACKAGE_LIBOPENSSL
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160
 	help
 	  Compile ProFTPD with mod_sftp support
 
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
