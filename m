Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A633C6FD18
	for <buildroot@archiver.kernel.org>; Tue, 25 Apr 2023 17:15:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0331961467;
	Tue, 25 Apr 2023 17:15:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0331961467
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cuKcYIoS8bho; Tue, 25 Apr 2023 17:15:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E936961473;
	Tue, 25 Apr 2023 17:15:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E936961473
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6525A1BF82D
 for <buildroot@lists.busybox.net>; Tue, 25 Apr 2023 17:15:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 45D7F4098A
 for <buildroot@lists.busybox.net>; Tue, 25 Apr 2023 17:15:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45D7F4098A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DNVN2aYZS5jM for <buildroot@lists.busybox.net>;
 Tue, 25 Apr 2023 17:15:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4046A4098E
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4046A4098E
 for <buildroot@buildroot.org>; Tue, 25 Apr 2023 17:15:04 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-63b51fd2972so4823197b3a.3
 for <buildroot@buildroot.org>; Tue, 25 Apr 2023 10:15:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682442903; x=1685034903;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gSQzr3X8N9/KFqHqNn/Tms//MgX92Y0z+zWYj+4M66Q=;
 b=hBPdtsGWFgo9fIwelCcpWA8ZyPBcSlRI5wphzMmhYAR8egya1lNRtDIk9VqurkU1A6
 Q0QjGAoBlmjeMATK0xJ3UbJqgjup3PzvRvJo7JSlKPUgKdKmVleEURJo+5oiOpFii1gu
 GEFw0erjeCSSqdLdHak87vJubaO8ST/FT0jGJeF9oMOuZfYr+lvZTKgiMVnbZwPyaotS
 stSun7qqTCMmnupD94S4uoLQA9w9BMFJrsBvXPGrz3joG9ysM21dAyUJAae+4Y8wWAYJ
 5k74SlpRSuwZzEB9DBXHcUnJ5NDU7+87JhvZAtgWY1FWm2Wl7fJbHcYsTKfubTEE3/3p
 b1GQ==
X-Gm-Message-State: AAQBX9fhoIUQszgABhmAw2jj5BqZKX/qAUI/i/Ds/wwwPbnURez03LNQ
 VsF9rS+xg3ynBdOjbC64VryWwQsSFBUcLg==
X-Google-Smtp-Source: AKy350aJYfGRR1magwcoMEWUoSXKZfDtXXXhRJ45n1wqY8rJy6OMN62xB951fJkXlhtRSHVndthwAw==
X-Received: by 2002:a05:6a00:c85:b0:625:efa4:4c01 with SMTP id
 a5-20020a056a000c8500b00625efa44c01mr26500602pfv.3.1682442903160; 
 Tue, 25 Apr 2023 10:15:03 -0700 (PDT)
Received: from fedora.hsd1.wa.comcast.net ([2601:603:2180:ebe0::51c9])
 by smtp.gmail.com with ESMTPSA id
 h11-20020a056a00218b00b0063b8ada8777sm9582454pfi.112.2023.04.25.10.15.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 10:15:02 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 25 Apr 2023 10:14:45 -0700
Message-Id: <20230425171454.48802-5-aduskett@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230425171454.48802-1-aduskett@gmail.com>
References: <20230425171454.48802-1-aduskett@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682442903; x=1685034903;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gSQzr3X8N9/KFqHqNn/Tms//MgX92Y0z+zWYj+4M66Q=;
 b=lpApZVlUEY09GM2TrlVrm2WithK4duJX4fz2y1DcVUUNiBStzovAwSreKdY0auzTP2
 ZTr0wxqCWXU8MEdQXh3LovZDBtYUuoBIBijOigLUvktovRObnSF/rCNhBBAVO+Dz8c2l
 4ex58lpsOxLNgU/CoFyL3KOW78v5vZ906JSK3dYoXvDKRkNPyiwErdVt1ZrZNcghM157
 bkkjT6A0kQP4QSrUZFFEwOyWXcKtzNVfB63jp18XnUopgxH4tD2iwJIQwPdm+TRDTMeK
 e8lffOZd4Xym5SW+RXh/exmA2nV0ySnFLIHbZPn0Aqu9he4XdsDoL8CuAHsjPx/HuSqQ
 ivAw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=lpApZVlU
Subject: [Buildroot] [PATCH v2 04/13] package/libsemanage: bump to version
 3.5
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Antoine Tenart <atenart@kernel.org>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Change the license file to LICENSE. The hash remains the same.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/libsemanage/libsemanage.hash | 4 ++--
 package/libsemanage/libsemanage.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libsemanage/libsemanage.hash b/package/libsemanage/libsemanage.hash
index 1f333aac30..73df34bde9 100644
--- a/package/libsemanage/libsemanage.hash
+++ b/package/libsemanage/libsemanage.hash
@@ -1,5 +1,5 @@
 # From: https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  84d0ec5afa34bbbb471f602d8c1bf317d12443d07852a34b60741d428d597ce8  libsemanage-3.3.tar.gz
+sha256  f53534e50247538280ed0d76c6ce81d8fb3939bd64cadb89da10dba42e40dd9c  libsemanage-3.5.tar.gz
 
 # Hash for license file
-sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
+sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  LICENSE
diff --git a/package/libsemanage/libsemanage.mk b/package/libsemanage/libsemanage.mk
index db9f16bb6a..0fbdc5ae8d 100644
--- a/package/libsemanage/libsemanage.mk
+++ b/package/libsemanage/libsemanage.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-LIBSEMANAGE_VERSION = 3.3
+LIBSEMANAGE_VERSION = 3.5
 LIBSEMANAGE_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(LIBSEMANAGE_VERSION)
 LIBSEMANAGE_LICENSE = LGPL-2.1+
-LIBSEMANAGE_LICENSE_FILES = COPYING
+LIBSEMANAGE_LICENSE_FILES = LICENSE
 LIBSEMANAGE_DEPENDENCIES = host-bison host-flex audit libselinux bzip2
 LIBSEMANAGE_CPE_ID_VENDOR = selinuxproject
 LIBSEMANAGE_INSTALL_STAGING = YES
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
