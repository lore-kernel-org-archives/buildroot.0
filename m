Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC11C47074
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 23:04:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F59360BC8;
	Tue,  2 Jan 2024 23:04:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F59360BC8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BNM_o1QlmwrT; Tue,  2 Jan 2024 23:04:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8970660BFC;
	Tue,  2 Jan 2024 23:04:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8970660BFC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AEC741BF2B6
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 23:04:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A3CA4032B
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 23:04:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A3CA4032B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hZHTkk5qIBG1 for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 23:04:16 +0000 (UTC)
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 642474014B
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 23:04:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 642474014B
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-33687627ad0so9242650f8f.2
 for <buildroot@buildroot.org>; Tue, 02 Jan 2024 15:04:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704236654; x=1704841454;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ejWxu2iwUWLo+o5Tdunp+JK8Y2X+bGQ+Hr52wyrb5to=;
 b=qUzmaxZWa1Oznf+cuh68O/yf1OOGqPSk54gYjGVn3ur++iwhvmB2XP8YPe4trV9DoN
 FqvkHUj6eq3GKZ76cnKFcoPKXBVRqssP/wWsx5aC3qyvzljDfwL1uVQ+A8llesOl6pU9
 17Wd53onTsawnh/26pLcwl91NKd/V/hfUfeut9zhe8q3zHhpiz1bbv6o6zL30ZH/3wyX
 bxwAnVODs8KKLlhT4Mmz4gvYM/jFOPvERgnoznvYR//Mh1+2l3psrylT/0KW3Ace13h2
 M+OfYbK9OfCP/dDcrh39GK2Lat2RO926RjZNCfkTSfMnbO5zRJl/kxx+QgPDqYVXYwQE
 mV3A==
X-Gm-Message-State: AOJu0YzGA9HI5cnUK0kQE2QV63Z8TkRSC3R7U7Rkt8oR/TmoATsKVEl7
 rhvkA3f0rYBcoQblV1/unPCrSHU8YaY=
X-Google-Smtp-Source: AGHT+IG6ZBWIEstAPiKNsH/VUdXRHymQx153Qs11uNawSnFuHt/xncDQhDfIxEHGp+UtZ6YETwsBJw==
X-Received: by 2002:a7b:c7cb:0:b0:40d:8c4d:c0b3 with SMTP id
 z11-20020a7bc7cb000000b0040d8c4dc0b3mr761715wmk.94.1704236653803; 
 Tue, 02 Jan 2024 15:04:13 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 v10-20020a05600c470a00b0040d579817b0sm398028wmo.15.2024.01.02.15.04.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jan 2024 15:04:13 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  3 Jan 2024 00:04:09 +0100
Message-ID: <20240102230409.2560737-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704236654; x=1704841454; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ejWxu2iwUWLo+o5Tdunp+JK8Y2X+bGQ+Hr52wyrb5to=;
 b=K5t9Colj/GCNI5wrIeE1RREM+eMIAG7MV7Npo4kIS77mrbLcpJScf8P9lQf06XQz4R
 ezc5rRMLQv72E+Xw1qpDxJX/eT+ZDAeCQ8hAxko9VwTTNrPVr0t0WKySX3Gn7RWMp84j
 6hCKBfuITOjmAideFDQ+A4kkG+tXVxrI1F+fpZuFz3hUvyevJpN292I1hK05us19Oc4V
 DTbfkTIsczdMtnZfrh0Jia+xUokwcDFeIidLWmdIEfY2+gpCDASMsbM9Uan2xM6L6f96
 8bjE8EAOHD9FqPMxvMDnQ8SFnuL2UryqLd7NR6wG7r86kt5R8JW89UvEOJaJuLbD5Nyf
 EOuA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=K5t9Colj
Subject: [Buildroot] [PATCH 1/1] package/pv: bump to version 1.8.5
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

- Switch to tar.gz tarball as tar.bz2 is not available anymore
- License is GPL-3.0+ since
  https://codeberg.org/a-j-wood/pv/commit/e5cc71b4d22bd018fa55b8e7c795c7bf94776b2d
- workarounds can be dropped as standard gnu automake is used since
  https://codeberg.org/a-j-wood/pv/commit/e99548ea8a2b1dd4e163036cabf4e26c40fe5170

https://codeberg.org/a-j-wood/pv/src/tag/v1.8.5/docs/NEWS.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pv/pv.hash |  4 ++--
 package/pv/pv.mk   | 24 +++---------------------
 2 files changed, 5 insertions(+), 23 deletions(-)

diff --git a/package/pv/pv.hash b/package/pv/pv.hash
index b3dd71f74b..ed4cc21d89 100644
--- a/package/pv/pv.hash
+++ b/package/pv/pv.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  e831951eff0718fba9b1ef286128773b9d0e723e1fbfae88d5a3188814fdc603  pv-1.6.20.tar.bz2
+sha256  d22948d06be06a5be37336318de540a2215be10ab0163f8cd23a20149647b780  pv-1.8.5.tar.gz
 
 # Hash for license file
-sha256  280e182171df3e9bb4a9b407326e88521151fcb8f4f8557255f26177d5900ccf  doc/COPYING
+sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  docs/COPYING
diff --git a/package/pv/pv.mk b/package/pv/pv.mk
index 27060cf07e..f7243da8be 100644
--- a/package/pv/pv.mk
+++ b/package/pv/pv.mk
@@ -4,28 +4,10 @@
 #
 ################################################################################
 
-PV_VERSION = 1.6.20
-PV_SOURCE = pv-$(PV_VERSION).tar.bz2
+PV_VERSION = 1.8.5
 PV_SITE = http://www.ivarch.com/programs/sources
-PV_LICENSE = Artistic-2.0
-PV_LICENSE_FILES = doc/COPYING
+PV_LICENSE = GPL-3.0+
+PV_LICENSE_FILES = docs/COPYING
 PV_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 
-# --relax linker option is enabled by default on sparc/sparc64
-# architectures, and it can't be used together with -r option, so
-# disable it.
-ifeq ($(BR2_sparc)$(BR2_sparc64),y)
-PV_LDFLAGS = "-Wl,--no-relax"
-endif
-
-# While 'pv' uses autoconf, it does not use automake for its
-# makefiles. It uses $(LD) $(LDFLAGS) to achieve partial linking, but
-# using 'ld' directly doesn't work well with some toolchain
-# configuration, as the ld default emulation may not necessarily be
-# the correct one. By passing the below values for LD and LDFLAGS, we
-# ensure that 'gcc' is used to do these partial linking steps.
-PV_MAKE_OPTS = \
-	LD="$(TARGET_CC)" \
-	LDFLAGS="-Wl,-r -nostdlib $(PV_LDFLAGS)"
-
 $(eval $(autotools-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
