Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B0DAC4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 21:03:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9662E41931;
	Thu,  8 Dec 2022 21:03:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9662E41931
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7Nlo7PRXRPKj; Thu,  8 Dec 2022 21:03:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56ADC4161C;
	Thu,  8 Dec 2022 21:03:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56ADC4161C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0DCA61BF591
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 21:03:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D9C6660B31
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 21:03:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9C6660B31
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0dRLpubNp9qG for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 21:03:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DD7660746
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9DD7660746
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 21:03:49 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id co23so3196381wrb.4
 for <buildroot@buildroot.org>; Thu, 08 Dec 2022 13:03:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tDFAsZHrO9eomDRmop8zrdxe07ryRl8+lsVXg+e1Pg4=;
 b=Sh0LYv8vuaXKyDN3MFGKZLr1makkvfnUZfRPcE46gsTfTFUiNsixbaCUipRce9dX4/
 TY9bKN/E9sFU4ARargtx92ADQG+Cf97vYL3docxPIAR/0gtYnQeP2hPYhes/iV/QQBK+
 wqOQW2w2PMgdjlM0c7m926loWlzihAyRibgaVBqSTFXp5XXlrS+5eFXHWwZXbe0L7dgK
 aSRMRKCyCPW4dW07Z5aKKY0TOXzjjSbhV1/afteSagw83HoNN/D7lgd2XO/S2qBbsVpO
 wDvNtIq+Ax0sNVoQOxx89tXT+VMmVQMU1uR8PpeJF1zwb6v7uwbfJ5MxztmzMNY6CqeN
 xMwg==
X-Gm-Message-State: ANoB5pkBYCWcJaOA3u603mcmsAyaMlpc7NLH1R6pKKVu5MqjhsSHD+UZ
 JUfZimQHUdLppxbUCil7gzgyOBbet2o=
X-Google-Smtp-Source: AA0mqf5GO0DkC+W403ewa8Qxj1tTJ9zlXQDylJolHgyedzBxZSrVc6lzoQWgGO2w1R+laMQqUM+15A==
X-Received: by 2002:adf:a2c5:0:b0:242:849b:a31f with SMTP id
 t5-20020adfa2c5000000b00242849ba31fmr2016751wra.30.1670533427229; 
 Thu, 08 Dec 2022 13:03:47 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 ay5-20020a5d6f05000000b00242710c9910sm10249970wrb.8.2022.12.08.13.03.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 13:03:46 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 22:03:42 +0100
Message-Id: <20221208210342.23228-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tDFAsZHrO9eomDRmop8zrdxe07ryRl8+lsVXg+e1Pg4=;
 b=Gu725h0hQyUfSgZpvrY2XhlEPCh6Ij/NFVgQiq54CIi4itekvJF32z/XFPjHeu9TSE
 7QebX4sZE54S7hkF6ikvl7TeviEBswRnZEwzRJQZqj/KP21xCXOb2b4vL6Kd0nFPxzWi
 rLKfpFwkz7R3siaJzey+EXz26q87pyBTk8JvGCAZvOTaxxztwfoSS1YLdI1WX09z5DfM
 5VI0FyISMLMEKPgNRN1iQrjUUOF50GgUEZD5nKl+e2FcYBHIKQhcvtXdVVbdvJi4lnQ/
 c6S2flEXxOz2mq7k9CZ1MoWQUzVaDq6eYXfORnCx6EoTh9YG9t7QSKjl1f1qH0zfgUcJ
 yyiQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Gu725h0h
Subject: [Buildroot] [PATCH 1/1] package/hans: bump to version 1.1
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

https://github.com/friedrich/hans/blob/v1.1/CHANGES

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/hans/hans.hash | 6 +++---
 package/hans/hans.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/hans/hans.hash b/package/hans/hans.hash
index c555528efb..a1f591eb1c 100644
--- a/package/hans/hans.hash
+++ b/package/hans/hans.hash
@@ -1,6 +1,6 @@
 # From http://sourceforge.net/projects/hanstunnel/files/source/
-md5  8628393ec1b61a6c3a47a0a3dcb455b3  hans-1.0.tar.gz
-sha1  0bc857df109af222732cb95c861a0f0a6dd53dee  hans-1.0.tar.gz
+md5  d23fbaeb990ed7d05695fcc8f8ef7847  hans-1.1.tar.gz
+sha1  15dd4b717e8808d9279af970d4826aad826bc849  hans-1.1.tar.gz
 # Locally computed
-sha256  f8f70cf22ba14d9223695c9e9a2d75289d8360f61f533b83ee538836f29a458e  hans-1.0.tar.gz
+sha256  966962d8734ab6b4d871e035d08f45256025a5220216bd48e41fa7fd0ad136c5  hans-1.1.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
diff --git a/package/hans/hans.mk b/package/hans/hans.mk
index e26c2f37f8..6d2b1dabe5 100644
--- a/package/hans/hans.mk
+++ b/package/hans/hans.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HANS_VERSION = 1.0
+HANS_VERSION = 1.1
 HANS_SITE = http://downloads.sourceforge.net/project/hanstunnel/source
 HANS_LICENSE = GPL-3.0+
 HANS_LICENSE_FILES = LICENSE
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
