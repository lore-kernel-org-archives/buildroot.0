Return-Path: <SRS0=vKZi=NQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E2AAC432BE
	for <buildroot@archiver.kernel.org>; Wed, 25 Aug 2021 22:01:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E63B361052
	for <buildroot@archiver.kernel.org>; Wed, 25 Aug 2021 22:01:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E63B361052
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B37EB80CC7;
	Wed, 25 Aug 2021 22:01:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id guk512BIIsKd; Wed, 25 Aug 2021 22:00:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39D2480D02;
	Wed, 25 Aug 2021 22:00:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0951A1BF2FA
 for <buildroot@lists.busybox.net>; Wed, 25 Aug 2021 22:00:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ECD2A80D02
 for <buildroot@lists.busybox.net>; Wed, 25 Aug 2021 22:00:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k24qZOdpudLT for <buildroot@lists.busybox.net>;
 Wed, 25 Aug 2021 22:00:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EF15880CC7
 for <buildroot@buildroot.org>; Wed, 25 Aug 2021 22:00:49 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id x12so1550126wrr.11
 for <buildroot@buildroot.org>; Wed, 25 Aug 2021 15:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QkjTPF6dIpAed3QK3uzUo5u4kvM0F5h5Grq25AWMDks=;
 b=inHU1peHtbBnfrb8b2dH/PSCWaArvDuWRQhceA82SgEpLftPaj/oOea9D9wNYTQM3b
 YUSIX+ZeTmDJ6tvPY4X42mtn+Cl6jqNGv4IZ0KsEeFzdz7gXewMXYqKCNn37iGm9nIle
 TAliiPnpaR4g1vW9yjefLauF3ZbGwgTRLT567TGQQrQ3UtszPu9Xqxu04wjIbFy4OMfS
 iF1XZIOq8NPiu6ktjMbadMYl5X/qa8OWiJNvF/d8fL83AVeyS50uOA3SXeJmBbXktAW4
 TL6HiuefeqLNcvxXTN7nWF9grEBNyzYdBwo3gL4r3dX+DojlWFZmF9fxTfvdWQUoOft4
 0bhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QkjTPF6dIpAed3QK3uzUo5u4kvM0F5h5Grq25AWMDks=;
 b=maRoWndHJW1U25fj0rV8FMMPhanHNwBTmvxS9/902xFc929bwMjmwpGlmomXa8FOXz
 YO939rPhFBP9OxXZ1N1lEft2VyY5uLvcoSYIOC0W/KGHQZHZ7gP3xBGHxmGAp+6zLwi8
 8IEcrcoLxgJIwAFu3RrPE2ILmbqpoSeTEefZXr0WvIYpbYXQHt11yylh4QeM4lES7fSk
 b4vdBOmhHauoNCn3FfUPftnTzeHhrbEJo7scjYIy8zbLE8dtNtGD7xroXdMtgU0RuqI/
 g2eFc4i677IOwifBoZ8fnosiuoI96KZhuoKRByAB39GdI69tH0yFKR/lnWQRqYu+F0BG
 TbmA==
X-Gm-Message-State: AOAM533NdPcadpTrgs6UkmV6D9ykLT994l+iwgyI1zBZtnb+zQitrZv3
 ib9Ng+snff+ofv2zaqQXr9dSvEW84m0WiQ==
X-Google-Smtp-Source: ABdhPJzDjobHcfxWeLRB3YYvRZfCq/Iyl/860OMXHWnOgn9WqxSyBR07DPQjAwFVPBsPVJX0qqUoTg==
X-Received: by 2002:adf:ce8d:: with SMTP id r13mr328481wrn.18.1629928847791;
 Wed, 25 Aug 2021 15:00:47 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id n4sm1349223wro.81.2021.08.25.15.00.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 15:00:47 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 26 Aug 2021 00:00:38 +0200
Message-Id: <20210825220038.7757-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2, 1/1] package/ushare: fix build without msgfmt
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
Changes v1 -> v2 (after review of Arnout Vandecappelle):
 - Add --enable-nls and move GMSGFMT to this new block

 ...-t-build-po-files-if-NLS-is-disabled.patch | 47 +++++++++++++++++++
 package/ushare/ushare.mk                      |  9 +++-
 2 files changed, 54 insertions(+), 2 deletions(-)
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
index a4c9711600..df9da223ec 100644
--- a/package/ushare/ushare.mk
+++ b/package/ushare/ushare.mk
@@ -18,7 +18,12 @@ USHARE_CONF_OPTS = \
 	--sysconfdir=/etc \
 	--disable-strip
 
-ifeq ($(BR2_SYSTEM_ENABLE_NLS),)
+USHARE_MAKE_OPTS = LDFLAGS="$(TARGET_LDFLAGS) $(USHARE_LDFLAGS)"
+
+ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
+USHARE_CONF_OPTS += --enable-nls
+USHARE_MAKE_OPTS += GMSGFMT="$(HOST_DIR)/bin/msgfmt"
+else
 USHARE_CONF_OPTS += --disable-nls
 endif
 
@@ -31,7 +36,7 @@ define USHARE_CONFIGURE_CMDS
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
