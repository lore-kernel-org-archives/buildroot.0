Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A926AC64ED8
	for <buildroot@archiver.kernel.org>; Fri, 24 Feb 2023 09:25:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E54781EA8;
	Fri, 24 Feb 2023 09:25:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E54781EA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LCrnuJ7DCMdb; Fri, 24 Feb 2023 09:25:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90EC481E92;
	Fri, 24 Feb 2023 09:25:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90EC481E92
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 19ED11BF2C8
 for <buildroot@lists.busybox.net>; Fri, 24 Feb 2023 09:25:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F2BDB81E92
 for <buildroot@lists.busybox.net>; Fri, 24 Feb 2023 09:25:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2BDB81E92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LI46OO8q5n7V for <buildroot@lists.busybox.net>;
 Fri, 24 Feb 2023 09:25:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4FD08175E
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C4FD08175E
 for <buildroot@buildroot.org>; Fri, 24 Feb 2023 09:25:39 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id j3so8996577wms.2
 for <buildroot@buildroot.org>; Fri, 24 Feb 2023 01:25:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZXj8lInWi92E7FxYUAgki8hJ82X7Svgcpit1KovNIMY=;
 b=Fkwvg+/96hz7hfYoblXpSyjLty9CKnOAHh3WlZi8IjEIst7LNWb9EyRo2n5+Vvy0BW
 owz6PaQSBDM6pRihA6gwZ4xMtltZrxeTU0ExTFbtCIB620Wk3B/MPjGl82kG3wh831ZI
 FSetAHIvHEIQilZU6UxluZz6tqKQ+A0CwZiqTTFIYm2tGnTAVX/DBL37x/Pfbp43djtJ
 k2SlKZ8qV2pw4IYdGB2wmP7H1m9cveHx8yPj/GeMYw9boZ8wJhLUT9Phq/p35DpgJ3QV
 k9BZp8ZdaIJQeqKHgtH0XY1mHhkA5Glf1/glOjxIIZnUJjMyuawm8vJwg1uwcnRgIBsJ
 w5RA==
X-Gm-Message-State: AO0yUKWhsM3nZJoQiiiHRvomrAv+omOIf24rsZDpPlZGPYwOdCIDeSiq
 K5321nk5IsHefj7WyChm7TmB8EA2n6o=
X-Google-Smtp-Source: AK7set+C7VB3ClEgT5R48NJ2xdDTQRYCOI66EkFqK4FqCCnw7Z01EuzE0LM74hqEXQuoQivtUe3waw==
X-Received: by 2002:a7b:c8ce:0:b0:3eb:248f:a13e with SMTP id
 f14-20020a7bc8ce000000b003eb248fa13emr511353wml.22.1677230737587; 
 Fri, 24 Feb 2023 01:25:37 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 r126-20020a1c2b84000000b003db0bb81b6asm2174293wmr.1.2023.02.24.01.25.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 01:25:37 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Feb 2023 10:25:35 +0100
Message-Id: <20230224092535.306646-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZXj8lInWi92E7FxYUAgki8hJ82X7Svgcpit1KovNIMY=;
 b=JR2SpZHBSbuf/rHesp1lyyyTPbwHmWM1QLSJ22aEEGn7SKxYmtKmX1IfWvIC/OL6o+
 nUVMI0ScQ/5KIc62/HLlKhKIssysCVXTjxlaPFWtnqKKQpbo1xMS+hpRoe+NIO14OJPV
 ifqbWgUOvnChR51mkaWDtYHdSo1ZOEuBTmvHp78siy2zHOuxZOIjJDNL9Xnm1lEEIy1E
 u5jpw4Oslsz1Cfth0hnzIcPxHeqouQXMWHNJFJtwEheWv0qxIFFdKOpGCwp6fdGvdk47
 YpPfjZbeOzDS3Y/YJyRgXmIttkg0Iq88itfXnGXacnrNZ1kvD6e4yE3J2ZPVdCnQ0hvW
 lABw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=JR2SpZHB
Subject: [Buildroot] [PATCH v2, 1/1] package/xtables-addons: replace
 XTABLES_ADDONS_DISABLE_GEOIP_HELPERS
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

Replace XTABLES_ADDONS_DISABLE_GEOIP_HELPERS by
XTABLES_ADDONS_REMOVE_GEOIP_HELPERS to avoid the following build failure
raised since bump to version 3.22 in commit
53f2999edfa5e67923d4d8a102c15fa3200e089c:

make[3]: *** No rule to make target '/xt_geoip_query', needed by 'all-am'.  Stop.

Fixes:
 - http://autobuild.buildroot.org/results/f2d596b510f027b94a6b1fad10c363922c50cbec

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Add XTABLES_ADDONS_REMOVE_GEOIP_HELPERS

 package/xtables-addons/xtables-addons.mk | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/package/xtables-addons/xtables-addons.mk b/package/xtables-addons/xtables-addons.mk
index 77dcfd741c..e794538956 100644
--- a/package/xtables-addons/xtables-addons.mk
+++ b/package/xtables-addons/xtables-addons.mk
@@ -16,12 +16,6 @@ XTABLES_ADDONS_CONF_OPTS = \
 	--with-xtables="$(STAGING_DIR)/usr" \
 	--with-xtlibdir="/usr/lib/xtables"
 
-# geoip helpers need perl with modules and unzip so disable
-define XTABLES_ADDONS_DISABLE_GEOIP_HELPERS
-	$(SED) 's/ geoip//' $(@D)/Makefile.in
-endef
-XTABLES_ADDONS_POST_PATCH_HOOKS += XTABLES_ADDONS_DISABLE_GEOIP_HELPERS
-
 define XTABLES_ADDONS_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS)
 endef
@@ -30,6 +24,15 @@ define XTABLES_ADDONS_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) DESTDIR="$(TARGET_DIR)" install
 endef
 
+# geoip helpers need perl with modules and unzip so remove them
+define XTABLES_ADDONS_REMOVE_GEOIP_HELPERS
+	$(RM) $(TARGET_DIR)/usr/bin/xt_geoip*
+	$(RM) $(TARGET_DIR)/usr/libexec/xtables-addons/xt_asn*
+	$(RM) $(TARGET_DIR)/usr/libexec/xtables-addons/xt_geoip*
+endef
+
+XTABLES_ADDONS_POST_INSTALL_TARGET_HOOKS += XTABLES_ADDONS_REMOVE_GEOIP_HELPERS
+
 define XTABLES_ADDONS_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_ADVANCED)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK)
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
