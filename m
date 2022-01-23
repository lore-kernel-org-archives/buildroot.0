Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8ADDC433EF
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 10:01:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90DF08144C;
	Sun, 23 Jan 2022 10:01:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I1i0UcJPoXUt; Sun, 23 Jan 2022 10:01:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA3B981446;
	Sun, 23 Jan 2022 10:01:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 47E121BF57F
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 10:01:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 367D860AFB
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 10:01:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cxnLOqTps8uT for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 10:01:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 926E860AF1
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 10:01:39 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id u15so8110292wrt.3
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 02:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OMfR4oOJ6i5ho+cyFnywMtWFBxtxPpKJT8miuk5s8ak=;
 b=jysFLLrp5ix9V+HcGFZCzOMM32h2vQJaxxhry4N7rV5cKRJzrGXvOqHZbEVD+Pj48A
 GJ+wtPGAT1EzFVAi3gR0VNx5fgQQK55uQZQ5Cn3bnQMLYQ/2qF0Nl3vKQpj98cRLif38
 OQaFxa2HZwAC7e96fJDm1MQHX9ilhVpksH+GPLatzcWZSsAuyuR3yh9L7K7sOmqGp/X+
 leGIf+AA4W5IwGeOlny//UpGkvfriu/6NAkZ1BnW0XrPQMeBx0ZnnSoWhPll8Ep+W6Aa
 eHiCAcmdx6UaqWH9HjbIsyV6bl1a4fiKlTcJMFAHjapCfMYJxLRrihcrNTSQzm/4dI4A
 4WLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OMfR4oOJ6i5ho+cyFnywMtWFBxtxPpKJT8miuk5s8ak=;
 b=dpGEpb7I92+W0NrxkscgcWiEnZKW6XcbN6EZoqrqy/m3n+aiINU04irfTXxX4vo5Az
 QljiYirfVS9blYEil5S4JCwS6wQLHGIqQNXgZoHeBShJy6izxOg/MtRAIcBH67wQwl6V
 W6r+MG6EYEU/eBcQnLqu1j+P9BNAB/aZRHawchpUcGF/mcPY1KnR2LTZxJBvf0n0z6Yu
 WYZWgBxluoGgIIWnBlBKarUYApwdj/BCyF23YWXbnhKvauOOzKolbn+BdXF/+k741ckA
 iKFfsz65ECYltfxjTQowt4RckNB754FpbrMvcjPtQX5ZPfl2vEjZV2TV3XVvWQSKmEv/
 DoVw==
X-Gm-Message-State: AOAM532yZBIB9N8DAa7aXd5jGXYQgQW9/IehHmD51MYk/UdAWXU3jCGr
 vIqCI3/0MzfkFTY/EXioMztFiiYGFmY=
X-Google-Smtp-Source: ABdhPJxNL2zAlYHets5YuDZpAHRZzpTH04+957wBfhGtOsPD89lK2BlqubH8qhzOtbX8LP9cKOW6vg==
X-Received: by 2002:adf:fb84:: with SMTP id a4mr10357565wrr.315.1642932097616; 
 Sun, 23 Jan 2022 02:01:37 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id g4sm13021692wrd.12.2022.01.23.02.01.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 02:01:37 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 23 Jan 2022 10:59:53 +0100
Message-Id: <20220123095957.492671-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220123095957.492671-1-fontaine.fabrice@gmail.com>
References: <20220123095957.492671-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,2/6] package/lighttpd: add zstd support
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
index 59c1e0b2a6..05a7c84961 100644
--- a/package/lighttpd/Config.in
+++ b/package/lighttpd/Config.in
@@ -65,4 +65,10 @@ config BR2_PACKAGE_LIGHTTPD_ZLIB
 	help
 	  Enable zlib support for lighttpd mod_deflate.
 
+config BR2_PACKAGE_LIGHTTPD_ZSTD
+	bool "zstd support"
+	select BR2_PACKAGE_ZSTD
+	help
+	  Enable zstd support for lighttpd mod_deflate.
+
 endif
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index bdbf75191c..4f05db4e29 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -32,7 +32,6 @@ LIGHTTPD_CONF_OPTS = \
 	-Dwith_wolfssl=false \
 	-Dwith_xattr=false \
 	-Dwith_xxhash=true \
-	-Dwith_zstd=false \
 	-Dbuild_extra_warnings=false \
 	-Dbuild_static=false \
 	-Dmoduledir=lib/lighttpd
@@ -92,6 +91,13 @@ else
 LIGHTTPD_CONF_OPTS += -Dwith_zlib=false
 endif
 
+ifeq ($(BR2_PACKAGE_LIGHTTPD_ZSTD),y)
+LIGHTTPD_DEPENDENCIES += zstd
+LIGHTTPD_CONF_OPTS += -Dwith_zstd=true
+else
+LIGHTTPD_CONF_OPTS += -Dwith_zstd=false
+endif
+
 define LIGHTTPD_INSTALL_CONFIG
 	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/lighttpd/conf.d
 	$(INSTALL) -d -m 0755 $(TARGET_DIR)/var/www
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
