Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 734EAC3DA6D
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 21:05:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E91596133E;
	Fri, 16 May 2025 21:05:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LXxdsEIC1Byf; Fri, 16 May 2025 21:05:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9489A61357
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9489A61357;
	Fri, 16 May 2025 21:05:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 67E931142
 for <buildroot@buildroot.org>; Fri, 16 May 2025 21:04:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5907840581
 for <buildroot@buildroot.org>; Fri, 16 May 2025 21:04:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CZ9GOwXKs9QS for <buildroot@buildroot.org>;
 Fri, 16 May 2025 21:04:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 44891400C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 44891400C5
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 44891400C5
 for <buildroot@buildroot.org>; Fri, 16 May 2025 21:04:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 46E8B4399E;
 Fri, 16 May 2025 21:04:56 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>
Cc: Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jesse Van Gavere <jesseevg@gmail.com>
Date: Fri, 16 May 2025 23:04:47 +0200
Message-ID: <20250516210452.342275-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250516210452.342275-1-thomas.petazzoni@bootlin.com>
References: <20250516210452.342275-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudefjeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepuedvtdelfedvtdduveduieekhffghedvhffhveekfeekleegleehtddugfefkefhnecuffhomhgrihhnpehqthdrihhonecukfhppedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfedphhgvlhhopeifihhnughsuhhrfhdrrddpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtoheprhhohihkohhllhgvnhhsvhgvnhgushgvnhesghhmrghilhdrtghomhdprhgtphhtthhopehthhhom
 hgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehjvghsshgvvghvghesghhmrghilhdrtghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747429496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i28Dp0bScwLz6C7uVf2x3AdXofLZQ+P4f0lhdHHoBHY=;
 b=RgekyX6gcGf+xw7CXqPoazIM39m8+LBppxvOmmRiKpbCCnOzXoxk6P8B2gQbF8CfH4NNct
 WNpka4CGlj2Sz4B8IACZ5mB+Qbgy26HhPsK3Qn4wVFKUes2nQBwRSLIs4jZ0kKkLzmYLsT
 VtTtRYVZauTFOrjH66LhuGCxdq25DV6aqiCVKHGdRBLIcnJB9TXpuTDQc9kmmeolK4zIZU
 gF//2+q6Y37SsIhJ5CTKi6U7B3RptVKf+aRwQqyvX/jFL0MhCiaF+qMAcDENlGTQ4k+UeE
 cIq20sdhklDbUYLxhS3GeNjn0i4iAleIR4RjWVmoR4t0oUoywvwc0H3fsaPoww==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RgekyX6g
Subject: [Buildroot] [PATCH 1/4] package/qt6/qt6base: fix build when xcb
 support is enabled
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>

Fixes:
ERROR: Feature "xcb": Forcing to "ON" breaks its condition:
QT_FEATURE_thread AND TARGET XCB::XCB AND TEST_xcb_syslibs AND QT_FEATURE_xkbcommon_x11
Condition values dump:
QT_FEATURE_thread = "ON"
TARGET XCB::XCB found
TEST_xcb_syslibs = "FALSE"
QT_FEATURE_xkbcommon_x11 not evaluated

The xcb feature is defined in [2].

According to [1] XCB::CURSOR is needed for xcb support.

[1] https://code.qt.io/cgit/qt/qtbase.git/tree/src/gui/configure.cmake?h=6.9.0#n522
[2] https://code.qt.io/cgit/qt/qtbase.git/tree/src/gui/configure.cmake?h=6.9.0#n1016

This bug was introduced in e634be8906bd64d6a9de1768204d0f03d8d8357a,
and fixes the build with the following defconfig:

 BR2_arm=y
 BR2_cortex_a9=y
 BR2_ARM_ENABLE_VFP=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_STABLE=y
 BR2_PACKAGE_QT6=y
 BR2_PACKAGE_QT6BASE_GUI=y
 BR2_PACKAGE_QT6BASE_XCB=y
 BR2_PACKAGE_XORG7=y

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt6/qt6base/Config.in  | 1 +
 package/qt6/qt6base/qt6base.mk | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index 96a0416dbd..7f3948ec27 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -61,6 +61,7 @@ config BR2_PACKAGE_QT6BASE_XCB
 	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_LIBXCB
+	select BR2_PACKAGE_XCB_UTIL_CURSOR
 	select BR2_PACKAGE_XCB_UTIL_IMAGE
 	select BR2_PACKAGE_XCB_UTIL_KEYSYMS
 	select BR2_PACKAGE_XCB_UTIL_RENDERUTIL
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index a4c56da601..39fb440be7 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -211,6 +211,7 @@ QT6BASE_CONF_OPTS += \
 QT6BASE_DEPENDENCIES += \
 	libxcb \
 	libxkbcommon \
+	xcb-util-cursor \
 	xcb-util-wm \
 	xcb-util-image \
 	xcb-util-keysyms \
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
