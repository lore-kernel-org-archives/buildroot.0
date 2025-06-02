Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0349FC5B549
	for <buildroot@archiver.kernel.org>; Mon,  2 Jun 2025 08:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD86760E41;
	Mon,  2 Jun 2025 08:01:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qTQ4CaYF19Ig; Mon,  2 Jun 2025 08:01:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38B1360FBD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38B1360FBD;
	Mon,  2 Jun 2025 08:01:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 39F9B1F7
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 08:01:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D7D2806F0
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 08:01:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zlkNCrv7FbaX for <buildroot@buildroot.org>;
 Mon,  2 Jun 2025 08:01:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 37276806EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37276806EF
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 37276806EF
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 08:01:08 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-553280c345cso5226731e87.0
 for <buildroot@buildroot.org>; Mon, 02 Jun 2025 01:01:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748851266; x=1749456066;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G/no5MQ4X9a2507qP8cPAGo07/tQK0O7rkjwlT14mow=;
 b=ug2ezK+wgHiEvNmHCArnv39eJUWLZpb/zcdRZqY40fxJgFDRapHCpJbQ4duaB7BG3u
 +n8j0BwUmAYvDufwjrvMSWhc8UIkKXAij5z1AzbxfhYDo+I/Hrz5HxvruUWTenUiIU+G
 s/adpbk+qh0r7VdyrgPV0ews3flysuToch2ZsZL42FTkqcUv/HLTaV0z/6Q2d1Dhulnb
 Ur3XnOJI8WqgNDWJQJGFhEKvRbTknm98yOU4ma47TfBAWJlIjUvHVoofBQ9c+kP1N2Bl
 73BQ1T0kfZYdsXimSGRapXCfVRZ06v9LcYnxyDWfruw3KS7icYL5KQzGB03EfzREt2qA
 sItQ==
X-Gm-Message-State: AOJu0YxxfIfcQyqNsjQGKhUfOYnm094eSoZ7i3eu4qmtBE400V+cGczR
 g/DcKm98Su2kO869XPf/VvwlGXcz/Y+CKJt1qAPBjWb5EAJNuYdi1gtFE2dRcA==
X-Gm-Gg: ASbGncsJ1W4Hz2+tjtl+qXDVzHDcp/du3nNr2AN+OUmQG76yAaWKInMm5Afz2He64zc
 bWkN5stcXaZDBSXn26jCJJK/kloLNrl9s+K6li+bRC/Y159cXP8vLe00mEOd0TEZ9EywhxVwSnS
 PvyE2RYXrNDkv/rlKTqK9Z+whhOurVrH9p2jWbQM73M4MV1NN3A5VOh+gFhzL+38CNVwj7D5jlY
 OOhyUbhueboe5Yts9b2eeZlpTUo0xdLEfhxyQJKqGA/xHZH1LTny9Ih6NZutXJoRFVUQ0KEeLgN
 rZDs6ubi91w22iHM+cyv7GBz3nZn/Yjjgly4jVNBT5DreP0pjiLP9k8me5K9MYEoQ/xpUc0MjcI
 aTKjsjFNVeQ==
X-Google-Smtp-Source: AGHT+IFExo01QGuqcoJXTcn+7tL+gH+yFYM53bSGH/FStDbIVhafoI8HwDISd2b1QE77Bk6kAfoQVA==
X-Received: by 2002:a05:6512:b96:b0:553:3073:c38b with SMTP id
 2adb3069b0e04-5533d14f123mr2864529e87.1.1748851265840; 
 Mon, 02 Jun 2025 01:01:05 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5533793770bsm1495467e87.238.2025.06.02.01.01.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jun 2025 01:01:05 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  2 Jun 2025 10:00:53 +0200
Message-ID: <20250602080056.2466471-4-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250602080056.2466471-1-roykollensvendsen@gmail.com>
References: <20250602080056.2466471-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748851266; x=1749456066; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G/no5MQ4X9a2507qP8cPAGo07/tQK0O7rkjwlT14mow=;
 b=cFYEopiYKp8xE+owUWmFW062pYD+DAThePzLqyujBGt0Loa84jQAxSqo/lGNtJ5G78
 xi078Ll7aMQyn2FdoGAQDPaVWqsARyveVdCOVSWZeIDpMh+4l/lCLdU4PcIlL+9IHLKW
 17a0f2MvdGOh6I6ZV2LTZraHFb7TMPZsq2ZDcZNpSKigzHObzjR464KzkRNJR+KSUceD
 c/JGA9msZuphRxuMV1dORx7HKyUMuH2U7OtleuopB3QGjPjg6nhiDGgNcnsc+NNlli9y
 QkzoKmG8brqk1Fx07GJrqFGhk88bMrMZ8wtiFAQ4daRKjq2ycrfggNPzr+mV+BxaUucJ
 OENw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=cFYEopiY
Subject: [Buildroot] [PATCH v4 3/3] package/qt6/qt6tools: build without
 clang support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
If external clang is available on the host system, the buildsystem tries
to use it. The result will be unpredictable. We can't use the version of
clang that is shipped with buildroot either, because it is too old. See:
https://code.qt.io/cgit/qt/qttools.git/tree/.cmake.conf?h=6.8.1. So we
disable clang support in qt6tools for now.

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/qt6tools/qt6tools.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/qt6/qt6tools/qt6tools.mk b/package/qt6/qt6tools/qt6tools.mk
index a818cd7abc..fd32b3352a 100644
--- a/package/qt6/qt6tools/qt6tools.mk
+++ b/package/qt6/qt6tools/qt6tools.mk
@@ -36,6 +36,10 @@ QT6TOOLS_CONF_OPTS = \
 	-DQT_BUILD_EXAMPLES=OFF \
 	-DQT_BUILD_TESTS=OFF
 
+# Disable clang support in qt6tools for now, as version 17 is needed:
+# https://code.qt.io/cgit/qt/qttools.git/tree/.cmake.conf?h=6.8.1
+QT6TOOLS_CONF_OPTS += -DFEATURE_clang=OFF
+
 QT6TOOLS_DEPENDENCIES = \
 	qt6base \
 	host-qt6tools
@@ -50,6 +54,10 @@ HOST_QT6TOOLS_CONF_OPTS = \
 	-DQT_BUILD_EXAMPLES=OFF \
 	-DQT_BUILD_TESTS=OFF
 
+# Disable clang support in qt6tools for now, as version 17 is needed:
+# https://code.qt.io/cgit/qt/qttools.git/tree/.cmake.conf?h=6.8.1
+HOST_QT6TOOLS_CONF_OPTS += -DFEATURE_clang=OFF
+
 HOST_QT6TOOLS_DEPENDENCIES = host-qt6base
 
 ifeq ($(BR2_PACKAGE_HOST_QT6TOOLS_LINGUIST_TOOLS),y)
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
