Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0848C433F5
	for <buildroot@archiver.kernel.org>; Fri, 18 Feb 2022 10:07:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5745641DBA;
	Fri, 18 Feb 2022 10:07:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vLAx0JW3fIQg; Fri, 18 Feb 2022 10:07:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80F7341DBB;
	Fri, 18 Feb 2022 10:07:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CB6F21BF311
 for <buildroot@lists.busybox.net>; Fri, 18 Feb 2022 10:07:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B998B60C19
 for <buildroot@lists.busybox.net>; Fri, 18 Feb 2022 10:07:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q3Em3fsCf6Zq for <buildroot@lists.busybox.net>;
 Fri, 18 Feb 2022 10:07:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 64D9C60BBD
 for <buildroot@buildroot.org>; Fri, 18 Feb 2022 10:07:04 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id k1so13634971wrd.8
 for <buildroot@buildroot.org>; Fri, 18 Feb 2022 02:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7pz33tBpo94gXuTLOkMcrXxHCeZdNUpXAQmw8ByQTMY=;
 b=IlSQQ+ANCv4HsdvrlLXGwlzf0P8X1/yRG2jXGs0Pog71j8gmJ1/6WktBQShnC7pio6
 3UFpP+iLaQdSVEw0BK8OXpiZply12kUHvYpNdemuwzpTbjggk1x7kXV3U8t7LbTx6rRp
 PVJ3CwfJ+kasfh1w7B+nhLQOSEn9MCrp25Ze/jY/Ol+zIUCanXUkShwjN4fcMgVqx2rj
 Y/DiGeRYHw3dNMdNzCG5HEqYP8qjRIrs0yGwE4KVN91TPRZL/ILF3IPdxX1VEESgd4XR
 7b8vixJoPylDZ7G5FhingOoOWOIN/LNG85QvwwJguJtL4CcIQQFtovDSCbdPAN8NWfld
 kfZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7pz33tBpo94gXuTLOkMcrXxHCeZdNUpXAQmw8ByQTMY=;
 b=JpkFCPn8NQp2PAM3OwamoTPpOVfxTVis95f9koEhJexjEfo2lqg8hUW4IB6e4L8PMb
 eLMOZfsLOUqzbCTBukv5D7oQoedl6Ag5+lbyv0YN9GDY9xmxh+z8hGlXopAWRGxEthkc
 V8jSlzIVkMQRm8KwatJZaOgDECZpwO5xqR7DQ9f2yhphvB+wRgabLAe5IgNWOL+GMQJo
 NTDfc2/8GYcj88g1u15jYRoRDHzeRPo9MjyObXkbL1HbBPqJoARQQ+S5nef4nw8O9s1q
 QtTHJAYtB0oJaHw1ySsjFcidBUzhMfdf+JBoZSNAYHj8Cl9u9OlyG5e2w9TnXmnMqilI
 Ciyw==
X-Gm-Message-State: AOAM532zT84uCdQmVma2PFtBFnOi8WsA/QUaUeLZjJsLbngwupA/Z4Hz
 TRgSW1nVceX/rE+tXrPzG60O+HXc4vE=
X-Google-Smtp-Source: ABdhPJw/77td1lDH6v6ELgP4kqM72fqZcfiQOuQhI2qNawcoJngElVRCnr2M/uowW32X/X4wVwlTmQ==
X-Received: by 2002:adf:9106:0:b0:1e3:c02a:f4af with SMTP id
 j6-20020adf9106000000b001e3c02af4afmr5550496wrj.150.1645178822155; 
 Fri, 18 Feb 2022 02:07:02 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id e7sm19293552wrg.44.2022.02.18.02.07.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 02:07:01 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 18 Feb 2022 11:07:09 +0100
Message-Id: <20220218100709.677205-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/zfs: replace PYTHON_VERSION_MAJOR
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
Cc: =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Replace PYTHON_VERSION_MAJOR by PYTHON3_VERSION_MAJOR now that python2
has been dropped. It should be noted that PYTHON_SITE_PKG was wrongly
set since the addition of the package in commit
4470bc9914d730383db86f58bc86fb09739622dc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/zfs/zfs.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zfs/zfs.mk b/package/zfs/zfs.mk
index 6b542f5c05..dbda8aceb4 100644
--- a/package/zfs/zfs.mk
+++ b/package/zfs/zfs.mk
@@ -44,7 +44,7 @@ ZFS_CONF_ENV += \
 	PYTHON_CPPFLAGS="`$(STAGING_DIR)/usr/bin/python3-config --includes`" \
 	PYTHON_LIBS="`$(STAGING_DIR)/usr/bin/python3-config --ldflags`" \
 	PYTHON_EXTRA_LIBS="`$(STAGING_DIR)/usr/bin/python3-config --libs --embed`" \
-	PYTHON_SITE_PKG="/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages"
+	PYTHON_SITE_PKG="/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages"
 ZFS_CONF_OPTS += --enable-pyzfs
 else
 ZFS_CONF_OPTS += --disable-pyzfs --without-python
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
