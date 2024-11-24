Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB41E668A4
	for <buildroot@archiver.kernel.org>; Sun, 24 Nov 2024 10:50:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C68742DF3;
	Sun, 24 Nov 2024 10:50:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DcX38__k8vyr; Sun, 24 Nov 2024 10:50:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3713842DEC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3713842DEC;
	Sun, 24 Nov 2024 10:50:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 906DA496F
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 10:50:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7073D80D29
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 10:50:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q05D7PBuYKAT for <buildroot@buildroot.org>;
 Sun, 24 Nov 2024 10:50:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=raphael.pavlidis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 658B380D1D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 658B380D1D
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 658B380D1D
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 10:50:05 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43497839b80so5453935e9.2
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 02:50:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732445403; x=1733050203;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jsvo/CfEfv/rQQ6XzlzgLfBptnK/yb/6TMc13NezTBY=;
 b=vIzr2/ex87QL9E3rSN7YIWHhqzFvEuyg/eeB/7KLJzg53yU9MEYkRoIUqKc8xA8973
 cEZyFGbwlVvNjpLDOmtar91pyo5oBhv/LoPOhlkDpHfXxC79caanb2uXRIuFWksp0WFw
 3wUe2fL3mDqGikifyK9QH8QDONrEvmUdS4roGwztYdNn232ogn2cV8DNXKSm9iX+2aTi
 92+e8+kSje1daKgk291lDv/iG+zxMZ2dED0zuwZMH7Yze5UtcgFHzOBUOOL3g9KStVmt
 L+wKrwRBF+BGvTdBSqs6x/1EgcjlBN2OUVPd3h2rEM1pYMyIiTH0HHdmvATIOpds/iPS
 jbOg==
X-Gm-Message-State: AOJu0Yy0sWICmDQCCAOdULSU9HWaXmQr/Ek0O5CnoG3YoMO6QtA7sVlK
 3ryyB4uXzMKIu5XnHTY0BRLn31YVDeEWDuM2pq9aozTXdGdNVB5/Lh2Nw4Zr
X-Gm-Gg: ASbGncuxzvxTIGjBaooLxmAjw2zZueGh8XCaLD0i1bu7q3Wz+q6pP/LES8ZfDC0ZNlz
 2D8Ak/YzfXxIvULS97eX+ueK2cniARg3RV8aKoayRYyr1cyiV0NkekLmRzNoBWy4ot/3bJjT9UG
 xOe+fIGM2PzvykWVVrRJ1hUfrxXI/qg3OdrA5S+RtWGLRsxRuvYGZU2jiYU+H3iGAvOVRj+X9oI
 uHn9Y3XgVtrLyFVFyxdarKwsY6OxeYhQs5UhgRwZfM4zE42rGqiYdoM
X-Google-Smtp-Source: AGHT+IGDg3EeoWajhiQ7/Gba9Uww8tIKbWSmfUhgO9W0Y3Ub1vGAdPOTYy/y9UUx4Uw19FWVtY71lg==
X-Received: by 2002:a05:600c:4690:b0:431:2b66:44f7 with SMTP id
 5b1f17b1804b1-433ce4d4c6emr89203405e9.31.1732445403123; 
 Sun, 24 Nov 2024 02:50:03 -0800 (PST)
Received: from localhost.localdomain ([2a02:8070:2483:7e00::478])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-433cde110cfsm88665515e9.11.2024.11.24.02.50.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Nov 2024 02:50:02 -0800 (PST)
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
To: buildroot@buildroot.org
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 24 Nov 2024 11:49:04 +0000
Message-ID: <20241124114907.16924-2-raphael.pavlidis@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241124114907.16924-1-raphael.pavlidis@gmail.com>
References: <20241124114907.16924-1-raphael.pavlidis@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732445403; x=1733050203; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jsvo/CfEfv/rQQ6XzlzgLfBptnK/yb/6TMc13NezTBY=;
 b=YvAXgDgIY92VwSql0kJVdbWtrXemEudSYrPB6pESkUPvanPihr79rVHHhnwiFPs/Ot
 /s3ZTkmUT7xNTagvg4XaBEGurCKcdbnteQ7J+tXNocAE51eMbw28aZZUXeX2VFJ6Enp4
 9ua3EiiAoyhwRy3ByFjnPctX0tYRP6G4F0dnYTDmwNG1z6AcEW8hdRPme66zR6NUADtP
 pI/O4wW5o39c2V65RItqDaeXtdGQgAfoFvFKt1FVt0MJjOpVe7G6NKWX8uqeSHMWzWP0
 YVJwAKUj9wzPV8IKvyin61rNjYeA+0C/EEk32AeTGt+0ZOm/yjF8s6J/l4ZNoPXc1pV0
 bN2w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=YvAXgDgI
Subject: [Buildroot] [PATCH 1/4] package/libxkbcommon: bump version to 1.7.0
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

Changelog:
https://lists.freedesktop.org/archives/wayland-devel/2024-March/043539.html
Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
---
 package/libxkbcommon/libxkbcommon.hash | 4 ++--
 package/libxkbcommon/libxkbcommon.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libxkbcommon/libxkbcommon.hash b/package/libxkbcommon/libxkbcommon.hash
index fff2b7a943..cab2587dca 100644
--- a/package/libxkbcommon/libxkbcommon.hash
+++ b/package/libxkbcommon/libxkbcommon.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2022-February/042104.html
-sha256  106cec5263f9100a7e79b5f7220f889bc78e7d7ffc55d2b6fdb1efefb8024031  libxkbcommon-1.4.0.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2024-March/043539.html
+sha256  65782f0a10a4b455af9c6baab7040e2f537520caa2ec2092805cdfd36863b247 libxkbcommon-1.7.0.tar.xz
 
 # License file:
 sha256  086caee279449369d41c1157911ec7696e707b93feba7280de757d3c470b2dfb  LICENSE
diff --git a/package/libxkbcommon/libxkbcommon.mk b/package/libxkbcommon/libxkbcommon.mk
index 882791b917..c60580ef84 100644
--- a/package/libxkbcommon/libxkbcommon.mk
+++ b/package/libxkbcommon/libxkbcommon.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXKBCOMMON_VERSION = 1.4.0
+LIBXKBCOMMON_VERSION = 1.7.0
 LIBXKBCOMMON_SITE = https://xkbcommon.org/download
 LIBXKBCOMMON_SOURCE = libxkbcommon-$(LIBXKBCOMMON_VERSION).tar.xz
 LIBXKBCOMMON_LICENSE = MIT/X11
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
