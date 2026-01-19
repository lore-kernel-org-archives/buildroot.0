Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D87FD2ECF8
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 23:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DFF884467;
	Mon, 19 Jan 2026 23:18:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id la26DSUQ8Hi6; Mon, 19 Jan 2026 23:18:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3DCE884462
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768864736;
	bh=cTh9tLuKSdIzlamN/trdFuQ6dJg/gDdPxYtxESQyHug=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=X+WWElENwbh3cYZX9ZYLRqus2je6Sq7+Lg6jmRDoMNXfaYPm1pUkaa/jWiJLjUmVF
	 pt1mabW15pXALNqcyb0qlf7hBVq9LBgUkmYJOlKlGEoflJrVO7dJcDlzwnE+4kGedF
	 NvA/RodOpF81S0Pc5WzxQjXgB11XOPIROoE+q+9QsN/6vsvP21rwzTOJK2wzp1nVk3
	 M49DcHSpvOaNlJOvXgI7Xn/y7nm/6QrBMm+IBoxXRhjwTp1WoyewOKi6mR5K6XkoH3
	 NOw0gUnlyqtf/3n93CtQpnGEgG33S+OJrwnTexg/e6AGxenexiezuilhJIhZAneRNy
	 SfubyT0WdRsPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DCE884462;
	Mon, 19 Jan 2026 23:18:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 729372A8
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 23:18:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 54D5761153
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 23:18:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h7ZYCZ2xa1Pv for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 23:18:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=mattianarducci1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2B3DC60DCB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B3DC60DCB
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2B3DC60DCB
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 23:18:52 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4801c731d0aso27665835e9.1
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 15:18:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768864730; x=1769469530;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wtbFKyGrINEzoxGrxT24KVD6GsEzv/XjSv2zzUSPWGQ=;
 b=G35zS/CKfYPG1t6G1w8vzIRSpUM1E5fJ/dizGgyoUYuTXvlq+u3IDDf5fvkmqZwc7D
 +VypN2ghQEHCwUbOhs2DG8bmAR5EepxkAlUJNWN2XY56Tde2bf2TO1Q+rfv7Kz35eBnL
 k8h8GLskNl8f/Gnat2FHRqU4UjIA3iAX77UZA1UdoWdOxj0Zy+msMrYM1cAYWVmmWGTz
 SQs92Sf3x2KSlOlYdDixg/0nOzTBy0fOiw4Qra8aQZwZbgmRy/yIcTcwkHEndZXtVura
 B4TiscTXSUWhDXobWR+Fn3cxt4W4ApXLMfqc5myurXO6EgvU+Og4qa7ykByl68xbcZ2/
 KtoQ==
X-Gm-Message-State: AOJu0YwlByyacqsYO22Pk2ExEA9gemBzkwtoKtwZGd/7/y//buTfCg9Q
 Z8WeGiEpMPKJliHW46pYp2VNfwNpeErMucZP3cKtpocWSXdDy4r83hTO/XnQgw==
X-Gm-Gg: AY/fxX6+4lT9StFSf2d+2MIM10PiZEtOpt7JMaFab9icergAPBI7q2YZmd9Sq13kPYS
 edVmITuoPXI6uBEUC5yfKGe31dZB+qYiuXO3uGM0mkORMTF1Y5Lw0Ct9uh1rCRTVG0390EpfG9i
 EO5RdDmI81DSMaXq+QBjazU1c6+5W0UdQ65oIyGtTczF0cGOMaYJvxSVGX1Bw0N/qg7NYzNCp1N
 uFch0c2NWkqvclje3ru68RM+YWvhvEgTn0Fwa+xctqc8l7Y3ny4vgaZVY4nCszwqqN46E3/bIbB
 rr/jjAB99o3QRj6no472ntuuQsXLoIGvrvn8qeprTdmEU3IUIm8LHsqWTOT2daOT380OUMrS/fm
 dRq8WGIxcxl6dvK3xmCpS7zLVvMeIPRVolnmhywcTEZq1Biyrw+2zU2tIaSoO5gVf/8Iy3rIWFU
 WTYjOV7QzIOuxl2s4=
X-Received: by 2002:a05:600c:4e43:b0:477:73e9:dbe7 with SMTP id
 5b1f17b1804b1-4801e358875mr161223835e9.35.1768864729905; 
 Mon, 19 Jan 2026 15:18:49 -0800 (PST)
Received: from localhost ([37.163.185.24]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47f429071a2sm270181925e9.11.2026.01.19.15.18.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 15:18:49 -0800 (PST)
From: Mattia Narducci <mattianarducci1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 20 Jan 2026 00:18:20 +0100
Message-ID: <20260119231830.32276-4-mattianarducci1@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260119231830.32276-1-mattianarducci1@gmail.com>
References: <20260119231830.32276-1-mattianarducci1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768864730; x=1769469530; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wtbFKyGrINEzoxGrxT24KVD6GsEzv/XjSv2zzUSPWGQ=;
 b=kKUrh9efyY7RaqDOIS37lR+yFzstdauHd5rxqysJwEuBuCtBVj0f5FSKXVAqgnWv33
 yqaBxCYT/LhKGj2UC1ZX5doQObwwl3WKDsLKAiYFKuKSYHOQZ6SuCGY8HQeJZ46i/qPR
 wOGsTqJiycdQkFwBDFtbS1yEIcOizKikOnuFk/HOm0RkHHSBqKgUJzPCu6qgPxx5Bqbh
 UII0jRIN37XdHQXnpqzSAlZBpMe1V9GXvZqnGQW7nrtxywTh9ZLhHtUt8EnL1CTBQdcR
 M/2ofS3JEFdPTOjXlNZwG3huYhNu8Icpb7KxNL1wRxqUyhLX7wq00CAOALh5b+42TKsd
 Zu0Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kKUrh9ef
Subject: [Buildroot] [PATCH 4/4] package/ser2net: bump to version 4.6.6
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Francisco Gonzalez <gzmorell@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog: https://sourceforge.net/p/ser2net/news

Static builds are no longer supported after bumping gensio to 3.0.1.

Updated licenses hashes due to upstream commit:
https://github.com/cminyard/ser2net/commit/2bc83f09548dec25b0bec48e11a3ee1942fb3c3e

Signed-off-by: Mattia Narducci <mattianarducci1@gmail.com>
---
 package/ser2net/Config.in    | 1 +
 package/ser2net/ser2net.hash | 8 ++++----
 package/ser2net/ser2net.mk   | 2 +-
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/ser2net/Config.in b/package/ser2net/Config.in
index 1859d42c8f..a14d0b8a49 100644
--- a/package/ser2net/Config.in
+++ b/package/ser2net/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_SER2NET
 	bool "ser2net"
 	depends on BR2_USE_MMU # fork()
+	depends on !BR2_STATIC_LIBS # gensio
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC # gensio
 	select BR2_PACKAGE_GENSIO
 	select BR2_PACKAGE_LIBYAML
diff --git a/package/ser2net/ser2net.hash b/package/ser2net/ser2net.hash
index 50a2efdee8..e625be70f5 100644
--- a/package/ser2net/ser2net.hash
+++ b/package/ser2net/ser2net.hash
@@ -1,6 +1,6 @@
 # From https://sourceforge.net/projects/ser2net/files/ser2net/
-md5  73b4ccc7e9d89034f1a1a20a780b9da9  ser2net-4.3.8.tar.gz
-sha1  d1597d88d154489cb08bac69bb1772712d30cbcd  ser2net-4.3.8.tar.gz
+md5  d1b18cbac5e9caa0c259a8003b1e8c4e  ser2net-4.6.6.tar.gz
+sha1  306205fb87622b4b488621d94bc36436ab2d4134  ser2net-4.6.6.tar.gz
 # Locally computed:
-sha256  e5620975523059a38709bb53c0567600adbbcb8011066a2d2fe1b4db9efe0ba3  ser2net-4.3.8.tar.gz
-sha256  501f3108e6c03e5a0a5585ebaaa369171aead5319cd0a7a4dc1f66211c1f09f1  COPYING
+sha256  a468073c7bf8166c78c61d30bba487916dc4088e98f96e190b37ea8100a94fd4  ser2net-4.6.6.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/ser2net/ser2net.mk b/package/ser2net/ser2net.mk
index 679aaec29a..97f3478d6e 100644
--- a/package/ser2net/ser2net.mk
+++ b/package/ser2net/ser2net.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SER2NET_VERSION = 4.3.8
+SER2NET_VERSION = 4.6.6
 SER2NET_SITE = https://downloads.sourceforge.net/project/ser2net/ser2net
 SER2NET_LICENSE = GPL-2.0+
 SER2NET_LICENSE_FILES = COPYING
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
