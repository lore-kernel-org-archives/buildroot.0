Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85FB4C2BBCA
	for <buildroot@archiver.kernel.org>; Tue, 25 Jun 2024 21:20:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B798040592;
	Tue, 25 Jun 2024 21:20:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TszbiRhI40YB; Tue, 25 Jun 2024 21:20:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3752E416D8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3752E416D8;
	Tue, 25 Jun 2024 21:20:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D675C1BF417
 for <buildroot@lists.busybox.net>; Tue, 25 Jun 2024 21:19:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D17EB80E8B
 for <buildroot@lists.busybox.net>; Tue, 25 Jun 2024 21:19:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id apVniEuTOXUT for <buildroot@lists.busybox.net>;
 Tue, 25 Jun 2024 21:19:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 17A9B80E46
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17A9B80E46
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 17A9B80E46
 for <buildroot@buildroot.org>; Tue, 25 Jun 2024 21:19:06 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2ec17eb4493so81336071fa.2
 for <buildroot@buildroot.org>; Tue, 25 Jun 2024 14:19:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719350345; x=1719955145;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7TQZdR3rgNALMznLtPfCIXMpuUhTyUUWDpEn2e3WYH8=;
 b=BOGCdQQnK+a2asPN2IyWmRx4/C7g04wZbp1TGAkhB2tuag2i+QwVTq3qmmJFGAZhPy
 tvlI0oAAspwjodUcm2BYioFMRlY387eCZ90w3k4QIXmKMFlhsDhYcwbQ29lutAPEJomu
 xukr1sg24ojKI4xzVud0y+mjqjZfvc+F0pN/i2omJY+XG2uhbxjrdfS2ocAEu07A+asz
 BC83zeaWpEsDgIoZRj8+S5XADVWcMek9nHRh+Ib9/BpK4zSu/LTCQZjfTHhDJKSs9D0R
 ga7LOXLWvP14GebP0zilYnJ79WVugBfpmhU4OnFGdJeobgV/J/CO13gQVbqlX4QDZaTX
 pPUg==
X-Gm-Message-State: AOJu0YwLjoX9MU5E+hbBwoASQ7FhqAg/cWot4qLQnHKVmALK/qYZC2m7
 A+F8OyLaMR7v9yRzVXJkmsTNtG0xbdURsrbmMF+iboZszKNwMUx98g/4qw==
X-Google-Smtp-Source: AGHT+IG3TqTtNh5BcFrPh9Tq8C/ssP2OTUO6sxaIhbfaWGkekSlvxZrWCfbj3cbWwIE0XfqUJcoKeQ==
X-Received: by 2002:a2e:9c98:0:b0:2ec:e719:c7ed with SMTP id
 38308e7fff4ca-2ece719c93dmr6435011fa.27.1719350344783; 
 Tue, 25 Jun 2024 14:19:04 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec592b6158sm8908971fa.3.2024.06.25.14.19.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 14:19:04 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 25 Jun 2024 23:18:27 +0200
Message-ID: <20240625211847.1419944-3-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240625211847.1419944-1-roykollensvendsen@gmail.com>
References: <20240618212646.4154474-1-roykollensvendsen@gmail.com>
 <20240625211847.1419944-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719350345; x=1719955145; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7TQZdR3rgNALMznLtPfCIXMpuUhTyUUWDpEn2e3WYH8=;
 b=Qk2CKJIkcxbcBHiYJZrwnaXkQIu0GAgCbdQJWE9qbJ9rbS5gAJyC3z4h79S3wXrReb
 vJcwYuj1kdqAzx6Tzbwl+blOoEWXd6fJgZ+O5RWEmVi6gyK15yb2d4XNkvEuGv5YFLgO
 zq5g8kavJhhMy+aSqD6loZoBvCdFRhBpjHQT3AlR5FIz6Kn2qJgZKQYJVxE77XbKm14p
 El6xxU0WM5ZyWwSZzLsmdLfKr9nnIH+X7WJGc82ld88twoZm4lqwJDzt2KoQxPbhWJZt
 GzFARRRmkeEZUdBvYUW/jU8zPVYGDg/YfIyMA5H2BT41F6mJS6UqUpXuzU9ggH9E3nbG
 7myQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Qk2CKJIk
Subject: [Buildroot] [PATCH v9 03/14] package/qt6/qt6base: add blind option
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
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Jesse Van Gavere <jesseevg@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The Network module is explicitly required by qt6tools.

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/qt6base/Config.in.host | 5 +++++
 package/qt6/qt6base/qt6base.mk     | 8 +++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

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
index a229c62844..509c6b0066 100644
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
@@ -105,6 +104,13 @@ else
 HOST_QT6BASE_CONF_OPTS += -DFEATURE_gui=OFF
 endif
 
+# The Network module is explicitly required by qt6tools.
+ifeq ($(BR2_PACKAGE_HOST_QT6BASE_NETWORK),y)
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_network=ON
+else
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_network=OFF
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
