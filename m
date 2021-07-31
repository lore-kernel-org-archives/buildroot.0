Return-Path: <SRS0=zrjq=MX=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4CECC4338F
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 20:03:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 658BD60F48
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 20:03:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 658BD60F48
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B0776079A;
	Sat, 31 Jul 2021 20:03:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KD5-uiqbRoeB; Sat, 31 Jul 2021 20:03:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 572F660786;
	Sat, 31 Jul 2021 20:03:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 45B841BF83A
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 20:03:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2750A4035A
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 20:03:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qkdjNFaXidEi for <buildroot@lists.busybox.net>;
 Sat, 31 Jul 2021 20:03:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 272564034D
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 20:03:45 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id k4so8037498wms.3
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 13:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uuxi3P3w4+ey0TlkmtIJG5MyR/y1RGILQ7L0PI9Y6hg=;
 b=AwO6Nz8KskXUoyzYAXIRm+pNXWZTM9mN2AzCHdjAdOctyNCWGTZYQCHHPgmH6ywfsg
 Uri6B59tvi2/hPRGgWLdDhSZxcuRlVUNK/7qrXIIWLbE5im6EORLN/O8bUjhBg+ImrWw
 wt5xQIfyXFqxPCB6SEWEnO8zKHlLNxZEr8O3QcVQ99sL1s3jYSDYjCvoBKL95NBr6RC8
 zOYfkdFZIHq3aOZNxgNs55zurxWXY/Vl/yNMR+4uI9hwX8RTUvKbY8VhTVToq135WB7U
 bSi48wRxqcYvMOIxB5/EbdrYTXnZB6grtOmZIH5jUHlN6LHoAJZGj9vNmXAY1K507y6I
 SLbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uuxi3P3w4+ey0TlkmtIJG5MyR/y1RGILQ7L0PI9Y6hg=;
 b=hiWosMEnhsZVxde7GinsHDuCVFjvY5AbJV4Sd+cRoKEp47kd8m1/7t4jYhm5X9kQH/
 ZIfYn2OZL1KFb0A/1Ok+75wySrzzVn7VuWib3Y5spc7El73pLilldQ9iKsoMKikv4P+0
 fU3fa0EfGtiwbcZ5yOe+GeNldzAAoWglz4WBqU5SQZnvjiPCFYLUanigR2V/3fJHgKHh
 M8hjThSMEjwFIa4NYhrsaqJIDHz/gxFTUoEnnawLfSZUu3Q5IbxBxjv5p6MwVfbz+RA+
 hQ20bNzNWn1FfbN5qGqJxdsaafILVqpAffsu7hVqQKF409rjz9382R1k5a0S0ZygavKl
 lw7A==
X-Gm-Message-State: AOAM533BAsoSFa/aKO0u2yzeGZ9RFD68MuuNVCsk+YkT1l28+lLXeq8l
 tHF+KJLBMp6ioDl71RrigDS9S8q0MmZamA==
X-Google-Smtp-Source: ABdhPJwn7BEibQyAmvISkKXRgXp5goPUK7PvqSDkd3g+ijNrefZm532Btd7OzPELWjNXYqXNEHD+oQ==
X-Received: by 2002:a05:600c:4f4d:: with SMTP id
 m13mr9245618wmq.9.1627761822773; 
 Sat, 31 Jul 2021 13:03:42 -0700 (PDT)
Received: from kali.home (pop.92-184-116-174.mobile.abo.orange.fr.
 [92.184.116.174])
 by smtp.gmail.com with ESMTPSA id h8sm5667763wmb.35.2021.07.31.13.03.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Jul 2021 13:03:42 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Jul 2021 22:03:27 +0200
Message-Id: <20210731200327.1235994-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/swupdate: needs dynamic libary
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

dynamic library is needed since bump to version 2021.04 in commit
2c6b0359c3b819fadb4437b2d780e95c32fdab21 and
https://github.com/sbabic/swupdate/commit/f802cfa427686c5c90245ae08da36f4c7e31862f

Fixes:
 - http://autobuild.buildroot.org/results/e4b937c7421024bfcc4fbfa1a90f016134d3307f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/swupdate/Config.in   | 5 +++--
 package/swupdate/swupdate.mk | 9 +--------
 2 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/package/swupdate/Config.in b/package/swupdate/Config.in
index e87f695861..f601e45fcd 100644
--- a/package/swupdate/Config.in
+++ b/package/swupdate/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_SWUPDATE
 	bool "swupdate"
+	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	# swupdate requires a parser and uses libconfig as default
@@ -70,6 +71,6 @@ config BR2_PACKAGE_SWUPDATE_INSTALL_WEBSITE
 	  installed to /var/www/swupdate.
 endif
 
-comment "swupdate needs a toolchain w/ threads"
+comment "swupdate needs a toolchain w/ dynamic library, threads"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index fe967d7fd7..402aa0a91f 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -93,7 +93,7 @@ else
 SWUPDATE_MAKE_ENV += HAVE_LIBWEBSOCKETS=n
 endif
 
-ifeq ($(BR2_PACKAGE_HAS_LUAINTERPRETER):$(BR2_STATIC_LIBS),y:)
+ifeq ($(BR2_PACKAGE_HAS_LUAINTERPRETER),y)
 SWUPDATE_DEPENDENCIES += luainterpreter host-pkgconf
 # defines the base name for the pkg-config file ("lua" or "luajit")
 define SWUPDATE_SET_LUA_VERSION
@@ -185,19 +185,12 @@ SWUPDATE_BUILD_CONFIG = $(@D)/.config
 SWUPDATE_KCONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_SWUPDATE_CONFIG))
 SWUPDATE_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
 
-ifeq ($(BR2_STATIC_LIBS),y)
-define SWUPDATE_PREFER_STATIC
-	$(call KCONFIG_ENABLE_OPT,CONFIG_STATIC)
-endef
-endif
-
 SWUPDATE_MAKE_OPTS = \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
 	CONFIG_EXTRA_CFLAGS="$(TARGET_CFLAGS)" \
 	CONFIG_EXTRA_LDFLAGS="$(TARGET_LDFLAGS)"
 
 define SWUPDATE_KCONFIG_FIXUP_CMDS
-	$(SWUPDATE_PREFER_STATIC)
 	$(SWUPDATE_SET_LUA_VERSION)
 endef
 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
