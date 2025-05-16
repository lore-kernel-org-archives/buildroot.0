Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F32C3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 21:05:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2F1583CD8;
	Fri, 16 May 2025 21:05:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bcMoqsdEGDw3; Fri, 16 May 2025 21:05:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18BC2813CB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18BC2813CB;
	Fri, 16 May 2025 21:05:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DF4F222CD
 for <buildroot@buildroot.org>; Fri, 16 May 2025 21:04:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C55F340BD2
 for <buildroot@buildroot.org>; Fri, 16 May 2025 21:04:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9U4A60j4Q0h0 for <buildroot@buildroot.org>;
 Fri, 16 May 2025 21:04:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BB61E408DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB61E408DF
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BB61E408DF
 for <buildroot@buildroot.org>; Fri, 16 May 2025 21:04:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id E70D34399F;
 Fri, 16 May 2025 21:04:56 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>
Cc: Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Baxiche Su <baxiche@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>
Date: Fri, 16 May 2025 23:04:48 +0200
Message-ID: <20250516210452.342275-3-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250516210452.342275-1-thomas.petazzoni@bootlin.com>
References: <20250516210452.342275-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudefjeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepuedvtdelfedvtdduveduieekhffghedvhffhveekfeekleegleehtddugfefkefhnecuffhomhgrihhnpehqthdrihhonecukfhppedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumegufeduvgemvdefheemtgehvgdvmegvugekfedphhgvlhhopeifihhnughsuhhrfhdrrddpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtoheprhhohihkohhllhgvnhhsvhgvnhgushgvnhesghhmrghilhdrtghomhdprhgtphhtthhopehthhhom
 hgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegsrgigihgthhgvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepjhgvshhsvggvvhhgsehgmhgrihhlrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1747429497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gyXbxiRmMapn6alVMiffcTcb/SLj9NEDpyKgM33LtF8=;
 b=PsPG5yK4+wa1vPwzz7GJnnfd3S8eDPyVghMNAdHiYYVbDk8YgX196v6HW/iNeFKFrlaIPh
 Fb2c49WCvxOpepM1d4/ZbmRlOC22Ugm8l+L3yB9vkhqNsPXu/NvWd/PtmykirRHuZeB86r
 wZD6EN8DkPb6W5lgDKZDskQ+zRiWisz0O3DonoLTWQd3xMB3ZP5PmdL/shG28cYqhT9d0O
 /xCfE89iEBCB6p/ljtaFI3HsgErX1L3pKAvCjL9rSwaYYQalDEiOBQ4nOoDMuhXM06eWde
 oW+xhYkb4HPcz0S87uQDst27Px4VFya/y1wrJaNhXhPXSnrIdnu+BMsNa8u8Ew==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PsPG5yK4
Subject: [Buildroot] [PATCH 2/4] package/qt6/qt6multimedia: fix ffmpeg
 plugin build for x11
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

The following defconfig:

BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_VFP=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_STABLE=y
BR2_PACKAGE_QT6=y
BR2_PACKAGE_QT6BASE_XCB=y
BR2_PACKAGE_QT6MULTIMEDIA=y
BR2_PACKAGE_QT6MULTIMEDIA_FFMPEG=y
BR2_PACKAGE_XORG7=y

would fail to build, due to <X11/extensions/Xext.h> being not found,
and then <X11/extensions/Xrandr.h> being not found. Fix that up by
introducing the necessary dependencies.

There are no build failures reported for qt6multimedia in the
autobuilders, so there is no reference to a build failure.

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt6/qt6multimedia/Config.in        | 5 +++++
 package/qt6/qt6multimedia/qt6multimedia.mk | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/package/qt6/qt6multimedia/Config.in b/package/qt6/qt6multimedia/Config.in
index ae555f98ea..3107caa597 100644
--- a/package/qt6/qt6multimedia/Config.in
+++ b/package/qt6/qt6multimedia/Config.in
@@ -38,6 +38,11 @@ config BR2_PACKAGE_QT6MULTIMEDIA_FFMPEG
 	select BR2_PACKAGE_FFMPEG_SWSCALE
 	select BR2_PACKAGE_QT6BASE_CONCURRENT
 	select BR2_PACKAGE_QT6MULTIMEDIA_PULSEAUDIO
+	# libxext/libxrandr are needed for ffmpeg plugin to build with
+	# X11 support:
+	# https://code.qt.io/cgit/qt/qtmultimedia.git/tree/src/plugins/multimedia/ffmpeg/CMakeLists.txt?h=6.8.1#n198
+	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXRANDR if BR2_PACKAGE_XORG7
 	help
 	  This option enables ffmpeg media backend.
 
diff --git a/package/qt6/qt6multimedia/qt6multimedia.mk b/package/qt6/qt6multimedia/qt6multimedia.mk
index 98ab2ec4be..c2a9d250cf 100644
--- a/package/qt6/qt6multimedia/qt6multimedia.mk
+++ b/package/qt6/qt6multimedia/qt6multimedia.mk
@@ -66,6 +66,12 @@ endif
 ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_FFMPEG),y)
 QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_ffmpeg=ON
 QT6MULTIMEDIA_DEPENDENCIES += ffmpeg
+# libxext/libxrandr are needed for ffmpeg plugin to build with X11
+# support:
+# https://code.qt.io/cgit/qt/qtmultimedia.git/tree/src/plugins/multimedia/ffmpeg/CMakeLists.txt?h=6.8.1#n198
+ifeq ($(BR2_PACKAGE_XORG7),y)
+QT6MULTIMEDIA_DEPENDENCIES += xlib_libXext xlib_libXrandr
+endif
 else
 QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_ffmpeg=OFF
 endif
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
