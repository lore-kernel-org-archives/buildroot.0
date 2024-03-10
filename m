Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 666A0C54791
	for <buildroot@archiver.kernel.org>; Sun, 10 Mar 2024 17:37:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92E5440660;
	Sun, 10 Mar 2024 17:37:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y9uxQTtTVCCV; Sun, 10 Mar 2024 17:37:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CDA240656
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CDA240656;
	Sun, 10 Mar 2024 17:37:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4FDAE1BF409
 for <buildroot@lists.busybox.net>; Sun, 10 Mar 2024 17:37:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 49BFF81765
 for <buildroot@lists.busybox.net>; Sun, 10 Mar 2024 17:37:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZYCHYT3eYiZB for <buildroot@lists.busybox.net>;
 Sun, 10 Mar 2024 17:37:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=fperrad@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1436681470
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1436681470
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1436681470
 for <buildroot@busybox.net>; Sun, 10 Mar 2024 17:37:34 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-33e570ef661so2055780f8f.1
 for <buildroot@busybox.net>; Sun, 10 Mar 2024 10:37:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710092253; x=1710697053;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LEoUQ4fDgV7SRW6ggbj+JuBXklweF0tRRQvXwOqR6dg=;
 b=I0HAs+f5kqgvmvlKXKXcnyNHGkI8RkQS6NEJtx5E4/ch5bZpQkkSr677CcYbSzsrQS
 rv21xjfUoC4lSirHewDkL0mzuYfiPyFM7KNYnkTjGGisP6yGBwzIZB9DLAwy2OQbpjV+
 bGn9o4Rzwqju+ILc/ncus0lZg41o1DmTlnjsoav1SGOQXHpOcqg3PbuDuzNnTlUG4Uhq
 Ablo4pkjarqZplyy6buFBah+eIYdA5hk88ovGB/4E0dBqr5padkH1faGxJzVzoB6N1qi
 ds9OGCTrTfztR1WoqA/u/KgV0XIZVZbaEzbbv3s5M9QRzaHU1NQWXaGhpU02uTccPxRK
 n/5Q==
X-Gm-Message-State: AOJu0YziKyLxQzHfz439vH/Dwdz0n8K7Q+kK/0Vi6+SlIY4nn0Kvh/Mx
 HyejQfqkr8X7OCY7Vt5RjNzzcOIwTtJnaGX1mrFJY843D7Ic0ObuCX5DjZN9tPw=
X-Google-Smtp-Source: AGHT+IG4IOmX/lnUxjXO20mVH/R5RhiUoe/ap8E4h2mXirfpzpFMrj0J97zv70ZyvZeVIfO7E7bsng==
X-Received: by 2002:a05:600c:538a:b0:413:2ab0:eacc with SMTP id
 hg10-20020a05600c538a00b004132ab0eaccmr65162wmb.23.1710092252870; 
 Sun, 10 Mar 2024 10:37:32 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.7.140]) by smtp.gmail.com with ESMTPSA id
 iv17-20020a05600c549100b00413160baa9bsm10044884wmb.10.2024.03.10.10.37.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Mar 2024 10:37:32 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sun, 10 Mar 2024 18:37:27 +0100
Message-Id: <20240310173727.20470-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710092253; x=1710697053; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LEoUQ4fDgV7SRW6ggbj+JuBXklweF0tRRQvXwOqR6dg=;
 b=ioiJqZNfvm7r/aaiA6Ly919bqYKMv+YRrpPwtKVWZNcvwQxM0lza1MANhch+/RS3Kp
 A3ZXxer73fuImGU/MaofjEy2U5AgxORhNkJxw5MNqItqVvQKrG+uL9IWlmEg948e/fZZ
 gUJOUskDmYsRKSI1W4XxjTMaYNf9M5Sx8hj3h6NdD4jhjAJBCZ9IlUdah2oGSgml5F/z
 ttiih+2JkRHb5tcZsOlZwhX1q7hheeD2gSdA2Ao4Ks1dN8wbMBu1zPKWO15rGmVAkG5Z
 dlX41P6vjYm6B7qeXYt6SkPSzrj92S/PEYggUUuvQ0E53iwVVHqYmPJi6FAe64JxZRqw
 F6cA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ioiJqZNf
Subject: [Buildroot] [PATCH] package/libressl: bump to version 3.8.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/libressl/libressl.hash | 2 +-
 package/libressl/libressl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libressl/libressl.hash b/package/libressl/libressl.hash
index 40b49dbb8..60bb854ff 100644
--- a/package/libressl/libressl.hash
+++ b/package/libressl/libressl.hash
@@ -1,4 +1,4 @@
 # From https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/SHA256
-sha256  6d4b8d5bbb25a1f8336639e56ec5088052d43a95256697a85c4ce91323c25954  libressl-3.8.2.tar.gz
+sha256  a65f40e3ef6e3c9451c8318e6f2c454c367e67f09c0cde1849731a4d6ecc7272  libressl-3.8.3.tar.gz
 # Locally computed
 sha256  5c63613f008f16a9c0025c096bbd736cecf720494d121b5c5203e0ec6e5955b1  COPYING
diff --git a/package/libressl/libressl.mk b/package/libressl/libressl.mk
index b72f3b38c..05373d48e 100644
--- a/package/libressl/libressl.mk
+++ b/package/libressl/libressl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRESSL_VERSION = 3.8.2
+LIBRESSL_VERSION = 3.8.3
 LIBRESSL_SITE = https://ftp.openbsd.org/pub/OpenBSD/LibreSSL
 LIBRESSL_LICENSE = ISC (new additions), OpenSSL or SSLeay (original OpenSSL code)
 LIBRESSL_LICENSE_FILES = COPYING
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
