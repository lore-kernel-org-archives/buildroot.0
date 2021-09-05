Return-Path: <SRS0=j1wI=N3=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CF88C433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Sep 2021 19:51:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B26F60C3E
	for <buildroot@archiver.kernel.org>; Sun,  5 Sep 2021 19:51:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0B26F60C3E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC6B36079A;
	Sun,  5 Sep 2021 19:51:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4FJkjie6DexU; Sun,  5 Sep 2021 19:51:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43D716078B;
	Sun,  5 Sep 2021 19:51:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 18BF31BF3F9
 for <buildroot@lists.busybox.net>; Sun,  5 Sep 2021 19:51:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 033046078B
 for <buildroot@lists.busybox.net>; Sun,  5 Sep 2021 19:51:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RwS1B9UySR73 for <buildroot@lists.busybox.net>;
 Sun,  5 Sep 2021 19:51:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1A85E60786
 for <buildroot@buildroot.org>; Sun,  5 Sep 2021 19:51:42 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id x6so6537882wrv.13
 for <buildroot@buildroot.org>; Sun, 05 Sep 2021 12:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4bYsQoe0gagKhs/3AOAj4rLvbD1Ah8wdkIlMIFif4wI=;
 b=kJoY3rjNa3tNUpzwf8ci0WyvpzSpgk70R4Q/KbLsrJK5O4zmA36Ux7XL3BIrN0d6dT
 FNlIUqxVKwEhplSLaadocUicniGLSBsSEuEXILy6taRz5ICq39jwC4bzfqNj2XNAtOkX
 5cO0W1R+eLyx+T9aCju8vfBB8OFp8dulunA0r49o29ZT/0bmubal/cIAcXsBvMGmwlmm
 x/bGK5XTqrab/P3h6Vz9t0TIr84QPJgwCiDQFWAdqFxhu+L+Na9BVzNScipAuH8LYQGF
 sRsPhD1nNEck+uSelCKhJxd6ML+otgvz9yrNAg9TbCzWEhstmwsj8UOP/VZo1HOXI3JL
 V2Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4bYsQoe0gagKhs/3AOAj4rLvbD1Ah8wdkIlMIFif4wI=;
 b=sDvV7oLUWVjS0i8yN5FrAdek/n8bmuAqYyHPIUr76Is9zlWxrZU1EF4wsHShO8WqeT
 qWSUcQ4Kz7miEaP1rIlsrJ6WufEOti+0czjE4x78+6ubpWOnW61lahHnJcO5XLRMGfMY
 1dybPi78ajR1O/1Op7trVqYj60Ufg14yw8fGOJvOEFCFHOmpLB3CcxFTj3MO/hRbisVw
 WRVLZEbdAMgcGXu8NwJhHlrKEA0CHalB3DMOlMWPta9yRC6VEFMAhyr7DHKfuisF7S/b
 PjjVBtA96/bKH3Db5DpLbku1Z+ewM1hk8klJNU/nKVvXRfOqchrdMvRwDsSE9ZhPJgqc
 CVAw==
X-Gm-Message-State: AOAM532IOvXBtoO2ow1VQQHS7gzRx1JoBQWE6pqMxf3bKQgCybDJs7gc
 YnxNg/dB8jR8j/pJ1aGKFZrBrN+JCxNNkQ==
X-Google-Smtp-Source: ABdhPJxb/lXlQpyhRkipSR2qlH/YX6UdOA2p8DCLn5PLcjvIZ7wWSW1NH6b8kjD837Y1WHWPwi6lAQ==
X-Received: by 2002:adf:e887:: with SMTP id d7mr9516290wrm.79.1630871500213;
 Sun, 05 Sep 2021 12:51:40 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id o5sm5675843wrw.17.2021.09.05.12.51.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Sep 2021 12:51:39 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Sep 2021 21:51:28 +0200
Message-Id: <20210905195128.1485052-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pulseaudio: needs xdg SELinux module
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

xdg is needed (and can't be make optional as it is unconditionally used
in pulseaudio.fc) to fix the following build failure raised since commit
bf44a11cf67fde4ba96928a2a4196103b7ec4ef3:

 Compiling targeted policy.33
 env LD_LIBRARY_PATH="/tmp/instance-0/output-1/host/lib:/tmp/instance-0/output-1/host/usr/lib" /tmp/instance-0/output-1/host/usr/bin/checkpolicy -c 33 -U deny -S -O -E policy.conf -o policy.33
 policy/modules/apps/pulseaudio.te:44:ERROR 'attribute xdg_config_type is not declared' at token ';' on line 317285:
 #line 44
	typeattribute pulseaudio_xdg_config_t xdg_config_type;
 checkpolicy:  error(s) encountered while parsing configuration
 make[1]: *** [Rules.monolithic:79: policy.33] Error 1

Fixes:
 - http://autobuild.buildroot.org/results/818219c0f722080d9f6ef778fdc50e34dd4187ab

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pulseaudio/pulseaudio.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index 372cd98da8..a238315778 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -11,7 +11,7 @@ PULSEAUDIO_INSTALL_STAGING = YES
 PULSEAUDIO_LICENSE = LGPL-2.1+ (specific license for modules, see LICENSE file)
 PULSEAUDIO_LICENSE_FILES = LICENSE GPL LGPL
 PULSEAUDIO_CPE_ID_VENDOR = pulseaudio
-PULSEAUDIO_SELINUX_MODULES = pulseaudio
+PULSEAUDIO_SELINUX_MODULES = pulseaudio xdg
 PULSEAUDIO_CONF_OPTS = \
 	--disable-default-build-tests \
 	--disable-legacy-database-entry-format \
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
