Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F4FECAAD4
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 13:58:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A8536111B;
	Fri, 26 Aug 2022 13:58:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A8536111B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QI7yCq1yNaql; Fri, 26 Aug 2022 13:58:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A178061112;
	Fri, 26 Aug 2022 13:58:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A178061112
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 69E971BF5F5
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 13:55:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 434B882FA9
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 13:55:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 434B882FA9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9fY8EzgpOHqj for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 13:55:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79CEB83EF9
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 79CEB83EF9
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 13:55:21 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id s11so2170242edd.13
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 06:55:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=rGentBfKr2DO7z/4iNZKS3fO/hHFN/7xiiXMu+95K0k=;
 b=z8lllRyFkU8i2TfS5CyIdZFsdGk5aZSSYFnGVN9hKNkn4DfiTI1eJQ70N2D7CLnvEB
 caZK3DYbfb4Evh5Jcz5Kt2O97s/B2t8ckFYSzaed3ujC3hWfXw3iKKmvCosnQ7QjUZJc
 omms4hsHNseuifCByToYkqyhy3jz5l24v+Kez3EwC9eWr6JDtZl3afP/BP+y2gazG1iT
 CBANznP/ltyymgYtb8mS7iLVc4LFHXwDpadCv5/SPkdY00Tc59BIOt23br9jGBjR/Bsk
 o3CQmJ6SOx24ZBbWVD48jtYhmpgm9+bGKHJRQ8fGJqRPxQETb/OLPK/GVyZNak07c/ld
 XpZg==
X-Gm-Message-State: ACgBeo3NPvllMhZP1QwOLM6WDzpc76q4s9lbi3BIg5dgThdeH05g72br
 2XMpjQzrlefwXLBq9ursiEzyN6aCKNRI/dhm
X-Google-Smtp-Source: AA6agR7u0GVIXRRJxPkKAttsLxsiM/G3J5NSQmHhWmK2a4JyJEx3J9lupEnVhuwAAxcsu/DBffBf+Q==
X-Received: by 2002:a05:6402:26cf:b0:447:e004:ea40 with SMTP id
 x15-20020a05640226cf00b00447e004ea40mr3055304edd.385.1661522119298; 
 Fri, 26 Aug 2022 06:55:19 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a508d86000000b00446bf462203sm1347928edh.1.2022.08.26.06.55.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 06:55:18 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 15:54:47 +0200
Message-Id: <20220826135503.20612-14-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826135503.20612-1-jesseevg@gmail.com>
References: <20220826135503.20612-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=rGentBfKr2DO7z/4iNZKS3fO/hHFN/7xiiXMu+95K0k=;
 b=Rh5Y39dgu9SuIoxk0nWqOqd/1LB1XiuiDJDOpzg9nQEcGfYaGGhQzAumBmL/PzYChK
 zdFMmBBG2UY7zwVEubrgUqZ2p5ys+lLCASw5U5DYyvzUPc+FKM39MDlv9A/2ht/CD3l2
 yAPS+TTYfmCHOugXzna2ltQpaY32KpZxfRLxvIw41wRMTfIm1pnlMS3ILxDijWcJfHsw
 wHa6pZ8B7sUgDqbM84CxEs3qErpAincqpMKGmLCjrJ3vrmcxijNTtBTtmbhW8TE908Qy
 dtPxbqUa5qQjmkGGjLBkqaTpVTooaYHsVKVvajfJeFgtV7BtQzz8UCIwIJdtve/SSnI6
 YmOA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Rh5Y39dg
Subject: [Buildroot] [PATCH v4 13/29] package/qt6/qt6base: add support to
 link qt to openssl
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
index c04564d132..0826a0be07 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -96,6 +96,13 @@ define HOST_QT6BASE_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $(BR2_CMAKE) --install $(HOST_QT6BASE_BUILDDIR)
 endef
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+QT6BASE_CONF_OPTS += -DINPUT_openssl=yes
+QT6BASE_DEPENDENCIES += openssl
+else
+QT6BASE_CONF_OPTS += -DINPUT_openssl=no
+endif
+
 ifeq ($(BR2_PACKAGE_QT6BASE_DBUS),y)
 QT6BASE_CONF_OPTS += -DFEATURE_dbus=ON
 QT6BASE_CONF_OPTS += -DINPUT_dbus=linked
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
