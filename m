Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4A9BC00140
	for <buildroot@archiver.kernel.org>; Wed, 10 Aug 2022 21:10:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AB0B404F0;
	Wed, 10 Aug 2022 21:10:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AB0B404F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QFceHmNO2LZW; Wed, 10 Aug 2022 21:10:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE477404CC;
	Wed, 10 Aug 2022 21:10:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE477404CC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 910C91BF40E
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 21:09:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C33040527
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 21:09:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C33040527
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0fvvpw6fqFGU for <buildroot@lists.busybox.net>;
 Wed, 10 Aug 2022 21:09:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB0FE404C4
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AB0FE404C4
 for <buildroot@buildroot.org>; Wed, 10 Aug 2022 21:09:58 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id j17so7401264qtp.12
 for <buildroot@buildroot.org>; Wed, 10 Aug 2022 14:09:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=UrYgUxSPs3WZwICCG7U6fEd0vsEebxzkw9XCqCdiMXs=;
 b=LOGGpOtYxtK7uYojkGDzEhA/14/xHP+JsP/2cTpl3JnSn6u6rprAkpwNW7TuJJM1Tk
 I0fjqXqYh9W5N9sS5eykT6UWqY+gTIZix5sgxea04BEEDy95Gt9nBaBEeKiEcWsipLqg
 KLbY0mSH5qhFTnSWBbfcA44p2FnAhxcVEZWSeNoesHO7fjN1M6Ys0NFofZl69Y3UBfTE
 /EDrxyTRBmvnviNYMYzTXhAQU++WXZrR42Tj1OGoxX+tZXq4JdyYA9ZsBwYBMHz4SKY0
 gMwg0JArDQ5GIi/G0C+g1f/pPdyu1YtNYuzk6Va9Py3ACbB6cjtb3xFj3VSbBdkZZ2lF
 yzWA==
X-Gm-Message-State: ACgBeo05n2PuoreXQ5hSobf5VCZdyzu4xLLDJMqFqL73CaJbCnnR2ZfW
 /09qpoDpLxe3/rBw7CDuDu6AgXxKsxA=
X-Google-Smtp-Source: AA6agR4bM3BVi+A11vyMliT4jfTZwIIBk8VUSk/3nsIp5AMSedVhCfmgsHp+G1jwyMAbH4VNv/z0hw==
X-Received: by 2002:a05:622a:1d1:b0:33b:71bc:a081 with SMTP id
 t17-20020a05622a01d100b0033b71bca081mr25961675qtw.325.1660165797070; 
 Wed, 10 Aug 2022 14:09:57 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 bn36-20020a05620a2ae400b006b633dc839esm565184qkb.66.2022.08.10.14.09.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 14:09:56 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Aug 2022 14:09:53 -0700
Message-Id: <20220810210953.2294547-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=UrYgUxSPs3WZwICCG7U6fEd0vsEebxzkw9XCqCdiMXs=;
 b=jrczvQdeJ9aJgUHhOjIeZ1vBYXmk4KmuZymj6k5vPtJtmhyWYe7SNI32VKXS1Y5be+
 l979F4o4yOpuc74T4vx7GUdabB8NOPpoLCxv9Dcv9YQsKF1vxCj5nXUXpmPpo3SwMJfO
 FRUjHVDZ2TfbgFJUf+MwNMNVoLBSZJBSdXBEgLIkYTVZ0867GFcsISXJJQ+XlbJXABoz
 DBgmsRJ2gDUnjAhzODmyzhsbCSf0j6GWlKgbBqGitTPSyVgBNf5+Gs/F3FaRpWbWBEjY
 fX47Mu9WFCR07nh/ZTe4Au9muF2x4uCbRSlq/llntYK0F4M9QQ81I7jFK61+4EA2auIL
 EPwQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=jrczvQde
Subject: [Buildroot] [PATCH v2] package/linux-tools: Allow installation of
 perf scripts
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
Cc: bernd.kuhls@t-online.de, chrismcc@gmail.com,
 Florian Fainelli <f.fainelli@gmail.com>, yann.morin.1998@free.fr,
 thomas.petazzoni@bootlin.com, fontaine.fabrice@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In order to run the full gamut of "perf tests" installing the perf
scripts is required, otherwise we run into errors similar to those:

	failed to open shell test directory: /usr/libexec/perf-core/tests/shell

Make this possible by introducing a new option allowing us to install
perf scripts.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
Changes in v2:

- updated based upon Fabrice's feedback

 package/linux-tools/Config.in             |  6 ++++++
 package/linux-tools/linux-tool-perf.mk.in | 12 +++++++++---
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index 732ac65a2565..0a761191eca0 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -76,6 +76,12 @@ comment "perf needs a toolchain w/ dynamic library"
 
 if BR2_PACKAGE_LINUX_TOOLS_PERF
 
+config BR2_PACKAGE_LINUX_TOOLS_PERF_SCRIPTS
+	bool "enable installation of perf scripts"
+	help
+	  Enable the installation of the perf scripts under
+	  /usr/libexec/perf-core/ which is necessary for running "perf tests"
+
 config BR2_PACKAGE_LINUX_TOOLS_PERF_TUI
 	bool "enable perf TUI"
 	depends on BR2_USE_MMU # slang
diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
index d82d45973cd7..7bba4405305a 100644
--- a/package/linux-tools/linux-tool-perf.mk.in
+++ b/package/linux-tools/linux-tool-perf.mk.in
@@ -159,12 +159,18 @@ define PERF_BUILD_CMDS
 endef
 
 # After installation, we remove the Perl and Python scripts from the
-# target.
+# target unless BR2_PACKAGE_LINUX_TOOLS_PERF_SCRIPTS is enabled
+ifeq ($(BR2_PACKAGE_LINUX_TOOLS_PERF_SCRIPTS),)
+define PERF_INSTALL_REMOVE_SCRIPTS
+	$(RM) -rf $(TARGET_DIR)/usr/libexec/perf-core/scripts/
+	$(RM) -rf $(TARGET_DIR)/usr/libexec/perf-core/tests/
+endef
+endif
+
 define PERF_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE1) $(PERF_MAKE_FLAGS) \
 		-C $(LINUX_DIR)/tools/perf O=$(LINUX_DIR)/tools/perf/ install
-	$(RM) -rf $(TARGET_DIR)/usr/libexec/perf-core/scripts/
-	$(RM) -rf $(TARGET_DIR)/usr/libexec/perf-core/tests/
+	$(PERF_INSTALL_REMOVE_SCRIPTS)
 endef
 
 define PERF_LINUX_CONFIG_FIXUPS
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
