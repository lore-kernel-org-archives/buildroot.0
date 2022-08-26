Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B07CFECAAD5
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 12:55:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53D1D61108;
	Fri, 26 Aug 2022 12:55:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53D1D61108
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AhHLlfrQWT4x; Fri, 26 Aug 2022 12:55:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D08C610AF;
	Fri, 26 Aug 2022 12:55:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D08C610AF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 222D61BF27E
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 12:53:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F14E5404BB
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 12:53:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F14E5404BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n4Br_e_oYmvq for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 12:53:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E1EF40192
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3E1EF40192
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 12:53:10 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id d21so3004246eje.3
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 05:53:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=rGentBfKr2DO7z/4iNZKS3fO/hHFN/7xiiXMu+95K0k=;
 b=n8cSSE9xuEt4ylakekmdWmfQl+XbrVpEPt5dbWPlUgq8/Iu+4rSWIDZgw/82BOdFhj
 Tz6+34kqdsr3oEoqb7731EpBp4pzXHhUhaaAh4kZ9UWI9g0AfndNC03+8Sz3RDjQue94
 gOnWx0bKfE65DbA6H0LdBt19SRvWQBNCrDkYGzRDZykzcyi1dAc1dXtNq4Zs83Y1ujKn
 wqQWEM1yfKzV0+9H4WXV9VXHTa5ed8IBG8L2cvVzdHlGdu7aWsfeTT9BDPd9R1+AoQWN
 RKPPAW5e20cM+Ral/8TPKgQ5LrqV7wsOmkDeB5SPqEZGzOv+VxZ/2Z5V7BmXpChi+peQ
 02oA==
X-Gm-Message-State: ACgBeo1mBD3phvsfTxb+rVHtZOAIzm6eKx/Pj5kte19w0AdQVtC5ofq9
 SK++ioau+CyFhBXCJf5K7+z8MVI2lMY0YCuB
X-Google-Smtp-Source: AA6agR7qSgwYd31QNHFv4FR4TFsE5dz1ixfr7ikdWaBF11PGKkmlckZKgF5tcYveLn/uQ+S5SvOayw==
X-Received: by 2002:a17:906:9749:b0:730:aaee:30e2 with SMTP id
 o9-20020a170906974900b00730aaee30e2mr5401218ejy.248.1661518389326; 
 Fri, 26 Aug 2022 05:53:09 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a1709064d8200b0073923a68974sm829573eju.206.2022.08.26.05.53.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 05:53:08 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 14:52:36 +0200
Message-Id: <20220826125252.16782-14-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826125252.16782-1-jesseevg@gmail.com>
References: <20220826125252.16782-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=rGentBfKr2DO7z/4iNZKS3fO/hHFN/7xiiXMu+95K0k=;
 b=o19pxLititT4J/rRL840FTj/I8fcmEqYLYwxCbamYcsA7qYfj8Tw0KqjLfmEyTN/FX
 Go1vyo6pXpHSliHFgPcRi0w7GOnKVR6nObOrIqnnNwJhSDCIPaByoo+iE/C6bedCAN1J
 TGuE5Q1MpqchEVxZ0aL31GdGmZkoZytOsBxyZU10rkQwX15hzWSKSvfCXg9w7tNh/b/P
 ye8TzU+3PEGDqANgtgnOOAXmxSUYjBj2amNfPa68DRYlEcRAbglv9j+biRFmQdhdUIt7
 9f9B6Lcx6VRvWWWcnc9jHUK/lp1KtO/DfYYaBLCbSewx5mqHVMl4q2dFCFKNnSE2MsO7
 fdUw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=o19pxLit
Subject: [Buildroot] [PATCH v3 13/29] package/qt6/qt6base: add support to
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
