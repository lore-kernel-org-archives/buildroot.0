Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D63AECAAD4
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 12:56:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12AAB83F26;
	Fri, 26 Aug 2022 12:56:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12AAB83F26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NDx_DGHRxjZ9; Fri, 26 Aug 2022 12:56:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 264B582D96;
	Fri, 26 Aug 2022 12:56:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 264B582D96
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2E2DD1BF27E
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 12:53:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 09AC083EEC
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 12:53:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09AC083EEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R-ZIC0oKMVIq for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 12:53:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4323383EE9
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4323383EE9
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 12:53:12 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id gb36so2958354ejc.10
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 05:53:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=d/SW6JRYX0LXB/9gmAUZAH+BBl9SPM2HW6yOnxJuYOA=;
 b=mQ+WKVomDBWVqE8RnTulbpJZVX/lb4BzYL5Op06VjG1+VeaX/yv+pPE8hcNqPvThgx
 osNWgZwtnj3JE5G4ryPHkXgjRRIFVSsjTqf94hDEBa8/aHyenKmCBTTlbxyrZ+YPL+ra
 GR3VU52uDnhsiHZC/km27RNXOrfY52xN2Q1Q5bIOV99YNG5dOmVGxXgBHnVDkWqDBSf5
 6udMKQVLKScznLYl5d8XQhbS4rIVwIXM3kohlXMxo2PkbM9cOjHtd785m0bgGmSdjJH/
 aHs/1US75jUhGPi1sHdS+aIUfk7O03hQQkEXUl/1RsO+roBAdqhOb0eVbaiMN3kC4VUK
 iHmw==
X-Gm-Message-State: ACgBeo2ndd6fSBlqyXqGpaN1czmIKnmdqrZHkFruWWkeXgddhYGpJV4Z
 HHjW0tw+pkVcnDMc5KKvnH8CAVOLnFw7Yayy
X-Google-Smtp-Source: AA6agR6wwB2OZu6thJv8o+PMSvEXULEH+MhMQUzIFoDqBPnlzyypBEwIBPjMQJOY9rQsH3keMVlPNQ==
X-Received: by 2002:a17:906:8a70:b0:730:9c9e:edb2 with SMTP id
 hy16-20020a1709068a7000b007309c9eedb2mr5324311ejc.41.1661518391341; 
 Fri, 26 Aug 2022 05:53:11 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a1709064d8200b0073923a68974sm829573eju.206.2022.08.26.05.53.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 05:53:10 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 14:52:38 +0200
Message-Id: <20220826125252.16782-16-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826125252.16782-1-jesseevg@gmail.com>
References: <20220826125252.16782-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=d/SW6JRYX0LXB/9gmAUZAH+BBl9SPM2HW6yOnxJuYOA=;
 b=awYO18aga5XQ98gpcwVPXjQ6OnUzPR0hUeq1x1mBLR/E0zIPgYh+6AORlmggu4lu1C
 kaagjTbZJiEJ46JTNATI2J1J45PB4Yd37eJ1xLXqk0qRfqzL3shRUsd/9g57LA8zo37A
 dIKX7t8G09vAkD2QnP8hxlX8Wy82Ca5lDB+8AcCbf6+Bq4cbamMOxVYAQbqamOl27gZa
 YJWkcr4icCga3BwraKNWxm/p6o7+VcLrk6Uc2/gOF8nVlDXTkosqTVlLuCcGQES/xQbZ
 i/WDodlTCU1CmEgtBeVohuQmEYunGrUfMxIAvg8Vzk0RdaS9Ih/q5HlJK5zGIuI7Kr9G
 lpFw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=awYO18ag
Subject: [Buildroot] [PATCH v3 15/29] package/qt6/qt6base: add qt libudev
 support
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
 package/qt6/qt6base/qt6base.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 47512fcab6..3e94eaacb3 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -96,6 +96,13 @@ define HOST_QT6BASE_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $(BR2_CMAKE) --install $(HOST_QT6BASE_BUILDDIR)
 endef
 
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+QT6BASE_CONF_OPTS += -DFEATURE_libudev=ON
+QT6BASE_DEPENDENCIES += udev
+else
+QT6BASE_CONF_OPTS += -DFEATURE_libudev=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 QT6BASE_CONF_OPTS += -DINPUT_openssl=yes
 QT6BASE_DEPENDENCIES += openssl
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
