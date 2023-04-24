Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE357C7618E
	for <buildroot@archiver.kernel.org>; Mon, 24 Apr 2023 20:26:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E3CB414C2;
	Mon, 24 Apr 2023 20:26:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E3CB414C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gOf6V6IKnosU; Mon, 24 Apr 2023 20:26:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6F6641731;
	Mon, 24 Apr 2023 20:26:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6F6641731
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B86361BF476
 for <buildroot@lists.busybox.net>; Mon, 24 Apr 2023 20:25:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9195041755
 for <buildroot@lists.busybox.net>; Mon, 24 Apr 2023 20:25:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9195041755
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id soVmjh5YtJyW for <buildroot@lists.busybox.net>;
 Mon, 24 Apr 2023 20:25:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC7F94116B
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CC7F94116B
 for <buildroot@buildroot.org>; Mon, 24 Apr 2023 20:25:24 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-63b70ca0a84so6273704b3a.2
 for <buildroot@buildroot.org>; Mon, 24 Apr 2023 13:25:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682367924; x=1684959924;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ygdo2dAeyS4S4LWAWIqdu3sdjF1uZ9hKh8jdn9FU3vU=;
 b=NCJXVnmN+5lL9MrLLzeUvhSjTVrNeSuta8TdYbaYkG4HLUWXmP2fU7xsFZ3FgL6/eJ
 yJpCHYTMALRQaL1wvdM6m+xUxjkESpRFKEKHrKLQ0WtQ3xsTfMMGOzqUZNuXIlwzuYuQ
 gpL17+L3ZMFUpck7SDKXtmSm5NUaPKckZheRqHKXCnmYgS11w5V+0AWATOU4E3/9cjaW
 +g1XYmb24/i/Y/VwRIueNQ3CRaBNzshD+3F2DxqDjEc0SRO5EavNPrwGvF1kQhBM3Onf
 Uyhp6PjHgXdROCv7XFF1OsgkLSeAiQ8BysMLTK1jksmcRASD7xnKhcUNrmIoyXZOozJ2
 h2MA==
X-Gm-Message-State: AAQBX9fc7ZK9qfGO0Aix05Xxk97PfK4yQ30ZqXCrlW6661jiU/bvM0Yy
 STA8Jn2MDAgxChWvyT5Ero2Im+ZS/bY2Ww==
X-Google-Smtp-Source: AKy350aH7iezvysaQ3FCrsGiAz4F25nTTgqzSKhHEK/TllKDNHiepLLmZRqhuD1GVV6kv7lIR3MSxQ==
X-Received: by 2002:a05:6a20:12d5:b0:ef:2180:2e8d with SMTP id
 v21-20020a056a2012d500b000ef21802e8dmr20549057pzg.32.1682367923759; 
 Mon, 24 Apr 2023 13:25:23 -0700 (PDT)
Received: from fedora.hsd1.wa.comcast.net ([2601:603:2180:ebe0::e18])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a656806000000b0051b71e8f633sm6819592pgt.92.2023.04.24.13.25.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 13:25:23 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 24 Apr 2023 13:25:07 -0700
Message-Id: <20230424202514.1546092-7-aduskett@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230424202514.1546092-1-aduskett@gmail.com>
References: <20230424202514.1546092-1-aduskett@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682367924; x=1684959924;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ygdo2dAeyS4S4LWAWIqdu3sdjF1uZ9hKh8jdn9FU3vU=;
 b=oMSRlNW4mr0dZYGNG/wm8h/vtyVZKiikBoR4xE8G15Rymq6iOeNPkHVHaKPVv4vY7r
 GRKPjgUqMISKZ5j3mTJ2aHd/IOjpxnITsHEkjQeyMQsJo6L5TmYP7Q6R2fjArSWdiyxe
 64D9IU9Y5FpVV+zFZvEvdZ7ZLvXnSRKfkZhJtYavtTbj5W5bbRQ3xLaj3svWmi9t0Lis
 8ESWFUhdFXlpTyqKgDQVKBRbGlIiwHNCcWjLa9STE6pPfWeSV5qcOgc6TiCNtTFt1jH4
 UtMyXXk79ksmsAsgu2ZPautJE10jq3x9D19dJB9i71a10PERcR91/UZoEWkS7Fz5r+bT
 adlg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=oMSRlNW4
Subject: [Buildroot] [PATCH 06/13] package/policycoreutils: bump to version
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
 ...1-Add-DESTDIR-to-all-paths-that-use-an-absolute-path.patch | 2 +-
 package/policycoreutils/policycoreutils.hash                  | 4 ++--
 package/policycoreutils/policycoreutils.mk                    | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/policycoreutils/0001-Add-DESTDIR-to-all-paths-that-use-an-absolute-path.patch b/package/policycoreutils/0001-Add-DESTDIR-to-all-paths-that-use-an-absolute-path.patch
index aa75ca63c0..18f0001aef 100644
--- a/package/policycoreutils/0001-Add-DESTDIR-to-all-paths-that-use-an-absolute-path.patch
+++ b/package/policycoreutils/0001-Add-DESTDIR-to-all-paths-that-use-an-absolute-path.patch
@@ -32,7 +32,7 @@ index a3bbbe1..df675cf 100644
 +AUDITH ?= $(shell test -f $(DESTDIR)$(PREFIX)/include/libaudit.h && echo y)
  
  CFLAGS ?= -g -Werror -Wall -W
- override LDLIBS += -lselinux -lsepol
+ override LDLIBS += -lselinux -lsepol -lpthread
 -- 
 2.13.6
 
diff --git a/package/policycoreutils/policycoreutils.hash b/package/policycoreutils/policycoreutils.hash
index e7f006b023..e29d192b13 100644
--- a/package/policycoreutils/policycoreutils.hash
+++ b/package/policycoreutils/policycoreutils.hash
@@ -1,3 +1,3 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  d1331c6fa766c547b071c491de90b9f343c8dbffdb119be8a5a7e491199b93a9  policycoreutils-3.2.tar.gz
-sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
+sha256  78453e1529fbbf800e88860094d555e781ce1fba11a7ef77b5aabb43e1173276  policycoreutils-3.5.tar.gz
+sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  LICENSE
diff --git a/package/policycoreutils/policycoreutils.mk b/package/policycoreutils/policycoreutils.mk
index 8505dbca3f..61d91066d4 100644
--- a/package/policycoreutils/policycoreutils.mk
+++ b/package/policycoreutils/policycoreutils.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-POLICYCOREUTILS_VERSION = 3.2
+POLICYCOREUTILS_VERSION = 3.5
 POLICYCOREUTILS_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(POLICYCOREUTILS_VERSION)
 POLICYCOREUTILS_LICENSE = GPL-2.0
-POLICYCOREUTILS_LICENSE_FILES = COPYING
+POLICYCOREUTILS_LICENSE_FILES = LICENSE
 POLICYCOREUTILS_CPE_ID_VENDOR = selinuxproject
 
 POLICYCOREUTILS_DEPENDENCIES = libsemanage libcap-ng $(TARGET_NLS_DEPENDENCIES)
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
