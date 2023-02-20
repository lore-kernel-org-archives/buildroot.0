Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26197C636CC
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 14:27:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4FA460EA1;
	Mon, 20 Feb 2023 14:27:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4FA460EA1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rhmu2s04qNr3; Mon, 20 Feb 2023 14:27:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CD5960BF2;
	Mon, 20 Feb 2023 14:27:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CD5960BF2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 152B31BF2B4
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 14:27:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F01A2416C8
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 14:27:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F01A2416C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SReAYawVjhrl for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 14:27:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A954416D1
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7A954416D1
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 14:27:53 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id c12so1418677wrw.1
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 06:27:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Oigb9QpCgJo4Dk+Y7YpTg6wrShCIk1c4dIHsp6Twq4w=;
 b=jMO/fXzafy1miRgT49DLbhgHL1GRUEnYbnQba3Ui6VpSH2Ns33CjrNKoeg8mfjQehC
 zm40YxWB5q/ch7eGoye/oZJ+EiimdknY1Av+J+aRoT3SMBK8IUlD4yzevWbE2abqq2GV
 wlYJGlbxMhozKorS7XH0qwVhnD/39pu058tNlN7Tj7KiC7ZvAMsqnYCoLE+6IsHC9zrg
 +Pvi5TCDG2NnvndvQdZ27O1VkcmetPzj5rGChrex7dKASwWWaT2HA3BXHZ1ZpXk6lBA3
 TWjWo2VGjXHz+w4r5maUU/HL8YXJqQn5Q1qQlJneXwCXmYST/JJxcPSQExPszYo3eD6f
 gn0A==
X-Gm-Message-State: AO0yUKXeLQW2V1qgW9LlYlB5ES/Kc8/tYc8QA0jSPqkhonVYYVz3Yy5H
 N5S2gTjfiy+LD+XJRMZ2Fo9C1P3WE0Y=
X-Google-Smtp-Source: AK7set8jPaRRgP4tcSYm7+o3EJ3/ZnreByl7ZOsVNoTCLyad3Vyf4ga9Gv7Rr0WbSHHc7tDIG+MeAg==
X-Received: by 2002:adf:df0b:0:b0:2c5:510b:8f9c with SMTP id
 y11-20020adfdf0b000000b002c5510b8f9cmr1305927wrl.52.1676903271120; 
 Mon, 20 Feb 2023 06:27:51 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 g16-20020a5d4890000000b002c56a991971sm5110555wrq.76.2023.02.20.06.27.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 06:27:50 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 20 Feb 2023 15:27:46 +0100
Message-Id: <20230220142746.1935069-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Oigb9QpCgJo4Dk+Y7YpTg6wrShCIk1c4dIHsp6Twq4w=;
 b=pdUh36xmg0BngvMI1GbpLHMz4VfB0gEqo9M56smg9/cONu+yOzdJg8VVZNTpoI1jIz
 X6TyQ2fJJ5dtKhEq1rC+b+HK475+lZxPOaqXXA1j8WCDe30b81+nlSQJbvp07on6hLmg
 kOc2hmGQ+PE/Zr/26wQxDobW3ic+U7i+W1XemDkzqsEffh3CHJPynjYu6GcZPHpdAwLA
 OTiKKb8Jqp3TjLl5cgo2wMiahqqiNQw2GUwUz7tr8ZZdRJ55Fhk9PVGk3xLVTZbBk61a
 uY/TnzCKYfIUkOUJNwC1j1fR11O/dpIcnb93UWmijVsKb2Zsdt46SInXsvtCN540s2Ws
 WUoA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=pdUh36xm
Subject: [Buildroot] [PATCH v2,1/1] package/libarchive: fix host build
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following host build failure raised since commit
9525bc7e64e8f44c31ab9dfd3f516ecb35982429:

configure.ac:140: error: possibly undefined macro: AC_MSG_FAILURE
      If this token and others are legitimate, please use m4_pattern_allow.
      See the Autoconf documentation.
configure.ac:328: error: possibly undefined macro: AC_CHECK_LIB

Fixes:
 - http://autobuild.buildroot.org/results/11868e9bc4916843a7fc76f7b5e4c251f89e33dc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Drop per-package from commit message

 package/libarchive/libarchive.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index cd7c13fbed..2010b6529f 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -140,6 +140,8 @@ endif
 
 # The only user of host-libarchive needs zlib support
 HOST_LIBARCHIVE_DEPENDENCIES = host-zlib
+# needed for autoreconf
+HOST_LIBARCHIVE_DEPENDENCIES += host-pkgconf
 HOST_LIBARCHIVE_CONF_OPTS = \
 	--disable-bsdtar \
 	--disable-bsdcpio \
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
