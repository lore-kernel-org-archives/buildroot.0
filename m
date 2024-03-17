Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47CC2C54E68
	for <buildroot@archiver.kernel.org>; Sun, 17 Mar 2024 22:00:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4FA2605CF;
	Sun, 17 Mar 2024 22:00:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1fr-OQH4J7Av; Sun, 17 Mar 2024 22:00:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9B7760632
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9B7760632;
	Sun, 17 Mar 2024 22:00:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E5E1E1BF3FB
 for <buildroot@lists.busybox.net>; Sun, 17 Mar 2024 22:00:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D2C7360632
 for <buildroot@lists.busybox.net>; Sun, 17 Mar 2024 22:00:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 05tiUQzxXFwb for <buildroot@lists.busybox.net>;
 Sun, 17 Mar 2024 22:00:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 897CB605CF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 897CB605CF
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 897CB605CF
 for <buildroot@buildroot.org>; Sun, 17 Mar 2024 22:00:33 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4140816539fso9531945e9.3
 for <buildroot@buildroot.org>; Sun, 17 Mar 2024 15:00:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710712830; x=1711317630;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MfY4DdxNdQ03Sj+5wDIU28bjdmuETLWjMImRhgZ8WLY=;
 b=M1scEKl+EQHvDcRnmXq2knSsSGcR0uSzwyOzdcDKvi/3/703Nk9cGRUn9MPZNYrSvv
 NOuF8AxB49KSKFF5brZGkofSACTZH+7cdHgjOYMxg1tYLDs419Chl5FgBzroDopGsKK+
 YKysrukm3D7py+yvk0bwAPL3aXqiJ8MEKasAWkW0Z6LZIiP1aKpxeAnQ8EP6TaN56Lg2
 s4my36vKAzhiDDDn73k0KwfwepzRB1EWNF9Reqh0aD7FX6wsPUFBciXmLbOKpuPdc3dh
 pNHz4Krih2YDByz2lzgus22JxPEkw+7jmVypyLSnS0kZ2iPU5l1+KLzqRUziZvykP6SQ
 dEFw==
X-Gm-Message-State: AOJu0YxpTxs5GGurBc4Wf6mXEGa3DbYFoKMqtiFt6CTTNidtJwm2Ts/e
 wbsTGU3tvGUhYDJanvo5i5nlod0byQjfHOqYjDcBQquTUe10Flo1VtOCQytS
X-Google-Smtp-Source: AGHT+IEvjewqgkXN6kjcKKkRKXRtnACG3pDcsvDeg70APUR9JVFzCJKsB6yT7r4yO0xDwZ3K6ybE8A==
X-Received: by 2002:adf:f551:0:b0:341:787b:5622 with SMTP id
 j17-20020adff551000000b00341787b5622mr108766wrp.52.1710712830139; 
 Sun, 17 Mar 2024 15:00:30 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 ay25-20020a5d6f19000000b0033e3cb02cefsm8399029wrb.86.2024.03.17.15.00.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Mar 2024 15:00:29 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 17 Mar 2024 23:00:28 +0100
Message-ID: <20240317220028.1497643-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710712830; x=1711317630; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MfY4DdxNdQ03Sj+5wDIU28bjdmuETLWjMImRhgZ8WLY=;
 b=QfH9dY9KVIaWgm9RMRNlZe6HkzjJ3uXhqEx1/heH1agHYodg+tPFp3jV1D+UBzOhjB
 Z1Zcm2HpXg0Aynn6JQtV0VCpbebeZu82E7zstDxRpOxTqZkyY5c0QxRAmKFWYykVldTG
 VFl8tz+NpqOlWXOz1n12lTTU5n4JTkIi2rfeLJCyHHxsi/+WZ7AsxmQ2Jf1JuRVTxoEX
 FE6QoBer8FxOIq+vOsNv5gPkjBjnUSH82Mo3DYMIt+0oq8vI77ejwEVyh04EVP3LguOH
 1ijTYrA4qatsp38phqlCTnoH5/lDOCr5p3sd08hwW60o5t/RzDZgkJ/0zVJqIxFQPZJ5
 Gs0g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QfH9dY9K
Subject: [Buildroot] [PATCH v2, 1/1] package/osm2pgsql: only supports 64 bits
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

osm2pgsql only supports 64 bits architectures since bump to version
1.10.0 in commit e056aeeca9cf8c00c6da62c39979ce6c55c92791 and
https://github.com/osm2pgsql-dev/osm2pgsql/commit/389904269a1b1f246641d203abadfcd5cebb97cc
resulting in the following build failure with arm:

CMake Error at CMakeLists.txt:20 (message):
  osm2pgsql needs a 64 bit architecture

Fixes: e056aeeca9cf8c00c6da62c39979ce6c55c92791
 - http://autobuild.buildroot.org/results/30c2675a732fd810c68dffbb6483f9cf8e4fcbf3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Arnout Vandecappelle):
 - Use BR2_ARCH_IS_64

 package/osm2pgsql/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/osm2pgsql/Config.in b/package/osm2pgsql/Config.in
index c6a38f3180..439309df95 100644
--- a/package/osm2pgsql/Config.in
+++ b/package/osm2pgsql/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_OSM2PGSQL
 	bool "osm2pgsql"
+	depends on BR2_ARCH_IS_64
 	depends on BR2_INSTALL_LIBSTDCPP # boost, libosmium, protozero
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
 	depends on BR2_TOOLCHAIN_HAS_THREADS # boost, libosmium
@@ -24,9 +25,11 @@ config BR2_PACKAGE_OSM2PGSQL
 	  https://osm2pgsql.org
 
 comment "osm2pgsql needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
+	depends on BR2_ARCH_IS_64
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_TOOLCHAIN_HAS_THREADS
 
 comment "osm2pgsql needs a toolchain not affected by GCC bug 64735"
+	depends on BR2_ARCH_IS_64
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
