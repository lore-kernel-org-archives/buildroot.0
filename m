Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42E50ECAAA3
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 12:59:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DAA0F419C3;
	Fri, 26 Aug 2022 12:59:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DAA0F419C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sQCL2d4AZewC; Fri, 26 Aug 2022 12:59:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9762419B5;
	Fri, 26 Aug 2022 12:59:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9762419B5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EE1561BF27E
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 12:53:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C9BDC83EF6
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 12:53:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9BDC83EF6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1_TIPROiHBN9 for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 12:53:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12D1C83EED
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 12D1C83EED
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 12:53:26 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id u9so3001782ejy.5
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 05:53:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=60UBVY2mjkol2dhHjpGxdypDw4unvrhOYjahABaNWdk=;
 b=STrJwtbb+QYUv1EpAwoxt+2d04xLV695/+W6KDijEM9Bxwum3Xdv6VlxquhY3C0dEW
 IDXfxQcdTx9BCFBu6R1DD0RcY0m1npsFwCNaMnmMsoaFyYWuDxKYAAsOeajLUw5gotoS
 qQNepXFRpLrejFnli1rJlsiz4kTF97uFtC+nqmIxU5kmIWhr5jrp7850HOHrbarAcRAM
 uYbt20qg8ckjmn2CG6zBGVYbfDj16CNkwgcRmP6Adv75Mvh+evuozbidSTDINyqojbN1
 iOZlZekIUVHMI3ahoZK4u5c+tzTUsrYFlR1JpSEBdFRxbr2c5JDvmrr0m6/jUzqrUg1h
 gPFg==
X-Gm-Message-State: ACgBeo0WwajYS+ue9gpD+bM9ZRKlymKqCLldAyGDTslyjuBcECuUO90x
 5PDj7Oc0003+IoUXcNuQS1IBokUM/ZaMJ5LH
X-Google-Smtp-Source: AA6agR7c1yTySzt79tKAweJzc6CWPSm9VCd0mws4I3sP4Xo1S8f6abG8CkrP5OdaWHQAMHnARXuKGQ==
X-Received: by 2002:a17:906:eec7:b0:733:189f:b07a with SMTP id
 wu7-20020a170906eec700b00733189fb07amr5431390ejb.230.1661518404841; 
 Fri, 26 Aug 2022 05:53:24 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a1709064d8200b0073923a68974sm829573eju.206.2022.08.26.05.53.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 05:53:24 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 14:52:51 +0200
Message-Id: <20220826125252.16782-29-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826125252.16782-1-jesseevg@gmail.com>
References: <20220826125252.16782-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=60UBVY2mjkol2dhHjpGxdypDw4unvrhOYjahABaNWdk=;
 b=TEfUwV0cLGUoqsbvDs45gIf10S3t2u4kxCVNW1cjL3lsCzG8eXoeqVUaztao92IJ+t
 eQT35tFO+WOI4lO5hBIbQKczWZyOR055w2tNVxclDQCqy6JlboR3MiOlYAc0ZCpKN5yL
 Il0ZAhVzNBUruNgXkq8CKR6fBHWXp2KAAsC6fRNegSols/jyBkIfv6Y/fgkIg4KaHYft
 qPc3V1+9c2dVPQIIuFULOf93xjm127/CgYgTiqJQUEVR3foZ+ECt1MqGI8oGdGUD752u
 W3KnD7UYNUWfP7wHnvRWAPDZc9CRl7jqGVIdeMuBk4AQxvG5rHsOEIEPcYId2A4RkzqO
 ab9Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=TEfUwV0c
Subject: [Buildroot] [PATCH v3 28/29] package/qt6/qt6base: add support for
 gui module printsupport/cups
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
 package/qt6/qt6base/Config.in  |  4 ++++
 package/qt6/qt6base/qt6base.mk | 12 ++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index 648afa78a4..ffa5a56b40 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -146,6 +146,10 @@ config BR2_PACKAGE_QT6BASE_DEFAULT_QPA
 	  target. You can choose a different platform at runtime with
 	  the -platform option.
 
+config BR2_PACKAGE_QT6BASE_PRINTSUPPORT
+	depends on BR2_PACKAGE_QT6BASE_WIDGETS
+	def_bool y
+
 config BR2_PACKAGE_QT6BASE_FONTCONFIG
 	bool "fontconfig support"
 	select BR2_PACKAGE_FONTCONFIG
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 424dc6f754..9b5328e5f2 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -175,6 +175,18 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_jpeg=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_QT6BASE_PRINTSUPPORT), y)
+QT6BASE_CONF_OPTS += -DFEATURE_printsupport=ON
+ifeq ($(BR2_PACKAGE_CUPS), y)
+QT6BASE_CONF_OPTS += -DFEATURE_cups=ON
+QT6BASE_DEPENDENCIES += cups
+else
+QT6BASE_CONF_OPTS += -DFEATURE_cups=OFF
+endif
+else
+QT6BASE_CONF_OPTS += -DFEATURE_printsupport=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_LIBDRM),y)
 QT6BASE_CONF_OPTS += -DFEATURE_kms=ON
 QT6BASE_DEPENDENCIES += libdrm
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
