Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AE4DC43334
	for <buildroot@archiver.kernel.org>; Mon, 20 Jun 2022 05:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 61A7E40AA6;
	Mon, 20 Jun 2022 05:42:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61A7E40AA6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f7KWW6SPyXcW; Mon, 20 Jun 2022 05:42:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B257F40141;
	Mon, 20 Jun 2022 05:42:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B257F40141
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 973B01BF282
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 05:42:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 70E7B60F0E
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 05:42:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70E7B60F0E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SYWaDjT3WrWh for <buildroot@lists.busybox.net>;
 Mon, 20 Jun 2022 05:42:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A76F60DFA
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8A76F60DFA
 for <buildroot@buildroot.org>; Mon, 20 Jun 2022 05:42:29 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-101ec2d6087so2519847fac.3
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 22:42:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=XeAkc7ngdS0uNZ6XtzNNCENrY/7RihWoLV0ITk+LGhY=;
 b=B6XaElq/ayRohDoyI8LSuXeDz9BAUmb/bo+L9s2nzopffdx4BtZ5dghPoyPkEeWHTc
 Zi7AuaL2fmIy6cOXS9kMi4rDTepGoUID3f+IsZ/q8iKAaRnAaT+bI77P0K/V1atbmKED
 80v4gJ1NsSE4X4v0WVtBYvdvyusMUvEOJ2bI3Sn0Xkwi0H3iFNTbZNIu58YK175mSHLZ
 f84+DbBm7kwhn+zlpOgxd0CXo1Z1MLHO+r68IiaWAcH1N41NhsOwk9T8ChAy9qMHqRdA
 zFmXsHL1wLDC+iR0hO3VaomtSF3P1T8MCQ3LYSdsJ+aUHXYoG9ZGqrI81RUScDgYXwXe
 kWOA==
X-Gm-Message-State: AJIora+GzTctrr12lGCZHHCCPjQWFFHTN/MVta0d8PkzQHTJzIya704a
 KZPowwl+5T4LRbC8jZl0W4RtLSoHlVfd2Q==
X-Google-Smtp-Source: AGRyM1tKZq90gcHjSlBvmlmhQEKmZZIzw+DYa17jC/jqOvncxaun74PLUlfXOYc8ICk5oZiBuboFIQ==
X-Received: by 2002:a05:6870:b616:b0:e2:f8bb:5eb with SMTP id
 cm22-20020a056870b61600b000e2f8bb05ebmr17585614oab.218.1655703748452; 
 Sun, 19 Jun 2022 22:42:28 -0700 (PDT)
Received: from rawyouth.ads.eso.org (ppbla15.hq.eso.org. [134.171.6.19])
 by smtp.gmail.com with ESMTPSA id
 w19-20020a056870431300b000f5e33aaa66sm6793259oah.0.2022.06.19.22.42.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jun 2022 22:42:27 -0700 (PDT)
From: Federico Pellegrin <fede@evolware.org>
To: buildroot@buildroot.org
Date: Mon, 20 Jun 2022 07:42:17 +0200
Message-Id: <20220620054217.92028-1-fede@evolware.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XeAkc7ngdS0uNZ6XtzNNCENrY/7RihWoLV0ITk+LGhY=;
 b=p8mv1OTIg0AwcVcufE4S8HciTFJe5nP+I3AgZy7vvGPsCFV6HpPlooHoEs43NyuQlW
 e9Xj5jvlrspAaV1QP0/iw/SPjje8pQtQrtnArS752Pp5MDA2wC5aYBU6UDQDs++p5AY4
 Hu33HilWvFOrvUAUtHa6iM99C7ysdnc1yropYoTfhDwdrT5sVTbLMxdd5Sc7lmWPdVNf
 9hfbCEq6q5BKlhlMkLHCZ7o9XHHxK7JNP5i1p7FAaWCKS87HQPxt1pdZ3AY9u62PG3NI
 8lCcTWa73GC3wGbMOgKTCBasn0PkRZGPaUweppVzhmQHZgDEuoqUS8/07ZV1Y7RxrVpU
 MNLg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=p8mv1OTI
Subject: [Buildroot] [PATCH 1/1] package/kexec: bump to version 2.0.24
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
Cc: Federico Pellegrin <fede@evolware.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://www.spinics.net/lists/kexec/msg28922.html

Signed-off-by: Federico Pellegrin <fede@evolware.org>
---
 package/kexec/kexec.hash | 2 +-
 package/kexec/kexec.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kexec/kexec.hash b/package/kexec/kexec.hash
index 05eb9e3d02..dcf661cce4 100644
--- a/package/kexec/kexec.hash
+++ b/package/kexec/kexec.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/linux/utils/kernel/kexec/sha256sums.asc
-sha256  aa63cd6c7dd95b06ceba6240a7fdc6792789cada75a655e6714987175224241b  kexec-tools-2.0.23.tar.xz
+sha256  af230ce6430deb6c2ab35762f8028888ac9d6ebefc2c4c83224a9c109143c0e8  kexec-tools-2.0.24.tar.xz
 # locally calculated
 sha256  fa5fc1d1eec39532ea517518eeefd7b6e3c14341a55e5880a0e2a49eee47a5b7  COPYING
diff --git a/package/kexec/kexec.mk b/package/kexec/kexec.mk
index b3b4e56546..c08a9155f2 100644
--- a/package/kexec/kexec.mk
+++ b/package/kexec/kexec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KEXEC_VERSION = 2.0.23
+KEXEC_VERSION = 2.0.24
 KEXEC_SOURCE = kexec-tools-$(KEXEC_VERSION).tar.xz
 KEXEC_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kexec
 KEXEC_LICENSE = GPL-2.0
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
