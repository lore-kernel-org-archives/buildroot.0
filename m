Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E612C3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 20:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F24E682049;
	Sat, 13 Jul 2024 20:36:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xpZFFWhJqSwR; Sat, 13 Jul 2024 20:36:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DC4E82085
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DC4E82085;
	Sat, 13 Jul 2024 20:36:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C9A021BF271
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 20:36:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B5FD8404C1
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 20:36:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8RGdSFQA3dhu for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 20:36:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8721A404BF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8721A404BF
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8721A404BF
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 20:36:25 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-52e9a550e9fso4105008e87.0
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 13:36:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720902983; x=1721507783;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Hijo3rVkV+u6b4v+zvju8ZtOBD3OCurDNi6SNbnlj40=;
 b=wGNKhjgqfGbCeFfltRF+ySUALx+McHuJ5y7DZ+dvPZ/yfJGwTMhS3EAEPA+jfEmUkY
 7EfQh1ad4gzN+psH3sWA5WvFlVP1iBuXaQNl96/Cms7gYttv+TODMIE6CkKqE8LE0871
 Dyw5NlvKgXVNaeVHaKlQJY8c1XV+eT4t2uxGn+VW9oS6zTQEuatVCD3SjunbRHwAfoYU
 NIHThuUJBMoaN/akgNM/ItkJineIYz5kE1u0oSqub5HY5ngDjpU0P55SLKE2TNePqXeG
 yGZkknaWP62mI/0fauQ/wQve5TavstpZErOuLmRfZZrVfwi937iV06xl5TA3RozD/HqV
 kHrQ==
X-Gm-Message-State: AOJu0YwhsVAe04WjT6MSuaB07AetmEEaN8flQp5QR6xEFPrr/f/IJ3zf
 nrguZLyP+QDGI3nqHpvy5YQhhvUqAyVe1M2/i/4tkhchBT2xQNirols2NA==
X-Google-Smtp-Source: AGHT+IHZF7U+5FQ8CswyzfVv/sZPlI64u6xo1L1vuGfPSW2RA97AP8KGLM1pw1sC2R/L6ceF3/NWrg==
X-Received: by 2002:a05:6512:12d3:b0:52e:bdc4:e51b with SMTP id
 2adb3069b0e04-52ecb80eb12mr1687362e87.16.1720902982877; 
 Sat, 13 Jul 2024 13:36:22 -0700 (PDT)
Received: from precision7530-arch-roy.lan ([79.161.254.12])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ed24e1d79sm291411e87.10.2024.07.13.13.36.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jul 2024 13:36:22 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 22:35:58 +0200
Message-ID: <20240713203559.3360538-1-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720902983; x=1721507783; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Hijo3rVkV+u6b4v+zvju8ZtOBD3OCurDNi6SNbnlj40=;
 b=ForrBeuaX2Yj5R+ohIb2tdbU/tbnZA8UDmRfZc61dRmK8YkJ+3Em+VDihBienhTyEL
 F7ocd8PVPde59BZV14z9uRlTB5COfhYTmyZ7lgYS0wMnnWs4/X+H+0tE1Acy3jRzp0Vy
 qugNPlv7BVNdC+k0wwkysI1TGbDuyX7kiaSkvELhZUamksL78lJ09mFNkdqQDEAEF0DK
 mxrgA9pfLpFl5IZ4v1u0l48iGmtT9YdWWRV/3BXmTABE8ISqvZeIyEI0JYuaa6JKNMit
 x3zT3qAo2ehwlCX5qd2vIspnnbYyhLuCDmlYFbF9HtlSvKl+bzFl4/quH4on8D+me6eI
 TORA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ForrBeua
Subject: [Buildroot] [PATCH 1/1] package/qt6/qt6base: fix missing plugins
 and qml2 imports
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
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When using the default value "." for of ArchData, qt6-applications that require QML2 imports or
plugins, will not run:

In my case the wayland-egl platform plugin is not found:

  qt.qpa.plugin: Could not find the Qt platform plugin "wayland-egl" in ""

And I also get a lot of qml related warnings:

  qrc:/qml/main.qml:3:1: module "QtQuick.Layouts" is not installed

Prior to this fix, we had to set the QML2_IMPORT_PATH and QT_PLUGIN_PATH or make sure qt.conf is
available.

After this fix, ArchData starts with "lib", which is necessary (according to my own experiments)
for qt6-applications to find plugins and qml2 imports. The root cause is still unknown, but I
think the current solution is sufficient.

Setting ArchData to "lib/qt6" is also a good first step towards a better qt6 filesystem layout.
I will continue improving the qt6 filesystem layout in a later patch.

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/qt6base/qt6base.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 6cb82d9a94..5ab61ba3e0 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -42,6 +42,7 @@ QT6BASE_INSTALL_STAGING = YES
 
 QT6BASE_CONF_OPTS = \
 	-DQT_HOST_PATH=$(HOST_DIR) \
+	-DINSTALL_ARCHDATADIR=lib/qt6 \
 	-DFEATURE_concurrent=OFF \
 	-DFEATURE_xml=OFF \
 	-DFEATURE_sql=OFF \
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
