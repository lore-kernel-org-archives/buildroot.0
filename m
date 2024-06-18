Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB31C27C4F
	for <buildroot@archiver.kernel.org>; Tue, 18 Jun 2024 21:28:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EC8742B3F;
	Tue, 18 Jun 2024 21:28:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6fU__k6AqfPR; Tue, 18 Jun 2024 21:28:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B9ED42B50
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B9ED42B50;
	Tue, 18 Jun 2024 21:28:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 545D91BF2EA
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 21:27:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 40F0E40254
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 21:27:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zeT546dE9NwE for <buildroot@lists.busybox.net>;
 Tue, 18 Jun 2024 21:27:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 027B7400EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 027B7400EA
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 027B7400EA
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 21:27:10 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2ead2c6b50bso64716931fa.0
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 14:27:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718746029; x=1719350829;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oNwEmPQPeYYTlmMNm+OOPXc5GtdF8/d+e6ZpfjGLwng=;
 b=X8H6eV9lBdXcq+d7WwCk/Bd2fxSJe1VblcQwRmdwDID1qbg7v6qrAJiG6LYj03IaH9
 SnpI7VlBW99dhkcc/D58E0KUApL5dUi1XlUshha5PC28yg8Z+otuGT51utef5/O+cj2Z
 Fy7hfNBXZ2BUt7TQgrWfoYE61im1q5aCLdbQ65c4y9a6Um2RXlt7bOvA0zB5eKHNhDEr
 16Z6qnUjeqHCFS2Ro2nxL/D+/AgbOD7jOG1gEoHv4beNEVqZTUwXyjmc/Ckn0EF/VdGY
 8j56ux4lpfZTkMxp8z9XXYuK2v6SCUKUWxMgaa7bqAHGrJTFw72E1MQq3DFAiRHGPOpF
 QdxA==
X-Gm-Message-State: AOJu0Ywp1LfuHXE940z+UV/zbpHO7KOSNAwljiWJraO8qB9lOg8pjb8w
 tiVop41BavfTOSMkUQsI7fpKSr2+xyaEG6fvdP/E1j6SDSCm6HT9Xthqug==
X-Google-Smtp-Source: AGHT+IH95KnFXMHRbF0dzYcsvVHS8uCKdtTv8BE7UL5zc8f9IR6c9GyM08aDdiPZJ4aJNTqa63INUg==
X-Received: by 2002:a2e:8791:0:b0:2ec:ff6:3bd5 with SMTP id
 38308e7fff4ca-2ec3ce7cee6mr6281301fa.10.1718746028351; 
 Tue, 18 Jun 2024 14:27:08 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec05c7838fsm17240521fa.100.2024.06.18.14.27.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 14:27:07 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 18 Jun 2024 23:26:25 +0200
Message-ID: <20240618212646.4154474-2-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240618212646.4154474-1-roykollensvendsen@gmail.com>
References: <20240618131902.2912459-9-roykollensvendsen@gmail.com>
 <20240618212646.4154474-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718746029; x=1719350829; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oNwEmPQPeYYTlmMNm+OOPXc5GtdF8/d+e6ZpfjGLwng=;
 b=IM9q/dI2ilbxlyEi55vy/GvY5XlJxGYiphxPoaEwW8QNsmHsrTX8o5G2wf871JEvhd
 IayDBUZxHdiCmxz+/99+YAeSB3zb4u/kTqymKiQEdEFbuGPRg/8MJ7439PwSkSzsrh3H
 A94yWXVRzDN1dEqlUUutoO+WSKHFm8NEKtqCcrrnW9QOLMSTzDCJ0Criq6EEF+qt00aY
 4u1mzfw+FdysJ/pnah1Ix7PnBYb31B0DVhr967r0Z8E5lw7/cT5GWl61RKtOl93hJUNc
 O2AEe3eQlycFF2i/nBb1FEEsxJuotzRS3pbIMm19rowCnOLFeD8tGlb14YVk87KE7vpc
 JiUQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=IM9q/dI2
Subject: [Buildroot] [PATCH v8 02/14] package/qt6/qt6base: add blind option
 to enable GUI support on host
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

We need host-qt6base with Gui support when building host-qt6shadertools,
otherwise the build is skipped and no qsb host tool is generated.
qt6shadertools fail to build if qsb is not available.

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/Config.in.host             |  1 +
 package/qt6/Config.in.host         |  5 +++++
 package/qt6/qt6base/Config.in.host |  4 ++++
 package/qt6/qt6base/qt6base.mk     | 10 +++++++++-
 4 files changed, 19 insertions(+), 1 deletion(-)
 create mode 100644 package/qt6/Config.in.host
 create mode 100644 package/qt6/qt6base/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index 9cdca62633..66f3a6fa9d 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -92,6 +92,7 @@ menu "Host utilities"
 	source "package/python3/Config.in.host"
 	source "package/qemu/Config.in.host"
 	source "package/qoriq-rcw/Config.in.host"
+	source "package/qt6/Config.in.host"
 	source "package/raspberrypi-usbboot/Config.in.host"
 	source "package/rauc/Config.in.host"
 	source "package/riscv-isa-sim/Config.in.host"
diff --git a/package/qt6/Config.in.host b/package/qt6/Config.in.host
new file mode 100644
index 0000000000..dfe7865c57
--- /dev/null
+++ b/package/qt6/Config.in.host
@@ -0,0 +1,5 @@
+if BR2_PACKAGE_QT6
+
+source "package/qt6/qt6base/Config.in.host"
+
+endif
diff --git a/package/qt6/qt6base/Config.in.host b/package/qt6/qt6base/Config.in.host
new file mode 100644
index 0000000000..326c06278e
--- /dev/null
+++ b/package/qt6/qt6base/Config.in.host
@@ -0,0 +1,4 @@
+# Select this if you need host qt6 tools that require the Qt::Gui module (e.g.
+# Qt Shader Baker(qsb)).
+config BR2_PACKAGE_HOST_QT6BASE_GUI
+	bool
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 13999bbd44..a229c62844 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -83,7 +83,6 @@ HOST_QT6BASE_DEPENDENCIES = \
 	host-pcre2 \
 	host-zlib
 HOST_QT6BASE_CONF_OPTS = \
-	-DFEATURE_gui=OFF \
 	-DFEATURE_concurrent=OFF \
 	-DFEATURE_xml=ON \
 	-DFEATURE_sql=OFF \
@@ -97,6 +96,15 @@ HOST_QT6BASE_CONF_OPTS = \
 	-DFEATURE_system_pcre2=ON \
 	-DFEATURE_system_zlib=ON
 
+# We need host-qt6base with Gui support when building host-qt6shadertools,
+# otherwise the build is skipped and no qsb host tool is generated.
+# qt6shadertools fail to build if qsb is not available.
+ifeq ($(BR2_PACKAGE_HOST_QT6BASE_GUI),y)
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_gui=ON
+else
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_gui=OFF
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
