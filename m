Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD757C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 17:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F2A060F67;
	Tue,  2 Jan 2024 17:18:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F2A060F67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s6-3jckyOzr7; Tue,  2 Jan 2024 17:18:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C783D60F3B;
	Tue,  2 Jan 2024 17:18:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C783D60F3B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 25D711BF34F
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 17:18:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F393460F3B
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 17:18:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F393460F3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z5ahdY0vuZ9L for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 17:18:07 +0000 (UTC)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F2A0460E89
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 17:18:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2A0460E89
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-336f2c88361so5104257f8f.3
 for <buildroot@buildroot.org>; Tue, 02 Jan 2024 09:18:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704215885; x=1704820685;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kZypPIogniRVGDja/IxcUvdDY1dpm/Cs5ev3QuQZ+Hg=;
 b=hJ+FtPV0dIUHilt7dFX6KAmoKj/C7YEAU3PQiW9fUoXn0RLuHvMJuHul+1ViDIPoWW
 zakFN/8H/ceNAqTGYA8nOCboNiYszh9CXRaT+GPhu5yZfSM7RcpUb8nOXUJUMboBmjLw
 mVXEHoC+Rs6QbQ06qHjuuPHQqn1DqUmlS0VzZZNhwlurH915sqX36koG4XFUb6OQymQr
 6BNFVGO3locjV41hhvhaLRm1VbY58FE4E8212JsAcLuyIjfw2MCGNaQG02/rVp1IUKf0
 B3SetTwwGkAdBO6TwaMhX6EfsyAJlBtNHBIxbIbCVp6eBs1FFBVbFLORSYTQ7l7ujedg
 5tmw==
X-Gm-Message-State: AOJu0YzG8uVEg7GdUmUgV9I0clysj0w0Omh6wgZmDO54qlR/oo6Tm1pt
 EUpBJ+jismPm0TZw4pH6SLAgLa6puI0=
X-Google-Smtp-Source: AGHT+IGHDrJ9zfJUqCBqzgz5J4SxjUOSSUWiMvw8lDSUe07/JtkHYtXHL5tRF+voCS08mRPx/GuI5w==
X-Received: by 2002:adf:f644:0:b0:336:7c43:6452 with SMTP id
 x4-20020adff644000000b003367c436452mr10126257wrp.99.1704215884511; 
 Tue, 02 Jan 2024 09:18:04 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 t18-20020a5d49d2000000b00336751cd4ebsm29018355wrs.72.2024.01.02.09.18.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jan 2024 09:18:04 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  2 Jan 2024 18:17:59 +0100
Message-ID: <20240102171759.824667-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704215885; x=1704820685; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kZypPIogniRVGDja/IxcUvdDY1dpm/Cs5ev3QuQZ+Hg=;
 b=QjSy5i9rrG+py3htqf53W2C8VaqgJ4OgGP5GUvEtneclj/Z+uPiIRETgiK0y6gzV3z
 yY0FGk8PWFH0rxJE5nmt+SRtXcDjPJi4oDNMlm98RI1vO/BOk9WblEs1WiBDIV2CKmjM
 LjaQyLhdn40OCH2NwlwpTNF8MunMQws94TtMAecFl4S2PaqmmpMXPVBeDqAYTc5FCweu
 Y3I3CyclUntMc7X9R+0WPN14Au+nkuCOlJik5X8BUTqbwFO7GX7ttyiRgNA+92Ed7zKA
 pG3gfb0wvw0rsyOAncRcGFA0dEvxTZPgIQyKYkHWtLItn3T/EKexjDI5nyAs5EF1faPe
 f5LQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QjSy5i9r
Subject: [Buildroot] [PATCH 1/1] package/python-contourpy: needs C++
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

C++ is mandatory resulting in the following build failure since the
addition of the package in commit
1e7f0794bbb0075285dc3b4dab8484f12adbb886:

../output-1/build/python-contourpy-1.1.0/meson.build:1:0: ERROR: Unable to detect GNU compiler type:

Fixes:
 - http://autobuild.buildroot.org/results/6b50f9621b00aab384cc2dde77fae7daff46d08b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-contourpy/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/python-contourpy/Config.in b/package/python-contourpy/Config.in
index 4843884a97..313d270dda 100644
--- a/package/python-contourpy/Config.in
+++ b/package/python-contourpy/Config.in
@@ -1,8 +1,12 @@
 config BR2_PACKAGE_PYTHON_CONTOURPY
 	bool "python-contourpy"
+	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_PYTHON_PYBIND
 	help
 	  Python library for calculating contours of 2D quadrilateral
 	  grids.
 
 	  https://github.com/contourpy/contourpy
+
+comment "python-contourpy needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
