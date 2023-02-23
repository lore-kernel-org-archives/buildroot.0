Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 962A4C636D6
	for <buildroot@archiver.kernel.org>; Thu, 23 Feb 2023 16:07:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E54B961B23;
	Thu, 23 Feb 2023 16:07:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E54B961B23
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 86GfGGiDVETu; Thu, 23 Feb 2023 16:07:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C87361B1D;
	Thu, 23 Feb 2023 16:07:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C87361B1D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 95B391BF397
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 16:07:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70E1F41193
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 16:07:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70E1F41193
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m71xDD2UqeNO for <buildroot@lists.busybox.net>;
 Thu, 23 Feb 2023 16:07:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77DA2403C6
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 77DA2403C6
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 16:07:19 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id l1so10797770wry.10
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 08:07:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R3K+Qt70bAno+WhCclRWqRWkWumTbuZJEGrNVHFRoG4=;
 b=R7zQ1kUKOUkAmLFaBVwU7UcNlu373HZ4h7PbIlFJ9jltWRK3TFNTzmYWM6OTEwjORo
 EPC+Lomw9VzxIzLUGyCQtOGfYGdRd9i9Z9aNrFNt6sGgN9bGTgJVXrM9lOcY+U7aTpQQ
 /OaA6FEpKrfMS76wOfzmZi8dsRn0AJ38iR/pYtLGAc6vOxzLw0z7q+wTVVhY3eySUDfv
 Rpu6rE5zIJ8SWPHMVD/XRwsMW1jjqzpxOexXjRn54n5beA8b0zsVKqM17PKwqMPR5ops
 R2qE8DxlqqqoW/F9fAJezLHhzWpGnGqNlUIIWWSKYTkglW39UO6DMXwi59/HeMhwhMCs
 d9pQ==
X-Gm-Message-State: AO0yUKX+42Sp84MwJEc9e/7Pxauzk9sd4OF0KGPygIyxojmNZbqkE/4f
 iP21SgfBvtfVV+mvFQFTKj3op2ZXwos=
X-Google-Smtp-Source: AK7set9hEzfTsIFFOer/LUbcfW/X47wrUWnnhLHGg7g9s50ItoOAfK8KHgEBl72VFm2kvUWpdsxApw==
X-Received: by 2002:adf:fc46:0:b0:2c7:dec:77a7 with SMTP id
 e6-20020adffc46000000b002c70dec77a7mr4253714wrs.71.1677168437207; 
 Thu, 23 Feb 2023 08:07:17 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 20-20020a05600c025400b003e71a6be279sm10247672wmj.37.2023.02.23.08.07.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 08:07:16 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 23 Feb 2023 17:07:14 +0100
Message-Id: <20230223160714.1210026-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=R3K+Qt70bAno+WhCclRWqRWkWumTbuZJEGrNVHFRoG4=;
 b=OTaOmiOilhD0GyhNLecuD5spxXTQ3LQ7hPbqK7sE4bsO9zkdPlD274Z/5ZQkpMEQGK
 uCYQ5M3F8QbJyDvlP7ywk35NQYE6FPivjsPUlVO8GxrHqIrNzpx1yPu3fekUVJLN3nog
 tjBqiXHQuTAyszqt2OYVn6z9TnY7O7pjgPtldKzuFWtCzXQfCb9RUn1fR6NeuxuTMndn
 Jt36ELEyjk9Dykr3aBb0vF6Lxzta9rZCPYbY87BDeLfouoEV2DWumbK00bweJiTmHlmc
 YEeEzgWZ6d/9h5DrdGYp11Ue+LxlxFdYNCeeWzunNVl0uokboexdz283xFQ70pCdzHT0
 ZUZQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=OTaOmiOi
Subject: [Buildroot] [PATCH 1/1] package/xtables-addons: drop
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

Drop XTABLES_ADDONS_DISABLE_GEOIP_HELPERS which raises the following
build failure (probably since the addition of the package):

make[3]: *** No rule to make target '/xt_geoip_query', needed by 'all-am'.  Stop.

unzip and perl don't seem to be needed

Fixes:
 - http://autobuild.buildroot.org/results/f2d596b510f027b94a6b1fad10c363922c50cbec

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/xtables-addons/xtables-addons.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/xtables-addons/xtables-addons.mk b/package/xtables-addons/xtables-addons.mk
index 77dcfd741c..b656ab0e81 100644
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
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
