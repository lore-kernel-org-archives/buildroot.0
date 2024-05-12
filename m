Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90757C25B4F
	for <buildroot@archiver.kernel.org>; Sun, 12 May 2024 20:19:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A49C081A1C;
	Sun, 12 May 2024 20:19:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mxj7Y2jpEyGi; Sun, 12 May 2024 20:19:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8C9D816F5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8C9D816F5;
	Sun, 12 May 2024 20:19:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DE8811BF3E0
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 20:19:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB2A4402F7
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 20:19:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id adXdcEjMosTL for <buildroot@lists.busybox.net>;
 Sun, 12 May 2024 20:19:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B04B4400D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B04B4400D8
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B04B4400D8
 for <buildroot@buildroot.org>; Sun, 12 May 2024 20:19:09 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2e2c70f0c97so44367931fa.0
 for <buildroot@buildroot.org>; Sun, 12 May 2024 13:19:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715545147; x=1716149947;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FIFKYJtyxPJNDIYV9We0gPoQ7aJSVgrSXvWp7sveWjk=;
 b=G7F5/5mgm/PyJrlIMK3Hd3T8ghsCVWPvrOiIJzBzhLux+SFTVyzUtwV+71mz+ZFVJx
 4aR6Qoq66LbV4Xp7eS62Hoo+4uFQYFJxNhHMJ6/FnXwzhGtZCEbXnJfcRrrRi3DMoU+Z
 iKJ8bCq6kWRLa8f2q9/MrzvudfX1gtA6/wSq/ExY3VYKjbyp1oeyJJjini3rx7P1JmCO
 GfZr0uNRfFsCak5RDVHQQc9gwpLhR/x7ZNsdqmJoUwG5SyrJllqxgbehx2c4WzaS6UHz
 iKen8xeeY7q4yZLmDNLTLS7lHdpEhvAiTokxhzeO8YL/zc38wKu5E2cYt6MOxP5Ie4BS
 NWWQ==
X-Gm-Message-State: AOJu0YzHl3PJvkAYOHyKlDS5Y+AUdbjihbYWMPOVzmDkjiHKTplL+7mI
 sWTNtPgiCdG357zlVp1vRH+0niaHE+16jbV3s0Avd/bEIT4k1CI8svzwMqnN
X-Google-Smtp-Source: AGHT+IFACe9tqrJ1RRy2tok+eOPGRjdIiIq7lGSR1wRKIiph2vNKsCWQeN68dmr2sefVngEK7ojW+A==
X-Received: by 2002:a2e:720d:0:b0:2e0:69b4:d655 with SMTP id
 38308e7fff4ca-2e51fe52731mr52143801fa.3.1715545147301; 
 Sun, 12 May 2024 13:19:07 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e4d1515580sm11400791fa.79.2024.05.12.13.19.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 May 2024 13:19:06 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 May 2024 13:45:49 +0200
Message-ID: <20240512114617.2564569-2-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240512114617.2564569-1-roykollensvendsen@gmail.com>
References: <1924535>
 <20240512114617.2564569-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715545147; x=1716149947; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FIFKYJtyxPJNDIYV9We0gPoQ7aJSVgrSXvWp7sveWjk=;
 b=ZqnQ00smTf3wi0WJd6SbYVfg0ZpKs6JAneJthxI6XzFLUEQ0B5ZN5Sf1nTHOeCtYAo
 I4odXNfgaqHJ1MJ6K+hBGCVO9GZqQW4ZMBygoH5R8nwAFigEwR6F/qMhfdXPhb/Jm27Z
 OWcEqGdeRxiLvTgL4RjiTD09v02EnC954tKCBzWCVeoq2ojf6yCLzC2au9G+aEHKtNdj
 gjuAZOWBXrY/dD5EhqyE381GPYBaR6YFyvgHfEyxyop7tm91d+V5nQ1kaq5F4Qxpmk8F
 zHvLKigKeoWDAQ2lMwSR+QKcgU7kFmQ13OFI4PwFMkGyZ59Za8/7BSwG4oREcNFVTbMv
 1XTg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZqnQ00sm
Subject: [Buildroot] [PATCH v3 02/14] package/qt6/qt6base: patch
 CVE-2024-33861
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
Cc: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Jesse Van Gavere <jesseevg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>

Got patch from:

https://download.qt.io/archive/qt/6.7/
Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
Changes v2 -> v3:
  - Add this new patch to the series since a new CVE fix was recently uploaded
    to the Qt 6.7 downloads site.
 
 .../0001-Fix-CVE-2024-33861-for-Qt6.7.patch   | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/qt6/qt6base/0001-Fix-CVE-2024-33861-for-Qt6.7.patch

diff --git a/package/qt6/qt6base/0001-Fix-CVE-2024-33861-for-Qt6.7.patch b/package/qt6/qt6base/0001-Fix-CVE-2024-33861-for-Qt6.7.patch
new file mode 100644
index 0000000000..f016788017
--- /dev/null
+++ b/package/qt6/qt6base/0001-Fix-CVE-2024-33861-for-Qt6.7.patch
@@ -0,0 +1,36 @@
+From 7f88945625f560796c86a267086f163e74c1407b Mon Sep 17 00:00:00 2001
+From: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>
+Date: Sun, 12 May 2024 07:15:32 +0200
+Subject: [PATCH] Fix CVE-2024-33861 for Qt6.7
+
+Signed-off-by: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>
+Upstream: https://download.qt.io/archive/qt/6.7/CVE-2024-33861-qtbase-6.7.diff
+---
+ src/corelib/text/qstringconverter.cpp | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/corelib/text/qstringconverter.cpp b/src/corelib/text/qstringconverter.cpp
+index b5749843..fd45ccf2 100644
+--- a/src/corelib/text/qstringconverter.cpp
++++ b/src/corelib/text/qstringconverter.cpp
+@@ -1954,7 +1954,7 @@ struct QStringConverterICU : QStringConverter
+         const void *context;
+         ucnv_getToUCallBack(icu_conv, &action, &context);
+         if (context != state)
+-             ucnv_setToUCallBack(icu_conv, action, &state, nullptr, nullptr, &err);
++             ucnv_setToUCallBack(icu_conv, action, state, nullptr, nullptr, &err);
+ 
+         ucnv_toUnicode(icu_conv, &target, targetLimit, &source, sourceLimit, nullptr, flush, &err);
+         // We did reserve enough space:
+@@ -1987,7 +1987,7 @@ struct QStringConverterICU : QStringConverter
+         const void *context;
+         ucnv_getFromUCallBack(icu_conv, &action, &context);
+         if (context != state)
+-             ucnv_setFromUCallBack(icu_conv, action, &state, nullptr, nullptr, &err);
++             ucnv_setFromUCallBack(icu_conv, action, state, nullptr, nullptr, &err);
+ 
+         ucnv_fromUnicode(icu_conv, &target, targetLimit, &source, sourceLimit, nullptr, flush, &err);
+         // We did reserve enough space:
+-- 
+2.45.0
+
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
