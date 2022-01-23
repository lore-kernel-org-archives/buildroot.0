Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F1CC433F5
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 10:02:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF0058144C;
	Sun, 23 Jan 2022 10:02:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z_sNEaTSKuvg; Sun, 23 Jan 2022 10:02:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7E7681446;
	Sun, 23 Jan 2022 10:02:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7AD141BF57F
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 10:01:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 776DA60AFB
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 10:01:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DElv_299DKtP for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 10:01:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D269B60AF1
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 10:01:43 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 o1-20020a1c4d01000000b0034d95625e1fso17672280wmh.4
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 02:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+Wk9vWMtIu0hHTDwp3oow9+Oq3vfzpJqcIaMIObxGOs=;
 b=hk2UDspYDLTEDHYUDazIwfvhj8z5VCDVUyrUju6yIJ6w3A/PNfxMb6SxZbkVNar26t
 cFXEPqALoGoHTdvXU7EbhqpeLCs44mgyboUplSp9La6/VfvJPNI4dOzSIYGD1piDpPG+
 N+SVj1dElxQxcnQU8+/wIO9su/GJ+AZkYbNWWcKljJ2NJyib3sZPqrwaZtb/qf3wNzqW
 RXoSYXUNJTdcMA9p9a+hYkA0GyJhhz9MyayrP2EipGFnQyBe3co9iz5phWFfCqkaw/ZL
 nNaZ+Z/ksX5fl9n/W3ADht0CM2obc7X4Q2xal0vfO5iuFREtYBOUB0XK7D6MQb0lMPx6
 MPkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+Wk9vWMtIu0hHTDwp3oow9+Oq3vfzpJqcIaMIObxGOs=;
 b=M8//cIGBRqp7qjENn0XqQVTcj63p5a+dKabQ5zYN/t+qf0QUcoXJrH4qgH7xtDLvna
 ycw35C8HYB/PJHFrJFee0NdAocMZssPAVsRJyPE78KO6/QL1Cq7voec0QPtfphh6wg+a
 1rRWfNGJSbTprdlFkjyKzooSm2fe7IcC9qHDFZguvcyTYHKleRMkVpPZAdznVRog48Md
 YVdCqMPq64J+kIA9DthwKAgaFHLapooSBPl9J0i7EXBfHTeNroQz2ZZWUTpRAq6QMlRp
 8PM613bazhYwfd5VqqzWnuNbiXYBiWQziBGcGdtOHZoHl6i5vEIvVE6auCwF7uwo0YJN
 Um6A==
X-Gm-Message-State: AOAM532GgjswTyaCoLyFnfTbZQjHr6gsMt/9RWY3YKlgD0XQdEgwX0jW
 z9aT/vGcGji8zeaj2It20LhkWBdK/Y0=
X-Google-Smtp-Source: ABdhPJwPcgzvueFpzl+Z+vEOs7AMgJkgvipK82hbzmtFTUKQI2SkLwNc2vmFPh1YtNrm8rJe0rqaBA==
X-Received: by 2002:a7b:c181:: with SMTP id y1mr7375120wmi.137.1642932101902; 
 Sun, 23 Jan 2022 02:01:41 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id g4sm13021692wrd.12.2022.01.23.02.01.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 02:01:41 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 23 Jan 2022 10:59:57 +0100
Message-Id: <20220123095957.492671-6-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220123095957.492671-1-fontaine.fabrice@gmail.com>
References: <20220123095957.492671-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,6/6] package/lighttpd: add ldap support
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
Changes v1 -> v2:
 - Fix openldap dependency

 package/lighttpd/Config.in   | 10 ++++++++++
 package/lighttpd/lighttpd.mk |  8 +++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/package/lighttpd/Config.in b/package/lighttpd/Config.in
index 595c50c978..f46e1a9a66 100644
--- a/package/lighttpd/Config.in
+++ b/package/lighttpd/Config.in
@@ -39,6 +39,16 @@ config BR2_PACKAGE_LIGHTTPD_KRB5
 	help
 	  Enable Kerberos5 support for lighttpd mod_auth.
 
+config BR2_PACKAGE_LIGHTTPD_LDAP
+	bool "ldap support"
+	depends on BR2_USE_WCHAR # openldap
+	select BR2_PACKAGE_OPENLDAP
+	help
+	  Enable LDAP support for lighttpd mod_auth mod_vhostdb_ldap.
+
+comment "ldap support needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
+
 config BR2_PACKAGE_LIGHTTPD_LUA
 	bool "lua support"
 	depends on BR2_PACKAGE_LUA
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index a25bb0bfcb..f8ed7c6f7c 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -16,7 +16,6 @@ LIGHTTPD_CONF_OPTS = \
 	-Dwith_dbi=false \
 	-Dwith_fam=false \
 	-Dwith_gnutls=false \
-	-Dwith_ldap=false \
 	-Dwith_libev=false \
 	-Dwith_libunwind=false \
 	-Dwith_mbedtls=false \
@@ -54,6 +53,13 @@ else
 LIGHTTPD_CONF_OPTS += -Dwith_krb5=false
 endif
 
+ifeq ($(BR2_PACKAGE_LIGHTTPD_LDAP),y)
+LIGHTTPD_DEPENDENCIES += openldap
+LIGHTTPD_CONF_OPTS += -Dwith_ldap=true
+else
+LIGHTTPD_CONF_OPTS += -Dwith_ldap=false
+endif
+
 ifeq ($(BR2_PACKAGE_LIGHTTPD_LUA),y)
 LIGHTTPD_DEPENDENCIES += lua
 LIGHTTPD_CONF_OPTS += -Dwith_lua=true
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
