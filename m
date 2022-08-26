Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAADCECAAA3
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 12:54:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6178081261;
	Fri, 26 Aug 2022 12:54:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6178081261
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OJqRbReeiEfy; Fri, 26 Aug 2022 12:54:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9168A83EF6;
	Fri, 26 Aug 2022 12:54:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9168A83EF6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 70FCD1BF27E
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 12:53:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5994A83EEC
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 12:53:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5994A83EEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EaG81pCEsAAb for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 12:53:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83B0B83EE9
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 83B0B83EE9
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 12:53:05 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id gb36so2957759ejc.10
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 05:53:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=02f+DaRMsn9nZGR8pOE7oaQnPXhfAUEVH6zzIplolAo=;
 b=7sUB2MnSMyFCr7qnC5GV/KhbM5V9d1FDaM6TU7LfGx1j7LTt2atDzIzRp7refrjjt0
 ubre97D/sFBcQgMaFUfDzG/zOwAD5tLLXFnAQnpMvDunN7T91LM5/w2A/OACAqy380L6
 OS9HwOJt5Rfww/a5UJ40jg5uq0ah4kmbqj/VYd23XCMR1S8utQBvcJ7JKsjYbLVw2LqS
 EuTYrnfxTrJXVer7/CyUjqBr+xYGod0vmqKPxaDuBmwXi5DLwRcwsCpuVQepqh7gsHgk
 S9gwozkd7y9dFs9JtORFeYpoKllory3qpwPo/ImhHtNN0AEqPY4b97tk8dZBIUu5t6pG
 mxxg==
X-Gm-Message-State: ACgBeo0QWobuoUNab008/P5zMjU2Lv6Sgh0WTC+kuGLRNnhuR7nt0V0Z
 RP+dsvANDHM5HtpX9Tu4uI7SJbJ+UtJsCAqi
X-Google-Smtp-Source: AA6agR7cxd4MJri12caRSAEC+2ssPCsSBOdJCv6Z1sNuP4xgqXmJhnSdfbzi9Zx1MGXlvID2hF3KiA==
X-Received: by 2002:a17:906:794c:b0:73d:be5b:2b51 with SMTP id
 l12-20020a170906794c00b0073dbe5b2b51mr5441698ejo.88.1661518383318; 
 Fri, 26 Aug 2022 05:53:03 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a1709064d8200b0073923a68974sm829573eju.206.2022.08.26.05.53.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 05:53:02 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 14:52:30 +0200
Message-Id: <20220826125252.16782-8-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826125252.16782-1-jesseevg@gmail.com>
References: <20220826125252.16782-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=02f+DaRMsn9nZGR8pOE7oaQnPXhfAUEVH6zzIplolAo=;
 b=hChWVTpZn3b6XMCcQRPxb5r6NDDcZkeTqWJ7DHeTliz3JwHuHW8Itv/qAfgid+cC+J
 NnmO0sFrqZ6oiqzIZITgVKGpBPM1WZxVQD26hCLR9h3pqKN1uj3JgNLFDJyk7KfF3hbZ
 F/ipo4vBTMDra+F14o/fDo0o4hGzUmgl7L5MVlQmkMJV+DI1yRexNYGY4rxAS1ImnTtP
 BCm4JP53I31JDKZed6bRM2pWm6KyiH6Ki/a6+84M/5DUhZFhrQ89vbQCdgcpQR3V8zDg
 0lrCLeGYdhELHO9OnHrKRc3+9zLqZHRNYth0Apd+2+EXLFOs7/fcnLU9hogHpvYGptYg
 Uc2w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=hChWVTpZ
Subject: [Buildroot] [PATCH v3 07/29] package/qt6/qt6base: add support for
 dbus module
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
---
 package/qt6/qt6base/Config.in  |  8 ++++++++
 package/qt6/qt6base/qt6base.mk | 11 +++++++++++
 2 files changed, 19 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index 354e02280a..2d4a4df223 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -22,6 +22,14 @@ config BR2_PACKAGE_QT6BASE_CONCURRENT
 	help
 	  This options enables the Qt6Concurrent library.
 
+config BR2_PACKAGE_QT6BASE_DBUS
+	bool "DBus module"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU
+	select BR2_PACKAGE_DBUS
+	help
+	  This option enables the D-Bus module.
+
 config BR2_PACKAGE_QT6BASE_NETWORK
 	bool "network module"
 	help
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index fd1e0a2847..fdb3377eb4 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -77,6 +77,17 @@ define HOST_QT6BASE_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $(BR2_CMAKE) --install $(HOST_QT6BASE_BUILDDIR)
 endef
 
+ifeq ($(BR2_PACKAGE_QT6BASE_DBUS),y)
+QT6BASE_CONF_OPTS += -DFEATURE_dbus=ON
+QT6BASE_CONF_OPTS += -DINPUT_dbus=linked
+QT6BASE_DEPENDENCIES += dbus
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_dbus=ON
+HOST_QT6BASE_DEPENDENCIES += host-dbus
+else
+QT6BASE_CONF_OPTS += -DFEATURE_dbus=OFF
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_dbus=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_QT6BASE_NETWORK),y)
 QT6BASE_CONF_OPTS += -DFEATURE_network=ON
 else
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
