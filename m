Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50FE8C47077
	for <buildroot@archiver.kernel.org>; Tue, 16 Jan 2024 19:45:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C663040432;
	Tue, 16 Jan 2024 19:45:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C663040432
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K6HW6iTmzycG; Tue, 16 Jan 2024 19:45:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BFB2540629;
	Tue, 16 Jan 2024 19:45:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BFB2540629
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5A8BE1BF846
 for <buildroot@lists.busybox.net>; Tue, 16 Jan 2024 19:44:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3331A819D5
 for <buildroot@lists.busybox.net>; Tue, 16 Jan 2024 19:44:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3331A819D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZRf-F1Q8iSaC for <buildroot@lists.busybox.net>;
 Tue, 16 Jan 2024 19:44:57 +0000 (UTC)
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EB7EF818D7
 for <buildroot@busybox.net>; Tue, 16 Jan 2024 19:44:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB7EF818D7
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a277339dcf4so1150180666b.2
 for <buildroot@busybox.net>; Tue, 16 Jan 2024 11:44:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705434295; x=1706039095;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=twaV/k/5de1r9rh0a8pJbYzuz9BjtbAIRNKkVu6x0B8=;
 b=Cp/MNmhB8WJoAdmsSSS2gc8LCtzAHsO044NwnrayryfzVANNyiwaQ8tu+H02Cs4Y48
 sd8uDRhQxj2B/kbqu12KF0ZaSyBhkY5/SJwRM6m79TAB7XGoL64QXYm82dDMPQz5DJ3G
 xor8FnDOBa92V4HTzt+cJBs6D8HL6sXj2OHZoz3GkDfjWmyDHRpTREXplws9oH+EfCsk
 VXxvsx4vZvob8Jf4oRpho/HpvgxGZIZjFgzEAl+QV4Gd7u1PNRyT6FCj3sHrnMAtifiI
 wvMkNYTvpim8aQPq0JLtjY+dnCwNdcj0FUU/Bgqrgixox/rILoy/WH4ECBFQA7guwGvB
 JZ9Q==
X-Gm-Message-State: AOJu0YyTxRBoZdIfH5st2L5xb6PmPzbZi5cnW2lFIub0V0DY6uCe0rGb
 EaEwUro56S7zGa0eRl5y9c0WK0rjwsA=
X-Google-Smtp-Source: AGHT+IE/Jttr1PTlLnIsPIg45KeUWkgP7OBTjmIqXnNAHHuccwLzbv9tHYqdfOEZ0uPmsfvAoMnsPA==
X-Received: by 2002:a17:907:7a94:b0:a2e:bc31:e4c1 with SMTP id
 mm20-20020a1709077a9400b00a2ebc31e4c1mr7044ejc.142.1705434294834; 
 Tue, 16 Jan 2024 11:44:54 -0800 (PST)
Received: from xubuntu-23.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 ce2-20020a170906b24200b00a26a0145c5esm6819711ejb.116.2024.01.16.11.44.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jan 2024 11:44:54 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue, 16 Jan 2024 20:44:50 +0100
Message-Id: <20240116194450.33260-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705434295; x=1706039095; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=twaV/k/5de1r9rh0a8pJbYzuz9BjtbAIRNKkVu6x0B8=;
 b=ZAuIJ13edz+C8hkJTUypfi2xbdtZn8cpyhLOSedjwB7lyIspf+UcVTTPRFgRH1v9r+
 KrK1toODzUhYl6ztfm1EENGe4PWo1Iv2SMESAKvQ6IZ//rIjCI+nOtQEat76oiqJad6U
 m86uIfp/9vPrwe3OXkgO35MyNPhfWptuzGNWjlK9lcrqRPOeaCsgcpFwNxChJ76TYr2M
 Am5hBffo1plQGHC/o0tq+mzFUE26tSPXiMGS33k9lsE83vPEKFQG/93Im91iEx3qV//W
 FPmLdC8/JhyGE273KSosegLhi2Sv70KkyBjFxmYDSUeul5huZ/PjbgKRxLoa9Ta5fiiN
 p0Rg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZAuIJ13e
Subject: [Buildroot] [PATCH] package/libksba: bump to version 1.6.5
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
 package/libksba/libksba.hash | 4 ++--
 package/libksba/libksba.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libksba/libksba.hash b/package/libksba/libksba.hash
index 08b599dc0..3ac36e19c 100644
--- a/package/libksba/libksba.hash
+++ b/package/libksba/libksba.hash
@@ -1,6 +1,6 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  258c31c72adda2ef547d94038b7e0fd7bd93d03c  libksba-1.6.4.tar.bz2
-sha256  bbb43f032b9164d86c781ffe42213a83bf4f2fee91455edfa4654521b8b03b6b  libksba-1.6.4.tar.bz2
+sha1  0ada15ac00baa7df677a05bcb517621708f9c2f2  libksba-1.6.5.tar.bz2
+sha256  a564628c574c99287998753f98d750babd91a4e9db451f46ad140466ef2a6d16  libksba-1.6.5.tar.bz2
 
 # Hash for license files:
 sha256  f9c59ea5a5e1dfdeebcd134e6a594c21eb088cc95f6653ee99ff2e187c105380  AUTHORS
diff --git a/package/libksba/libksba.mk b/package/libksba/libksba.mk
index fdc4bb034..52ad5fbee 100644
--- a/package/libksba/libksba.mk
+++ b/package/libksba/libksba.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBKSBA_VERSION = 1.6.4
+LIBKSBA_VERSION = 1.6.5
 LIBKSBA_SOURCE = libksba-$(LIBKSBA_VERSION).tar.bz2
 LIBKSBA_SITE = https://gnupg.org/ftp/gcrypt/libksba
 LIBKSBA_LICENSE = LGPL-3.0+ or GPL-2.0+ (library, headers), GPL-3.0+ (manual, tests, build system)
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
