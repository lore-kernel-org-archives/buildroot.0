Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D17C3C25B78
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 22:04:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A3949415B1;
	Mon, 13 May 2024 22:04:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8V5jPvGhUNDg; Mon, 13 May 2024 22:04:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46277415D6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 46277415D6;
	Mon, 13 May 2024 22:04:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1BEF71BF2C0
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 22:04:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB584415B1
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 22:03:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1aacEUZjtIcm for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 22:03:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9B7EC415A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B7EC415A9
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9B7EC415A9
 for <buildroot@buildroot.org>; Mon, 13 May 2024 22:03:58 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2e0b2ddc5d1so71836861fa.3
 for <buildroot@buildroot.org>; Mon, 13 May 2024 15:03:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715637836; x=1716242636;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zfToIYT7yA0jUMs9H0HIm0OUBcvGZYYoyuhVtx4cze4=;
 b=dF/deAdHia/J+6gBNkiEU9bJ62zv0wtzx2bKvFnETYIlKAaXGbg30eAvCvuWFFBC14
 PsSfJcAAPZ4+o9jo6XXChSpQfSMz9dT1elUrFAg3TJNX76pVqPPwcaGcR/2wIeg5wUpk
 I+3Z5QwdqDDMz0Gkyb4MRJUKiG9R/xZX4eTlBr7Te64yf8BYPvqdonEOAy4zgH+xdjr8
 5NNGNLn45y5qf03rzRJ+EfSCZhNEOsXJKrbDR9MDTo1/+qWhFnSsCj64Y/aiQOlYw4Si
 78zRdifuQnxkfW3XN4J7igKwINz/EPEsXjUVOjHb67/eLRPUMuX945o306w7sMk3dIYK
 OzMA==
X-Gm-Message-State: AOJu0YxSi6dGGE76Kf+2NefKrXGDQDafoACBFWT+2eVASK353fHLPGsw
 qcIX20oe+Bo3PQXguyYD9DavPIWioWwV1kmqSfSr32GWH6ZiR1bi1hRCCBq9
X-Google-Smtp-Source: AGHT+IGCNEuIZiFni+Vgq8mUW9hA/a02HOwn8auYHA0/0GB+AHpXb66W6tWVDJSDewmJk/VfrQ2oBQ==
X-Received: by 2002:a2e:9b8b:0:b0:2e5:59a:591d with SMTP id
 38308e7fff4ca-2e51fd3fe2emr77227431fa.4.1715637835680; 
 Mon, 13 May 2024 15:03:55 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e4d0ce3488sm15548401fa.52.2024.05.13.15.03.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 May 2024 15:03:54 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 14 May 2024 00:03:09 +0200
Message-ID: <20240513220328.1085629-4-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240513220328.1085629-1-roykollensvendsen@gmail.com>
References: <1934329>
 <20240513220328.1085629-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715637836; x=1716242636; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zfToIYT7yA0jUMs9H0HIm0OUBcvGZYYoyuhVtx4cze4=;
 b=UPZRSPeUhNWIpz1tIkakBTgdsgdSE5N98hVNpX2hfuD284r6kH9CIE0EAsy/0tZayj
 uOeRoVqpwbb7xcQuJVlCopfdV2+pz5WTLTxVGdKryOWlBpBxpt0qOQcs3S/6Z05Y1/mM
 q7LW6qXycLpwf/QTjitVJn1ns9r6VSzWEsWU5c7jMXpgEIB19VDIrCFzZ8W0re/ADdzM
 40dfqYcTTeD4Rx6H3DhuLQcy8zyVsrpVVjQ6YcRXMaGXXbiPiecIBTgFD6JpPXnGK/WQ
 kv+PN+O7CGefKitq4hzyWN6m0LOLrtVTnYAQ/79naWuqyVgWk+2SvJTtKVZFN6LRNxxB
 n+MA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UPZRSPeU
Subject: [Buildroot] [PATCH v4 04/14] package/qt6/qt6base: add blind option
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

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
Changes v3 -> v4:
  - This patch was added in v4. Required by patch 9/14.

 package/qt6/qt6base/Config.in.host | 5 +++++
 package/qt6/qt6base/qt6base.mk     | 7 ++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

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
index 684bb86bc9..b19cce26f8 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -87,7 +87,6 @@ HOST_QT6BASE_CONF_OPTS = \
 	-DFEATURE_concurrent=OFF \
 	-DFEATURE_xml=ON \
 	-DFEATURE_sql=OFF \
-	-DFEATURE_testlib=OFF \
 	-DFEATURE_dbus=OFF \
 	-DFEATURE_icu=OFF \
 	-DFEATURE_glib=OFF \
@@ -108,6 +107,12 @@ else
 HOST_QT6BASE_CONF_OPTS += -DFEATURE_network=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_HOST_QT6BASE_TEST),y)
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_testlib=ON
+else
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_testlib=OFF
+endif
+
 # Conditional blocks below are ordered by alphabetic ordering of the
 # BR2_PACKAGE_* option.
 
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
