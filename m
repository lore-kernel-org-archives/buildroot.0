Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BBF0C4345F
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 08:20:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA04D406C7;
	Mon,  6 May 2024 08:20:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ow3rqRITSnne; Mon,  6 May 2024 08:20:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0011406C5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0011406C5;
	Mon,  6 May 2024 08:20:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4A6E51BF5EA
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 08:20:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42A98406C5
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 08:20:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UzfIXDsmNYGA for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 08:20:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 44630406C0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44630406C0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 44630406C0
 for <buildroot@buildroot.org>; Mon,  6 May 2024 08:20:08 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-41b9dff6be8so10515235e9.3
 for <buildroot@buildroot.org>; Mon, 06 May 2024 01:20:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714983606; x=1715588406;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MZbhxd0wqeLgOJXJVUtM6HifOOSN0NLTlPvE8gR8CXw=;
 b=IZFUUgeO2F+s/7cYR5sEMjr6WTtPSFN7PpTXoJWjEixb6K3KMlGCQ88oOsSOzzScKK
 ETNqPfpU6cqLdEwwWwV3wtOOj5B7i/HShy7l99flrXsldDZwmdHalytgXx8VbpTCT77U
 DU3QXKjrI4f7HSuTiwbdbcGmU87VjzXDt5BG37qlJWKI4bvbaK5uMdWCpIcyP+ah21Vw
 lJPfxKIoQvIZWHKVVIDypK4wHc+tGy4JTFkqIJBZjJm4Kev/YfdvqvNnWxFI3TeEkBcX
 qRVZaI4a3NPymEvOzqYIxLFt6mOVQ999yapcttpT8fOC3O2wNwS/S3Cn/e8rHWKY3NQB
 ybhg==
X-Gm-Message-State: AOJu0Yzo+DIfRAz0st7kBl6iVaj2MJUhD3M2nEkc1HlATuDSfKfuGwf7
 sTOCh1/LzQH4UYNGScER81zGc3xFQiQMyPR3XF+BAmVByx3+KUFX6wFlhQ==
X-Google-Smtp-Source: AGHT+IFd6pPsxRAqeB4VTDcZ+pLkDM0BUWlA6JXbc6ZElTFzInGN4f5GHDJukEr4cCoCZORarWcN7g==
X-Received: by 2002:a05:600c:35c8:b0:41e:1bc1:36de with SMTP id
 r8-20020a05600c35c800b0041e1bc136demr5965464wmq.26.1714983605502; 
 Mon, 06 May 2024 01:20:05 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 bd13-20020a05600c1f0d00b0041c012ca327sm15262874wmb.45.2024.05.06.01.20.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 01:20:05 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  6 May 2024 10:19:58 +0200
Message-ID: <20240506081959.330708-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714983606; x=1715588406; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MZbhxd0wqeLgOJXJVUtM6HifOOSN0NLTlPvE8gR8CXw=;
 b=T9+1UBKSanJ3HpFf9mJfn1Kor+t7hCDew0RQJtR5sv439Mny9NhJVyfJWd8MRke/rz
 qQ/Kp4VUl0vb5SX3wMKvrI57cl8i1V7QEy21agx8508wK+6E/ZH9H7j1/9x00S2QXi+w
 MV5/J3p5EdymDj1IMVljbcpfVyFr0Wh1RAfrXQSTAhKoDA084yoYzaVjqJoZtBzpjqV3
 MZnn5aXMStDBCFPIPB1FTVGZFJB8WEi74bS668JbzZdWP6BBJz/pwObqY1MMEXRyPKvB
 AetgNW/tF0u4fN2uxzwd085ksB33Rcex8p3jBX+SzXW/0LT9ubmAoHvfT6LSWsUwY3jx
 Ebdg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=T9+1UBKS
Subject: [Buildroot] [PATCH 1/2] package/libhtp: security bump to version
 0.5.48
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

Fix CVE-2024-23837 and CVE-2024-28871

https://github.com/OISF/libhtp/security/advisories/GHSA-f9wf-rrjj-qx8m
https://github.com/OISF/libhtp/security/advisories/GHSA-ffr2-45w9-7wmg
https://github.com/OISF/libhtp/blob/0.5.48/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libhtp/libhtp.hash | 2 +-
 package/libhtp/libhtp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libhtp/libhtp.hash b/package/libhtp/libhtp.hash
index c016cb3439..1809bc93a3 100644
--- a/package/libhtp/libhtp.hash
+++ b/package/libhtp/libhtp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  d4214f94522fa5a1ec1909dbb52831c534788d93bc6b2ca8252de9332b11b606  libhtp-0.5.45.tar.gz
+sha256  7f0719732fd0c82f9915e3df27e31548798590ad624fbad24f58b50885248ab8  libhtp-0.5.48.tar.gz
 sha256  87c93904e5434c81622ea690c2b90097b9f162aaa92a96542649a157dbf98d15  LICENSE
diff --git a/package/libhtp/libhtp.mk b/package/libhtp/libhtp.mk
index 8a732d1d5c..8735f593d9 100644
--- a/package/libhtp/libhtp.mk
+++ b/package/libhtp/libhtp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHTP_VERSION = 0.5.45
+LIBHTP_VERSION = 0.5.48
 LIBHTP_SITE = $(call github,OISF,libhtp,$(LIBHTP_VERSION))
 LIBHTP_LICENSE = BSD-3-Clause
 LIBHTP_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
