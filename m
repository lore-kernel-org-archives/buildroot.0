Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2A77C25B75
	for <buildroot@archiver.kernel.org>; Fri, 31 May 2024 15:14:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5818D41D95;
	Fri, 31 May 2024 15:14:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2797LCwC5bOG; Fri, 31 May 2024 15:14:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D135E423E9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D135E423E9;
	Fri, 31 May 2024 15:14:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 06E761D5416
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 15:13:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB1C7844D3
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 15:13:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rMue5oGe7leV for <buildroot@lists.busybox.net>;
 Fri, 31 May 2024 15:13:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 14E64844D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14E64844D5
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 14E64844D5
 for <buildroot@buildroot.org>; Fri, 31 May 2024 15:13:38 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-52b80e5688aso2612565e87.0
 for <buildroot@buildroot.org>; Fri, 31 May 2024 08:13:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717168417; x=1717773217;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uW6b/8+UYOaUkUI73R+5JcnPVQDid1A/OWUvO4DQDOg=;
 b=R92UwXzrFEne02udpdjXB1TKwBODNZZvCoX4HnklgElX4jaW20oJceBhcdV962cn3V
 VJcPinMdK1ZeBiBpyxKFtfz05CK6HGRQD4aTzEYq+q0ejdtrcLv0f2oMdmhWe4hSHqEw
 7yHQQYgl36Bdznasl2A3I5biRLj0afvXI6z2w57lcRxnSX2dvTMY3G6PPvUsx6M1H5Rm
 kPnCUaazdf347wsawR1g2g1FrknzTktUDe2u1RIe/jfnwmAwL9Ix6tVW5iEYTai7fbOk
 +7RQwENxxZbie8frf7b0gz49fAIwkLti8wMs8tvmJZ5AdmIpvPojIsLe4bp35OC+imtD
 5sGw==
X-Gm-Message-State: AOJu0YyWFdmTWQ05xviF4hZg51+WY8NvK/sEktVLeXi0Q1kmEc1BVWLv
 uKFV/8u4nh3FY2qaXgnlDO1Qa4+GhEM0n6DppZAz0kpi06XmzZP5BFSpPrQc
X-Google-Smtp-Source: AGHT+IE4O56WA7AgdgQy18HViV7J//ma4Tw5wlsoFxW1Uv3A1ljFM/JTaZvmqxcrWoQJOVSXQT/3hA==
X-Received: by 2002:ac2:5dc1:0:b0:51c:778f:b569 with SMTP id
 2adb3069b0e04-52b8956362bmr1901017e87.29.1717168416672; 
 Fri, 31 May 2024 08:13:36 -0700 (PDT)
Received: from precision7530-arch-roy.lan ([79.161.254.12])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b84d3f510sm362599e87.90.2024.05.31.08.13.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 May 2024 08:13:36 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
X-Google-Original-From: Roy Kollen Svendsen
 <roy.kollen.svendsen@akersolutions.com>
To: buildroot@buildroot.org
Date: Fri, 31 May 2024 17:13:04 +0200
Message-ID: <20240531151325.2443323-3-roy.kollen.svendsen@akersolutions.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240531151325.2443323-1-roy.kollen.svendsen@akersolutions.com>
References: <20240513220328.1085629-1-roykollensvendsen@gmail.com>
 <20240531151325.2443323-1-roy.kollen.svendsen@akersolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717168417; x=1717773217; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uW6b/8+UYOaUkUI73R+5JcnPVQDid1A/OWUvO4DQDOg=;
 b=Hx093rjP+32yHPVshBNRlEcM/Ugr51IPH4Z+MN38xHCvSxB2uXe/HysoyumBjg/ifp
 FoYzVmFf1VCMe9VyZL0inBAQU8naNE0Y9XDLS6aniep6RlG1YJA4T9xxc13Ok+ID3PQH
 wEeKTSG7wEm/7LkKsZM5VOjF9ajmg2N+gFEbmGhcqnKeFgDPsj3E9dL5LKfXMDno37Ia
 7NLDfsU0twVkCnmYK9axNRXhgMwxXFQ5GAx0giemdnkxeSTfvk8YMACUxLVssA2Tbj9J
 oRtZ23GNu2C2UmhYotPEiTLt5i72ijFAzKlpuiyIFhA81HRGgKHE8yp8JbzciStKVuoG
 QTXg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Hx093rjP
Subject: [Buildroot] [PATCH v5 03/14] package/qt6/qt6base: add blind option
 to enable Network support on host
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
Cc: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Jesse Van Gavere <jesseevg@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Qt Network is a required dependency of Qt Tools. Therefor we need a way
to enable the Qt Network module when building for host.

Signed-off-by: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>
---
 package/qt6/qt6base/Config.in.host | 5 +++++
 package/qt6/qt6base/qt6base.mk     | 7 ++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/qt6/qt6base/Config.in.host b/package/qt6/qt6base/Config.in.host
index 326c06278e..286da0ff03 100644
--- a/package/qt6/qt6base/Config.in.host
+++ b/package/qt6/qt6base/Config.in.host
@@ -2,3 +2,8 @@
 # Qt Shader Baker(qsb)).
 config BR2_PACKAGE_HOST_QT6BASE_GUI
 	bool
+
+# Select this if you need host qt6 tools that require the Qt::Network module
+# (e.g. Qt Tools).
+config BR2_PACKAGE_HOST_QT6BASE_NETWORK
+	bool
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 08c6425331..8c08784f91 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -87,7 +87,6 @@ HOST_QT6BASE_CONF_OPTS = \
 	-DFEATURE_xml=ON \
 	-DFEATURE_sql=OFF \
 	-DFEATURE_testlib=OFF \
-	-DFEATURE_network=OFF \
 	-DFEATURE_dbus=OFF \
 	-DFEATURE_icu=OFF \
 	-DFEATURE_glib=OFF \
@@ -102,6 +101,12 @@ else
 HOST_QT6BASE_CONF_OPTS += -DFEATURE_gui=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_HOST_QT6BASE_NETWORK),y)
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_network=ON
+else
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_network=OFF
+endif
+
 # Conditional blocks below are ordered by alphabetic ordering of the
 # BR2_PACKAGE_* option.
 
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
