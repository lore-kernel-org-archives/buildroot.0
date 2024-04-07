Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9245FCD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 13:48:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A61B407F5;
	Sun,  7 Apr 2024 13:48:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 77t69Uoc2lVO; Sun,  7 Apr 2024 13:48:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D709340819
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D709340819;
	Sun,  7 Apr 2024 13:48:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B8A2C1BF34A
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 13:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A60D1608FD
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 13:48:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ROrQ6nw3bNK for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 13:48:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7C2DE608F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C2DE608F2
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7C2DE608F2
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 13:48:06 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4166d58a71eso656365e9.1
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 06:48:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712497684; x=1713102484;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w0AYoJNnxJPHh0BVcJXm/cdUy4q+eIo24omP6V/CILs=;
 b=PYjNW4KKGTrAVGTLWlUwg/z5Rb+yBtGjpN3TAf3D174ZTWCirRcSD794JTI30j8ZfU
 NLx/V1ZZEFbSDXTbbS9g6BloJgbVSe/D62UdJLFXmnR0cs0rRbQbMxwMvRQ9qQ03BlmD
 E9Mkvhyi8zhqKHcHLC/1gWUliyrOJFDgtiLgqZSVjnAyJ+0m16enLNE4lGoR5kc2Ujp6
 uo/pnMBDTizkqW4/VOkrguxbe6zIRvRdWRp3hhqwzn9H+r609oZze1f9yjSEGVeEM3r0
 /E4OShl6ofjGm91FkMVLZo5rCga8IYvyemI7PktxSabv5AVH838aVcWE8yn+5i7pyUXD
 xAvw==
X-Gm-Message-State: AOJu0Yz3PqZeG/kPVznKq//MQLv3dqAZ9NSF/ciK5UL7c6CfjsSVgVFj
 Etn0wfkiEfMBQmQJpOSda4eR3mI/KmOwSAw5/Vm8hm3OdlITRLlYp6BP2R9K
X-Google-Smtp-Source: AGHT+IHaLjJT618LCNAMsPLOW/gc1uv2osvVnYbkYII0DFJa16hMpyzWNJCxkXl78IrWQJ3Jwhpv8w==
X-Received: by 2002:a5d:4a90:0:b0:33e:8b93:87c6 with SMTP id
 o16-20020a5d4a90000000b0033e8b9387c6mr5139296wrq.42.1712497683595; 
 Sun, 07 Apr 2024 06:48:03 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 o16-20020a5d6710000000b00343956e8852sm6691170wru.42.2024.04.07.06.48.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 06:48:03 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 15:48:01 +0200
Message-ID: <20240407134801.1839680-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712497684; x=1713102484; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=w0AYoJNnxJPHh0BVcJXm/cdUy4q+eIo24omP6V/CILs=;
 b=dzmnHMxQuJvrhFkXKDpauq2ktuS759agcsbFltbfItEowScjDUULn5CzK+mygQgMV6
 c6M5wEYY3mdr+/Wm51djpCgRfCSHg4a9xkH1SPLm5JxbS5ecPz3lVbPFAyORoASSzQq5
 /uPOhmALCqvz3BAWctjz3jb+Gv1IihvALxfDB41qygu760DYriFRln1R486w7IFC9c/x
 gQRT1t3RUGf4fAPzlr23ABoY6wtLsxplf566eB72t0+siVdzprByNdIa4fEBxjcVKG+k
 ExHC6Hs+bKTY4s60E0vH5wNOd3EgJe0YCcPqbEmEOqFVyumySt3zyLlXKd7F7fN7FHxX
 b8nQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dzmnHMxQ
Subject: [Buildroot] [PATCH 1/1] package/frr: add libxcrypt optional
 dependency
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
Cc: Vadim Kochan <vadim4j@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump of glibc to version
2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97:

/home/autobuild/autobuild/instance-1/output-1/per-package/frr/host/bin/../lib/gcc/i686-buildroot-linux-gnu/12.3.0/../../../../i686-buildroot-linux-gnu/bin/ld: lib/.libs/libfrr.so: undefined reference to `crypt'

Fixes: b5680f53d60acf8ff6010082f873438a39bd5d97
 - http://autobuild.buildroot.org/results/668da3829cacbe883e6cf97ce6191a8180441db6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/frr/Config.in | 1 +
 package/frr/frr.mk    | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/frr/Config.in b/package/frr/Config.in
index ef105202f4..e2ad5d5aa6 100644
--- a/package/frr/Config.in
+++ b/package/frr/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_FRR
 	depends on BR2_HOST_GCC_AT_LEAST_7 # protobuf-c
 	select BR2_PACKAGE_BASH
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_LIBYANG
 	select BR2_PACKAGE_PROTOBUF_C
 	select BR2_PACKAGE_READLINE
diff --git a/package/frr/frr.mk b/package/frr/frr.mk
index 29a9e7b3e8..d20dc07bb7 100644
--- a/package/frr/frr.mk
+++ b/package/frr/frr.mk
@@ -13,7 +13,8 @@ FRR_CPE_ID_PRODUCT = free_range_routing
 FRR_AUTORECONF = YES
 
 FRR_DEPENDENCIES = host-frr readline json-c libyang protobuf-c \
-	$(if $(BR2_PACKAGE_C_ARES),c-ares)
+	$(if $(BR2_PACKAGE_C_ARES),c-ares) \
+	$(if $(BR2_PACKAGE_LIBXCRYPT),libxcrypt)
 
 HOST_FRR_DEPENDENCIES = host-flex host-bison host-elfutils host-python3
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
