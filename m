Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0BF6CD37B4
	for <buildroot@archiver.kernel.org>; Wed,  4 Sep 2024 12:21:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86F12404D9;
	Wed,  4 Sep 2024 12:21:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GlrGAlL6tRxE; Wed,  4 Sep 2024 12:21:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CB2D4049A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CB2D4049A;
	Wed,  4 Sep 2024 12:21:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 32DA41BF47A
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 12:21:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1FADB40129
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 12:21:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gHkoZQHmXzvF for <buildroot@lists.busybox.net>;
 Wed,  4 Sep 2024 12:21:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BC45940467
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC45940467
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BC45940467
 for <buildroot@buildroot.org>; Wed,  4 Sep 2024 12:21:02 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2f3f07ac2dcso72538071fa.2
 for <buildroot@buildroot.org>; Wed, 04 Sep 2024 05:21:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725452460; x=1726057260;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BsCg33FtuZUF8hsHjEbpAdlh1j9dWWPnAIFcR2VFbC4=;
 b=W3Ge+A+AsPaQX01sG2FKC2QEZBMIjJUn6naQzfH4qGKUJ/kZ5Ohzv2B71JWrXVCTvW
 JjwV51PCtRn44pwl//ZdlhoNXdZZMNeMaYw5DGq6QUOuwvQXjdUTpNfAMmhOkeb/7Ely
 Onz10duh+qNqT1h7VD5EKympwtTgKh2SIk+rEoAjItyyM5I9z4bppLmnxEbIogNw7obb
 i5R4Kkn57F1eQgAH8QbvUTdBAqdpHrWAeu+ItVan6hMs30uq5EaFLG8FthJNr1SHLxPT
 SLkHTKECgXJk5k94mFY6K5lpaegSSfT+qX72NsqTB1qgklUctvk7i9mp4do74mudR2cy
 Opqw==
X-Gm-Message-State: AOJu0YzdeT+MfveyWf9DO7Zj8qKI8IiNkoaalf20dDkZh6PdnABDBs7J
 RhmdsJgWZ79zJcj216WGiD8e/+TSyFOdZsXZwluJVuZzgtQcbWXG3lZ84A==
X-Google-Smtp-Source: AGHT+IF1doYAPLH+03+DTB/jVyPm+fC0jDmR5cecjScLWCNjRR+AAS+UEVaHNUd80JmZfeEBhyLSng==
X-Received: by 2002:a05:6512:3e02:b0:533:483f:957f with SMTP id
 2adb3069b0e04-53546b2c0c9mr11842599e87.32.1725452458808; 
 Wed, 04 Sep 2024 05:20:58 -0700 (PDT)
Received: from precision7530-arch-roy.lan ([79.161.254.12])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53540841326sm2333930e87.197.2024.09.04.05.20.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 05:20:58 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  4 Sep 2024 14:20:38 +0200
Message-ID: <20240904122040.738362-2-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240904122040.738362-1-roykollensvendsen@gmail.com>
References: <20240904122040.738362-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725452460; x=1726057260; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BsCg33FtuZUF8hsHjEbpAdlh1j9dWWPnAIFcR2VFbC4=;
 b=XSEmQPkGJNRmUfKaKi3FVNdVQ8Z1g8I5+9iIY7jB/OXuZ0eh+ufLg8ZPZdY7H3udZj
 QNviMhIwf+WZfES/BLSSNEvxKCdbEWStoUFOmKLsp4QtYI6dwKCs6IQsr8vQ4cVwkD6A
 bY1O/1JNC/FMv+cMCH3hbs9UvKqlRCSCPz+hq5huA4iWHZvvWzKYKcZp32g+XU61hcox
 SC7IYfX7DH8rRUudLPfgFEhYnE5HkYvkuXOBnDJ5m3Au641xG4IetW5CHU+EO5k6gEko
 4nVmb2Pqc6bZJyfnPkA2cOI6nNlsfqVtOvUtY2SBeNSxlKptQ2bY9Wlos2SG4gNsfBpM
 2N1Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=XSEmQPkG
Subject: [Buildroot] [PATCH 2/2] package/qt6/qt6base: allow selecting the
 host Qt Print Support module
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

According to configure.cmake printsupport requires widgets:

qt_feature("printsupport" PRIVATE
    LABEL "Qt PrintSupport"
    CONDITION QT_FEATURE_widgets
    SECTION "Module"
    PURPOSE "Provides the Qt PrintSupport module."
)

So we let print support automatically select widgets support.

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/qt6base/Config.in.host | 11 +++++++++++
 package/qt6/qt6base/qt6base.mk     | 16 ++++++++++++++--
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/package/qt6/qt6base/Config.in.host b/package/qt6/qt6base/Config.in.host
index 46fb668817..8f0bc1f070 100644
--- a/package/qt6/qt6base/Config.in.host
+++ b/package/qt6/qt6base/Config.in.host
@@ -8,6 +8,13 @@ config BR2_PACKAGE_HOST_QT6BASE_GUI
 config BR2_PACKAGE_HOST_QT6BASE_NETWORK
 	bool
 
+# Select this if you need host qt6 tools that require the Qt Print Support
+# module
+# (e.g. Qt Tools Linguist Tools).
+config BR2_PACKAGE_HOST_QT6BASE_PRINTSUPPORT
+	bool
+	select BR2_PACKAGE_HOST_QT6BASE_WIDGETS
+
 # Select this if you need host qt6 tools that require the Qt::Test module
 # (e.g. qmltestrunner).
 config BR2_PACKAGE_HOST_QT6BASE_TEST
@@ -17,3 +24,7 @@ config BR2_PACKAGE_HOST_QT6BASE_TEST
 # (e.g. qhelpgenerator).
 config BR2_PACKAGE_HOST_QT6BASE_SQL
 	bool
+
+# The Qt Widgets module is required by the Qt Print Support module
+config BR2_PACKAGE_HOST_QT6BASE_WIDGETS
+	bool
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 4c0392f92d..271f464115 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -113,10 +113,8 @@ HOST_QT6BASE_CONF_OPTS += \
 	-DFEATURE_png=OFF \
 	-DFEATURE_gif=OFF \
 	-DFEATURE_jpeg=OFF \
-	-DFEATURE_printsupport=OFF \
 	-DFEATURE_kms=OFF \
 	-DFEATURE_fontconfig=OFF \
-	-DFEATURE_widgets=OFF \
 	-DFEATURE_libinput=OFF \
 	-DFEATURE_tslib=OFF \
 	-DFEATURE_eglfs=OFF
@@ -131,6 +129,13 @@ else
 HOST_QT6BASE_CONF_OPTS += -DFEATURE_network=OFF
 endif
 
+# The Qt Print Support module is required for building Qt Tools Linguist Tools
+ifeq ($(BR2_PACKAGE_HOST_QT6BASE_PRINTSUPPORT),y)
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_printsupport=ON
+else
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_printsupport=OFF
+endif
+
 # We need host qt6base with Sql support for host-qt6tools to generate the
 # qhelpgenerator host tool. qt6tools will fail to build if qhelpgenerator is not
 # available.
@@ -150,6 +155,13 @@ else
 HOST_QT6BASE_CONF_OPTS += -DFEATURE_testlib=OFF
 endif
 
+# The Qt Widgets module is required by the Qt Print Support module
+ifeq ($(BR2_PACKAGE_HOST_QT6BASE_WIDGETS),y)
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_widgets=ON
+else
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_widgets=OFF
+endif
+
 # Conditional blocks below are ordered by alphabetic ordering of the
 # BR2_PACKAGE_* option.
 
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
