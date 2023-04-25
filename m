Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41661C6FD18
	for <buildroot@archiver.kernel.org>; Tue, 25 Apr 2023 17:16:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D972F61477;
	Tue, 25 Apr 2023 17:16:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D972F61477
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G_etD7MYkyGE; Tue, 25 Apr 2023 17:16:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1616E6147F;
	Tue, 25 Apr 2023 17:16:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1616E6147F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 16DEF1BF82D
 for <buildroot@lists.busybox.net>; Tue, 25 Apr 2023 17:15:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E424261458
 for <buildroot@lists.busybox.net>; Tue, 25 Apr 2023 17:15:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E424261458
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W31SMoW7Sfeh for <buildroot@lists.busybox.net>;
 Tue, 25 Apr 2023 17:15:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 077B161473
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 077B161473
 for <buildroot@buildroot.org>; Tue, 25 Apr 2023 17:15:06 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-63b8b19901fso7515571b3a.3
 for <buildroot@buildroot.org>; Tue, 25 Apr 2023 10:15:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682442905; x=1685034905;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ygdo2dAeyS4S4LWAWIqdu3sdjF1uZ9hKh8jdn9FU3vU=;
 b=GsPcSGF8wQiaX5kOEZ0xLe0IRCIa/FRYSQ9DffaBrfUb99s9RHzyKgabtRrqHTZghr
 apx08pf/z1dp6zgTcEJrhRQBr2UUgnfiqvMinWNL5pVNAJN1Yo7RgJwe2GSDw0fnrCLo
 7TmLZHiu3XcPAUFjLMRTinL9KdeBNPFf2ejgdWF3j79bosX343U1GWtYx/bQ/4JLJVQu
 YgFHMe760+8TnIFtD199sIyLDV9jEmTGqvhQeFqdq/UEYnYqfRgjRMkh+rUb9n44ghil
 U2xP5SSS9iNuBJQy1pNrrSGwJfc0+vrLwz3o/ITnqJ7mpDzVdqn/Xw5RVZrtWC5JLLw3
 WP2A==
X-Gm-Message-State: AAQBX9e93KBxVgoKO1hILORpyqzP/hBsiUF75j/E0LqF9Pjk2BmHMx4p
 SDkJGbUyLXKrXVcFHWMCB7AUhuMl8MFn3w==
X-Google-Smtp-Source: AKy350ZYT5rMEg+buvCtblCR50PeHOkNF/cD/O28p49YnCfJm4uUE1BU1hXSarcGFK7ona2dlK2+Qg==
X-Received: by 2002:a05:6a00:22c3:b0:639:9089:798e with SMTP id
 f3-20020a056a0022c300b006399089798emr25348245pfj.19.1682442905226; 
 Tue, 25 Apr 2023 10:15:05 -0700 (PDT)
Received: from fedora.hsd1.wa.comcast.net ([2601:603:2180:ebe0::51c9])
 by smtp.gmail.com with ESMTPSA id
 h11-20020a056a00218b00b0063b8ada8777sm9582454pfi.112.2023.04.25.10.15.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 10:15:04 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 25 Apr 2023 10:14:47 -0700
Message-Id: <20230425171454.48802-7-aduskett@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230425171454.48802-1-aduskett@gmail.com>
References: <20230425171454.48802-1-aduskett@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682442905; x=1685034905;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ygdo2dAeyS4S4LWAWIqdu3sdjF1uZ9hKh8jdn9FU3vU=;
 b=XxwAmA+nb3cXVF8+zv8SUoYfTqztvGPQnW3vWmdPKwqXjtPGPBl5vWvgsjkiiqATnQ
 DFtfJF7zeDN28/2f+b+X3nVOtVF8SKMGxIrUu9Gfnl1nYX8JnaOXgBYf3Q0e2PT99J7X
 KYzejFPZ6pWfdi9S/JJvTJyF1xAzJhNv39/j83N3dU18H7Gv9zRtpTp7zPbRHupOd2LU
 nf5Ao0DeLgGmgrVAAHJNNfniQiMJbjsPJYb8n5VSAQ22LZw1eYH97Yt5fuUhGzmnqwP6
 GckCuWVeqEkGGgNuK/37OlhjMvThkIgFTsDCKlVrSZW2vioKBiEW9OMZyLj0pCAbEmr4
 ju+A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=XxwAmA+n
Subject: [Buildroot] [PATCH v2 06/13] package/policycoreutils: bump to
 version 3.5
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
