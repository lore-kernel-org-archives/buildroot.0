Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 890AEC05024
	for <buildroot@archiver.kernel.org>; Wed, 20 Sep 2023 21:12:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D19546134B;
	Wed, 20 Sep 2023 21:12:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D19546134B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id etzXJ3Q5p-zQ; Wed, 20 Sep 2023 21:12:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 315916134C;
	Wed, 20 Sep 2023 21:12:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 315916134C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9A5C71BF239
 for <buildroot@lists.busybox.net>; Wed, 20 Sep 2023 21:12:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 69FF34035C
 for <buildroot@lists.busybox.net>; Wed, 20 Sep 2023 21:12:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69FF34035C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ji6T9JEtILOz for <buildroot@lists.busybox.net>;
 Wed, 20 Sep 2023 21:12:49 +0000 (UTC)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 05EAD40284
 for <buildroot@buildroot.org>; Wed, 20 Sep 2023 21:12:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05EAD40284
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-400a087b0bfso2628715e9.2
 for <buildroot@buildroot.org>; Wed, 20 Sep 2023 14:12:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695244367; x=1695849167;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f/rH/A9ozgKowO4xyo2q29yZRB5nJsbkQpmCwKtsJos=;
 b=h4nfOqc1Vjff6Jk8tzGso4YZ9LE4G1mUc94CsKUFpkNz/MmOauCaZ0RUtfWPHSMG9T
 jtd6qq9hNpzSUikcYX+corE5/H6S4VxZn+pJfW5ykQnLW5Ma/CVbasdnLvz0+cUE6Cpt
 Da44x3Y8veyHtok5xATtFM9YisLSwiSyat0SwKyAKj1Nu1hl1eq3GBUyghL4XmfCpr63
 Zw9mpu0FeYBVL+l+Ulfuk37/70Q6jAssoghCMOFqwUYJV/K0GElOD53rGquoR+yH0XXI
 OshwRBRtH2trIFEapNpvy2BdDBH+vXz942829Qr8mar/mbq1O/soRoHJxcPNmPhcoFqw
 adDw==
X-Gm-Message-State: AOJu0YzI9dNCIMw6j5wFVTemhX6CTzc+SVlN6/YfqLTVyhsb1cRCPKZU
 mj5061EEB7wAZbcDZ2csvWlG6PVwIAI=
X-Google-Smtp-Source: AGHT+IFdYjdMVi+N9DfaYQkHti4is2Gti1iu+hKULBXRcRG+3sLeX7Ff7+egwBfxOfevasyRfJogVw==
X-Received: by 2002:a7b:ce98:0:b0:402:f517:9c07 with SMTP id
 q24-20020a7bce98000000b00402f5179c07mr3500916wmj.0.1695244366469; 
 Wed, 20 Sep 2023 14:12:46 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 z11-20020a7bc7cb000000b00402fa98abe3sm2983232wmk.46.2023.09.20.14.12.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Sep 2023 14:12:45 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 20 Sep 2023 23:12:42 +0200
Message-Id: <20230920211242.43437-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695244367; x=1695849167; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=f/rH/A9ozgKowO4xyo2q29yZRB5nJsbkQpmCwKtsJos=;
 b=SbA581/Fq5cBTqiFBx9eEUsrXmSjFYWVEpxtpxZqYJwxBPvotzBLbo1+oG8Z1LIpQk
 kmgKmLjSDW1mtGCXM1Oz16O1kOJ+EFZIZIX5dDFxMG9enVKASQVJYflTPESblnXRzCPq
 DLkhHfVvmzdsgwGFtJItYhCUqVFrpzk1PWfoeOak/Nin2ySw6gNI1Z+gehpOEs8KoHNI
 2PP64yrtsbAB4Kt3Y6mF9xS82lQNXf1cEu+a0UE0swjyJCY5V/ODfGIwKaBZyxMlMLkJ
 osvVXX6WV55nUACMsIUX5aNR8ZpP4em17B9uBqcGR5UIVeGHC3t0LPlFIQV42VcBr6zl
 jfhA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=SbA581/F
Subject: [Buildroot] [PATCH v2,
 1/1] package/openvpn: dco needs headers >= 4.16
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

NLMSGERR_ATTR_MAX has been added in kernel 4.16 with
https://github.com/torvalds/linux/commit/dc2b9f19e3bdaa87a7c3d123b8bba8a42d96d942
resulting in the following build failure since bump to version 2.6.4 in
commit a46ac2346558d05afe405dda3730169df4b677d2 and
https://github.com/OpenVPN/openvpn/commit/e34437c26b764851555e4acbe2ccca6bec235c7e:

dco_linux.c: In function 'ovpn_nl_cb_error':
dco_linux.c:303:27: error: 'NLMSGERR_ATTR_MAX' undeclared (first use in this function); did you mean '__CTRL_ATTR_MAX'?
     struct nlattr *tb_msg[NLMSGERR_ATTR_MAX + 1];
                           ^~~~~~~~~~~~~~~~~
                           __CTRL_ATTR_MAX

Fixes:
 - http://autobuild.buildroot.org/results/69b9737913ac0b5cd2c117d526602874da3ee487

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Only disable dco with headers < 4.16

 package/openvpn/openvpn.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 12c090ba3e..619a22c3b3 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -16,7 +16,7 @@ OPENVPN_CONF_OPTS = \
 	$(if $(BR2_STATIC_LIBS),--disable-plugins)
 OPENVPN_CONF_ENV = NETSTAT=/bin/netstat
 
-ifeq ($(BR2_PACKAGE_LIBNL),y)
+ifeq ($(BR2_PACKAGE_LIBNL)$(BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_16),yy)
 OPENVPN_CONF_OPTS += --enable-dco
 OPENVPN_DEPENDENCIES += libnl
 else
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
