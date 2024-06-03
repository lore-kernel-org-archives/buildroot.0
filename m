Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7157C25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 11:53:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 71C7A414F6;
	Mon,  3 Jun 2024 11:53:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yjXR6mibqdAq; Mon,  3 Jun 2024 11:53:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FFD841491
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6FFD841491;
	Mon,  3 Jun 2024 11:53:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C11581BF383
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 11:52:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B942381FA2
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 11:52:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JhIbIAbTCDjz for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 11:52:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CE0D8808B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE0D8808B0
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CE0D8808B0
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 11:52:33 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-52b92e73e2fso2189074e87.2
 for <buildroot@buildroot.org>; Mon, 03 Jun 2024 04:52:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717415552; x=1718020352;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RyeM0z4C37XC3Kv+RkiSoWqVPGsvgH+LGV4QZ74wzdk=;
 b=JrfxHGVMLuS07EHNTKml2+pbwg0zfChWeVZbHMaqtAitzKHZCVVvdvFzkm/jLQx8r2
 fBbTmg2CNcwYrv2uIxlFneO0KhC5JNNHfZnUall/zMnw0L6QX53DciSKaxArEwk4lFdE
 9mwQ3zkLoDQQvdrmP92HOtb+JB0kEdijWQln32cvkMvwxtDsfi+CcmpggNZgEBbARfxN
 lB3W99Afsa2OejH2Cb0XzsFDcjO2aKHr1rDpW2cn4FAVIRDBBaNlfCvS2VRVyVpaylrl
 pSEIs/HkJX+Z6CRfgwax7yp13TUU8/7YXSRa1n/8MN9d3olRuXFb8rXiwAEL1j7JUgiI
 q3TQ==
X-Gm-Message-State: AOJu0Yw6OElLntO2DooYhSdRcEFoEl7gys1JXaBrMLY/tDQiNuj5JKkF
 /5HUeQtbO+JxEC6qcTfD81tFZ9xPETw/t7PTvMdKdJL188dXQMSD0NStUChF
X-Google-Smtp-Source: AGHT+IEA7aMBR8HOWQo15ROoP4jpbHMbi65XlV6h32mgLVjv66mWeVX2h2wLar99m9IP3egasV8Ohg==
X-Received: by 2002:a05:6512:5d0:b0:52a:e529:16bd with SMTP id
 2adb3069b0e04-52b896cd4eamr5418359e87.58.1717415551360; 
 Mon, 03 Jun 2024 04:52:31 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b96035a33sm529058e87.294.2024.06.03.04.52.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jun 2024 04:52:30 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
X-Google-Original-From: Roy Kollen Svendsen
 <roy.kollen.svendsen@akersolutions.com>
To: buildroot@buildroot.org
Date: Mon,  3 Jun 2024 13:51:47 +0200
Message-ID: <20240603115206.3583474-4-roy.kollen.svendsen@akersolutions.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240603115206.3583474-1-roy.kollen.svendsen@akersolutions.com>
References: <20240531151325.2443323-9-roy.kollen.svendsen@akersolutions.com>
 <20240603115206.3583474-1-roy.kollen.svendsen@akersolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717415552; x=1718020352; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RyeM0z4C37XC3Kv+RkiSoWqVPGsvgH+LGV4QZ74wzdk=;
 b=g4ETncTFdbL0B2yDxsq1REka8z6CObR1/kcCYjS4JdGiaKrawlW0JjzbGcBY2Iv4UO
 2wjwBX+A9qfCBngtOhJXLWvs7iyAEEVBaN19WiL3sESQWj50z/bRN5LqWOQiNYvSIw+i
 G1fQ1rwDuer6RH1Cy6o3fRVCOT/TVsXcN/XmSq60qZp9mejOXFS4LGLy07iKP4wBtBFK
 roq9EbdTIqpQxLpgzfN+eJS+ZKU424scDHGh//9pX6B5lFyWmm6LBvW6eKCkfsgfujSv
 VtiuLHk79gFPeQofH1oqdfvZhvkOCgZiJofvSDLEw3rtOCgpQ1PrtEYa4G6K5U3goFkg
 e0bg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=g4ETncTF
Subject: [Buildroot] [PATCH v6 04/14] package/qt6/qt6base: add blind option
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
Cc: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Jesse Van Gavere <jesseevg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>

We need host-qt6base with Testlib support when building host-qt6declarative
with QuickTest support. QuickTest support is further required for building the
qmltestrunner host tool. qt6declarative will fail to build if qmltestrunner is
not available.

Signed-off-by: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>
---
Changes v5 -> v6:
  - Add explanation to commit message  (suggested by Yann)
  - Add explanation to qt6base blind host testlib option

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
index 6d2d3ef377..63584aa293 100644
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
@@ -116,6 +115,16 @@ else
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
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
