Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C6FBC02183
	for <buildroot@archiver.kernel.org>; Fri, 17 Jan 2025 10:49:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 036506FB1F;
	Fri, 17 Jan 2025 10:49:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EAkoe5jxi8WY; Fri, 17 Jan 2025 10:49:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDF4F6FB22
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDF4F6FB22;
	Fri, 17 Jan 2025 10:49:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BE51B94B
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:49:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ABCE041A08
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:49:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xq9TK1GVM6TB for <buildroot@buildroot.org>;
 Fri, 17 Jan 2025 10:49:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DA35041A17
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA35041A17
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DA35041A17
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 10:49:47 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5401b7f7141so1760681e87.1
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 02:49:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737110986; x=1737715786;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wQKhb47wo+TlhDw2DVjCfnYB6u9hoXQoGintDG/89VM=;
 b=p4vzQHJ1gU55U+vLTiePNp7k4VJCnnpOo8ZL7NMb1PalL5+0r8QwfKWMAut+KezFiF
 QxzOhhUkn5saP2PpeQfATRo30Kihdi+AWQQl1LyHuxZn2UEI8TkuywUJJvHh/Ivm/iw4
 F/VSZtlnuXcbfMAKlYbilWr4dCG1JMHPvtbkCOs7XtLyFO/ncpeYLe6Qcd66jFO9OF5S
 CZKzVJtk0BJNthA3hiUu3T6lGXAJo0hhuvgDAQ7BzkTxGGS5OE+RyrFufok1Ivg6zZe+
 TZgZAsh/y0UewRbUvxAy1OHji5O0dND4ifugVZ4vIsfo7qkJJf7Xh5VVu3Th5HbbrCNG
 stvA==
X-Gm-Message-State: AOJu0YyVPS74ghuT/pKlXDIv+yfJMk7Jx32MDehXvNW/paJ1oHcuPzg7
 ZAhrLABlMJVNiGf+/FqjlAvgulNHtdDvrvBiIgWI2GXDCXBshGFloPYZeA==
X-Gm-Gg: ASbGncs9pbwzBoqVDSPaN2D7TbD/sukKyEix/EI4s9dOb4ivBNAQgaHe+S7zbLHwSAt
 liQNFaGwsgllI3vF59BwW73a8Et39/7osC5wjKlkZU6dQdzfC2yDW08tP6lYkCPR+T6KwO3QBeb
 HCv9M/CsKb/J4u1/ngUQzCd94gG9YnOcp20GoZjY9noPYPeVIYxqfnS/Q8/gscLJ4npSiHpd4rk
 EeGvgs5KgDlE2ACgHIlOJQrFsbCuAZ3SpwVOxo5UgzybNNSU18ueVJ8LLe+c/9+AVGEAzP2eovt
 HR+PQnmOcv4=
X-Google-Smtp-Source: AGHT+IFvrFhq8wx2Q6rRkF6/4+0ZJQgLb31sqwhE2MCHxtS7VQrsYswUgIx+9pLq7Rf5eFt+vnMAaw==
X-Received: by 2002:a05:6512:1191:b0:542:2e09:637a with SMTP id
 2adb3069b0e04-5439c224ac3mr628942e87.12.1737110983782; 
 Fri, 17 Jan 2025 02:49:43 -0800 (PST)
Received: from precision7530-arch-roy.lan ([79.161.254.156])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5439af0ec7csm313520e87.97.2025.01.17.02.49.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 02:49:43 -0800 (PST)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Baxiche Su <baxiche@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Jan 2025 11:48:45 +0100
Message-ID: <20250117104911.613221-5-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250117104911.613221-1-roykollensvendsen@gmail.com>
References: <20250117104911.613221-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737110986; x=1737715786; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wQKhb47wo+TlhDw2DVjCfnYB6u9hoXQoGintDG/89VM=;
 b=eef+og9TF/WUnYK8bn9gGz+tY59ZssfUldR9DSMrNxAbggcJnP/zdyEz8A4g2R/FDX
 W6Sx4e7Lilrd+SRQiVAl7ABudG7D1ejtod07L9s1xkiS1kZiRAPK7mqv5iBOkXCYElCU
 /ePo1aGOUYbj58btJgxxO98pVCdSvFiNxtlvDydrrQctLuZbS0Dv3QU4n4qVTH0JYanf
 I6v37QspIvMOmw11wElDA8ftLsn9AcSXL1i8HgxiKpL00HEPMgaDTYi2vXmiWR7pt+1t
 dKEaGBZvoabadcPhTCYcSwahemTd4aDlRl7WFE3nQH0WgrCvFyv9pUgBe4Am7wBIlcSJ
 pX0Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=eef+og9T
Subject: [Buildroot] [PATCH 05/19] package/qt6/qt6multimedia: list only
 overall license
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

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/qt6multimedia/qt6multimedia.mk | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/package/qt6/qt6multimedia/qt6multimedia.mk b/package/qt6/qt6multimedia/qt6multimedia.mk
index af50612e1c..01bf9adf96 100644
--- a/package/qt6/qt6multimedia/qt6multimedia.mk
+++ b/package/qt6/qt6multimedia/qt6multimedia.mk
@@ -10,13 +10,7 @@ QT6MULTIMEDIA_SOURCE = qtmultimedia-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6MULTIMEDIA
 QT6MULTIMEDIA_INSTALL_STAGING = YES
 QT6MULTIMEDIA_SUPPORTS_IN_SOURCE_BUILD = NO
 QT6MULTIMEDIA_CMAKE_BACKEND = ninja
-
-QT6MULTIMEDIA_LICENSE = \
-	BSD-3-Clause (buildsystem, examples, pfft,  snippets), \
-	GFDL-1.3-no-invariants (docs), \
-	GPL-3.0 (tests), \
-	GPL-3.0 with Qt-GPL-exception-1.0 (utils), \
-	LGPL-3.0 or GPL-2.0 or GPL-3.0 (modules, plugins)
+QT6MULTIMEDIA_LICENSE = GPL-3.0, LGPL-3.0
 
 QT6MULTIMEDIA_LICENSE_FILES = \
 	LICENSES/BSD-3-Clause.txt \
@@ -61,11 +55,6 @@ endif
 ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_FFMPEG),y)
 QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_ffmpeg=ON
 QT6MULTIMEDIA_DEPENDENCIES += ffmpeg
-QT6MULTIMEDIA_LICENSE += , \
-	BSL-1.0 (ffmpeg-boost), \
-	IJG (ffmpeg-libjpeg), \
-	LGPL-2.1+ and BSD-3-Clause and BSD-2-Clause and BSD-Source-Code and ISC and MIT and MPL-2.0 (ffmpeg), \
-	Zlib (ffmpeg-zlib)
 QT6MULTIMEDIA_LICENSE_FILES += \
 	LICENSES/BSD-2-Clause.txt \
 	LICENSES/BSD-Source-Code.txt \
@@ -108,10 +97,6 @@ endif
 
 ifeq ($(BR2_PACKAGE_QT6MULTIMEDIA_SPATIALAUDIO),y)
 QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_spatialaudio=ON
-QT6MULTIMEDIA_LICENSE += , \
-	Apache-2.0 (resonance-audio, eigen), \
-	LGPL-3.0 or GPL-3.0 (resonance-audio, spatialaudio, spatialaudioquick3d), \
-	MPL-2.0 and BSD-3-Clause (eigen)
 QT6MULTIMEDIA_LICENSE_FILES += \
 	LICENSES/MPL-2.0.txt \
 	src/3rdparty/eigen/COPYING.BSD \
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
