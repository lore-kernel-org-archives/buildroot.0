Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62634C27C4F
	for <buildroot@archiver.kernel.org>; Tue, 18 Jun 2024 21:28:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BE6E404DC;
	Tue, 18 Jun 2024 21:28:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3_fx0uFt5xEx; Tue, 18 Jun 2024 21:28:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C269E40890
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C269E40890;
	Tue, 18 Jun 2024 21:28:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C8D491BF2EA
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 21:27:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C1C87834F7
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 21:27:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5TwOPQEDhORr for <buildroot@lists.busybox.net>;
 Tue, 18 Jun 2024 21:27:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D2507834F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2507834F2
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D2507834F2
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 21:27:13 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2e95a75a90eso63662071fa.2
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 14:27:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718746031; x=1719350831;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IFknuf6txIWrvv3BiGpCnuovvD0K5IoEVeWoxGrMwAc=;
 b=N0gn/V0OjlCYU2Btv1vSMJkmpWORpL85vXzbLiDsaQpOw+GOvldRvKOLjf47bYxICh
 2gm0iTB8T8x4nFTeEs43OrS4T1OcQz62NFyn09bGH/rtnkudq9hMZS9aZDiNFBmVhQlf
 0eNIEamkoXX7dUCxo3MMxzFKNhYLYic8aoJqfODDNpk/ClXG6NuTZqo+aBGZMrsa1W/i
 ZJ11phoa1/EWwuJSVSqQKnDWlFPrO5+iAcMxSUSVt4uQkCbbjINihQ3eHGJVudS2pnRt
 BqkgDVin1/MIsQMEpX3in+OuQ5L3DEIPExBKapDBVtyXrHZN9NzxLLTxfH4kt1gIQFNI
 yF/w==
X-Gm-Message-State: AOJu0YwXL8cDdd6WRXsVpUyMvL94wEGDKvICqqN7zLYv9A+MKcp5AmtX
 RrTaT1BZ8EDdmCIWzpT8igLY4RZirOs8ESBed2ee60xP7Ar4sTBTYNEA1Q==
X-Google-Smtp-Source: AGHT+IFHZ1lro9/FB62FqVVTbTM+3mM9z2ow0n2smfwU3tnWGYmnbPxBv8utc/l/A2EzQ4Hj+rAbWw==
X-Received: by 2002:a2e:9bca:0:b0:2ea:e773:c58 with SMTP id
 38308e7fff4ca-2ec3cea10d1mr5001431fa.24.1718746031559; 
 Tue, 18 Jun 2024 14:27:11 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec05c7838fsm17240521fa.100.2024.06.18.14.27.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 14:27:10 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 18 Jun 2024 23:26:27 +0200
Message-ID: <20240618212646.4154474-4-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240618212646.4154474-1-roykollensvendsen@gmail.com>
References: <20240618131902.2912459-9-roykollensvendsen@gmail.com>
 <20240618212646.4154474-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718746031; x=1719350831; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IFknuf6txIWrvv3BiGpCnuovvD0K5IoEVeWoxGrMwAc=;
 b=ZzyW34VIvO7VZBQ9peLk/aD36ChZB/fYG9wlvqnnw0Go9XChlvmZdG5JK+6N8nriUh
 Shl/nZvZ1Rdb05cWx3nVRDdO8YePj1cBxuTKZtmx51KgJ5Q3NjpA6FRXfQuZistVxfdE
 nW9gZBmt7OO7EVpsoA0GtilxSN0Zfi2nWmSsqW80kwtg67rjGfauJvlBkPfZ5lZ54a+A
 4so/V05xh5+52Jl8z84Rk01lliaWbQbInLqfbSSoDP5JXJrlMiNPBzAmovaPBGyNUB5e
 xg8S59TCBEVFAX1IWFIVdFHSDn2vqT1Iy3Rh2qvGID1hCD8/RW1fpHWKs3Ut2PJte2yM
 n3NQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ZzyW34VI
Subject: [Buildroot] [PATCH v8 04/14] package/qt6/qt6base: add blind option
 to enable Test support on host
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
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Jesse Van Gavere <jesseevg@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We need host-qt6base with Testlib support when building host-qt6declarative
with QuickTest support. QuickTest support is further required for building the
qmltestrunner host tool. qt6declarative will fail to build if qmltestrunner is
not available.

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/qt6base/Config.in.host |  5 +++++
 package/qt6/qt6base/qt6base.mk     | 11 ++++++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/package/qt6/qt6base/Config.in.host b/package/qt6/qt6base/Config.in.host
index 286da0ff03..80bc13c7dc 100644
--- a/package/qt6/qt6base/Config.in.host
+++ b/package/qt6/qt6base/Config.in.host
@@ -7,3 +7,8 @@ config BR2_PACKAGE_HOST_QT6BASE_GUI
 # (e.g. Qt Tools).
 config BR2_PACKAGE_HOST_QT6BASE_NETWORK
 	bool
+
+# Select this if you need host qt6 tools that require the Qt::Test module
+# (e.g. qmltestrunner).
+config BR2_PACKAGE_HOST_QT6BASE_TEST
+	bool
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 509c6b0066..6b9f425255 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -86,7 +86,6 @@ HOST_QT6BASE_CONF_OPTS = \
 	-DFEATURE_concurrent=OFF \
 	-DFEATURE_xml=ON \
 	-DFEATURE_sql=OFF \
-	-DFEATURE_testlib=OFF \
 	-DFEATURE_dbus=OFF \
 	-DFEATURE_icu=OFF \
 	-DFEATURE_glib=OFF \
@@ -111,6 +110,16 @@ else
 HOST_QT6BASE_CONF_OPTS += -DFEATURE_network=OFF
 endif
 
+# We need host-qt6base with Testlib support when building host-qt6declarative
+# with QuickTest support. QuickTest support is further required for building the
+# qmltestrunner host tool. qt6declarative will fail to build if qmltestrunner is
+# not available.
+ifeq ($(BR2_PACKAGE_HOST_QT6BASE_TEST),y)
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_testlib=ON
+else
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_testlib=OFF
+endif
+
 # Conditional blocks below are ordered by alphabetic ordering of the
 # BR2_PACKAGE_* option.
 
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
