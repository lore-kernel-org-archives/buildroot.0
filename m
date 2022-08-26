Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC2D8ECAAA3
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 12:53:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A51F81261;
	Fri, 26 Aug 2022 12:53:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A51F81261
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xeRWJzha2Y14; Fri, 26 Aug 2022 12:53:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9853781252;
	Fri, 26 Aug 2022 12:53:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9853781252
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 19E201BF27E
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 12:53:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E939983EED
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 12:53:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E939983EED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o7KEwfSmQMLT for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 12:53:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1486383EE9
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1486383EE9
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 12:53:01 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id og21so3009181ejc.2
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 05:53:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=fQr1n6fMjoFlK5JUkkRsnY87tBvb6HRYnhwowQuimHQ=;
 b=Qpc3Fw4G6VL9NsG3QplleoNU7rRkb3hP1VXA3Sc8XRmg1ICCRKZL0tzvB0qxIq0b3L
 3f/3ssFX9NmPfx3wli4ywJd7AUjgn4rD+m9xzvsChfcatM1CnQYG+n3iurMxwZHxYbBa
 dghaJh9mZP9qy0LZ2doKpvJv86TLtmCikR4/5GW0JfqLFCbgmgw8uYQAxES0msgwqfkC
 JLUsySB6aKSmLi3Yy47iUFbAEdoO9vuPKmCcvEW8xelBsyZVTsUbuqJGMCCmY09lD3uu
 xsfrh9qsWZvO17U1lsbJGN0pEesFzS6i5N2R3V4zhcgtBesvI5PWO0mJi1CeNu66WXFS
 ZC4A==
X-Gm-Message-State: ACgBeo2jiyC3d7ixzwJDfQw8Z/gvPoTp32a9yiLQP0bYG8deFTN4diZ9
 fGPK6OT/93QgtWP2KDb3EGefuqG/n4V0513Q
X-Google-Smtp-Source: AA6agR6eOmY0KYXmtKZtiIx7JsBa0ClsE2uQcRd+m/u7KK/nVZGTLqssRRggb9BCVq5t/J2toy++DQ==
X-Received: by 2002:a17:907:6d1a:b0:73d:95a5:1170 with SMTP id
 sa26-20020a1709076d1a00b0073d95a51170mr5476559ejc.163.1661518380208; 
 Fri, 26 Aug 2022 05:53:00 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a1709064d8200b0073923a68974sm829573eju.206.2022.08.26.05.52.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 05:52:59 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 14:52:27 +0200
Message-Id: <20220826125252.16782-5-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826125252.16782-1-jesseevg@gmail.com>
References: <20220826125252.16782-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=fQr1n6fMjoFlK5JUkkRsnY87tBvb6HRYnhwowQuimHQ=;
 b=UEQuM+jjr2cwvLopfGxDhRhhXA6IR3QuYuGx8sQIosS8ICCBhfq3HQhqHXDdYY9KjI
 QxBIlPnQo3hs9M+nQy05sd2kUg5akf6KAasSvHhRnAjUTWXafcDokNdPt6nBiy7SGqnW
 gKV48uX/FHwGf68VLMNhsb6c9bT8O+aqUn7RSXHNOWe8eNp8zRtL2d83hKUhUKKTNv/d
 dF8RBnGA6kd+p7I3h3E7Kj30KEOspTexrv/lNbgUlEk9o4e79ikEkZ8tztXDjiy0MD28
 l61WcnxhDTTBuTT8zOsdFD0N6X6swfVlylk0KW1Y5RIQHU2RCLfxSBRV0LPUZsQMOgPc
 hqbA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=UEQuM+jj
Subject: [Buildroot] [PATCH v3 04/29] package/qt6/qt6base: add support for
 concurrent module
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
 package/qt6/qt6base/Config.in  | 5 +++++
 package/qt6/qt6base/qt6base.mk | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index 68bca728e2..fe488f1cc9 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -17,6 +17,11 @@ config BR2_PACKAGE_QT6BASE
 
 if BR2_PACKAGE_QT6BASE
 
+config BR2_PACKAGE_QT6BASE_CONCURRENT
+	bool "concurrent module"
+	help
+	  This options enables the Qt6Concurrent library.
+
 config BR2_PACKAGE_QT6BASE_NETWORK
 	bool "network module"
 	help
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index b4b6450bf1..302aecab31 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -83,5 +83,11 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_network=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_QT6BASE_CONCURRENT),y)
+QT6BASE_CONF_OPTS += -DFEATURE_concurrent=ON
+else
+QT6BASE_CONF_OPTS += -DFEATURE_concurrent=OFF
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
