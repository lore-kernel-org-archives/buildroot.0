Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B24F99C88
	for <buildroot@archiver.kernel.org>; Sat, 18 Apr 2026 15:55:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3D1D60D61;
	Sat, 18 Apr 2026 15:55:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RXle9R6OZ_4V; Sat, 18 Apr 2026 15:55:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C533160E83
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776527732;
	bh=2KRW98QJWc7DyY0rVI94w5120JNVmYHTEY0diJqecHU=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NdwZMFO2wEAJ5uxlN1b7id6BSlesjSlUuGYaDDlQQU2dJbwS2UlcMGlEtUwfZFWt8
	 EsDGz2vRoZyJs4TpixASbC/fB693XlN2qLq17L88VT2++x7sJ/tacfhqNtTV6xNhNA
	 dNmI7I3EsUQmVT4vrRGt30nkhV4y5cUDQ09Q6cx+TygzJ0ylpA21EyuwOpARNdJG7D
	 PraZSQrnFWcRHQanBJA3mrrhKA5rwicUN1gboqsJf3tpXi9JohrAZ/DohgoaCTKtrM
	 MAYw4/+XxyQ9d4TGtci1KA7MZpsbyq7XcuQEAqykfXwWdgPYxU+HUFj0chAGLk2tme
	 mQPn1LccVGmRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C533160E83;
	Sat, 18 Apr 2026 15:55:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E977259
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 15:55:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5ED9E60D61
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 15:55:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NDXRg0QbsVCk for <buildroot@buildroot.org>;
 Sat, 18 Apr 2026 15:55:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8939860E90
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8939860E90
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8939860E90
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 15:55:29 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-82f351ca23cso781331b3a.2
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 08:55:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776527728; x=1777132528;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k4glx1mFkTgvJULBZq07UPPs+YP7DkYVB+TgeNsnSbw=;
 b=pGhhLuwp0vExbqXjxsy8M5Z7/9Rz6Xt7QdyrAxGQfztqhnVMgper/CKJdiQH+fNJoy
 uxQamtV19EMG3yqEAksfPfkk/rgn1H6gSYsgkodzia7YR7okOIZ1PfhJ/FShkIMV+qN5
 wR5sWExHqzFpKwz2sYZ+SZtTFJ0DEoeh3fyCqx/YZQNT6UvvCtQNfBS4IO+/0iXoSCHz
 CxUO9MmPa0CrLSQPem6QXXE4h9UT31nmP0n2fCAgtKGGhB8ZN+X58yHJ6SD9zr5aajxN
 4GSttnrHgXpzz/GLIVrYyax1kprhtVR7bMtgwnm38dS6W2QTfn8Gv05W9aJcZDY4zC/M
 v77A==
X-Gm-Message-State: AOJu0Yz5jSmxu+5iCizKqIxBJERsSIJ15pNMsk5PM5DNG9DuWOl+Mb6B
 P/X/ACYpkqq7O6oHguyRQdeRVrjzklusg5I3uU+jzwGz6G1mUS8Gan1rLgM+0TWJ
X-Gm-Gg: AeBDieuI+ZfRW5tYLJ9icKEMiXIlqeTy8iztHxCI4kvTgAmAcUcIUVnxdjUD9zuoyfX
 17pL97ZVHL9yQtsHjcfxzdvQkgTlTl5zQ09lbSiGf5TVbUhHcy5FxOCo+HCFdt/peUQzJwGaZ0l
 9eGIB1ca3lMkXjKp53uFRmo4XBhlyzKMVwdBvY2aEcBwxHM4WZ6ibleAJAGbH7YnQMO2Vpy2ABp
 cQRH/zYajcp4n5ZcerpEQkf/yXheMDTLqQdPa2RpM2KbpKrxyZtG5QmnE/CE6/nkfNc0gcsToNu
 SKntso8Ouz2JvDx1EU+fpKHqDuaNNCbi1xAYpWRy69U1I70ulPumQ1MRPzZGVYruChJ+59ST+Xr
 0qU+xSD+awEwMu2Rb+Jj4a4GXktwGO16M7yOQ89vl5w9qyPKii2PRO5t40jcYymf8AQXDTe+mC+
 AnqZ6PpQP0Svw2p4Yxlvr7nIVrsAqe2bbLX3vN4ztlOLNAabrk4g7bCWjR
X-Received: by 2002:a05:6a00:17a0:b0:82f:48e:241c with SMTP id
 d2e1a72fcca58-82f8c8fc541mr7947769b3a.23.1776527728303; 
 Sat, 18 Apr 2026 08:55:28 -0700 (PDT)
Received: from fedora ([2409:40e5:112e:daba:4994:b597:7615:a059])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82f8e9cbb1dsm5959033b3a.14.2026.04.18.08.55.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Apr 2026 08:55:27 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Sat, 18 Apr 2026 21:25:10 +0530
Message-ID: <20260418155515.9980-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776527728; x=1777132528; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=k4glx1mFkTgvJULBZq07UPPs+YP7DkYVB+TgeNsnSbw=;
 b=LGCF8koExbYd/jZcGOmrvm0D+B82MlBYyoP1W3AWTtkd9biOzm+gRBEZiBg8YaN0Ug
 YYLldnPgCl9shv+05YQYbFNxBZn07wbkTpfdU3SZWYSU/8jjt2lHHN6Sns/2hoQw/Ik8
 IVeGIwFX2JS9ud7IKD8OTJdFCpXuToRcgQ+b3a6YqMh/W+iMksJvQHnoV3SbzfUWL2ot
 MqaI8HNHGd7dyVyrWSQTDEyBF2QPLcuaE0GgtbmwEGufVR/WJodEZpCs+QldyBxgVkf3
 ik6ShddrGxvIkfkyDC+zEDE8QeOcJuEy0Jn60RfVo9p3taV4Q6LtaWYt2+Btb0/yr988
 X0/g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=LGCF8koE
Subject: [Buildroot] [PATCH 1/3] package/libenca: bump to version 1.22 and
 migrate to new upstream
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The original upstream site (http://cihar.com/software/enca/) has been
deprecated. The project has been revived and is now maintained at:
https://github.com/Project-OSS-Revival/enca

Changes from 1.19 to 1.22:
- Project moved to GitHub under Project-OSS-Revival organization
- Updated build system and dependencies
- Various bug fixes and improvements
- Continued maintenance after original upstream abandonment

Updated:
- Version from 1.19 to 1.22
- Download site from dl.cihar.com to GitHub releases
- Homepage URL to new GitHub repository

https://github.com/Project-OSS-Revival/enca/releases

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 package/libenca/Config.in    | 2 +-
 package/libenca/libenca.hash | 2 +-
 package/libenca/libenca.mk   | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libenca/Config.in b/package/libenca/Config.in
index 5e951ed835..55527260ba 100644
--- a/package/libenca/Config.in
+++ b/package/libenca/Config.in
@@ -3,4 +3,4 @@ config BR2_PACKAGE_LIBENCA
 	help
 	  Extremely Naive Charset Analyser
 
-	  http://cihar.com/software/enca/
+	  https://github.com/Project-OSS-Revival/enca
diff --git a/package/libenca/libenca.hash b/package/libenca/libenca.hash
index 04c9d5127f..dfa0bb940b 100644
--- a/package/libenca/libenca.hash
+++ b/package/libenca/libenca.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3a487eca40b41021e2e4b7a6440b97d822e6532db5464471f572ecf77295e8b8  enca-1.19.tar.xz
+sha256  95a70dd21198e6427d77a1d79721f4f87dd8bd07fdefe71a2062c6f41eee39da  enca-1.22.tar.xz
 sha256  87f1bd4a52b4029476b684fcdd51fed3c6b2540e462d3c2d3bfc9be4558b2825  COPYING
diff --git a/package/libenca/libenca.mk b/package/libenca/libenca.mk
index 63b6895087..84c32ef7fb 100644
--- a/package/libenca/libenca.mk
+++ b/package/libenca/libenca.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBENCA_VERSION = 1.19
-LIBENCA_SITE = http://dl.cihar.com/enca
+LIBENCA_VERSION = 1.22
+LIBENCA_SITE = https://github.com/Project-OSS-Revival/enca/releases/download/$(LIBENCA_VERSION)
 LIBENCA_SOURCE = enca-$(LIBENCA_VERSION).tar.xz
 LIBENCA_INSTALL_STAGING = YES
 LIBENCA_LICENSE = GPL-2.0
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
