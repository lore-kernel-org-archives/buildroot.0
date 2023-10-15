Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A8B7CDB47E
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 21:01:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFF828125F;
	Sun, 15 Oct 2023 21:01:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFF828125F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HXZ5CL6YNlp1; Sun, 15 Oct 2023 21:01:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A4AC8126A;
	Sun, 15 Oct 2023 21:01:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A4AC8126A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8F3EE1BF83A
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 21:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 66763404DA
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 21:01:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66763404DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F_GPrzgRJxxU for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 21:01:34 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2DC08401ED
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 21:01:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DC08401ED
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40684f53ef3so42093645e9.3
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 14:01:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697403692; x=1698008492;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Gx8tnF7/OMz3OqubRvPmWCXKZwy6mPMLNliHhDCkM6U=;
 b=LvlJHobeecNJG11qGUqaZSPpCTVwr6J2tevkCCfHIz3fjJjhBzEVD3pnFieMoKwvUj
 tG3tbSCXnM59kg8Hsi1ycbMFCiOVlHONOeXKWXZD7eBpUMVjhs2N10mjEl4CZUP2dhK5
 VvlOhBUPDpZ1LsIEJ8q7o2Jm5vC5PoZOrzNsUFUqaUXd6I8RF+IFbY8TSmcPovTfzqgp
 XMmGx+EQ4pr5eWaj68mR7H8UY9eGe0T+eDG+bLSFGQLSUibOU2lbHOBMdG89iZJfoU3m
 kAw7U+EtWqpIHMlnx0HyUcAGF9UHkWRqWH06N7nsLD0cAqs6MpMhaaDSpiSBJ2kUy5wp
 gbbw==
X-Gm-Message-State: AOJu0YzA2j17AXy4dzu5K9vtJG4WEXNrZO06m6c2QkO76gHosPMWyek3
 HHH5A1yhe+wMWgS9GlOPulzsgyvWQfU=
X-Google-Smtp-Source: AGHT+IHR1vNGmqnd9aoM++2iztYrmB3zhxc4t+Rq8GKjqLGhphKLmm5gHu3qxU50ALzOZ2Ma8Q2Log==
X-Received: by 2002:a05:600c:22d5:b0:406:52e4:cd23 with SMTP id
 21-20020a05600c22d500b0040652e4cd23mr27604251wmg.0.1697403691568; 
 Sun, 15 Oct 2023 14:01:31 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 t14-20020a05600c198e00b00405c7591b09sm5386161wmq.35.2023.10.15.14.01.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Oct 2023 14:01:31 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Oct 2023 23:01:25 +0200
Message-ID: <20231015210125.1587623-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697403692; x=1698008492; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Gx8tnF7/OMz3OqubRvPmWCXKZwy6mPMLNliHhDCkM6U=;
 b=nFUJdD8/4nZshXd1RMnpB36At5GTWnwxK0G2jyIzEgeBR75+8X1Oc1/UHxsSXEZiS5
 Gxaeuy8fCHFhFXQafSubO7K0bqOir3esf39Bwg5GkAehvZecx5Vfp1i3lALXYH/x3F5X
 RH3HDbV2M+RHjuCgJC8lI9Bw3wHDIBeIUvtbCOgChP77j0BeXEaA/0SZtYQIHaFdfmQ6
 L8y+BLWG+6kc4g5FXlC4LCBDCT90a1Et5l3PUAJRkqO0JIrsx9p3b8Uu6+5fvIPP1Amy
 3lwimO+HM13zxRrXE0koMBsNm0onb82AfjoKR4bRXXf113KVZMyin2TtYQeOs0+Ae4SI
 bitg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nFUJdD8/
Subject: [Buildroot] [PATCH 1/1] package/monit: fix openssl static build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following openssl static build failure raised since bump to
version 5.33.0 in commit 8cedb39764f70f9d467bf0cc1acc99a8bbb963d6:

configure: error: Could not find SSL library, please use --with-ssl-lib-dir option or disabled the SSL support using --without-ssl

Fixes:
 - http://autobuild.buildroot.org/results/b2fe4ecd1d84c3cf7d0eb8f606b20bc6638d6d65

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/monit/monit.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/monit/monit.mk b/package/monit/monit.mk
index ce0f5f0e92..f9d6617a54 100644
--- a/package/monit/monit.mk
+++ b/package/monit/monit.mk
@@ -25,8 +25,9 @@ MONIT_CONF_OPTS += \
 	--with-largefiles
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
+MONIT_CONF_ENV += LIBS=`$(PKG_CONFIG_HOST_BINARY) --libs openssl`
 MONIT_CONF_OPTS += --with-ssl --with-ssl-dir=$(STAGING_DIR)/usr
-MONIT_DEPENDENCIES += openssl
+MONIT_DEPENDENCIES += host-pkgconf openssl
 else
 MONIT_CONF_OPTS += --without-ssl
 endif
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
