Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2FFFECAAA3
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 06:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 838F340C2E;
	Fri, 26 Aug 2022 06:51:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 838F340C2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 20hslM5gJIk9; Fri, 26 Aug 2022 06:51:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A6B6640CE6;
	Fri, 26 Aug 2022 06:51:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6B6640CE6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 196C11BF8A8
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 06:48:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7EB3409B6
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 06:48:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7EB3409B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HblEDryTDFnk for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 06:48:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0510F40919
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0510F40919
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 06:48:17 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id y3so1410421ejc.1
 for <buildroot@buildroot.org>; Thu, 25 Aug 2022 23:48:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=YFC/ceAYsNX6x+rgkhO7qYv/NiO5mWwFsnQU8/GOFlg=;
 b=V66cuSdkwYH6Wm6F/UznOW/ay4lQuVYN2sSiW7di2ISd1WHvPMFA+N1PyKzLDOBlCQ
 DcEGb5O9t/b6AfFbwRZ968cTwbgOehoqdAxlaueeIJmnRa2xEDJTUSpMtO7ops01F++f
 fMYv1fKHrf9cITdHMoCuDHUg+8tvjksa25x7sSi9BPfoBE5MycpRPSDwg3rhlIECfeuE
 QSKDtnNTU7KzulFxOcOaZdvrEVZmKTHh8Fx9iCyDT5+uX34YTh4Vz0spsS8p4d6s56Yu
 E8uJGhAW6ki6YP+qKFR5pUdfq2tyZgDpAAkwjZmF4cdTFlFMkySbcfBHMqDEM+pf95oK
 4Ujw==
X-Gm-Message-State: ACgBeo1rEtucofNHDWHP9/pemfqliBrtUk9YBTkxj36NyYDIsATkp3fq
 xSGFJTe7Oki03W1xORljy729R75ECSLzgyKF
X-Google-Smtp-Source: AA6agR5fH+U4c9yRPD9r86cIXIsDu+AtL/6DoiGPUL4DOuNsqHhc/fPhfzLMNLMAw8PbPNR+eAwiqw==
X-Received: by 2002:a17:907:97cd:b0:731:5d0:4434 with SMTP id
 js13-20020a17090797cd00b0073105d04434mr4329490ejc.603.1661496495675; 
 Thu, 25 Aug 2022 23:48:15 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 e1-20020a50fb81000000b00447c0dcbb99sm787613edq.83.2022.08.25.23.48.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 23:48:15 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 08:47:43 +0200
Message-Id: <20220826064758.3968647-15-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826064758.3968647-1-jesseevg@gmail.com>
References: <20220826064758.3968647-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=YFC/ceAYsNX6x+rgkhO7qYv/NiO5mWwFsnQU8/GOFlg=;
 b=PX/8jicVNVpGKbE3/watC9vVKY2ycURAYmSd0v5dpI47tcplpuW+yauinNT7PnmBfk
 ZiK4ptkRMOcEetFEFWx5xfAvyEElf3Hu9igtug7P6rONIxMLPjoipgJrvaPg4f+e0T6Z
 Sf5Jf3oIj6b/3U6xwWSGRrHlT906HRiAMQ35AjZWV7gkjPhTg/o7n1K3h4ITKzZm/S7s
 mdYdwrP79rVi0ZoCpJksb3EabPtPXgkeIjzVnXC021BXuhN+mTBD3hX3olcN9+v7Et2c
 7yS/j3YpboaZjJVlkYHKHAe/X8fyLn45BVMnIqKmUb672BHt/18s0ycPY+twjpr76LR4
 m7Hw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=PX/8jicV
Subject: [Buildroot] [PATCH v2 14/29] package/qt6/qt6base: add support to
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
 "Yann E . Morin" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

---
 package/qt6/qt6base/qt6base.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 033e92c26b..9784a9bd73 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -96,6 +96,14 @@ define HOST_QT6BASE_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $(BR2_CMAKE) --install $(HOST_QT6BASE_BUILDDIR)
 endef
 
+
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
