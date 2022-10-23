Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C25B3C3A59D
	for <buildroot@archiver.kernel.org>; Sun, 23 Oct 2022 21:49:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 74D0740180;
	Sun, 23 Oct 2022 21:49:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74D0740180
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RwpER9JqwzlM; Sun, 23 Oct 2022 21:49:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9280040134;
	Sun, 23 Oct 2022 21:49:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9280040134
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 862961BF33F
 for <buildroot@lists.busybox.net>; Sun, 23 Oct 2022 21:49:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6EF8F40134
 for <buildroot@lists.busybox.net>; Sun, 23 Oct 2022 21:49:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6EF8F40134
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8nGlTIVOWx19 for <buildroot@lists.busybox.net>;
 Sun, 23 Oct 2022 21:49:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C20C340017
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C20C340017
 for <buildroot@buildroot.org>; Sun, 23 Oct 2022 21:49:08 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id h9so2140269wrt.0
 for <buildroot@buildroot.org>; Sun, 23 Oct 2022 14:49:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2kVal6q+8+Wv/yYZ5S73wXFk6NG6z/7dYP3dR74DRjk=;
 b=7M/jqLif46sidIR/aA9UGqfn1V2QIohs7kj0oa+kq517cdQejLi2sDriMl/BDctobq
 ttcz1cHBppoHvsD4I4PrwJTFDaOAX1pbLPPeMCmC7pPN7n+WjxmHMnmvv39RplziNKdX
 LZYbHvtiEWtHbrqInQjYGmwOaNuEAH+45c7g+9/hBk88bTzwmLyYQiMwFicWmI5hC4eq
 U42/1mjT/L33scMipvBmAEOoaP5SbLN27Y4dXE95dBg7e5tlk/u/B3hDwkMUm/KQYS8V
 qkzCMuDveKnsZmJzZpF/N+A9smkxLOSeV1TUeWis/iNYZI24vNWFpoZWAcbwbQhh5zSM
 R7Pg==
X-Gm-Message-State: ACrzQf3RPKLMRYSfQaxmHEsR/dhyGgt0U3t5FQXKjtLRzlcRHHRnIjxP
 7Vlo94cok7Sf0xMpXOfNdLoocwAtaKA=
X-Google-Smtp-Source: AMsMyM7EVUOhO2RPr2dq3RxQD/jZcR6om+q3jbS9xzI9xV+g4U30aNniPZFxgFUfeLln9nTdpBrw8g==
X-Received: by 2002:a05:6000:16c9:b0:235:d203:7378 with SMTP id
 h9-20020a05600016c900b00235d2037378mr13287135wrf.353.1666561746665; 
 Sun, 23 Oct 2022 14:49:06 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 q12-20020a05600c46cc00b003c70191f267sm6454882wmo.39.2022.10.23.14.49.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Oct 2022 14:49:05 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 23 Oct 2022 23:49:02 +0200
Message-Id: <20221023214902.85185-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2kVal6q+8+Wv/yYZ5S73wXFk6NG6z/7dYP3dR74DRjk=;
 b=C//zXtHg58aUGncoAcfmtGnVJ5Ma5FPdn7EyJ5N8yNdC4dua4H8JDszOrefuWTXblq
 Vc9pjAcznr8sUhGyDhzwDyBUixEVicdkLuV8JuAgXGODEbBFaTpBE7Gt5fLXNAzMoUY6
 7pHSL0rLnY2znTdeByjn3xuj4iGIa2pUv3KYIo6eubQMdmCyI/ba+t4nNlFl8DqOLHXX
 PwS4NdnzXPCklgisuJl7y2xMAJJO1+KhbrhdDN7O7xpWj0JBBBjLJCFIa8qeD5mShDby
 9ranTV5JCsL1GhQtIgUzxBo5hK4OtBsGoZFmvFlD1XSG8teqCp7zpeDa5OV7uEkmIGE+
 Z+tw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=C//zXtHg
Subject: [Buildroot] [PATCH 1/1] package/file: bump to version 5.43
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

Update hash of src/vasprintf.c (typo fixed with
https://github.com/file/file/commit/42a6724bf9a9af6b1560100282fbe95341cf7125)

https://github.com/file/file/blob/FILE5_43/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/file/file.hash | 6 +++---
 package/file/file.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/file/file.hash b/package/file/file.hash
index 33875776eb..49fa9e1e1b 100644
--- a/package/file/file.hash
+++ b/package/file/file.hash
@@ -1,7 +1,7 @@
 # Locally calculated after verifying signature
-# ftp://ftp.astron.com/pub/file/file-5.41.tar.gz.asc
+# ftp://ftp.astron.com/pub/file/file-5.43.tar.gz.asc
 # using key BE04995BA8F90ED0C0C176C471112AB16CB33B3A
-sha256  13e532c7b364f7d57e23dfeea3147103150cb90593a57af86c10e4f6e411603f  file-5.41.tar.gz
+sha256  8c8015e91ae0e8d0321d94c78239892ef9dbc70c4ade0008c0e95894abfb1991  file-5.43.tar.gz
 sha256  0bfa856a9930bddadbef95d1be1cf4e163c0be618e76ea3275caaf255283e274  COPYING
 sha256  4ccb60d623884ef637af4a5bc16b2cb350163e2135e967655837336019a64462  src/mygetopt.h
-sha256  c4fa92d6504b88484a12140fe3e24b9b29b0112717f94b1ff4205d54828b1c70  src/vasprintf.c
+sha256  cc3d8704489d08eaefcaee8c639cc6436c6f0f6b2b03986d3ba7521a1a1d2fc9  src/vasprintf.c
diff --git a/package/file/file.mk b/package/file/file.mk
index c06975460f..9b751e2696 100644
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FILE_VERSION = 5.41
+FILE_VERSION = 5.43
 FILE_SITE = ftp://ftp.astron.com/pub/file
 FILE_LICENSE = BSD-2-Clause, BSD-4-Clause (one file), BSD-3-Clause (one file)
 FILE_LICENSE_FILES = COPYING src/mygetopt.h src/vasprintf.c
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
