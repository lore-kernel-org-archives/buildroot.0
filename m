Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75419C61DA4
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 16:06:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 20287416E5;
	Wed, 22 Feb 2023 16:06:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20287416E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l0wu-rinYzm7; Wed, 22 Feb 2023 16:06:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5EB67416DF;
	Wed, 22 Feb 2023 16:06:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5EB67416DF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CD9CA1BF847
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 16:05:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A79D461179
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 16:05:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A79D461179
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9v_zZQegMnCI for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 16:05:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 997986116E
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 997986116E
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 16:05:29 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id t13so8209596wrv.13
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 08:05:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GAaGD9lIp4sdXXUvgE6UEJeqg5VngPaZk3KuRud7wzw=;
 b=01IO1rW+1x3/kO0yw/FWrNN3ANaUiNTz+0IlYsAfVDej0KBkUsd3xPX4sQ6SA2a8BR
 f/E50iGbOS+I0Ik7uxLHI/92PC8WaQo4b8hNMA/UG9yLAhkUobkvKJjovHzqfobcweeQ
 DAKusA2tPmaAPV7egDtSaYupWIkSwsrI4IqgUYDpZ+xg0Bkjw6IaWH2hCP9YviePCFCV
 Jt8uFV/D8tq7D6pX0Nh+GZQQzPyUvniyoIBLJZ/w95PZ8eHq1Ji4K1KPbFkLtNScFEtv
 WnydEO2lVNQ3KMHA6VByC24wxyJjgRXNcBNtSMpC+KOkyTIqvVAAGXwzdWKn/I93Q0dP
 GmmA==
X-Gm-Message-State: AO0yUKVyiMZg9ie3y9VLi6oSg+6OpkYjU7uwtxq/4HbkfK89sgnYmEDe
 9eo7oUmLC1I6GYuUk+IzL7F9RTiESI8=
X-Google-Smtp-Source: AK7set/KW25t/5raREKC9mEzzy6Xf8aEzBxp1yvE38CozokxLLD8Q9Wg5gGeoi/xnzLCSOpmKQN6KQ==
X-Received: by 2002:adf:f748:0:b0:2c5:534d:eebb with SMTP id
 z8-20020adff748000000b002c5534deebbmr6645312wrp.13.1677081927556; 
 Wed, 22 Feb 2023 08:05:27 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 m22-20020a7bce16000000b003e209b45f6bsm6490531wmc.29.2023.02.22.08.05.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 08:05:27 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 17:05:13 +0100
Message-Id: <20230222160514.2069544-4-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230222160514.2069544-1-fontaine.fabrice@gmail.com>
References: <20230222160514.2069544-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GAaGD9lIp4sdXXUvgE6UEJeqg5VngPaZk3KuRud7wzw=;
 b=hYKZ0LzSfYpkc1Z8Hyb1XR8Yh6AepKvFZf8JW0vPPAYn7ioBnJu06+PGzFBhbW2S4V
 4D4S2czQU4GlOrgduHkpo8tKipSbxwCbbxpNn9sM07dpP9GhZu80MkCLcOjwLYeaDPrx
 UlHduuDb5Hnomve0rqFf7AbJm/e9wRBSwTO61pGajfc0tLcBVAVESp9BRwnwbIzgHr8V
 wAMK+ZMEsZEEBi0m6WxYB/flhpHytjlaLChq6rhr22NKDUyngiJZ4BfUJfgXXW0km0zF
 FEKs4SH73bM4WVGxZLrJNXw9uSM3UPEs1sCQp3JKViNGdxWi+7L6aOp+brh26NV2SVpC
 YB1A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=hYKZ0LzS
Subject: [Buildroot] [PATCH 4/5] package/gnuradio: add gr-network block
 support
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

grnet networking block support is available since version version
3.9.0.0 and
https://github.com/gnuradio/gnuradio/commit/cc37c3e8cd5eabcb5c9d919e5fffc5d938690140

gr-network is a mandatory dependency of latest gqrx

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gnuradio/Config.in   | 6 ++++++
 package/gnuradio/gnuradio.mk | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index 1824589263..51237e62b9 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -134,6 +134,12 @@ config BR2_PACKAGE_GNURADIO_FILTER
 	help
 	  Filter signal processing blocks
 
+config BR2_PACKAGE_GNURADIO_NETWORK
+	bool "gr-network support"
+	select BR2_PACKAGE_GNURADIO_BLOCKS
+	help
+	  TCP and UDP source/sink blocks
+
 config BR2_PACKAGE_GNURADIO_QTGUI
 	bool "gr-qtgui"
 	depends on BR2_PACKAGE_GNURADIO_PYTHON
diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index 59fb23d89d..d9218b533d 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -106,6 +106,12 @@ else
 GNURADIO_CONF_OPTS += -DENABLE_GR_FILTER=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_GNURADIO_NETWORK),y)
+GNURADIO_CONF_OPTS += -DENABLE_GR_NETWORK=ON
+else
+GNURADIO_CONF_OPTS += -DENABLE_GR_NETWORK=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_GNURADIO_PYTHON),y)
 GNURADIO_DEPENDENCIES += python3 python-pybind \
 	host-python-numpy host-python-packaging
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
