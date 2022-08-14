Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC1E4C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 23:40:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E72860E21;
	Sun, 14 Aug 2022 23:40:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E72860E21
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BwVVI3rQL3QL; Sun, 14 Aug 2022 23:40:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A12A760C09;
	Sun, 14 Aug 2022 23:40:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A12A760C09
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 656101BF2E3
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 23:39:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E718408BA
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 23:39:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E718408BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MAsGIe6KdxBY for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 23:39:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FC1D40298
Received: from mail-vk1-xa31.google.com (mail-vk1-xa31.google.com
 [IPv6:2607:f8b0:4864:20::a31])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3FC1D40298
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 23:39:28 +0000 (UTC)
Received: by mail-vk1-xa31.google.com with SMTP id q14so2998445vke.9
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 16:39:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=kKzifrhB1BuDjYc9UUgEnj5mj4jDTi2xxbAhG9ghn8Y=;
 b=FKTnsPKeoSGGAertvYDLFoE7jWL6TrzPz8gFLzgAa7FOn3jgpGL1V9hdTZ0XE8EL8b
 gnL9o9F6mL9/sIyw8eBRAlZkcI2O/HhCxrVTfLM3otyNLqMnhK7ptHSM7B5xN/6bwJL7
 RMGUUD98haB/ElWEQHLmY+pJbPzvjhUSQAI2AH0ZijEFq4xl9gzh9mdZYVJ4xDt9PYeV
 37GFBtmG0v+q+//sTqUdbiqD5fLuwA5w6kg0KFgyqarQ/Va+dtih1OUmY4EiGuSVShna
 LEiLb/QJFCZRVo8kcH+afwjVnyd26c+KwbwWoZNhIARA79rp4GDA+gSB/E/7msKqwNYr
 WttQ==
X-Gm-Message-State: ACgBeo0fjdLtvVV2XoE82E0MojPz1S3qFvNukJHVOrknCDvaGpztI2AO
 DKoyenBL4ABY47KtI0xsruYME/ixkaI=
X-Google-Smtp-Source: AA6agR6EFuCxLFw6DmkKOJwNVlyAfls1s12VqNXbsWDrgkgTf0+wbINvSD4Sfy0DG6IJptjP2s5+ug==
X-Received: by 2002:a05:6122:10e8:b0:377:412e:a69e with SMTP id
 m8-20020a05612210e800b00377412ea69emr5300128vko.17.1660520367081; 
 Sun, 14 Aug 2022 16:39:27 -0700 (PDT)
Received: from localhost.localdomain ([191.187.223.18])
 by smtp.gmail.com with ESMTPSA id
 z15-20020ab020cf000000b0038342b58f6csm4037769ual.17.2022.08.14.16.39.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Aug 2022 16:39:26 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 20:38:16 -0300
Message-Id: <20220814233845.2247022-5-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
References: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=kKzifrhB1BuDjYc9UUgEnj5mj4jDTi2xxbAhG9ghn8Y=;
 b=ZPSvARpqfcS5UXsOdWnkrVCtoCiFFboYpCV+lyiPlOsSeUHcBofdlUBgdYYLETfd+j
 dA2GrTt6mIxiW8i99GTR/oG8sFo2xzegs/bdzhT/uUjwq+VJBj+gE214suIc6p3jAPd+
 R64+2tkSRCNVzpkKccQOgyFpU0eCQgX9bA01h5MugQ4PgiEACXXcfPFfIllojYq1MaP1
 /kiu+WMfus5NSHe+VpPeMNr2rXXqETMWwzJz3wdy22Cu1GQidJ6uzhT6NFb5avtvFqvB
 K2GqbRxVgg2lDDTiAEedJ8BjxfyR9wDm5bay5wVU+QWKpVpq54itL283ktrbHIAN49T2
 HWcw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ZPSvARpq
Subject: [Buildroot] [PATCH 04/33] package/ace: fix typo on variable names
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
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

LIBARIES -> LIBRARIES

Cc: Matt Weber <matthew.weber@collins.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 package/ace/ace.mk | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/ace/ace.mk b/package/ace/ace.mk
index 3f7fe5e994..29555eea74 100644
--- a/package/ace/ace.mk
+++ b/package/ace/ace.mk
@@ -15,7 +15,7 @@ ACE_CPE_ID_PRODUCT = adaptive_communication_environment
 
 # Note: We are excluding examples, apps and tests
 # Only compiling ACE libraries (no TAO)
-ACE_LIBARIES = ace ACEXML Kokyu netsvcs protocols/ace
+ACE_LIBRARIES = ace ACEXML Kokyu netsvcs protocols/ace
 
 ACE_CPPFLAGS = $(TARGET_CPPFLAGS) -std=c++11
 
@@ -31,7 +31,7 @@ ACE_MAKE_OPTS = \
 	DEFFLAGS="$(ACE_CPPFLAGS)"
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-ACE_LIBARIES += ace/SSL
+ACE_LIBRARIES += ace/SSL
 ACE_DEPENDENCIES += openssl
 define ACE_CONFIGURE_SSL
 	echo "ssl = 1" >> $(@D)/include/makeinclude/platform_macros.GNU
@@ -51,25 +51,25 @@ define ACE_CONFIGURE_CMDS
 endef
 
 define ACE_BUILD_CMDS
-	$(foreach lib,$(ACE_LIBARIES), \
+	$(foreach lib,$(ACE_LIBRARIES), \
 		$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/$(lib) \
 			$(ACE_MAKE_OPTS) all
 	)
 endef
 
-define  ACE_LIBARIES_INSTALL
+define  ACE_LIBRARIES_INSTALL
 	mkdir -p $(1)/usr/share/ace
-	$(foreach lib,$(ACE_LIBARIES), \
+	$(foreach lib,$(ACE_LIBRARIES), \
 		$(MAKE) -C $(@D)/$(lib) $(ACE_MAKE_OPTS) DESTDIR=$(1) install
 	)
 endef
 
 define  ACE_INSTALL_TARGET_CMDS
-	$(call ACE_LIBARIES_INSTALL,$(TARGET_DIR))
+	$(call ACE_LIBRARIES_INSTALL,$(TARGET_DIR))
 endef
 
 define  ACE_INSTALL_STAGING_CMDS
-	$(call ACE_LIBARIES_INSTALL,$(STAGING_DIR))
+	$(call ACE_LIBRARIES_INSTALL,$(STAGING_DIR))
 endef
 
 $(eval $(generic-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
