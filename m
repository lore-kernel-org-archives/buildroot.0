Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3FFAC25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 11:53:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 46D8641499;
	Mon,  3 Jun 2024 11:53:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JV-gpmcHZw4G; Mon,  3 Jun 2024 11:53:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F245D41556
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F245D41556;
	Mon,  3 Jun 2024 11:53:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A5AA61BF383
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 11:52:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 91718407D2
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 11:52:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CasPlCahWSTp for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 11:52:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 77FCC406AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77FCC406AB
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 77FCC406AB
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 11:52:35 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-52b83225088so3925108e87.3
 for <buildroot@buildroot.org>; Mon, 03 Jun 2024 04:52:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717415553; x=1718020353;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C2BSgzU99KBE6wZRwG33rV4PqTrijqay49yt69dELVg=;
 b=G0uFKYCOwnveCSUysmaO9iHL69Q17Scf9mDzrB/NINPFq5VQtBB91wdoOKcicyNs+T
 eU6Ues47sEXDBwZUaF/BPz2TtYO33Ls41D0EujHbF6AkZt5/6cvKCcGI6rudpEuUVsSQ
 lidDM5041yguuxSZxaewjG/8tCx2gtUjXo7Ze+CXBA7NDiACj4u1QS2xKzdIyFIttLps
 nIaTOZlbbA0Bz6wgUjecWkugY4MSrSiKAtg/zJR+2DUWtadcrIjOFpEyxnmBIcp1F8uL
 GFtYpoS9ntttCyMXgy2bajheOk3LukzzCqWHD/H2bF+XYlbwiOlTnAo0Iucgpi4+DjXX
 cjhQ==
X-Gm-Message-State: AOJu0YwzdL3PeOjIN+gqw5sYKNfHg/UZA5oAm9rceF6AP4W1yhFuhR3z
 pBAJEGLrI9crHgqPsfRohTFXmge6ElagZ2Fi6f7Txp5j0L6kwzqIDRTxzh70
X-Google-Smtp-Source: AGHT+IFBGiddg3VUnRvFq0uO1Gik3q9Mgpkd0zRsJ/9hSjel3ril4dwrOPw2e52prdk+yY0XEn2BIQ==
X-Received: by 2002:a19:f00a:0:b0:52b:7c6f:cef3 with SMTP id
 2adb3069b0e04-52b8959d88fmr5962455e87.25.1717415552993; 
 Mon, 03 Jun 2024 04:52:32 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b96035a33sm529058e87.294.2024.06.03.04.52.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jun 2024 04:52:32 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
X-Google-Original-From: Roy Kollen Svendsen
 <roy.kollen.svendsen@akersolutions.com>
To: buildroot@buildroot.org
Date: Mon,  3 Jun 2024 13:51:48 +0200
Message-ID: <20240603115206.3583474-5-roy.kollen.svendsen@akersolutions.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240603115206.3583474-1-roy.kollen.svendsen@akersolutions.com>
References: <20240531151325.2443323-9-roy.kollen.svendsen@akersolutions.com>
 <20240603115206.3583474-1-roy.kollen.svendsen@akersolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717415553; x=1718020353; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C2BSgzU99KBE6wZRwG33rV4PqTrijqay49yt69dELVg=;
 b=lIJKuXJumKlOYH6DL94cUUQkcZb1zr16x6sKhwYPwRYFaIWvBWGYzEavOQfYmNY5mB
 o6Z9Fk6kHmBfYYX2eqLy1Ei27lPWQZ96UwwC4Qs6UwBCNQtRZMejtD6ggRfp5YVCGjjz
 8sQe3RsHziQJUU+ZXoT5rTcYPuTnRutgNfEtgwgLvd8MkVPl/wqL+nRpyzcKXTpsysnz
 sjcWHETLgY8ydz/yMiCe87cqFhsPFHib16K+PtnttUuJmdmBuZMa7wODkaokZUxCSMLs
 NjeriFUk8P36QYHU3mPONltviVMSj/5ygO2FUXU4WIP75MsSCdnGf8x63Bx+I2tT6KjB
 nfNw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=lIJKuXJu
Subject: [Buildroot] [PATCH v6 05/14] package/qt6/qt6base: add blind option
 to enable Sql support on host
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

We need host qt6base with Sql support for host-qt6tools to generate the
qhelpgenerator host tool. qt6tools will fail to build if qhelpgenerator is not
available.

Signed-off-by: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>
---
Changes v5 -> v6:
  - Add explanation to commit message  (suggested by Yann)
  - Add explanation to qt6base blind host sql option

 package/qt6/qt6base/Config.in.host |  5 +++++
 package/qt6/qt6base/qt6base.mk     | 10 +++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/package/qt6/qt6base/Config.in.host b/package/qt6/qt6base/Config.in.host
index 80bc13c7dc..46fb668817 100644
--- a/package/qt6/qt6base/Config.in.host
+++ b/package/qt6/qt6base/Config.in.host
@@ -12,3 +12,8 @@ config BR2_PACKAGE_HOST_QT6BASE_NETWORK
 # (e.g. qmltestrunner).
 config BR2_PACKAGE_HOST_QT6BASE_TEST
 	bool
+
+# Select this if you need host qt6 tools that require the Qt::Sql module
+# (e.g. qhelpgenerator).
+config BR2_PACKAGE_HOST_QT6BASE_SQL
+	bool
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 63584aa293..9adc03d59c 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -85,7 +85,6 @@ HOST_QT6BASE_DEPENDENCIES = \
 HOST_QT6BASE_CONF_OPTS = \
 	-DFEATURE_concurrent=OFF \
 	-DFEATURE_xml=ON \
-	-DFEATURE_sql=OFF \
 	-DFEATURE_dbus=OFF \
 	-DFEATURE_icu=OFF \
 	-DFEATURE_glib=OFF \
@@ -115,6 +114,15 @@ else
 HOST_QT6BASE_CONF_OPTS += -DFEATURE_network=OFF
 endif
 
+# We need host qt6base with Sql support for host-qt6tools to generate the
+# qhelpgenerator host tool. qt6tools will fail to build if qhelpgenerator is not
+# available.
+ifeq ($(BR2_PACKAGE_HOST_QT6BASE_SQL),y)
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_sql=ON
+else
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_sql=OFF
+endif
+
 # We need host-qt6base with Testlib support when building host-qt6declarative
 # with QuickTest support. QuickTest support is further required for building the
 # qmltestrunner host tool. qt6declarative will fail to build if qmltestrunner is
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
