Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86550C433F5
	for <buildroot@archiver.kernel.org>; Sat, 19 Feb 2022 14:21:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 36F924020B;
	Sat, 19 Feb 2022 14:21:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c2Ei5_SLq8cg; Sat, 19 Feb 2022 14:21:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 21B6940128;
	Sat, 19 Feb 2022 14:20:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ACDDB1BF86C
 for <buildroot@lists.busybox.net>; Sat, 19 Feb 2022 14:20:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 98A9882423
 for <buildroot@lists.busybox.net>; Sat, 19 Feb 2022 14:20:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8xbw-rsJ4knk for <buildroot@lists.busybox.net>;
 Sat, 19 Feb 2022 14:20:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DC5A481D73
 for <buildroot@buildroot.org>; Sat, 19 Feb 2022 14:20:56 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 x3-20020a05600c21c300b0037c01ad715bso8355896wmj.2
 for <buildroot@buildroot.org>; Sat, 19 Feb 2022 06:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iO/hwAH4qpopESl8pCASG8SQ7tGGDVdJ3xnEPq8xUdo=;
 b=PVVvNG0wuVio2NAqZT4j9ejiFuc/8l2jI6KA1jlELiOZZPNan9f6Q7zUfN/yDVQWoy
 zUvUMPH7y4rfMFuSWC8mzE4N+pFIGozgiPIvJaKkinJlH8ddraE9wyxE1tuOA4Ko17XZ
 7WZlRQ6fVgCQ2MYeoiGomJ59sCTsXphHGiyuJhroApQ65zUuBaE9DYZ8Go50645DXggD
 vst2Cvp5wIxPTjBgDSbpvBwVaIj2tOh3W2ups5Haw43hKCEh61lFhXV4a2AYRL9d2JRz
 INDK+YliDTSiyOBCn7ImYpvSg+Se3+M0+UNVN+IHergqPGxLBbfZEH+VPxtsuzhXhF9O
 FdQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iO/hwAH4qpopESl8pCASG8SQ7tGGDVdJ3xnEPq8xUdo=;
 b=wC6KCnkVp0fsKUB8wEoWmU/fzOVkzRtfMjLJtdAlGzE/0Wq8A6ZRSzdbUMK5S18Jdp
 brMIG9yo7jk1KkjwBq7MQlzMOO2g/aprEKAUHR7J6mAnCAMANzobjvWy5/w8BeTNzFnJ
 eqelXZSczLrog3pfM2Fw17Tv4fBj/mA+CVZG+d1eMtF0Q9e2PgXg5/BSelNRHyegpsaq
 HD1tkK6BuQTvCJmFuAV2YP/LUcnchxKvHPFA+52DP3vbguWO30Khy4Bnqod98jOe8Qgq
 mo2PrH7g38Bh1hgpIZkfMkKUDygKdosN9yjDy629tAF0EpHS7iXi2qe+B5yu4x6AdYQi
 Q5Hg==
X-Gm-Message-State: AOAM530QxA3navgBcpJNlMZnIZtu2Jdmg0u4rTaX4lUlf+6BqQsQNgF9
 6BZoicNofglW5YYn8+XXmnR92b6Huqc=
X-Google-Smtp-Source: ABdhPJxSLfnSRXm4kaWlWeIGtAXbsv5b0rPK9mvOnjdL3yyHD5TDEIX80N43aGP1/cuPsC9FomTNTw==
X-Received: by 2002:a1c:a946:0:b0:37d:1e29:5ccb with SMTP id
 s67-20020a1ca946000000b0037d1e295ccbmr11164727wme.8.1645280454765; 
 Sat, 19 Feb 2022 06:20:54 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 n4-20020a7bc5c4000000b0037e0c62604fsm2417740wmk.14.2022.02.19.06.20.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Feb 2022 06:20:54 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 19 Feb 2022 15:21:04 +0100
Message-Id: <20220219142104.3753374-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/apr-util: drop
 APR_UTIL_FIX_{LIBTOOL, RULES_MK}
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop APR_UTIL_FIX_{LIBTOOL,RULES_MK} which were added by commit
84b4c19e551288911a230c2b73e96bc6e2ed12f9 but is not needed since the
addition of PPD_FIXUP_PATHS in commit
b06294e9897e90862656416e8b67fdace15488d7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/apr-util/apr-util.mk | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/package/apr-util/apr-util.mk b/package/apr-util/apr-util.mk
index f6ce7ac064..cf8407ced0 100644
--- a/package/apr-util/apr-util.mk
+++ b/package/apr-util/apr-util.mk
@@ -17,20 +17,6 @@ APR_UTIL_CONF_OPTS = \
 	--with-apr=$(STAGING_DIR)/usr/bin/apr-1-config
 APR_UTIL_CONFIG_SCRIPTS = apu-1-config
 
-ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
-define APR_UTIL_FIX_LIBTOOL
-	$(SED) 's,$(PER_PACKAGE_DIR)/apr/,$(PER_PACKAGE_DIR)/apr-util/,g' \
-		$(STAGING_DIR)/usr/build-1/libtool
-endef
-APR_UTIL_POST_PREPARE_HOOKS += APR_UTIL_FIX_LIBTOOL
-
-define APR_UTIL_FIX_RULES_MK
-	$(SED) 's,$(PER_PACKAGE_DIR)/apr/,$(PER_PACKAGE_DIR)/apr-util/,g' \
-		$(@D)/build/rules.mk
-endef
-APR_UTIL_POST_CONFIGURE_HOOKS += APR_UTIL_FIX_RULES_MK
-endif
-
 # When iconv is available, then use it to provide charset conversion
 # features.
 APR_UTIL_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBICONV),libiconv)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
