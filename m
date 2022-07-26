Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A10C43334
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 07:08:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8F5860E93;
	Tue, 26 Jul 2022 07:08:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8F5860E93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d1bJid4rWEa1; Tue, 26 Jul 2022 07:08:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E84460DCA;
	Tue, 26 Jul 2022 07:08:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E84460DCA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EB6701BF280
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 07:08:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C2BE540016
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 07:08:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2BE540016
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PmOLioOTY10l for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 07:08:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A47440057
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7A47440057
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 07:08:29 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id m17so18570272wrw.7
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 00:08:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=auoJugZ3PIvnALj3qEcoBhBpDow0HjkHE1GM+sDcoSM=;
 b=s7BqAsGcKCxUfeiARTjZkJQS66KvdIYr0uEchS5m8gA/XOBY4lul9WBS/0D3eoFz+0
 azP1STns1QF/7ahJUDk/NmOsRkbEnLnm2+ZQ/fC2hFy/owu0Y0gB6lUHvR6jD3Xc36xc
 GLfSnSk1a/fy5XLdWKGUVaSgnKKPP8s3m2rrqzzijiGOqWlDFrZ62W8VbCDyBsx3VtX3
 oGsd8h0vPx54gqZmaxEOrtp/kVnQpUH6NyY2FHN60RpCejxb/AwzmvCDKQ+Or6CITIJ3
 ZULVK8qATWcjqCDdp0yt/GG/kcHAhzicZK4lDbuORyWgb4Lzd0/uN4O8kRsgMcvky7JN
 QCFA==
X-Gm-Message-State: AJIora9IPBXFgCXoaLhzZ/BQ8xZwAkJErKw9aVsH4xulqGOryVus1thP
 SZ7pklVMp2MymrzDBqbLy7n/qgUKV68=
X-Google-Smtp-Source: AGRyM1u2fDDYWHeOJcM0FCkae8GY7c816O6ewXYuC+vZbCb0D/0Mj6yrNkyWRPFbjznrKVDemnh0dA==
X-Received: by 2002:a05:6000:156f:b0:21d:887f:8ddf with SMTP id
 15-20020a056000156f00b0021d887f8ddfmr9971306wrz.534.1658819307361; 
 Tue, 26 Jul 2022 00:08:27 -0700 (PDT)
Received: from kali.home (2a01cb09d053e3d59a58c457f47a946a.ipv6.abo.wanadoo.fr.
 [2a01:cb09:d053:e3d5:9a58:c457:f47a:946a])
 by smtp.gmail.com with ESMTPSA id
 d10-20020a5d4f8a000000b0021d928d2388sm13892885wru.85.2022.07.26.00.08.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 00:08:27 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 09:08:16 +0200
Message-Id: <20220726070816.1197309-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=auoJugZ3PIvnALj3qEcoBhBpDow0HjkHE1GM+sDcoSM=;
 b=c17pt0hafKyl61tA9ArSNPyfGSKKtkT8bLHm9ai3CXLz99kFZQcS3af/hXx2Nou30J
 yin/ODlrQALK5zI0mKe48bnefoSYz7+yZ9JRB+ky5L1/xXGVM7Wpq5VVTsup4p+DSS+u
 sdgCaBwSmWFqIMMmAoKjCAgvPzFNOc6HsLXSfLGiQRd1E6GVv8LiQ+8RF0f86eMWR8eC
 CuoBxCSXbfzqe5B9U7n/EKGTZfO8dTFMDIeTsFqp2OsZqNcJAC2LEKaGW/Qj8cOcROaM
 Dshi9/BC1IbfutgWzde+4Dcyz5VqYLBLD4VUIkQSG00NIPmyXumcKzvS9jhhFHEGm3ay
 nahQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=c17pt0ha
Subject: [Buildroot] [PATCH 1/1] package/libseccomp: bump to version 2.5.4
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/seccomp/libseccomp/releases/tag/v2.5.4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libseccomp/libseccomp.hash | 4 ++--
 package/libseccomp/libseccomp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libseccomp/libseccomp.hash b/package/libseccomp/libseccomp.hash
index 20b8864727..8337f33f3e 100644
--- a/package/libseccomp/libseccomp.hash
+++ b/package/libseccomp/libseccomp.hash
@@ -1,4 +1,4 @@
-# From https://github.com/seccomp/libseccomp/releases/tag/v2.5.3
-sha256  59065c8733364725e9721ba48c3a99bbc52af921daf48df4b1e012fbc7b10a76  libseccomp-2.5.3.tar.gz
+# From https://github.com/seccomp/libseccomp/releases/tag/v2.5.4
+sha256  d82902400405cf0068574ef3dc1fe5f5926207543ba1ae6f8e7a1576351dcbdb  libseccomp-2.5.4.tar.gz
 # Locally calculated
 sha256  102900208eef27b766380135906d431dba87edaa7ec6aa72e6ebd3dd67f3a97b  LICENSE
diff --git a/package/libseccomp/libseccomp.mk b/package/libseccomp/libseccomp.mk
index ee2cb126f1..7d7f33618e 100644
--- a/package/libseccomp/libseccomp.mk
+++ b/package/libseccomp/libseccomp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSECCOMP_VERSION = 2.5.3
+LIBSECCOMP_VERSION = 2.5.4
 LIBSECCOMP_SITE = https://github.com/seccomp/libseccomp/releases/download/v$(LIBSECCOMP_VERSION)
 LIBSECCOMP_LICENSE = LGPL-2.1
 LIBSECCOMP_LICENSE_FILES = LICENSE
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
