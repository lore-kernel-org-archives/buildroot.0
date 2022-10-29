Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F64C38A02
	for <buildroot@archiver.kernel.org>; Sat, 29 Oct 2022 19:56:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64A0060B0B;
	Sat, 29 Oct 2022 19:56:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64A0060B0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VmeU831mrG2X; Sat, 29 Oct 2022 19:56:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8ED73605E3;
	Sat, 29 Oct 2022 19:56:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8ED73605E3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 437261BF421
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 19:56:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1E123404B9
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 19:56:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E123404B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PsGj1grHBmo2 for <buildroot@lists.busybox.net>;
 Sat, 29 Oct 2022 19:56:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCF4D403C1
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DCF4D403C1
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 19:56:51 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id o4so10738896wrq.6
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 12:56:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A7A7t6gvhEnjWzmpKZkdTIWdztYnOZZDCPUkXhtfT2w=;
 b=A5es6fI6cYqnJUfn2rKBfC3z2HthdsixWkpAWWomAHei7Quw6ooTq+6fdzL37EXEWF
 b9nOkXdvURhQF5/NiKggFATXCoODJQb3NZ6U5qCqyVezN9hk5qxv8AHwcDwL/uaoxO4a
 PzK4B+CgKSmzsHNGuB29y4gmg4zdoc93Bp7t3EKZTHaSQiMvnu9r7DIOvLT7+Wm6u3r2
 Y9T11h203sn+rCmMDA382dtH+50hEZtOpo/sceLWdWz7IxSAQuK582ZQ00jOUBWvd8k9
 379F62hxGXGg4H2Ehn9qox5IixrB1KGa0od3O1/lmFJpBNF7pPedslfPYD5qnp2eCrCT
 Fajg==
X-Gm-Message-State: ACrzQf2oyZ1qwkqD9WveqQde+DIpX0hLkE8zCByK5pWBaFFftdtnlTp+
 UqYu4tJAKFqiEgBpSCVvsCntot+QG4A=
X-Google-Smtp-Source: AMsMyM7dRGfJ6BgNR1sQbty8bM/ZZhNj05TZwTWr64qBzi94xpiVOahx4xLGGHI0UISZEpOsPrs4kA==
X-Received: by 2002:a05:6000:2c1:b0:22e:7507:a182 with SMTP id
 o1-20020a05600002c100b0022e7507a182mr3080432wry.550.1667073409471; 
 Sat, 29 Oct 2022 12:56:49 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 b15-20020a5d45cf000000b002364c77bc96sm2309258wrs.33.2022.10.29.12.56.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Oct 2022 12:56:49 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 29 Oct 2022 21:56:47 +0200
Message-Id: <20221029195647.42758-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=A7A7t6gvhEnjWzmpKZkdTIWdztYnOZZDCPUkXhtfT2w=;
 b=Tt1IqgXPADtHiwCMmdjpsahiv48aXXDnlIkM85XSRJj4WkzM0YmKG7sestEQ/Kvhsv
 vrjv4ItPK64eGTL3n6z/q+Rm76BdQzrcXF4SB7eLq+KuGdVHhBvRxLxM+FaywYfJnQJj
 UsKwnT4O+KevCPL7o2BM2oLrh/spCNuYGdHW2QAXWp8JrD4N2vhSyUQ3z63Ezvrhd/F5
 3DBhfzwhK+65v/G5shlaJtxKh5zluDgyspNJkrfkcrgYR+uMVbAZ/d624Xbx09sItf02
 hO4T8XvHGcPV6cUUpXKs/sI8Zt2YAen+A2HPPLu+rKd0df0Vk8cIgjKEblSK31BGK+Dg
 Ef3w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Tt1IqgXP
Subject: [Buildroot] [PATCH 1/1] package/minizip-zlib: bump to version 1.2.13
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

Use license file available since
https://github.com/madler/zlib/commit/352cb28d12baf02863ff5d4d96be0587ced419a1

https://github.com/madler/zlib/blob/v1.2.13/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/minizip-zlib/minizip-zlib.hash | 4 ++--
 package/minizip-zlib/minizip-zlib.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/minizip-zlib/minizip-zlib.hash b/package/minizip-zlib/minizip-zlib.hash
index e6ca974e2f..df5e8d723a 100644
--- a/package/minizip-zlib/minizip-zlib.hash
+++ b/package/minizip-zlib/minizip-zlib.hash
@@ -1,4 +1,4 @@
 # From http://www.zlib.net/
-sha256  7db46b8d7726232a621befaab4a1c870f00a90805511c0e0090441dac57def18  zlib-1.2.12.tar.xz
+sha256  d14c38e313afc35a9a8760dadf26042f51ea0f5d154b0630a31da0540107fb98  zlib-1.2.13.tar.xz
 # License files, locally calculated
-sha256  fc2c3368901700f0acdeb1d8afeaca5923296768ec6824ecdf627aac396001fd  README
+sha256  845efc77857d485d91fb3e0b884aaa929368c717ae8186b66fe1ed2495753243  LICENSE
diff --git a/package/minizip-zlib/minizip-zlib.mk b/package/minizip-zlib/minizip-zlib.mk
index ec0c3da7d6..4367a2420f 100644
--- a/package/minizip-zlib/minizip-zlib.mk
+++ b/package/minizip-zlib/minizip-zlib.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-MINIZIP_ZLIB_VERSION = 1.2.12
+MINIZIP_ZLIB_VERSION = 1.2.13
 MINIZIP_ZLIB_SOURCE = zlib-$(MINIZIP_ZLIB_VERSION).tar.xz
 MINIZIP_ZLIB_SITE = http://www.zlib.net
 MINIZIP_ZLIB_LICENSE = Zlib
-MINIZIP_ZLIB_LICENSE_FILES = README
+MINIZIP_ZLIB_LICENSE_FILES = LICENSE
 MINIZIP_ZLIB_INSTALL_STAGING = YES
 MINIZIP_ZLIB_SUBDIR = contrib/minizip
 # configure is not shipped in contrib/minizip
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
