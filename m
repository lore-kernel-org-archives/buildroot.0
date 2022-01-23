Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C2D6C433EF
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 09:50:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD1FC60B0E;
	Sun, 23 Jan 2022 09:50:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YPOtvT5MllWu; Sun, 23 Jan 2022 09:50:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2893D60AFB;
	Sun, 23 Jan 2022 09:50:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DAB521BF57F
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 09:50:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D749D4067F
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 09:50:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GQsngnBv8-J5 for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 09:50:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 309E64067C
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 09:50:35 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id l25so8089683wrb.13
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 01:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OMfR4oOJ6i5ho+cyFnywMtWFBxtxPpKJT8miuk5s8ak=;
 b=W6l50RX7BxXVeM5IZl9vbvMN9iY3QKVbe7gNbE3gpCNxAUHhC25KtC9IG/roOrronF
 z+eWjjEjhc5IMM1DA5M2wQ8vpEauk/kdWyQx8Rm1GZi8F8Cui0f2MkXhD0/Z1fFKks4b
 WZTkLHWND0V/aCCBMWO8GwhB0AeLZNjYbrCzBhSmObGvi6AtdnOmBoprIp44DhM5pSxY
 U+fVEopRwV0ZQOxVsL67KFtRPQZpyv78K6pSjpXHbglOOc3BE7lx4ORzDYwBBZwDjfZC
 XCMXp2dN9OKeNljDhfVHU4XOhgtG7GzSndWDaBApaZMjRVPdervXWUlD9sQKFBItEoIG
 9xjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OMfR4oOJ6i5ho+cyFnywMtWFBxtxPpKJT8miuk5s8ak=;
 b=McTHMUc/83ax/+meGtwpKt2Ob/rIQ6IIXTbeWQnYE+2Zb6O/rvGJLs32drV//T6a94
 b746CM2K6rfgiBHq8tI2Q1qqmPX8RBhR4pK6eXAywH/uu1Ss1nPpELvgfVD4JPeHRr9a
 EssWXFh0TURfQlhFvLURZbycjsVQU0o/Pf7XZFwkwW5/2L5Sk+mLz8NIm0B0bmbBEgJ0
 FBfuCc9WAn9rQ2gWPHqYxfq8ItbgwpSI3e4svOPCucR21FmO6BSVHrWRv4STGNqremK8
 gebJxLa1FqkB6vnBVNWb/vgqbSSzNo69F0+4D5TacI6DARCmftBvZSkjDWSCpstnTstI
 G9tg==
X-Gm-Message-State: AOAM530oZ5h1+jdxZHFXe8e6dYfANkUvVhKHMlRtKnKHqHN5WmqxYcSG
 JPJazIhltkXLZGjH2w0UYNhKYTXrXsM=
X-Google-Smtp-Source: ABdhPJxfQ9eIvmr1xFv4CLyg5Wy1tWrD/YL/oT6gbvjCwmJkBr/WfP6RJG5KWtlTB2EkgpVa46xsEA==
X-Received: by 2002:adf:9f14:: with SMTP id l20mr10236510wrf.65.1642931433369; 
 Sun, 23 Jan 2022 01:50:33 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id l24sm9773505wme.17.2022.01.23.01.50.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 01:50:32 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 23 Jan 2022 10:48:46 +0100
Message-Id: <20220123094850.491817-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220123094850.491817-1-fontaine.fabrice@gmail.com>
References: <20220123094850.491817-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/6] package/lighttpd: add zstd support
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
