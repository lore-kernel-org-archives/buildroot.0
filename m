Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD8F0C636CC
	for <buildroot@archiver.kernel.org>; Tue, 31 Jan 2023 13:23:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 47FA34029B;
	Tue, 31 Jan 2023 13:23:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47FA34029B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NyWnjBFJ8X6u; Tue, 31 Jan 2023 13:23:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 73ECC40253;
	Tue, 31 Jan 2023 13:23:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73ECC40253
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 978521BF3DF
 for <buildroot@lists.busybox.net>; Tue, 31 Jan 2023 13:23:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6FC1981336
 for <buildroot@lists.busybox.net>; Tue, 31 Jan 2023 13:23:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FC1981336
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hhiimRDUFpNX for <buildroot@lists.busybox.net>;
 Tue, 31 Jan 2023 13:23:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AB6481320
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7AB6481320
 for <buildroot@buildroot.org>; Tue, 31 Jan 2023 13:23:36 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 k8-20020a05600c1c8800b003dc57ea0dfeso4462923wms.0
 for <buildroot@buildroot.org>; Tue, 31 Jan 2023 05:23:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=scEEW5r53Ahy670e+ejHIe8lmOK9L3aDWhpQ8pzatVw=;
 b=Z60lNhTWI9RKA6wP/erGUZ1zU034NpgF6syLhXEwK9pydfkXWkyAeZG+lmcSeyTXLe
 bUMeukBc6SqOyrYbGjdallT6Lz6sRYQiwhnMu3jgzo3sErWK29V7l9kq1bie0QxSLOh4
 CXxzsBRhrL5eHJzrxJ9QYsqsElU+MzhTUFNnKzkpXqqNOxhgxtGAgp2tLTF3uBFpiI9C
 ZhWBn1n6VbKWAmNJp0cPI9RtCeL92UAqWD2LnYbf4ojugcXlSZrbV0BPHqonDA8RwA+7
 uP3106wyVEdfFOR1J20ZpHqjZ43Du133EDzt6yGENrrH0Uniw0eDfzvDWfdjFABvUInl
 m20Q==
X-Gm-Message-State: AO0yUKVGGxYFT6Y6XOK6I7iq57UCbF9MCJo5Z9Fo9Ua0/joVhtRxqPx4
 rp9DxcZVyMCsgv3KH16bI6lln74ncrZLEw==
X-Google-Smtp-Source: AK7set9w3l+40w3njgKo4UYotIB0E8ug+/5beuL27AQYSY7XEnivPmRPv/5seiQoSBZH5MPma+LhXw==
X-Received: by 2002:a05:600c:511c:b0:3dc:5240:53b6 with SMTP id
 o28-20020a05600c511c00b003dc524053b6mr9803385wms.6.1675171414138; 
 Tue, 31 Jan 2023 05:23:34 -0800 (PST)
Received: from goliat.wr25.org (82-209-154-112.cust.bredband2.com.
 [82.209.154.112]) by smtp.gmail.com with ESMTPSA id
 i20-20020a1c5414000000b003dc3f3d77e3sm13365262wmb.7.2023.01.31.05.23.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 05:23:33 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 31 Jan 2023 14:23:27 +0100
Message-Id: <20230131132327.636417-1-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=scEEW5r53Ahy670e+ejHIe8lmOK9L3aDWhpQ8pzatVw=;
 b=b34QKeT7UkqlA9dziGc9MjvkqbB1SXlziVgc5oJFewLBtagpLFR+l3GQqreoEhejns
 Y7wiIOnssv9sLkiEEvfe+xZ9kJtMl0c5+/G06k445ddG+4YM33j0WbPMI28ctEO5CtU2
 uxyRsFLyrH3ZdF9IOI4f2D/3tthdMcRa4yfaszMwUa7oNY0pOj7TuwIDBoj1viGOV6dh
 azsxSNahsaS/BLZnOJoFlpjWhRK6qjBepALDA2etFF3IZq6C3aAyWJw8ytRqbqTf44hF
 pAjSvEwbyUb50+kCs7vo4USe3PiHHTlOmwEnJGlz9pP+PrpLxFVzE2DcQSXJIEFa0xI9
 NXUA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=b34QKeT7
Subject: [Buildroot] [PATCH] package/libcamera-apps: bump to version 1.1.1
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 package/libcamera-apps/libcamera-apps.hash | 2 +-
 package/libcamera-apps/libcamera-apps.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcamera-apps/libcamera-apps.hash b/package/libcamera-apps/libcamera-apps.hash
index cc2d3b6926..fbb3150cb5 100644
--- a/package/libcamera-apps/libcamera-apps.hash
+++ b/package/libcamera-apps/libcamera-apps.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2d895ad5d11a6004b1e84eb8d486d5dca64dda1b41e0f4f3f87904666f249e3e  libcamera-apps-1.1.0.tar.gz
+sha256  c05e29e02da05fa92739941295d96dcb93324805f7b348ad182e7e29e7e0c520  libcamera-apps-1.1.1.tar.gz
 sha256  36dfed86bdef661a0a14ec1a1cc84c771d5a06b6f9b92e9ebb610ba711bd528a  license.txt
diff --git a/package/libcamera-apps/libcamera-apps.mk b/package/libcamera-apps/libcamera-apps.mk
index a5d9227250..290ee9a026 100644
--- a/package/libcamera-apps/libcamera-apps.mk
+++ b/package/libcamera-apps/libcamera-apps.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCAMERA_APPS_VERSION = 1.1.0
+LIBCAMERA_APPS_VERSION = 1.1.1
 LIBCAMERA_APPS_SITE = $(call github,raspberrypi,libcamera-apps,v$(LIBCAMERA_APPS_VERSION))
 LIBCAMERA_APPS_LICENSE = BSD-2-Clause
 LIBCAMERA_APPS_LICENSE_FILES = license.txt
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
