Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E98C54E58
	for <buildroot@archiver.kernel.org>; Fri, 15 Mar 2024 22:10:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C0BF40142;
	Fri, 15 Mar 2024 22:10:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P9rLkkOWBxd9; Fri, 15 Mar 2024 22:10:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F6BA40289
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F6BA40289;
	Fri, 15 Mar 2024 22:10:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4CAE11BF2BB
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 22:10:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4667440142
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 22:10:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id viORB3nuyEgm for <buildroot@lists.busybox.net>;
 Fri, 15 Mar 2024 22:10:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5B62640025
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B62640025
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5B62640025
 for <buildroot@buildroot.org>; Fri, 15 Mar 2024 22:10:38 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-413ef770149so16725325e9.1
 for <buildroot@buildroot.org>; Fri, 15 Mar 2024 15:10:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710540636; x=1711145436;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wcegl9VfHbQei+pmnhuV2PSAOB2sm6wQc/i99kr5uHI=;
 b=MIi8JaqSAV702nOiCpXEL8PD5kFWsondyrsx/5gK/RXT6TtHErekGv0XY2/124/kCs
 pJ8T8UaWIOHTRU1bfnWWIf8nuYK6Nzut7d/fVBqgde2Bo+dQJJDkStRA0sdwhrdrG0UA
 3M/RGonHhLyVu8aqY/UsOYeed0zhmLMDnkV+FDf70rncad/Akf+Bs3QrVGb/zzPEebyI
 5c7WOn6d06iZR7/l9zg5nT33Ei6SKasfZIW/vMf/9gRN+wxQXFoewbXcoa/Gr3WIeJKN
 TvvTS5a9E40boxTW1qP6X0TWE9AU/IPYP6O6tLHXQAFWnMwXWozuKzkrRh0hruc3JrpF
 Glgw==
X-Gm-Message-State: AOJu0YwaWhEPgaWgBq+pErrQNQR5HJNcCClMEs7NGLkI9Ip8wttdRQfu
 tdPqrv027KnNTkDXBVll4NDWIlIWusEkscMv0ziDVJSccf0HN5wPgNenZuDn
X-Google-Smtp-Source: AGHT+IHkTadEQ7NJnzCtDkVSWRQanhxCYc8OFBc/W+IoX9V4qc4aE/7tZsG2WtdKH94QvIfFgs7bxQ==
X-Received: by 2002:a5d:6583:0:b0:33e:7f5c:a75d with SMTP id
 q3-20020a5d6583000000b0033e7f5ca75dmr3580075wru.57.1710540635920; 
 Fri, 15 Mar 2024 15:10:35 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 t4-20020a0560001a4400b0033e756ed840sm4033165wry.47.2024.03.15.15.10.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Mar 2024 15:10:35 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 15 Mar 2024 23:10:29 +0100
Message-ID: <20240315221029.88170-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710540636; x=1711145436; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wcegl9VfHbQei+pmnhuV2PSAOB2sm6wQc/i99kr5uHI=;
 b=i1GzOv9K5YmlCU3WkVHHRuy4Vi+Tx7Po7eRAAoVZ12mJajVaY/HOdrlCPm9EnhaMjT
 2zQriedD4vl5KdNrl4j1NG5bbV1QLpJUHOVzd3UmSscX4U68h8D5dZWOc1zf0e/P/iEx
 N9FOuyVMfdK8OeHSa8jf/3W/HixuLzktK+OO2iMvN7XA1wrY8gTwmD7KH74rm4oidjoK
 vYViKmnNOJDK5XMtuDo7wvd5nBc1YdRPkRekQrSEVh+MzDJwyxSZFCIhptNugf/BLGNI
 1twO8LDqVTLaPxL3yHDC4gQRkk2EgsIuFt4KLek+PAmCaCfhsXA7s1lvEa+7JGTCvcED
 BEIQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=i1GzOv9K
Subject: [Buildroot] [PATCH 1/1] package/cvs: fix build without editor
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Set default editor to /bin/vi to fix the following build failure when no
editor is found on host:

configure:40833: checking for vim
configure:40862: result: no
configure:40833: checking for vi
configure:40862: result: no
configure:40833: checking for emacs
configure:40862: result: no
configure:40833: checking for nano
configure:40862: result: no
configure:40833: checking for pico
configure:40862: result: no
configure:40833: checking for edit
configure:40862: result: no
configure:40874: error:
    Failed to find a text file editor.  CVS cannot be compiled
    without a default log message editor.  Searched for
    `vim vi emacs nano pico edit'.  Try `configure --with-editor'.

While at it, drop CVS_CONFIGURE_ARGS variable for simplicity

Fixes:
 - http://autobuild.buildroot.org/results/5b8a747698bc2e64eb1f001e87577e86e4cb8d14

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cvs/cvs.mk | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/cvs/cvs.mk b/package/cvs/cvs.mk
index bd1e04eee0..64c15f16fe 100644
--- a/package/cvs/cvs.mk
+++ b/package/cvs/cvs.mk
@@ -18,18 +18,18 @@ CVS_CONF_ENV = \
 	ac_cv_func_working_mktime=yes \
 	cvs_cv_func_printf_ptr=yes
 
-CVS_CONFIGURE_ARGS = --disable-old-info-format-support
+CVS_CONF_OPTS = \
+	--disable-old-info-format-support \
+	--with-editor=/bin/vi
 ifeq ($(BR2_PACKAGE_CVS_SERVER),y)
-CVS_CONFIGURE_ARGS += --enable-server
+CVS_CONF_OPTS += --enable-server
 else
-CVS_CONFIGURE_ARGS += --disable-server
+CVS_CONF_OPTS += --disable-server
 endif
 ifeq ($(BR2_PACKAGE_ZLIB),y)
-CVS_CONFIGURE_ARGS += --with-external-zlib
+CVS_CONF_OPTS += --with-external-zlib
 endif
 
-CVS_CONF_OPTS = $(CVS_CONFIGURE_ARGS)
-
 define CVS_BZIP_UNPACK
 	$(BZCAT) $(@D)/cvs-$(CVS_VERSION).tar.bz2 | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	rm -f $(@D)/cvs-$(CVS_VERSION).tar.bz2
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
