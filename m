Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F485ECAAA3
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 06:50:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3175B610BF;
	Fri, 26 Aug 2022 06:50:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3175B610BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 26EhEtl2GaHW; Fri, 26 Aug 2022 06:50:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91B91610B8;
	Fri, 26 Aug 2022 06:50:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91B91610B8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CA6A01BF8A8
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 06:48:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A5C62610AD
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 06:48:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5C62610AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sR_EVm0rwFi2 for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 06:48:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC9B260B1A
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EC9B260B1A
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 06:48:13 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id fy31so966878ejc.6
 for <buildroot@buildroot.org>; Thu, 25 Aug 2022 23:48:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=jF1qc0InZirXgDKihWV/DelUqU0/WRDoAVL2bbT9X4w=;
 b=FXyY3JOF/299Q3mbevyLjKbYPx+yLDsX+hnRBSkl86sFHumnrG4bKFDwb9pvXv/DHI
 yA5dwzGPGE+YFa07raRc+Z4IxbizBDKiKMXszWobX96fOtjOYrnhc+JuiL5ZL6t1qZcw
 5je2Oz1P58CGmvXFoMfw8FoTu6czXDNVlYq1/CUih1ga5YzKq7u0YooVoqZ9ac1FSt64
 D56ZcKQq+cAHyeCz8c9gt0LL9NX3foSfj/LWLu9CfrUBP/1/oS8crjbGbmsu9dOjvRLT
 wj1yB9JRNy+u1GvVOekcNcfl4vRAzWL/wf8vyUundVlsePYYkH6GS0daMuCtcPwwqb6C
 6JOw==
X-Gm-Message-State: ACgBeo1nqVbgl95WaRXimkK3BCE26vfsBVD8xFJy08RVp7q3b3CASK5B
 Szb0MFt5Doo/1AsYv60Wmlp2OL+sH1q/AT0w
X-Google-Smtp-Source: AA6agR68BumbnWaCX8RIOSnbEzRLR+LLKjNPsztgBRr/1B/n7K2DQf5ldCzI2EYARN5DNctQ40uDQQ==
X-Received: by 2002:a17:906:7116:b0:73d:d0a6:2db8 with SMTP id
 x22-20020a170906711600b0073dd0a62db8mr4226096ejj.123.1661496491835; 
 Thu, 25 Aug 2022 23:48:11 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 e1-20020a50fb81000000b00447c0dcbb99sm787613edq.83.2022.08.25.23.48.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 23:48:11 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 08:47:39 +0200
Message-Id: <20220826064758.3968647-11-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826064758.3968647-1-jesseevg@gmail.com>
References: <20220826064758.3968647-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=jF1qc0InZirXgDKihWV/DelUqU0/WRDoAVL2bbT9X4w=;
 b=eDTQYTxbyK5JmDPecuMEhz8iPUtKUg1bR/y7wXnyBZDYS1h1WNrW3mbbNp/4xJt0ia
 8940bdNvFo/oRsE6VX74oy2eORKEzVipwx5YVQlcOtrp9XqCFKHChj7wP494zD7XV2j3
 m2hU+R7ZMTIusI4s5LRS/ep2SzT2RwnczHFyuD6eRiwwf4fk14+Xgi8Ybt0iR5wS+0wn
 eLKA4ur7ETlFJufVascyxn5c4KDVpWpz143aSadKcvRHO6JPKMSzVYV6dNCY8s1i7cG4
 bDQ1y3cwpJ7wxwAuoJ++qTZxoeM7ajTJEfaSfE5xrVIktwDU1gmQGrjzLZDHyOPPAUIW
 6LuQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=eDTQYTxb
Subject: [Buildroot] [PATCH v2 10/29] package/qt6/qt6base: add qt support
 for journald when using systemd
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
index 7d6a79d00a..d7c3e8a592 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -118,6 +118,13 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_xml=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+QT6BASE_CONF_OPTS += -DFEATURE_journald=ON
+QT6BASE_DEPENDENCIES += systemd
+else
+QT6BASE_CONF_OPTS += -DFEATURE_journald=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_QT6BASE_SYSLOG),y)
 QT6BASE_CONF_OPTS += -DFEATURE_syslog=ON
 else
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
