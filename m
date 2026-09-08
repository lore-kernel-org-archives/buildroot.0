Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C61A1C79F9E
	for <buildroot@archiver.kernel.org>; Tue,  8 Sep 2026 14:13:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63C1080865;
	Tue,  8 Sep 2026 14:13:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AeGCoZqzp9fG; Tue,  8 Sep 2026 14:13:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 714BB80A91
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788876789;
	b=swLz79AsAzDE9f93LmVopLpj+23R4XsllWZ5OO8yDjdSGXkhN/bYo/y11fToKCJIMKyM
	 f7Hk/rxamAOgKb5P2g0va3bcpajnirz25ervQPoqff5ZA6uaX/O0BgYce+to7MM8uB9lZ
	 /m7faF/v4JcH+mQv80iNRdtSoBe41oxEJB6fGFRQr+KF5/yY3pZ+yWSL3/Kt2Y83XyZOW
	 ++AKSgo8nwejslQt4QWFmoRRK2lcRRblnBW4QuRw6vNYuHG881oOtQ5rdPfWV4v5QsZqE
	 bEEJDG2uDFY8e66FohNSoz7fL86ylSMZEGeoiOlgC0loubn1mXqsi4lGvBpFmFjX+Yw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788876789;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=9rtSPMeO9EwKmtXZRBN+2wXC7WbHTdCuFEFngSmg0xQ=;
	b=SpWVBvMvlYEM5JiYPnhtB7ErQEbIb9eb6lGH1nFNthFNl793kvEvZiZ186Ai/btj46JB
	 VIge3TdEdUieic93SNpOteow33qrLPERWyx/VR7awF7ZGCwPsiqLJwXSGbFTHjLsasFIg
	 tqzBLjsltoXwC0M9ly2+A15wws+IJmdmTVohDEwkMCbmOyosPJySaE8DUoOjrMbjJdPqs
	 C1x9YGaSrV00qAIAFt4mI3by4LxySrKOmeYr5OSbD1wNqqIuQVyV/v56K2+5vPAWuPNiG
	 K4SacNC2M4oaB0gCB0tn4roiwo4U4rdZA9SU8mal8iwjtUhavsv1RV50Rv9cz9gmUjg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788876789;
	bh=9rtSPMeO9EwKmtXZRBN+2wXC7WbHTdCuFEFngSmg0xQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=e/IQwYLUa4BLCtfqtZO5w08qUfgvyEVH0wG7HgnjHh73vGSiE8G0LNe4ikG1rnOD+
	 JJXhR7MBCbhD4QlHZq1NUwgtoKOyxZd0G4HECizwOV+Y83X0JLNY3KKcxrB+t6a45v
	 sLAhfJyhmt9pH1O6ICkAk1BxZs98yCVrU7C5EJ4/K5Bgy9zQpGo5Vmaf0uN/pvaW+7
	 yWCOH4hY4GY9W/dnud/I7hFHHb+rFdq6lV7Cj1hvMbX1HprVKQTXUq06I1Fez5uXdQ
	 a/wsFdkZw6JvqIgwDGaqsIQXvgIvZAgLSKR9uHk1WoF471FiXe2G/mOLH7EJ/DZCYh
	 +PclullA2R5pA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 714BB80A91;
	Tue,  8 Sep 2026 14:13:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A54972C
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 14:13:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0B78960710
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 14:13:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zf9LsIMh509B for <buildroot@buildroot.org>;
 Tue,  8 Sep 2026 14:13:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 121B9606E8
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::631"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788876787;
 b=eVj6dBXaGOsEK8NXJkF6yoZjmSRAJOF6lNlHx05gvstxCfMNHyW47EOUNfo7JxglOn1I
 RaiTclaSpgogcmTsbKaIKMnosr/m6+sKi/zTWyHScSWK81OcG8QGwgEmeeDnGtEU2rl0R
 Qs5zaWn9t3KV1aYL+eCroUk1LSaqZjw5o2mXLZoxKIPyaXfW5fVD8WY+2QG79G4A2xIk6
 rtxAw0cZszuqTbRmXc9T66iGR/4E68vvViy3JkDkZ9BvNbiUM0/HN668dXC+Ld+nCqdRI
 f/8HInrpUuqeKK49H81TWVkhDUKe8W/4avUzfXOczkOqQBHSbDWhuDvzN/SZXMhyBng==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788876787;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=17lI7xUhLliz+Be+4baU2EF74U/nnKAtJYEFjta107A=;
 b=i6Qb1U/C8qIALcu0UEf0m/bKtk4IWQ9LCFsauZ3rTnqVogQmH3ggty9VpE6BJMQf4xFj
 +Lwx0RRWqRBgUL9dSVJ2oTWgGAkDOIRX421O/XZv8FR1GcF6gn64u5Ybsx1DxbDxzX0SQ
 +NhTS8rf1Lk9BokgCGMnuA+9ACpeKHg49DsDn7OPUXFO4cdxbSkHRwUCmErB8z6+qQ6EU
 tXrtvSZireuCKh5oEaS9nIwbs9sRJL/JEtCkoAFVqotn9eGdSxHzXdgpgAT87NI+Rr2Tn
 FtRayP3kVYVqScVDkygO7GCErV71O/aKZoI1IX4cgHilZRwbFydmEQWUHoFCwK1IY/Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=amarulasolutions.com; 
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=m2i6PphB; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::631"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=m2i6PphB
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 121B9606E8
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 14:13:06 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-c20ce3c118aso831241566b.0
 for <buildroot@buildroot.org>; Tue, 08 Sep 2026 07:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1788876784; x=1789481584;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=17lI7xUhLliz+Be+4baU2EF74U/nnKAtJYEFjta107A=;
 b=m2i6PphB3L/aOcFEm++zMDJjhEWlPdWATEw7wWaDrCwnOBcDozrw8gZOh3NgqpDuQn
 CIYgZr8fKVXCL1H0wkvm2dglpM1ndZ6kDVOZ/c88LrMfBKbI6qb+k1UOZrbkQuWQ4Cg8
 qcAFb3IYsRD9MHDIfUGWkKonC2xAffMeNSSqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788876784; x=1789481584;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=17lI7xUhLliz+Be+4baU2EF74U/nnKAtJYEFjta107A=;
 b=de9iTjNLExEzecdjCiEMLTBHwEldhbRKRvJxcGdxaca2e2WhkdUPzbsROHZwIwIX1M
 V2B7Ltm2or+AP8cNNbR82kO1yipbyABgIYSi3ao1om600O1vtF/iM5pWrlk286bDCOkh
 iTir10JdVnszA+NxsBHMJUE6f5g1hyGx6CiYZkuysiEQWavODOKWG7eP51Tpc74L/Z2q
 0osisPDg71/sS8JawAoEFQLg7++HP2rSL1g/9GUTaNWhtiZEjpm81cA8MDym+qAa3eaU
 AtWdZsMiaiolr5e4kLopQd899rQlVBRZDCYcVy7Kv8ysWYjo38XnsynmdehXt6o7DOSt
 ji8g==
X-Gm-Message-State: AFuF++mXi5hfwWBSZQcogwn9CiFPJtFGbFt2J7ZtuGqlhGXWZrhtiySV
 9x+DU2zhb3mf1IlFh2Jwdk11DR4Kg2Apz6KKGwhu/qTrLdgmfjzrsRAg+vLT0Elbr+GmQwYm4Zn
 Xe4D59BU=
X-Gm-Gg: AYBFou3631BJdA5yKwjsu0dBj9cCt1L4lnNUkyhnmMxEoiy9fvLzcnkpRTUjyKitqa3
 KK5WdOYS9tifJ1EC79E24hQQpCo+w/QEz2Qxn9UvbsQNCfCtEDHMOavrXqKzrSInQpKMca62OM4
 J9RUqrr2RvJtwZqCvUPRlq4nSS5/fG44JUBUJYKcMsEJejiDY5HLDKmnCR+vZMYFSVj7uVMpTrQ
 2xxgtGsmuaH5WhZ0+kaSNTu9FDOXuaCy/NLpHhZNtI2tm0qBzsGT/qYJCLk2MB+ylOII2Iwq/zp
 Gg7hMAZR/uOjYWNd9dklPxGl10//dOUXv5OEklWAgxzfjHWX5mROjy+tx+ITSe1e+ayMkr1M+0t
 XLLOKd6H29ssWdsJHDIeIZJUZMveHG4usyvITQWV2Fi/kOluAK6EovRbSc8H5xSjHj0ZsW5B2Lj
 8Sk+bezVHpfsq8hIScBfDTNcOO4AqwhhdvUJHi6E4DP5g8ft1dwFpxDCSEeoWzpfDMDO3dTy0Mb
 18j+tozNVukv+OxgIxqlFc+9tIpQf4ldxpu59aUpFj0JJe+FRfVKbJH
X-Received: by 2002:a17:907:c80d:b0:c25:f7dc:2d5 with SMTP id
 a640c23a62f3a-c25f7dc0956mr1218791266b.22.1788876784590; 
 Tue, 08 Sep 2026 07:13:04 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:c371:d703:6c9d:b3d2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485883a9b49sm30923335f8f.17.2026.09.08.07.13.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2026 07:13:03 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  8 Sep 2026 16:12:49 +0200
Message-ID: <20260908141253.1556634-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908141253.1556634-1-dario.binacchi@amarulasolutions.com>
References: <20260908141253.1556634-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v5 2/6] package/qt6: add QT6_QT_CONF_FIXUP hook
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

With per-package directories, qt.conf is generated at qt6base install
time and holds the paths of the qt6base per-package host directory.
Add a hook to regenerate it with the paths of the package being built,
as QT5_QT_CONF_FIXUP does for Qt5. The qmake infrastructure will use it.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

Added in v5 (it was part of patch 1 up to v3)

 package/qt6/qt6.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/qt6/qt6.mk b/package/qt6/qt6.mk
index bcf735c19e3b..5024544d9b81 100644
--- a/package/qt6/qt6.mk
+++ b/package/qt6/qt6.mk
@@ -22,5 +22,11 @@ define QT6_INSTALL_QT_CONF
 		$(QT6BASE_PKGDIR)/qt.conf.in > $(HOST_DIR)/bin/qt.conf
 endef
 
+ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
+define QT6_QT_CONF_FIXUP
+	$(QT6_INSTALL_QT_CONF)
+endef
+endif
+
 # Variable for other Qt applications to use
 QT6_QMAKE = $(HOST_DIR)/bin/qmake -spec devices/linux-buildroot-g++
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
