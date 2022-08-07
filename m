Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA88C19F2A
	for <buildroot@archiver.kernel.org>; Sun,  7 Aug 2022 21:47:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FAF160BF0;
	Sun,  7 Aug 2022 21:47:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FAF160BF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jopdy43wSroE; Sun,  7 Aug 2022 21:47:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 685B960BDE;
	Sun,  7 Aug 2022 21:47:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 685B960BDE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7F9451BF368
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 21:47:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5AC6B60BDE
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 21:47:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5AC6B60BDE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jc63TJCtendT for <buildroot@lists.busybox.net>;
 Sun,  7 Aug 2022 21:47:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B5CF60B03
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4B5CF60B03
 for <buildroot@buildroot.org>; Sun,  7 Aug 2022 21:47:09 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id j1so8978154wrw.1
 for <buildroot@buildroot.org>; Sun, 07 Aug 2022 14:47:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=zo8aYS6IGj4iHUOYg+4hOtEWwizC0/i/2IDHknI9Ndo=;
 b=KL1tu1lXbexrMXQoPQ17Y1BHO7uKvYmOgyJ1BHp5OmWIVUBdXF0pfDr/YDBVFUKTju
 wX9Nmbggb/M2kivAtZfby+2JpeMMK5YmbTHjL0puWaig25u/TsuvnXSyEDou6ZtHMAAD
 TvtR5aCedg/qT0U4RyroTXvGzQaXRk0R/11kaffIzZoMZlyctm9J4zhSaz6sZsRX2Ng5
 IEzmzmQfj1RcyDNpT+5hZEDyKUXDFvHMvDike+E1eLSSAee4UTupX55UVxE9UpH6cAVK
 aHzFKyrYbxIZsLM8dUDfdCCRD2tcOZnEcYNoGowav3k6TeZvUD2XOHLA0XZQ5nb9yTh+
 xblg==
X-Gm-Message-State: ACgBeo3x2a9THaB6fJQ8De/vekkNATZ6YV5myBPkarKxLBi2Yz3wTP/k
 tSlUjfdr9OldRqd7irrzZlpduSjekoI=
X-Google-Smtp-Source: AA6agR5wjrfpH8tFYuPOZZbaVyQ2NO3YjPYPvF5L083nOeJQuUIGA+oquZpJz99qKrKu+MbhI1hudg==
X-Received: by 2002:a5d:6d49:0:b0:21b:a3ba:30b5 with SMTP id
 k9-20020a5d6d49000000b0021ba3ba30b5mr10129379wri.513.1659908827297; 
 Sun, 07 Aug 2022 14:47:07 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 z7-20020a05600c0a0700b003a4bb3f9bc6sm19529037wmp.41.2022.08.07.14.47.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Aug 2022 14:47:07 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Aug 2022 23:46:58 +0200
Message-Id: <20220807214658.191628-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220807214658.191628-1-fontaine.fabrice@gmail.com>
References: <20220807214658.191628-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=zo8aYS6IGj4iHUOYg+4hOtEWwizC0/i/2IDHknI9Ndo=;
 b=jq7Efot7FzsuF2yjJMyXhpRfNCMAORODWAB1PrUD9maMdzaCA392YMxVtXdRpoawji
 GOThAl8POfhwGdWAKOwAhTdZ8HVhJ+wJIQT26mNeS/MMIy8e+YMUK8EgPRJveh6Yyhpt
 Be9HmdeRgE9fdiFOMIsetU7qaAAIvvjkfZNb8e4ouRuEv4x589arqtHf7FMFdK+zDp7C
 9F/+vpHq1TIGHMk2xJY9nijabdWIwMLG+ctDXFLH9Jn2w48VmF7Npww7CWQ1wQKN5nHK
 N0hzU/M2Ur+TSMIX11Nd52FnrXv85Oxxx7czJ7g0BnzTxl724apHeKktSfxTi8de7qfr
 hjsw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=jq7Efot7
Subject: [Buildroot] [PATCH v2,2/2] package/ocrad: bump to version 0.28
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
Cc: Gilles Talis <gilles.talis@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Add libpng mandatory dependency

https://lists.gnu.org/archive/html/bug-ocrad/2022-01/msg00000.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ocrad/Config.in  | 1 +
 package/ocrad/ocrad.hash | 2 +-
 package/ocrad/ocrad.mk   | 3 ++-
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/ocrad/Config.in b/package/ocrad/Config.in
index 38d37c612a..b6c4300f86 100644
--- a/package/ocrad/Config.in
+++ b/package/ocrad/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_OCRAD
 	bool "ocrad"
 	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_LIBPNG
 	help
 	  GNU Ocrad is an OCR (Optical Character Recognition) program
 	  based on a feature extraction method.
diff --git a/package/ocrad/ocrad.hash b/package/ocrad/ocrad.hash
index b8db1723a3..cd5b0039ea 100644
--- a/package/ocrad/ocrad.hash
+++ b/package/ocrad/ocrad.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  a9bfe67e9a040907aff5640dca56392476b6a89e48e37dc94ba846c5b6733b36  ocrad-0.27.tar.lz
+sha256  34ccea576dbdadaa5979e6202344c3ff68737d829ca7b66f71c8497d36bbbf2e  ocrad-0.28.tar.lz
 sha256  3d77c1a58fbde5ddba612d1fe09965e20a3804953eca12e8c1892298bb8a5eef  COPYING
diff --git a/package/ocrad/ocrad.mk b/package/ocrad/ocrad.mk
index 914d53a59c..78638b770a 100644
--- a/package/ocrad/ocrad.mk
+++ b/package/ocrad/ocrad.mk
@@ -4,12 +4,13 @@
 #
 ################################################################################
 
-OCRAD_VERSION = 0.27
+OCRAD_VERSION = 0.28
 OCRAD_SOURCE = ocrad-$(OCRAD_VERSION).tar.lz
 OCRAD_SITE = $(BR2_GNU_MIRROR)/ocrad
 OCRAD_LICENSE = GPL-2.0+
 OCRAD_LICENSE_FILES = COPYING
 OCRAD_INSTALL_STAGING = YES
+OCRAD_DEPENDENCIES = libpng
 
 # This is not a true autotools package.
 define OCRAD_CONFIGURE_CMDS
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
