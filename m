Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B36AC4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 17:50:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F2D840291;
	Sat, 10 Dec 2022 17:50:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F2D840291
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3cDWMTWybOUA; Sat, 10 Dec 2022 17:50:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8639A40353;
	Sat, 10 Dec 2022 17:49:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8639A40353
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 840FE1BF3FD
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 17:49:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6BA9B40436
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 17:49:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6BA9B40436
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RB0hoGnLe648 for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 17:49:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6903A40376
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6903A40376
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 17:49:57 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id u12so8148905wrr.11
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 09:49:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pryegm9SZdtFQZdzck63+DsYDuG4XrRdb9wgR0tHaig=;
 b=fYkbE9pIUzr1/NICGJLUhxG09RAK1Cafq8ApdUczWY4tTNQWAKmT5FjUidQy8ATPhL
 NAPFoKUg7q/sXyFzq59ZBQ67gvPG1gpzSEkuOqEvs4j/AYqQSe8a2IdDC1LGkHZO+eql
 ElCPL7mBv6jkWVPuQUoZ+qBGgtYWVH25vCNXOhYtF3KkUsbrnTd5xbTTKpuJCxHRwd7p
 +4es336AQXyTIGtRcAKDODpxF9HK3dqzfgYwij6HpJFSmIfj1/pCfrh8qgfWdv5ALVPQ
 0MBy+ofh5K7T88DhqDtATISksRGH5QR9a08PWjrsgG/kNjwzfZ3BCJYvwSpjS0GBAWXV
 E65g==
X-Gm-Message-State: ANoB5plr2Es48Ylq1YaO1Xo+pVvAhRtzxQqNNV335uiiXw7/hwQ8UbJo
 3/kX/qHyQYbnWcq6yb/PK/Gscjl7dFk=
X-Google-Smtp-Source: AA0mqf7O0w3l+4D8M58aFgEYW3seNms9g9haEGqT4BPs4V4ZROTVdYm3fmXbj8SZiS92vWmdLeOgxQ==
X-Received: by 2002:a5d:4a8f:0:b0:242:4c11:c062 with SMTP id
 o15-20020a5d4a8f000000b002424c11c062mr7748677wrq.28.1670694595080; 
 Sat, 10 Dec 2022 09:49:55 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 p7-20020adff207000000b002425dc49024sm4361796wro.43.2022.12.10.09.49.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 09:49:54 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 18:49:50 +0100
Message-Id: <20221210174950.46867-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pryegm9SZdtFQZdzck63+DsYDuG4XrRdb9wgR0tHaig=;
 b=RTiryA+opm+tAuy4C8e/wlQ50L51jdxAPlJ9ucHcJm04bnv5qeuNveVp2YflzEj5rE
 FbIzzIPsWCiAuUKz1qxU2NFf3WTvnlVVPjbxFUR0IM8ejdXMtbtYnwZCgNjL4663T1Xq
 fxpN0PkMm0gxO5H8qLSNgsA9pVbgO3EM4JOp9d2Gr8IExiqBB69mKMcRykF6RBIXFJ06
 tirzrRHm80yhdKiDnUDOmEVxNIw7o7Z1SJM0GxnH0NYj6DldJHoTBAaIUrrewXARfKBi
 +ryAsZu0CVtgghQDw3etkJVl5CdiA3yhElSSl29Zb3DLDJHXj/rYxDQBiYA2hMNnDp2J
 cBqg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=RTiryA+o
Subject: [Buildroot] [PATCH 1/1] package/exempi: bump to version 2.6.3
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
Cc: Ilya Averyanov <averyanovin@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Samples can be disabled since version 2.6.2 and
https://gitlab.freedesktop.org/libopenraw/exempi/-/commit/a8db9f4e7e4156ee7e52def01f1f83ca5fa7de40

This bump will fix the following build failure on arm with gcc 10 raised
since bump to version 2.6.0 in commit
55f1d0a3592253df2a356c195e5131a970eade9b and
https://gitlab.freedesktop.org/libopenraw/exempi/-/commit/0872e35a30457d2ecf746a1bebdb7d94636d0e2f
https://github.com/adobe/XMP-Toolkit-SDK/commit/0872e35a30457d2ecf746a1bebdb7d94636d0e2f
thanks to
https://gitlab.freedesktop.org/libopenraw/exempi/-/commit/f26d77ba26a7245a95068bca2eea9608f4e79f80:

/home/giuliobenetti/autobuild/run/instance-3/output-1/host/lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: ../../XMPFiles/source/.libs/libXMPFiles.a(XMPFiles_Impl.o):(.rodata+0x5c): multiple definition of `typeinfo name for TXMPMeta<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >'; XMPFilesCoverage.o:(.rodata+0x0): first defined here

https://gitlab.freedesktop.org/libopenraw/exempi/-/blob/2.6.3/NEWS

Fixes:
 - http://autobuild.buildroot.org/results/c440719de02a154c6bdae11bda06ea30c131c71d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/exempi/exempi.hash | 2 +-
 package/exempi/exempi.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/exempi/exempi.hash b/package/exempi/exempi.hash
index 5df610de17..772d9130d4 100644
--- a/package/exempi/exempi.hash
+++ b/package/exempi/exempi.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  072451ac1e0dc97ed69a2e5bfc235fd94fe093d837f65584d0e3581af5db18cd  exempi-2.6.1.tar.bz2
+sha256  80b3aa0b7f54978c6a49cc5f5f1d3b6e9524b59de74ef92b3bf0abeba4c28fb1  exempi-2.6.3.tar.xz
 sha256  3d3c3593c15e0d35bdae0df7c642106250f6be3adc61477419413900f23ae607  COPYING
diff --git a/package/exempi/exempi.mk b/package/exempi/exempi.mk
index 56fbe20379..f808afd53c 100644
--- a/package/exempi/exempi.mk
+++ b/package/exempi/exempi.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-EXEMPI_VERSION = 2.6.1
-EXEMPI_SOURCE = exempi-$(EXEMPI_VERSION).tar.bz2
+EXEMPI_VERSION = 2.6.3
+EXEMPI_SOURCE = exempi-$(EXEMPI_VERSION).tar.xz
 EXEMPI_SITE = https://libopenraw.freedesktop.org/download
 EXEMPI_INSTALL_STAGING = YES
-EXEMPI_CONF_OPTS = --disable-unittest
+EXEMPI_CONF_OPTS = --disable-samples --disable-unittest
 EXEMPI_DEPENDENCIES = host-pkgconf expat zlib \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
 EXEMPI_LICENSE = BSD-3-Clause
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
