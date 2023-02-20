Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 106C4C05027
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 09:17:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D82660FC6;
	Mon, 20 Feb 2023 09:17:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D82660FC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qiEv5Elrs9qt; Mon, 20 Feb 2023 09:17:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9D0260FAC;
	Mon, 20 Feb 2023 09:17:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9D0260FAC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6CB951BF403
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 09:17:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4781C400F6
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 09:17:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4781C400F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HX2cWW-7nMCQ for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 09:17:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28E60400C1
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 28E60400C1
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 09:17:44 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 iv11-20020a05600c548b00b003dc52fed235so316918wmb.1
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 01:17:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+/jvSKrtLgyc4iAVri8r9S4TOvYZiXL3gZEIY0qDEio=;
 b=sdXS0e9o2YGKAa2YKvMgTFaSGtnwxkkKOf07e/VUKZMWUXBA1wMeCdVlOMFi9Q9iL5
 Ooa02r1ATFO/GVWDSWMiImKq32vu+ggBxW+y9+fQOdDtm8rhmrkN6scSt88x8RRnRGv2
 uVsJOiG/8r+NFvKHsNC8rtRCyvy3cx7Y2yEwaIfXBaXxCzq6rYgsttM3NymHUoMV/ajC
 KMtL93XN7vvssWGOw/xdXLBUnB1Cq0j5YqbVNmTJsuyGUD4wgQrcRArFxhAcc8t6t52G
 T6Rxe2M+urvwK1dgYEDwBqL6Q1GQ3X7ZcwU/T/eGG8IM0yCS4ep/P0k2KmCr4za0uIMk
 QXfA==
X-Gm-Message-State: AO0yUKWE4Uf6tB/FtzQ2XZr7feMz1vxyVe97CjOjZReRKSMu9g7Ja27Q
 vMhJtV7FvtOHR4ceguh191uOddR4NwM=
X-Google-Smtp-Source: AK7set+idF63TOptK2rQY743UKUnI5W4lfyAgy7szAm6nuFpisNf3juCu+D8RxW6NNs7NJ8ZwhdhBQ==
X-Received: by 2002:a05:600c:1da5:b0:3e2:1dac:b071 with SMTP id
 p37-20020a05600c1da500b003e21dacb071mr243134wms.13.1676884662589; 
 Mon, 20 Feb 2023 01:17:42 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 g2-20020a5d4882000000b002c55521903bsm4052689wrq.51.2023.02.20.01.17.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 01:17:42 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 20 Feb 2023 10:17:39 +0100
Message-Id: <20230220091739.13107-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+/jvSKrtLgyc4iAVri8r9S4TOvYZiXL3gZEIY0qDEio=;
 b=q8HwJYHNQT+fvZOGrYfd8asgHndmvnTqYfRhD8N/tCa6fnrvLEmeTPxUPY72t8YvNE
 G4QYbWwyCqBhF73v3JoWH60c8Kv6Smijouhjs92HfPeGHq/NtjjstGSU8YQ/+7Uol1ZM
 p/WV4DJ58TAbTvVXNuPMTSDpZaMDfBE5BhAjE6A0LDtbLpn2CemBBbOBikGI0jBQZk97
 bbV5YrtZh8CHrYfeCoIoTjZFE/uLteO3CHDO8QVfDgIJrmbKyJOA2hwiuYDrCUz2SAKI
 Qf9sLNQrJ+L60qf13WinzmElUB4lSFAshyD7LOEgQud+lFRtxY7rRs2j5SVKFJYrxOMS
 wWUQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=q8HwJYHN
Subject: [Buildroot] [PATCH 1/1] package/zabbix: set --with-libpcre2
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
Cc: Alexey Lukyanchuk <skif@skif-web.ru>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Set --with-libpcre2 to avoid the following build failure raised since
bump to version 6.2.7 in
commit 89fa774a191d41ed5d125d87d812ff3478902251:

configure: using old pcre library by default
checking pkg-config is at least version 0.9.0... yes
configure: error: cannot find pkg-config package for libpcre

Fixes:
 - http://autobuild.buildroot.org/results/701b343b3b0d471c75899b61d02bd9d63a272247

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/zabbix/zabbix.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/zabbix/zabbix.mk b/package/zabbix/zabbix.mk
index db9efed78b..0d6c579f4c 100644
--- a/package/zabbix/zabbix.mk
+++ b/package/zabbix/zabbix.mk
@@ -15,6 +15,7 @@ ZABBIX_AUTORECONF = YES
 
 ZABBIX_DEPENDENCIES = host-pkgconf pcre2
 ZABBIX_CONF_OPTS = \
+	--with-libpcre2 \
 	--without-sqlite3 \
 	--enable-agent \
 	--disable-agent2 \
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
