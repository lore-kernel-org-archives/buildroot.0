Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5460EECAAA3
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 06:50:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4A4183E83;
	Fri, 26 Aug 2022 06:50:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4A4183E83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sb35EQU2NLwu; Fri, 26 Aug 2022 06:50:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D956983E8A;
	Fri, 26 Aug 2022 06:50:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D956983E8A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0A24D1BF8A8
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 06:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D85D0409B6
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 06:48:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D85D0409B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G7J-EmZ5krpj for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 06:48:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2CBC40336
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F2CBC40336
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 06:48:14 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id x93so805646ede.6
 for <buildroot@buildroot.org>; Thu, 25 Aug 2022 23:48:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=vnUD8H+p40x0dgu4/HlHo5PKt4exbfSVp890FNUqLCU=;
 b=Cp9Vqh3kvGLAKRSibh8s5vqQhO+tOhCx3p+NdCOYVCCpipZ2vNk8jTG+LnAnL8MMVs
 bQztQ0QWwdCek6I9Lj/Q/OUpBFj6rhW7ELRT+neJ9eY+OKJghysH1nGVh+pApSHUxdIR
 /rgewLXUfiB7zG50tHVRrUuFJ5P1KhINrz2Aw+C5mM1LPlAKaqOYovUjfvGbgEP8Fnjm
 uolvjYyWr4UTe1/6LXJJ8nrvXKkc29/49ozbuQ3tNkQdBHS8/l6P0c2JdwoBEJl8TOUS
 lOZPRtreIB6/4oBpK+Wp6ikpOMCsVH95Jpx4ZN+xfM0CSTRWWXQo4UZcIPid8PAI5VSs
 c3tg==
X-Gm-Message-State: ACgBeo0FWdCtgq3DRhrhJTuY+0xn96hcWfNQjuje2OF4pq2JI7Z09nK4
 YydCC/hicxUv/FVPdS7L5Z9XVU48pfzscIpc
X-Google-Smtp-Source: AA6agR5TlQgS3TISXm9UaCVBWO5oxy4RAMAD9R3ekQiPHTaWv+u/DSH1OfGROgwmf2AQo/miUQsUmg==
X-Received: by 2002:a05:6402:c45:b0:442:c549:8e6b with SMTP id
 cs5-20020a0564020c4500b00442c5498e6bmr5742682edb.123.1661496492793; 
 Thu, 25 Aug 2022 23:48:12 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 e1-20020a50fb81000000b00447c0dcbb99sm787613edq.83.2022.08.25.23.48.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 23:48:12 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 08:47:40 +0200
Message-Id: <20220826064758.3968647-12-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826064758.3968647-1-jesseevg@gmail.com>
References: <20220826064758.3968647-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=vnUD8H+p40x0dgu4/HlHo5PKt4exbfSVp890FNUqLCU=;
 b=GZlPibIg27YWPjYF5ClCykwogqKYB01sa/ggwB8G+RR/DxGcytIt7CorlYr6KOv4wf
 iqNBfUQXqz85fArOJcTmKM6/Z/fLeJ03a2xczI1TxZ42OcUAcRWYYJ03dwL7Ygmk+cWd
 9+W3mWkOBsES7YHSDJpnDzgSO6SQWujVcPPluY4HsMD6oXKpdw4AZV7kPvJAhmBI9B8M
 9UAIbxmfA/YcllbTv/JcwHGZTmUbupVJ18c0Wlx+JVtRZy0aKzUDuQqHlCMIJb6cONMj
 7iKuJG2wNDUIDdLalH6reM0E0qg1pR4kF13tQoxmdibb0AVI45JLD2PoGFNk4gpok+ei
 HMAA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=GZlPibIg
Subject: [Buildroot] [PATCH v2 11/29] package/qt6/qt6base: add qt support
 for zstd when using the package
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
index d7c3e8a592..440617ba74 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -125,6 +125,13 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_journald=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_ZSTD),y)
+QT6BASE_CONF_OPTS += -DFEATURE_zstd=ON
+QT6BASE_DEPENDENCIES += zstd
+else
+QT6BASE_CONF_OPTS += -DFEATURE_zstd=OFF
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
