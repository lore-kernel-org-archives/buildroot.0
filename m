Return-Path: <SRS0=qqE2=NN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCA2FC4338F
	for <buildroot@archiver.kernel.org>; Sun, 22 Aug 2021 08:58:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AFC36120A
	for <buildroot@archiver.kernel.org>; Sun, 22 Aug 2021 08:58:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5AFC36120A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB247402FA;
	Sun, 22 Aug 2021 08:58:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BzUoR19yyRQP; Sun, 22 Aug 2021 08:58:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 763A4402FB;
	Sun, 22 Aug 2021 08:58:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C538D1BF589
 for <buildroot@lists.busybox.net>; Sun, 22 Aug 2021 08:58:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C101680E1A
 for <buildroot@lists.busybox.net>; Sun, 22 Aug 2021 08:58:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n4w_qwbEg0K3 for <buildroot@lists.busybox.net>;
 Sun, 22 Aug 2021 08:58:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D6ED380E16
 for <buildroot@buildroot.org>; Sun, 22 Aug 2021 08:58:33 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 o39-20020a05600c512700b002e74638b567so1117815wms.2
 for <buildroot@buildroot.org>; Sun, 22 Aug 2021 01:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FDt9hnnSOdKUEJa75zJOR718fngbi/W9XjKmvgFcy9w=;
 b=fuOsTo9fmN6drl+XGh1NVAKFZdWc4HMUBizRR3uwakSfGqQigfoycnR1qGNbX2V6ka
 Lxf0dH43XxWai/gnJtF839xevB0s14+tdS9WVoqdRsBFSnJRTIgshacOie9wPthc4xGF
 ttIVm0g4X6E1lT04lrQK0DVXIhtyVGyN5iq2GAo+UBSvLdwNsIBFJeFJcBH5HrgDIsZk
 K9k9ZZHWHrtdZ71yS4mFBrz9uxXbrJ3GlcgcGNopas3kmGQbi4Ogkg8SoHL+87L3ZOZy
 vFW3AUXOK9dcocwzswVYemp5HxyJq2s3QthilgfZituPt6MOdo391NuLP0Js6FSmLGqP
 9T4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FDt9hnnSOdKUEJa75zJOR718fngbi/W9XjKmvgFcy9w=;
 b=YTbZ1QD0pwlUWJkjpl00uWLENOs1Um8J0Xm3yn1UKmUHf2RRMI8L+AINQp5IM5mk3t
 kmXGTWtp5k1FXFeMJr5wZEyniHvW6a6Aemw8f4PjzBPDvzhQjapC4vVacuCi0C2raNgr
 h2DwlmxdM84TXnevEEKYN87xOpE5VNDDOR/rVUSFTsFHgWBBnn8k4dzmNNN3dx1ZvPgE
 BiSGO4alWTgt/5LSRa/omWwVSchAN03pBDGpTca9xayctQ3wJHXu8Qc0kyOI9F+dBOBI
 VRY+SaFPK8KrJctdBe11L7FBg1EWhrW1woY05noSVWRQh5YLJcP5ca75O6OtpgyKrFad
 /+ig==
X-Gm-Message-State: AOAM530bizeC4KrXWLqPBkRmW9THuHDlaEgTWt+TsPrHlZM4r5+1cq+I
 0nbl/wdxVGmciTZZmyEsLH4hnPG/228bGA==
X-Google-Smtp-Source: ABdhPJx2EcuP4RFxoBz4jxVIsSfBy0MDDphRXkY4GI/oMAO61qZVZnYPbddPQccrjWgzwZ9VKfrFpw==
X-Received: by 2002:a05:600c:35c1:: with SMTP id
 r1mr11452821wmq.101.1629622711738; 
 Sun, 22 Aug 2021 01:58:31 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id s12sm11457460wru.41.2021.08.22.01.58.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Aug 2021 01:58:31 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 22 Aug 2021 10:57:40 +0200
Message-Id: <20210822085740.1770451-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/ushare: fix build without msgfmt
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

Fix the following build failure without /usr/bin/msgfmt raised since the
addition of ushare in commit 74097fd659154499612f21fabeda4e3e7c8fdbfc:

make[3]: Entering directory `/home/buildroot/autobuild/run/instance-3/output-1/build/ushare-2.1/po'
/usr/bin/msgfmt -c --statistics -o fr.gmo fr.po
make[3]: /usr/bin/msgfmt: Command not found

To fix this build failure, set GMSGFMT to $(HOST_DIR)/bin/msgfmt and
don't build po files if NLS is disabled

Fixes:
 - http://autobuild.buildroot.org/results/9f6b5b8f38386135bacd2d8f6e97c1fea77bbe69

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-t-build-po-files-if-NLS-is-disabled.patch | 47 +++++++++++++++++++
 package/ushare/ushare.mk                      |  5 +-
 2 files changed, 51 insertions(+), 1 deletion(-)
 create mode 100644 package/ushare/0001-Don-t-build-po-files-if-NLS-is-disabled.patch

diff --git a/package/ushare/0001-Don-t-build-po-files-if-NLS-is-disabled.patch b/package/ushare/0001-Don-t-build-po-files-if-NLS-is-disabled.patch
new file mode 100644
index 0000000000..f0fa89998f
--- /dev/null
+++ b/package/ushare/0001-Don-t-build-po-files-if-NLS-is-disabled.patch
@@ -0,0 +1,47 @@
+From 977171781f5d49e61b46c0241fb67cbb7d666498 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 22 Aug 2021 10:44:48 +0200
+Subject: [PATCH] Don't build po files if NLS is disabled
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/ddugovic/uShare/pull/12]
+---
+ Makefile  | 7 +++++--
+ configure | 1 +
+ 2 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index ebd8f91..6686cfd 100644
+--- a/Makefile
++++ b/Makefile
+@@ -14,10 +14,13 @@ EXTRADIST = AUTHORS \
+ 	    THANKS \
+ 	    TODO \
+ 
+-SUBDIRS = po \
+-	  scripts \
++SUBDIRS = scripts \
+ 	  src \
+ 
++ifeq ($(NLS),yes)
++SUBDIRS += po
++endif
++
+ all:
+ 	for subdir in $(SUBDIRS); do \
+ 	  $(MAKE) -C $$subdir $@; \
+diff --git a/configure b/configure
+index 4a3efe0..162a776 100755
+--- a/configure
++++ b/configure
+@@ -723,6 +723,7 @@ append_config "LDFLAGS=$LDFLAGS"
+ append_config "INSTALL=$INSTALL"
+ 
+ append_config "DEBUG=$debug"
++append_config "NLS=$nls"
+ 
+ 
+ echolog "Creating $CONFIG_H ..."
+-- 
+2.32.0
+
diff --git a/package/ushare/ushare.mk b/package/ushare/ushare.mk
index a4c9711600..7c7359c385 100644
--- a/package/ushare/ushare.mk
+++ b/package/ushare/ushare.mk
@@ -18,8 +18,11 @@ USHARE_CONF_OPTS = \
 	--sysconfdir=/etc \
 	--disable-strip
 
+USHARE_MAKE_OPTS = LDFLAGS="$(TARGET_LDFLAGS) $(USHARE_LDFLAGS)"
+
 ifeq ($(BR2_SYSTEM_ENABLE_NLS),)
 USHARE_CONF_OPTS += --disable-nls
+USHARE_MAKE_OPTS += GMSGFMT="$(HOST_DIR)/bin/msgfmt"
 endif
 
 define USHARE_CONFIGURE_CMDS
@@ -31,7 +34,7 @@ define USHARE_CONFIGURE_CMDS
 endef
 
 define USHARE_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) LDFLAGS="$(TARGET_LDFLAGS) $(USHARE_LDFLAGS)" -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) $(USHARE_MAKE_OPTS) -C $(@D)
 endef
 
 define USHARE_INSTALL_TARGET_CMDS
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
