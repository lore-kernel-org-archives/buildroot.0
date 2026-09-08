Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA4B9C79FA1
	for <buildroot@archiver.kernel.org>; Tue,  8 Sep 2026 14:13:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 888F360710;
	Tue,  8 Sep 2026 14:13:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qNCsHoWManMq; Tue,  8 Sep 2026 14:13:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8E15860745
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788876796;
	b=jurhrZeaLfLiXd0Rwz07hsrRUNMm2DstsEMuRwalqoeYTylOhIcoxhyd5v4WACm0LAAU
	 urSoOyQZIDG+fLjFLODkvzP6ZakRUcAm5aSKOW4fs6h5jMm92BqiEhcTR03iLCv1sh+Rm
	 ChsR9MxsPtcVoktTygNkbnx9Ii2QPaHuJfjhaPVleEQhrrNta7bhVuZ5eiKwphA7TLk6d
	 l+xR94SYJgcX4KaNBu0JBS0tiVgtfNwupITWQXUXlGjIyMzOWhs7X0ubEK4ZaT8GzGKh4
	 d3JeYbxKmtHA5x7l26rqcZbYzcdyPU2J4wBADgIqY+gA+QxKdtjlG/kSAurtroGC3Tw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788876796;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=9L+pugMuebMxPPhPOJDtcMt1+spaNHzmw6Y3fhULouM=;
	b=fUZMiG+B9lWqpH3F86gYnDV52MsnfCQb1GvULUB3ye9/sc7uqp4c4DlM4Uynvy5MYXKz
	 SjIAgC2mPjPEAHbN82gYD2ih9MAzFjsMvI5AMWrM9b+ls+AVLZbyjRcsCbMhFWb24nw2w
	 U11hSkQBMphlOEO0zk/kSHS8NJrlM+7ryVgy5KVVLJum765rQ30TQYk24HXj6Ye8SvCbV
	 FGDC+WXuerfTSZ5HV9MbXKY4jHgrg6bioNMDnv+vNEmelj9FfJtGEDkTANIMPeEVtIABX
	 M3VMTctVBICxBVqgOPmHtuZQivZe7UvjEpWLPBGdjwi570ev30+kKYytsPTtM7bwx2g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788876796;
	bh=9L+pugMuebMxPPhPOJDtcMt1+spaNHzmw6Y3fhULouM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Fr5m/XfI5HF4wFiFtvG4RHFRCBiHM5L/cUuKMPTAlo1lHL3d4P/hxSbT/a3SXIMpK
	 uv1+NqcNeTjdvsE1q7eipI0f14Lo24E7tO3c6VrHf8wK5QEi9fRNHm7x07dx59/Rri
	 TtMTjz/yBHVufZyCMb/1dK8soWn2dgIeq8jsiYHWyT564hETk9mQzONHDy/RXyuCPa
	 Arw9IvdlJLp0QUnIU2woHowswVKp6q2Eyr+Xmc+JxJYQQVYYH1nQtgUPcSTll6GjXm
	 NKoSyikT1W7Au5giN6C/EjlejQVmVw5GM1kA3ALGrwNP+4fLhuGislozNk3VyrZ4wy
	 u2GWWaL2cEjlw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E15860745;
	Tue,  8 Sep 2026 14:13:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8022BD5F
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 14:13:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 71F6880A92
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 14:13:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pBVz5eb6ocPx for <buildroot@buildroot.org>;
 Tue,  8 Sep 2026 14:13:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7D46380AE3
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::42d"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788876791;
 b=ocH2CJnaWrrcpPWnVfQAgflRzT87d38b8aA5YsZIwOHint5gc2FpMiCSJoRRh/F8mX1T
 4R8Grlu+NQpGkLeLRgSZWNg/8F9vlwCGds09fch5JfP365x8l08jCTMPuyMl6hjxth0G9
 dgYd9icCOUd1wUrdHpZ/H7dOKkFupDXQZhYL8OA4kriN+9mD2t1J9zeVWKQNLB/uaXxDy
 KRDT9INAbuEUx8V6/gBDwXLt8OzAhjnbu4TzADIawrrF1fkGvJ5zvePFYle7j5fmNZq42
 t2K2k4y39x+OyZJPo1HKlJicwBzdPZU7P7EZpcJZujieVCu4Wo5CJFs7SkuvGjva2Hw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788876791;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=O5P5nkyq0hPCVocnpTwOrn9Pkk7unn0FdtvmXk4STK8=;
 b=fJ1Xr6tjVFRcHUQTvUkEw7udV8mW2jGXMxQk+KP89dDoliWyaEa7e1gwCk47swENqb2t
 wD9rzsXTdO3mYNAiZyColVIcFqgBOUNWoIbN9eFtZUC7/Ju47X6ZVs+cB4xyvLfR3pMzT
 qAKQgiU8qE43AmvLLF7tkv29NskymF+01gPov4OABiywRN3vlnuvAglSC8tyO2awkLh8e
 ncbyK312+TDk1kMNbYtJV8BzYeHazk1UzY7oOMtiwH4nQQ8y/Ypns8qtqtI5+2sZsM91J
 wwuUiR6OPktPgyHtkIZF+ZdDN7S2ayOwJ6Imq+aDoIfOtA3vAjsJaclENSAosYzTMRA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=amarulasolutions.com; 
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=EAzcRPL5; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=EAzcRPL5
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7D46380AE3
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 14:13:11 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-4858303de5dso5724463f8f.2
 for <buildroot@buildroot.org>; Tue, 08 Sep 2026 07:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1788876789; x=1789481589;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=O5P5nkyq0hPCVocnpTwOrn9Pkk7unn0FdtvmXk4STK8=;
 b=EAzcRPL55yMTYVX3zcmnQ5JRP5GUV88MFYNAsrAY+9bjvCoow0GDIGNx0Omq9T/bi2
 Ocnh1SpgIBiC1AcuGxHIPTpbGQ4CdrplZsOr4c1exVV5zPPG+q5VblJhFIgV2FFGjfsh
 vt5e0FJdj0LJG+behh9+gqf0suhrW1yw7+2YI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788876789; x=1789481589;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=O5P5nkyq0hPCVocnpTwOrn9Pkk7unn0FdtvmXk4STK8=;
 b=nM0FuS1itmxe41LWOFRsPTziCq07YyqTlAwcJpdXeXjSfqvHa3qgcXCK7BuNlRJ76S
 i//J07+FvdtZbHR4K3sINY+51CrfnMvGeuCRhNVfukiqG6+h5N7MSGWxLJTw8LsrCR+e
 mlmB0Ds5C2QI7QbsbWIJxL/aJZXGfPkQTD73PTA51o89DiVsNm4rZItDBEmJAT3qBrr5
 pNSmjD8xvEUEtwnZAaha5g4yNNBlusMswMiQS7EwkH6ywyDdU7il/YFPJXqxCjF8oDww
 FtC//kKAnfeLifOFfhi0JCI84ctbO2kRoCt5/mC3/cSjiutIwtflDDkYXXLQpJl1p4ah
 V5EQ==
X-Gm-Message-State: AFuF++nPY8aVyF+36Wpnonhzg3OjiKddRiS7r//123G62k2LyRk85n+U
 bfubUQs2IGYUSHnMfvoh3byv5Jzt/JbJC/D0pNww7DQRW/eQZYSEhDZ+zzK8pxwN1Bj8jJWvlrK
 qf4rTFdw=
X-Gm-Gg: AYBFou2mQrfGy89TuQ5UQDi02b0YZ+BUx+S4ihuKiiYM2kcdRv+UHaFNjTGkH6oInIs
 JVfLxgsYQkjzOMkQ80Of6Z6wPbb7BPCZOceNqUMftpZ22+FcIFnIBHX2TK7sqLwSHbqXkb5wWU3
 EpWjN7IxpfjTGIiTumHi+p1HG+VBl7r6wVnVynjdHPyF8bCTJfBIlYQ/piB4c1sRAn/+qqGG14S
 D62I12/LjyfrzOtA9iaU62o4hJHKiBZ7lzYLQdTT9YxDg0l80P18q5lVI33qaKQd4C8HahT/uxF
 2hf+ksr8BWvUlAHqLIpdSWVp9FGqf5PbgY+rgoUaLPxk/cVagqDwUCNEH0BaMxK7cEpD3H6Lud2
 eZqDpPTaQTzuPJ2DiFsYXLT0WUA4nP2GIGA6AowuxqwzrHDqEdOCYobSFd+Wsz9viNW5cIUlO24
 9fIiG92kR9BJEN+QgKFBGwc5ytT/fItmF7VumtZAm8P0yuTCOVmTvIcyzjInEey0EjkYzmypDJg
 aAbQsKvsn11MJZAAsAkNkDGGGXcwB2cYm3HojEghjGNDdDj7iblDu77DNqhXLbvUgY=
X-Received: by 2002:a05:6000:40cc:b0:485:8393:215a with SMTP id
 ffacd0b85a97d-4858703f4bamr32228295f8f.5.1788876789061; 
 Tue, 08 Sep 2026 07:13:09 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:c371:d703:6c9d:b3d2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485883a9b49sm30923335f8f.17.2026.09.08.07.13.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2026 07:13:08 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  8 Sep 2026 16:12:52 +0200
Message-ID: <20260908141253.1556634-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908141253.1556634-1-dario.binacchi@amarulasolutions.com>
References: <20260908141253.1556634-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v5 5/6] package/qwt: enable build with Qt6
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Andrea Ricchi <andrea.ricchi@amarulasolutions.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jesse Van Gavere <jesseevg@gmail.com>, richard.genoud@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Version 6.3.0 added support for Qt6, so enable building Qwt with Qt6 as
well.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

Changes v4 -> v5:
  - OpenGL option depends on BR2_PACKAGE_QT6_GL_SUPPORTS

 package/qwt/Config.in | 22 ++++++++++++++--------
 package/qwt/qwt.mk    |  4 ++++
 2 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/package/qwt/Config.in b/package/qwt/Config.in
index 736ccc2a5ea5..7b0e068ad131 100644
--- a/package/qwt/Config.in
+++ b/package/qwt/Config.in
@@ -1,9 +1,13 @@
 config BR2_PACKAGE_QWT
 	bool "qwt"
-	depends on BR2_PACKAGE_QT5
-	select BR2_PACKAGE_QT5BASE_GUI
-	select BR2_PACKAGE_QT5BASE_WIDGETS # printsupport
-	select BR2_PACKAGE_QT5BASE_CONCURRENT
+	depends on BR2_PACKAGE_QT5 || BR2_PACKAGE_QT6
+	select BR2_PACKAGE_QT5BASE_GUI if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5BASE_WIDGETS if BR2_PACKAGE_QT5 # printsupport
+	select BR2_PACKAGE_QT5BASE_CONCURRENT if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT6BASE_GUI if BR2_PACKAGE_QT6
+	select BR2_PACKAGE_QT6BASE_WIDGETS if BR2_PACKAGE_QT6
+	select BR2_PACKAGE_QT6BASE_PRINTSUPPORT if BR2_PACKAGE_QT6
+	select BR2_PACKAGE_QT6BASE_CONCURRENT if BR2_PACKAGE_QT6
 	help
 	  Qwt is a graphics extension to the Qt GUI application
 	  framework. It provides a 2D plotting widget and more.
@@ -14,15 +18,17 @@ if BR2_PACKAGE_QWT
 
 config BR2_PACKAGE_QWT_SVG
 	bool "SVG support"
-	select BR2_PACKAGE_QT5SVG
+	select BR2_PACKAGE_QT5SVG if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT6SVG if BR2_PACKAGE_QT6
 
 config BR2_PACKAGE_QWT_MATHML
 	bool "MathML support"
 
 config BR2_PACKAGE_QWT_OPENGL
 	bool "OpenGL support"
-	depends on BR2_PACKAGE_QT5_GL_AVAILABLE
-	select BR2_PACKAGE_QT5BASE_OPENGL
-	select BR2_PACKAGE_QT5BASE_OPENGL_LIB
+	depends on BR2_PACKAGE_QT5_GL_AVAILABLE || BR2_PACKAGE_QT6_GL_SUPPORTS
+	select BR2_PACKAGE_QT5BASE_OPENGL if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5BASE_OPENGL_LIB if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT6BASE_OPENGL if BR2_PACKAGE_QT6
 
 endif
diff --git a/package/qwt/qwt.mk b/package/qwt/qwt.mk
index 67292ee025be..0e835c700e16 100644
--- a/package/qwt/qwt.mk
+++ b/package/qwt/qwt.mk
@@ -18,8 +18,12 @@ QWT_CONFIG += -e 's%/features%/mkspecs/features%'
 
 ifeq ($(BR2_PACKAGE_QWT_SVG),y)
 QWT_CONFIG += -e 's/^.*QWT_CONFIG.*QwtSvg.*$$/QWT_CONFIG += QwtSvg/'
+ifeq ($(BR2_PACKAGE_QT5),y)
 QWT_DEPENDENCIES += qt5svg
 else
+QWT_DEPENDENCIES += qt6svg
+endif
+else
 QWT_CONFIG += -e 's/^.*QWT_CONFIG.*QwtSvg.*$$/\# QWT_CONFIG += QwtSvg/'
 endif
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
