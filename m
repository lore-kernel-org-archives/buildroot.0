Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D55BC3DA63
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 09:56:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B59A80F97;
	Tue, 23 Jul 2024 09:56:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dNt0emwvmgyx; Tue, 23 Jul 2024 09:56:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47C5A811F6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47C5A811F6;
	Tue, 23 Jul 2024 09:56:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A411A1BF3AA
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 09:56:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 92068811F6
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 09:56:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qWdOzWEPDLJk for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 09:56:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 77C2580F97
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77C2580F97
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 77C2580F97
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 09:56:23 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-427edcc207cso5608575e9.3
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 02:56:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721728581; x=1722333381;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ffphRCAtna9/vnAHViOeULbcCqeA4VM4uzHEHh/esgc=;
 b=VDYGfo1UMZuOvvrO4iHMgS5P/SQVmazsFA5uBdihIoHaEdxsy4Pf8y41/DuUq+3qo5
 GCJ59AB1KQ/HKojJcIn9J4WIvc0XWBKnDAQ3YS+meMiGZAPw6neYKUWJW5X5xpw6SRN/
 9rXnxvpgrnKWKoQqUGsEmeHW0fHiTTH8VUowQQUiP9oOyrcoWjS8jKz2xqawHoBJYnzj
 JIW2Ss6tQojYHnMPNDy/PYe+hwIciFtitHCxkO58VR58neHQebFC+J79XoCyQBCOw/Fj
 q2Ci1Acypzj4px9BRQoBL8PUWn/AH0g3VAr5pDnRK8DVxKQD6hvEcfdQWG1XpWXknftn
 mzEw==
X-Gm-Message-State: AOJu0Yyy9KFMn87M0Jy77dSMU0WgGGiOC0AhPqjdHdJk3WlqS1Ibn5h7
 Vby+uoqiDqB0EUu4cId/az2zWEzYgyPoSJrSeKkkdKpxP7ZqppCX8Ipt/Q==
X-Google-Smtp-Source: AGHT+IFJ1mn7uZKjc0YBQR+28b1666O4ogcyVDMhZjXqrkabVgDU/os6eLp/nkafNTsUvNtKamI4Dg==
X-Received: by 2002:a05:600c:1e23:b0:427:9dad:e6ac with SMTP id
 5b1f17b1804b1-427ef99afcemr11085225e9.34.1721728577407; 
 Tue, 23 Jul 2024 02:56:17 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d6906a96sm169574335e9.22.2024.07.23.02.56.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 02:56:17 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 11:56:14 +0200
Message-ID: <20240723095614.993000-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721728581; x=1722333381; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ffphRCAtna9/vnAHViOeULbcCqeA4VM4uzHEHh/esgc=;
 b=krIwP06Kg0RV56iuZvvfhxV+zmLKfZ2JJprlyCr+VMCmZzblNZPRZNSSVURY0O6Pbz
 PH8tzwa7HFI1r12gmr/rU2a6poSRyAYLwhhnBSyv7DCBSP+x7UqhABhDirZmKzNuZzOD
 6Y6KwNi/QfBYv/yWOUmVoMJia5acfJ6J7cQH5B55PPcM44TAcTzt1ct0KUgGi38VybMf
 4YwMJCpdgNZ6AvjYpyowPeJzk+fWfikL8ZpYtvaI0pxfxkZYLm7Oc9Ibii6iWmEJZMq2
 YvDBsUEq+QKSuJHPG3hUViQi94r2HChRtKTVQID9rQVz0Ej5EtYTc51DDDrIZ5RGzWp9
 +/AQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=krIwP06K
Subject: [Buildroot] [PATCH 1/1] package/mtd: fix zlib build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit bb19ffeaab5ba4be0a1033ca326b25d4d4e8203f forgot to move
host-pkgconf dependency from BR2_PACKAGE_MTD_JFFS_UTILS condition to the
new BR2_PACKAGE_ZLIB condition resulting in the following build failure:

hecking for ZLIB... no
configure: error: cannot find zlib

Fixes: bb19ffeaab5ba4be0a1033ca326b25d4d4e8203f
 - http://autobuild.buildroot.org/results/7cbeead738af6302d5f0048a443e3b57d6776bb2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mtd/mtd.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index fe40cf6c06..d3444c88f2 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -28,7 +28,7 @@ MTD_CONF_OPTS += --without-lzo
 endif
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
-MTD_DEPENDENCIES += zlib
+MTD_DEPENDENCIES += host-pkgconf zlib
 MTD_CONF_OPTS += --with-zlib
 else
 MTD_CONF_OPTS += --without-zlib
@@ -37,7 +37,6 @@ endif
 MTD_CONF_ENV += LDFLAGS="$(MTD_LDFLAGS)"
 
 ifeq ($(BR2_PACKAGE_MTD_JFFS_UTILS),y)
-MTD_DEPENDENCIES += host-pkgconf
 MTD_CONF_OPTS += --with-jffs
 else
 MTD_CONF_OPTS += --without-jffs
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
