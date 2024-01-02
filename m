Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 067B1C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 17:50:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A41D4605B0;
	Tue,  2 Jan 2024 17:50:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A41D4605B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vifYG-FkX_Oq; Tue,  2 Jan 2024 17:50:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 105A86059D;
	Tue,  2 Jan 2024 17:50:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 105A86059D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 037AF1BF31F
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 17:50:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF55940399
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 17:50:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF55940399
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9tlcbEDqmiXm for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 17:50:23 +0000 (UTC)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 98818402D0
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 17:50:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98818402D0
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40d560818b8so70627645e9.1
 for <buildroot@buildroot.org>; Tue, 02 Jan 2024 09:50:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704217821; x=1704822621;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+zTwpoiXskL5CRfKEFK8WqYedseCtRKbVV4RBMl4+SM=;
 b=DklKTXBzkaWxmsxDFZwIyIfSasoQiauZnBlci63kMVCwgEtC1CHiqD7yjGfDkq6EJd
 0FBO5Kj7mvV6XgROgWjR/9pSK6KtmuGrZL7tvON17vXGUzV0utuev36F7oTs8rBaDtyn
 CAwvMxazp+79f5H+q9S4FR5LTGWfmpfXZSfPHFtDzq87PUvhyvAVzeT93kRxKxV6WGSH
 Ntj5/BxzLplhZH4iuEw+ec8zXzZ92Qj3gfZN++LKCYgb0Y5vBIWFe/u26RIjGFwUTCIg
 u5Ww19K8iiTryMy9Wvmah3K7jvfycjRbWFHp5P35BXS5xCzU6JtuXZztPtvLfp7AAmwh
 8Ghg==
X-Gm-Message-State: AOJu0YyVUAiWdIlhUXwyNKnYyIoQOZiPrEltqTOxrmbCBXMjQYdVfo5g
 0jAzCaWClN2O7cydtrcHUctWSKXFe+0=
X-Google-Smtp-Source: AGHT+IFA9FV1xU7LXSoieMefXqOMXDSyhWpsrmPxvGzxmO1A1UXIxJbJHulT7cED9sEPmO6kVdaxWQ==
X-Received: by 2002:a05:600c:2284:b0:40d:887e:fc8a with SMTP id
 4-20020a05600c228400b0040d887efc8amr1691985wmf.101.1704217820745; 
 Tue, 02 Jan 2024 09:50:20 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 j36-20020a05600c1c2400b0040d5bc2ea43sm25936895wms.31.2024.01.02.09.50.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jan 2024 09:50:20 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  2 Jan 2024 18:50:17 +0100
Message-ID: <20240102175017.1018320-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704217821; x=1704822621; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+zTwpoiXskL5CRfKEFK8WqYedseCtRKbVV4RBMl4+SM=;
 b=dfOkxu5nT8+/ETXfSCFI+FwFSBDnSBfcUlHM+novpbP8hGY46JJkGYW7RMduP8zzJQ
 lgF8K3MwMB+bMOjpA/Iph3R4igU0DGC9H5XUB9rgwy1HQ3Y1HzH5i+7IP7YycNCZOV/f
 pSt4DcbhEMhToIHrq4Hx6QxDQ1KPTdl1HlqTPPqf97n2QVg9pPQZwryuMrl9f/US99/r
 Xl/OiIMCpIoWjO9jv4fTy9dGcc3mkOCWRfGLJxGABYU2mzPsUALPNFbHqO4379yBkPtO
 nvzf03x8ErHBZQYsTgaB1b1dw4Rw7bb7onkSS4r8Y2qw9+4oCRAsCHlVKbYq5QkKUtmB
 fiUA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dfOkxu5n
Subject: [Buildroot] [PATCH 1/1] package/orc: bump to version 0.4.34
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://gitlab.freedesktop.org/gstreamer/orc/-/blob/0.4.34/RELEASE

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/orc/orc.hash | 4 ++--
 package/orc/orc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/orc/orc.hash b/package/orc/orc.hash
index 136fc3ece4..1e584c1190 100644
--- a/package/orc/orc.hash
+++ b/package/orc/orc.hash
@@ -1,5 +1,5 @@
-# From https://gstreamer.freedesktop.org/data/src/orc/orc-0.4.33.tar.xz.sha256sum
-sha256  844e6d7db8086f793f57618d3d4b68d29d99b16034e71430df3c21cfd3c3542a  orc-0.4.33.tar.xz
+# From https://gstreamer.freedesktop.org/data/src/orc/orc-0.4.34.tar.xz.sha256sum
+sha256  8f47abb3f097171e44eb807adcdabd860fba2effd37d8d3c4fbd5f341cadd41f  orc-0.4.34.tar.xz
 
 # Locally calculated
 sha256  4f5dabb1b44bb6fc5cd53820b1f103147ad61b395a57903991325bd1b85d97bf  COPYING
diff --git a/package/orc/orc.mk b/package/orc/orc.mk
index be718e6f85..b2d2bb461b 100644
--- a/package/orc/orc.mk
+++ b/package/orc/orc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ORC_VERSION = 0.4.33
+ORC_VERSION = 0.4.34
 ORC_SOURCE = orc-$(ORC_VERSION).tar.xz
 ORC_SITE = http://gstreamer.freedesktop.org/data/src/orc
 ORC_LICENSE = BSD-2-Clause, BSD-3-Clause
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
