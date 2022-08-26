Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7388EECAAD2
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 06:53:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E23A541974;
	Fri, 26 Aug 2022 06:53:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E23A541974
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eoJnmOiu6eMF; Fri, 26 Aug 2022 06:53:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C35EF41964;
	Fri, 26 Aug 2022 06:53:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C35EF41964
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D7F6B1C11A9
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 06:48:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C114B400F1
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 06:48:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C114B400F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fj_YUBRxsBLf for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 06:48:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13C8440012
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 13C8440012
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 06:48:31 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id m1so955955edb.7
 for <buildroot@buildroot.org>; Thu, 25 Aug 2022 23:48:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=ETTBwLRO8s/fk3XwwMsRUSPfbCbrg8l5bZs/SJ54EIM=;
 b=hueaPzlOVdVsboX2uB0akYNaTHQR2itDbGzslo+jGFhtv+azk9vhVLowF1ZjTv26RT
 9JcvPoKBf2iik+bTbI+67m7nSYt4uefZwKFYJ/RsFFoKesPnQyBEL1h+2nZrIZruXxHj
 WtHbLJRYIImz8ynieHCgr0Olx5/Jw3EIdcsWvALZbSYDwfCx1I+eqC/cFojgSW+GkWvi
 uSY4/6d/n3Xc5CHUfNKNBI0v7j83/ODHfrQ00vk/dXpGU0Q5ogvVnKMqnbEYHkEeLofY
 x1+4n0H8cGicD5PMsxCGqIh1geswTI2XweMEIhOn/3WEO8ifmB98oCOajCN7304toZwS
 2OIg==
X-Gm-Message-State: ACgBeo2MrIUPuzfbXtVgEw9zvBNpzlxtK880XNhj3SQ+McFU2x9sLiec
 AUCI07AWlN0ZWXar5k6EqHeTbIwtrArUk0/r
X-Google-Smtp-Source: AA6agR4VNbTbY+L0445Co181DZOvvTK+0KaOI0BM+lHVFLb7TAyb/MJQ9QD+aof/AYDaGAI1l+jGIA==
X-Received: by 2002:aa7:d78b:0:b0:447:d501:14c8 with SMTP id
 s11-20020aa7d78b000000b00447d50114c8mr2360679edq.82.1661496510169; 
 Thu, 25 Aug 2022 23:48:30 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 e1-20020a50fb81000000b00447c0dcbb99sm787613edq.83.2022.08.25.23.48.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 23:48:29 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 08:47:57 +0200
Message-Id: <20220826064758.3968647-29-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826064758.3968647-1-jesseevg@gmail.com>
References: <20220826064758.3968647-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=ETTBwLRO8s/fk3XwwMsRUSPfbCbrg8l5bZs/SJ54EIM=;
 b=fSIPVmCDN6vFceI5rcLQJBRef/tBk0+cYvVKgsfNNAhgxAg4OO0MjoTbnCNEka46B7
 62wfrpElzT9aAlM0x+ZK8g9ViG0yE/1xmeDEindoy+Jw4HQvek9D7Zd69xv9TNVTuJrt
 VHssU4NT9YNHd7EKKJcryh0mSlODlmY/F6E8MU33qa+kWzBaCrzU6MXraYQTU4iqikWv
 fTer/BXacJlkedspYPqyyQ4khIfxOcKxcmSVM2jMJmrJP7cL9qnVdeAj+TFRgBwHDXok
 8Q800hdPvtzOdAurO+nFmb9+rJQn8He19N2t1TtJBz2UOuIBbPF8R/cROMTVrrQg+Zqm
 wEZg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=fSIPVmCD
Subject: [Buildroot] [PATCH v2 28/29] package/qt6/qt6base: add support for
 gui module kms
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
 package/qt6/qt6base/qt6base.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 7f76b195d5..5e9b504b87 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -175,6 +175,13 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_jpeg=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBDRM),y)
+QT6BASE_CONF_OPTS += -DFEATURE_kms=ON
+QT6BASE_DEPENDENCIES += libdrm
+else
+QT6BASE_CONF_OPTS += -DFEATURE_kms=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_QT6BASE_FONTCONFIG),y)
 QT6BASE_CONF_OPTS += -DFEATURE_fontconfig=ON
 QT6BASE_DEPENDENCIES += fontconfig
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
