Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71BA9C433EF
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 10:02:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1076140577;
	Sun, 23 Jan 2022 10:02:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Oz9RE3Xv2o3x; Sun, 23 Jan 2022 10:02:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B6BA140572;
	Sun, 23 Jan 2022 10:02:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6029C1BF57F
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 10:01:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4EAD540866
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 10:01:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tFlOvKGy-Pfl for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 10:01:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 86D1640863
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 10:01:41 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id c66so20927565wma.5
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 02:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=95eP8WYNq5c0hCAIa7GS0V9G93OmuLW3/qYKDqH4b6I=;
 b=OV41MlChWANuDQFQJFJAu6gV92N0Ww4N/uIjcwqx/6c0hi9RpJ3J4R+rIoBccNs2Ag
 zEY6DtpmcGJpq+t/PSY0WKjVSbsKu7BXipKKHWH1OG4zoZL2hFht6cMXRm5yRd7139F5
 MqT8NtdhPmT+p5N5ReZI3Qa5ns4Bu13T6OiXuphUtL4DAUrg0bDL2VsgItaol5R3ARHq
 s7EnnJMwvz+yHwqITfc9oI8Iq+pD3CzI4tPX7QH95KLZXfVZeUNL3JbEAmf8APsHt1ZJ
 gE1QTdLzWOljzQ3XT+wP3LQLQhq52L1w7xjne2YIMzjzgXiYZSzspCy/K1/ftCz1ko8U
 XR1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=95eP8WYNq5c0hCAIa7GS0V9G93OmuLW3/qYKDqH4b6I=;
 b=ji2w9YPMwDLhu0Isl27ohJ8HqDsfRrOC6MArtVejQTSiclkR6NPIciKhjR8D9B+UIk
 QqDRwnVsr7adLrb55lRsqxCUWawaq+smaF3n1fp6ySmAW/AlG27OLfLvDh4wUj7iZwk1
 o8smbj3X2jpmXvbnNY5xvVi/PxHEOehN7RWah1CqlN5S9/CE0ycQ5F2+o4s5K/RcUtzp
 E0xJyFr85d2u4t8ZNvhLomFjUgS36wSxMUcZVsB8trKWNzf2PgEyuLVIh5uloEaus6QF
 sewxrguIsPw9Vme//mvqKrrZlv6K4mkVX+MkxcggAAzeOXQVBqc/ZNVP5konSAHkeb2g
 0slA==
X-Gm-Message-State: AOAM5337qpeobtHRH4tIm9AxTJaw65fivYU9LNZuT4/XCTBd1MKfZBSV
 Dz2M1eC3ER7s+/Yw0GXdJcjjzFsTK6I=
X-Google-Smtp-Source: ABdhPJwlWRn8BeHyYnAxXILlBocYBpqXhZ2AisIkDDerXjWcOgHYwfMDwA+yy+tfneM7a4xm789/Qw==
X-Received: by 2002:a05:600c:252:: with SMTP id
 18mr6495739wmj.189.1642932099776; 
 Sun, 23 Jan 2022 02:01:39 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id g4sm13021692wrd.12.2022.01.23.02.01.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 02:01:39 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 23 Jan 2022 10:59:55 +0100
Message-Id: <20220123095957.492671-4-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220123095957.492671-1-fontaine.fabrice@gmail.com>
References: <20220123095957.492671-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2, 4/6] package/lighttpd: add maxminddb support
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

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lighttpd/Config.in   | 6 ++++++
 package/lighttpd/lighttpd.mk | 8 +++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/package/lighttpd/Config.in b/package/lighttpd/Config.in
index f3e252d850..9a262dbe93 100644
--- a/package/lighttpd/Config.in
+++ b/package/lighttpd/Config.in
@@ -39,6 +39,12 @@ config BR2_PACKAGE_LIGHTTPD_LUA
 	help
 	  Enable Lua support. Needed to support mod_magnet
 
+config BR2_PACKAGE_LIGHTTPD_MAXMINDDB
+	bool "maxminddb support"
+	select BR2_PACKAGE_LIBMAXMINDDB
+	help
+	  Enable MaxMind GeoIP2 support. Needed to support mod_maxminddb
+
 config BR2_PACKAGE_LIGHTTPD_OPENSSL
 	bool "openssl support"
 	select BR2_PACKAGE_OPENSSL
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 22db1a7348..b2e06c77a1 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -20,7 +20,6 @@ LIGHTTPD_CONF_OPTS = \
 	-Dwith_ldap=false \
 	-Dwith_libev=false \
 	-Dwith_libunwind=false \
-	-Dwith_maxminddb=false \
 	-Dwith_mbedtls=false \
 	-Dwith_mysql=false \
 	-Dwith_nettle=false \
@@ -56,6 +55,13 @@ else
 LIGHTTPD_CONF_OPTS += -Dwith_lua=false
 endif
 
+ifeq ($(BR2_PACKAGE_LIGHTTPD_MAXMINDDB),y)
+LIGHTTPD_DEPENDENCIES += libmaxminddb
+LIGHTTPD_CONF_OPTS += -Dwith_maxminddb=true
+else
+LIGHTTPD_CONF_OPTS += -Dwith_maxminddb=false
+endif
+
 ifeq ($(BR2_PACKAGE_LIGHTTPD_OPENSSL),y)
 LIGHTTPD_DEPENDENCIES += openssl
 LIGHTTPD_CONF_OPTS += -Dwith_openssl=true
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
