Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 831F2C19F2D
	for <buildroot@archiver.kernel.org>; Sat, 13 Aug 2022 09:54:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 14999404ED;
	Sat, 13 Aug 2022 09:54:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14999404ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eau6OgfCnSY9; Sat, 13 Aug 2022 09:54:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E6844019D;
	Sat, 13 Aug 2022 09:54:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E6844019D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 862D11BF408
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 09:54:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E0DF60AE4
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 09:54:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E0DF60AE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Px0dF6ezqJrv for <buildroot@lists.busybox.net>;
 Sat, 13 Aug 2022 09:54:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6070E60A47
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6070E60A47
 for <buildroot@buildroot.org>; Sat, 13 Aug 2022 09:54:27 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id
 d63-20020a4a5242000000b0044880019622so537276oob.13
 for <buildroot@buildroot.org>; Sat, 13 Aug 2022 02:54:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=WeF5mVZgEBi4bJchIc9sjGIZtW4hEODXNR4TnlXBk0A=;
 b=yoqi+Y5aN/i0/XCRIatcPqIDMSVnlNxROTbfMO162thzpkxUSqm82YMKGb2yuMX10x
 bFix4nd3Xu/QK/HCAz+IXl0nJpoiOXGEysrqc5m460nrwqhN28ky+nX50JBTYpsMJQ5F
 QksDDYRnl5Kaz3MQb/T4FKWk4blQYwx7CMNaCJU/C0bOcCA9gBokhFbRO4+M2Enre/VN
 V8aDK1+9u49Sh9OGFxARsQluWpt30H2dQuLl/YVYqVemi3OWECewxwOuJEa5JuO1JUpI
 itiFywN38gLXdX8iuGsYP9iLR8Roh9Z7d7EdnehP5ceTctBkixpjBLrd4VqVr8xtKbAY
 YNdQ==
X-Gm-Message-State: ACgBeo3z9Qr35LvFt7CzdZo+/BOzIraJr3nADjh3vjpALDyetNb79mEc
 /niIP6F/lXLqIw/khVPE4oBcUdSDW+8=
X-Google-Smtp-Source: AA6agR6aXasqxsNYR2JhMJoSFhtf5FrG/4vwTGBZxL7hIcq2JtnMkISLphuE0RJ+ewKSha5zPYoxRg==
X-Received: by 2002:a4a:8c12:0:b0:435:9dbd:6c46 with SMTP id
 u18-20020a4a8c12000000b004359dbd6c46mr2445752ooj.10.1660384465725; 
 Sat, 13 Aug 2022 02:54:25 -0700 (PDT)
Received: from james-x399.localdomain (71-33-138-207.hlrn.qwest.net.
 [71.33.138.207]) by smtp.gmail.com with ESMTPSA id
 3-20020aca0703000000b00334c2e81dfbsm802662oih.0.2022.08.13.02.54.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Aug 2022 02:54:24 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 13 Aug 2022 03:54:22 -0600
Message-Id: <20220813095422.318927-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=WeF5mVZgEBi4bJchIc9sjGIZtW4hEODXNR4TnlXBk0A=;
 b=cSOQy7YXNpaDIBOV28pR9A/5EJJELBTwkKEMIU5jNdMB9bpNaRn2DKYmh4AtH1KLTh
 tP8NgSo3O+oSs1JpRp4gG4uF2H88aq568hdit7oLVxbrXzrH2rQLpbxCwFLEqgt+lPiR
 XOjgCccNIb5yuMqYxXcQyBytE1hzO/yRTR8zOgF+/ZFRot8mVMzUlIe0WJrkO+FCKg9Y
 yIiHIsrTz4yxhNr4d3hysmgcHZcQZ4cUR5WDIn91Ckw8PaebkIlNaMEienSi5Lj44rtC
 ml3eIqtB7uXBzYwqB+lrD/uD0CC8BH1MToOXNbWPRuQZcswWyjRKw0XORbdY07YdjB3a
 z7HQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=cSOQy7YX
Subject: [Buildroot] [PATCH 1/1] package/meson: bump to version 0.63.1
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/meson/meson.hash | 4 ++--
 package/meson/meson.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index 1133bed046..d22b21cdea 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://github.com/mesonbuild/meson/releases/download/0.63.0/meson-0.63.0.tar.gz.asc
-sha256  3b51d451744c2bc71838524ec8d96cd4f8c4793d5b8d5d0d0a9c8a4f7c94cd6f  meson-0.63.0.tar.gz
+# https://github.com/mesonbuild/meson/releases/download/0.63.1/meson-0.63.1.tar.gz.asc
+sha256  06fe13297213d6ff0121c5d5aab25a56ef938ffec57414ed6086fda272cb65e9  meson-0.63.1.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index 880dfffcf1..1e431f426a 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 0.63.0
+MESON_VERSION = 0.63.1
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
