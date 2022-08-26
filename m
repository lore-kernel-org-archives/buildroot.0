Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E2FFECAAA3
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 06:52:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C584940D73;
	Fri, 26 Aug 2022 06:52:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C584940D73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3UjtrHVluayf; Fri, 26 Aug 2022 06:52:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1B1740C63;
	Fri, 26 Aug 2022 06:51:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1B1740C63
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7C46F1BF8A8
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 06:48:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 44C8840336
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 06:48:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44C8840336
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4Qn8kJjnRXj8 for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 06:48:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40BEE409B6
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 40BEE409B6
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 06:48:20 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id b44so945568edf.9
 for <buildroot@buildroot.org>; Thu, 25 Aug 2022 23:48:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=qNmDKsGCg0ZfOGCqXTSHp317MXZ1a26wupQAgGjN4lE=;
 b=hahjY80O/XSDLG3VrWiIIsaKOXx9Op2yanNz700xWDZLv3zzlU+vDVF7znfmXZEGN0
 WRx8a84yOOkmRnUFt6CsIxmWOy/w3uN3FhQ2yXvIhWzWKe7gwJANUjasuLDnZxsjrag8
 KTTtKiqJsMUwmvht1YgJWefNGS1VXHWEF6jPXgPWybjkp7Kq3iZsgCKoD8GJ7FJNBlGy
 /frFm70XYAhytEjTo4lRUN/Mn1HvuilcxR968DnIOTzFNzDIwJGAo9oqx1vPRgszZa4r
 IxLRl7cL61/ksU/Ksn5qN5h0QnTaeo3wvcmnfdOYg64QwEvuqnJe6p2AiFb65LTHdY9n
 mVFA==
X-Gm-Message-State: ACgBeo3Mc7A/sOKfyykiSOIbw3Dvl+3BfdIBOUwhO99Fq7N9NYY1PEqs
 N7QbEKDBSsupotAV6sQtmbJW8WgiF/0EFM+W
X-Google-Smtp-Source: AA6agR6b9B4Boar8CW+o/RP2y+sOzQ+oT9QkyQQ5XLhIVh5SK9GySOpCITWL/a5zyGPunBbA1v2dyw==
X-Received: by 2002:a05:6402:454:b0:447:59a8:fc7d with SMTP id
 p20-20020a056402045400b0044759a8fc7dmr5795179edw.68.1661496498070; 
 Thu, 25 Aug 2022 23:48:18 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 e1-20020a50fb81000000b00447c0dcbb99sm787613edq.83.2022.08.25.23.48.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 23:48:17 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 08:47:45 +0200
Message-Id: <20220826064758.3968647-17-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826064758.3968647-1-jesseevg@gmail.com>
References: <20220826064758.3968647-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=qNmDKsGCg0ZfOGCqXTSHp317MXZ1a26wupQAgGjN4lE=;
 b=Gebtf7mlVT07NK/vt8WSQEN785GbI86JcU7upUvwX6Tq9bosheJLpmlLllae4srYDc
 Kv9LyJjfgHnA/CfrRni4Ja9YG4DFjP0Bs+q+7WqU23HyUX7P1Isx8s/E8ji+RRZ9LEez
 d3/baNypMPFtlTylHAJ2LtReS3umoK2taXik/qrM1FD+/GeFN9VRWf+nLfwdrHoT5Ipw
 0uLtZLCGqWMUClFr/Uewi89wFy0QxiQ1RUUaRTUhDlX1JqL0DgVJv6F73xNLziXJE+j9
 lAj8NBCYMu3ptXsmN688IUGrbSfem75c4sB1QRt48dLhjp+2OgSkBHhG7G4yNF1W9kKe
 8Yfg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Gebtf7ml
Subject: [Buildroot] [PATCH v2 16/29] package/qt6/qt6base: add qt libudev
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
 "Yann E . Morin" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

---
 package/qt6/qt6base/qt6base.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index aa2def64ae..22034c8b3e 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -96,6 +96,12 @@ define HOST_QT6BASE_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $(BR2_CMAKE) --install $(HOST_QT6BASE_BUILDDIR)
 endef
 
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+QT6BASE_CONF_OPTS += -DFEATURE_libudev=ON
+QT6BASE_DEPENDENCIES += udev
+else
+QT6BASE_CONF_OPTS += -DFEATURE_libudev=OFF
+endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 QT6BASE_CONF_OPTS += -DINPUT_openssl=yes
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
