Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 373EFECAAA3
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 06:48:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2702610B8;
	Fri, 26 Aug 2022 06:48:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2702610B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m0APzFuceriG; Fri, 26 Aug 2022 06:48:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB513610B5;
	Fri, 26 Aug 2022 06:48:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB513610B5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0B1941BF8A8
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 06:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DABFB400F1
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 06:48:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DABFB400F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P_VLYUTGIgMp for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 06:48:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CCF5140012
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CCF5140012
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 06:48:05 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id sd33so1371178ejc.8
 for <buildroot@buildroot.org>; Thu, 25 Aug 2022 23:48:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=NxebDutCwxPwbg903hwZYGp2v0G2t86cxjVEBW0jOwM=;
 b=r6PnWNaLgIhPWX62esfEGSh2R1dOtU+nJFQFV+ud/0fz0iyyznSaBHU3NpDMxxyjzy
 hV+RqnJjLspJ7tOmggAz+hkawdQGiUCYy6aw1CXdaWQ3cFJwzRePSiDUf/Btjl0EyZmc
 lkNFm4jwdyMCTricxq0qqTagXKe18Osyl/hsNqPdRQ41PxIOgMGKii1bHOBh01YFkfrM
 GX7dO/tu139cm6KTB073u6fBo8tbHDPGpySN1gWo2uJ8/TCOursZZjxNBCbbv5sOiq1m
 yVLspO2620dg/bIbG0rw33UbZzNG/4PyXt3nWmh1t1iLmXbw7qNmNBiX29ftCeHwwHBt
 NJVw==
X-Gm-Message-State: ACgBeo0amPRtEHrECt0hGRWjjBEhgcXvpyz0TbGc53ajanjVyabjh79A
 e3lq9rSqdLPatPhOGhV1AIzqb4GqmO0zcLFO
X-Google-Smtp-Source: AA6agR618J4mgfzGw3EpUq4iLD/i23PN1v7lOJfs04qxuSTpvLzpczxQ1e8EK/Q1h665INwQIfrHbQ==
X-Received: by 2002:a17:906:5387:b0:73d:af6c:6830 with SMTP id
 g7-20020a170906538700b0073daf6c6830mr4638226ejo.400.1661496485029; 
 Thu, 25 Aug 2022 23:48:05 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 e1-20020a50fb81000000b00447c0dcbb99sm787613edq.83.2022.08.25.23.48.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 23:48:04 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 08:47:32 +0200
Message-Id: <20220826064758.3968647-4-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826064758.3968647-1-jesseevg@gmail.com>
References: <20220826064758.3968647-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=NxebDutCwxPwbg903hwZYGp2v0G2t86cxjVEBW0jOwM=;
 b=LItnw85rs0HslJFQ+Cn1V1uAO78eAX5EubOcHKv9fmqGdi4LUIcMMAcJfBt3vQNHAE
 6fgBlInmR0fJ1sL9ia2rSFLxGsrmjdX6eLxGUd7zZzUz0gN5VXV5qGgfcw4vyae6g+L5
 UHFVsu1Su00gLUfniYU+eEOh8fHcfyYiF6k3EXny0o9WRAijnV8mExKFLYGycqfvTVvh
 oTnqn6y6kGU772QmwVhWGmbsQS4pXolypYnzINbpO/g8ZbpsONnbxWO4fMmn58nPZfD0
 WozPVcyY0P/f0DvK7srlWnRsHwYxtzh3GAUvjIJuHyInTCM81B5jXhvwnEwgj6TuYukW
 XFTA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=LItnw85r
Subject: [Buildroot] [PATCH v2 03/29] package/qt6/qt6base: add support for
 network module
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
 "Yann E . Morin" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

---
 package/qt6/qt6base/Config.in  | 9 +++++++++
 package/qt6/qt6base/qt6base.mk | 6 ++++++
 2 files changed, 15 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index a489ce39fc..68bca728e2 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -14,3 +14,12 @@ config BR2_PACKAGE_QT6BASE
 	  QtWidgets, etc.
 
 	  http://qt.io
+
+if BR2_PACKAGE_QT6BASE
+
+config BR2_PACKAGE_QT6BASE_NETWORK
+	bool "network module"
+	help
+	  This options enables the Qt6Network library.
+
+endif
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 7a0838b2bc..b4b6450bf1 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -77,5 +77,11 @@ define HOST_QT6BASE_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $(BR2_CMAKE) --install $(HOST_QT6BASE_BUILDDIR)
 endef
 
+ifeq ($(BR2_PACKAGE_QT6BASE_NETWORK),y)
+QT6BASE_CONF_OPTS += -DFEATURE_network=ON
+else
+QT6BASE_CONF_OPTS += -DFEATURE_network=OFF
+endif
+
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
