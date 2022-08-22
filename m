Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED6D7C28D13
	for <buildroot@archiver.kernel.org>; Mon, 22 Aug 2022 18:27:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 77E3E40347;
	Mon, 22 Aug 2022 18:27:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77E3E40347
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wOjIxpSexts9; Mon, 22 Aug 2022 18:27:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CDFB4405DD;
	Mon, 22 Aug 2022 18:27:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CDFB4405DD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7D7241BF3E8
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 18:27:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 659E980B6B
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 18:27:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 659E980B6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id icopzwQm0w0U for <buildroot@lists.busybox.net>;
 Mon, 22 Aug 2022 18:27:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 015EA80B1D
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 015EA80B1D
 for <buildroot@busybox.net>; Mon, 22 Aug 2022 18:27:42 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 v7-20020a1cac07000000b003a6062a4f81so8275352wme.1
 for <buildroot@busybox.net>; Mon, 22 Aug 2022 11:27:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=z9KA/2HLY+iSFSnOCh4Kd+5HWFLuJEGySM8UkeoDDrU=;
 b=jqsNKFd265/IcqwQrVpZowN3nApS+C8WqHBZdRWEeB3BJc8wZ5ybVlf5gkFge/PuWR
 35EL3cVhUb8VH3CRtrPJ9LWvpaLGom2UOyhg6xz49gang2GrvtQz95E/Rf6oOwjgjd/A
 I3FTJMtAReT6GlVhTlg/Ei1a2s6lNFBZIKkHRMr6DYq1G3MfLsAFRvyBF0oce/f2skvr
 UMUNuuuLSju83irULJzguZnb5bzGIEJC2QTN+gkI3vfH9i6TYDg1jz4CLoPETrhSYivh
 ifjv5toUx9ogDDpb9MbgA58yoEt3Ax1AF/qVaEDIEKF+cCXtqrJOb0iHtIddit8hkS9x
 7y2w==
X-Gm-Message-State: ACgBeo0Sj7YssSxDnP4UOmKYYsvbzsQmPCojqW8DGg+zeYjdItNJ2V71
 CJ6jpuzkpngatxrYqbs2H9ZpeGdwqSM=
X-Google-Smtp-Source: AA6agR66Mi6kLaZXWQ9KU+7uEMNakdCqcT7edfDOFnoeugKYw68RUFSCZoonbzFGsio9p49rQ7xr7g==
X-Received: by 2002:a05:600c:4e52:b0:3a6:d89:4d1b with SMTP id
 e18-20020a05600c4e5200b003a60d894d1bmr13426373wmq.150.1661192861236; 
 Mon, 22 Aug 2022 11:27:41 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 c16-20020adfef50000000b002205f0890eesm12228269wrp.77.2022.08.22.11.27.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 11:27:13 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 22 Aug 2022 20:27:08 +0200
Message-Id: <20220822182708.1691371-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=z9KA/2HLY+iSFSnOCh4Kd+5HWFLuJEGySM8UkeoDDrU=;
 b=YVR0nDUtCh2StvfXzn8f77UqjgMdGo7B5Gchhd5HsFSXZRP42ZOP86phR5OCBPH6MD
 gI4OD/J0IpB/TK+Gqnb4BG8raiM73zo49C5yBLZuOOXsBLkZP/wFh5APc+4Exf0z5y+a
 eMuCf3ikbo+MAr0M4DZXskZIbsh+6BU/A8etGcvDz5TxsV6xvkZvmrEocMIyZOB2n04z
 YJ2nTtegmqjQF7UeLr3gMadIKdIxW+2Vj8EXm/yJ8zqWh6JqDh+mfmEvOgQfyq1nifdf
 2g1AFXjIUppE5Ax5ojTre4+F/exVKPh1JGD/4AHmfXjogWzpKvNsL+2qpL2wTkSU02dK
 vq7g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=YVR0nDUt
Subject: [Buildroot] [PATCH] package/spi-tools: bump to version 1.0.2
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
 package/spi-tools/spi-tools.hash | 2 +-
 package/spi-tools/spi-tools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/spi-tools/spi-tools.hash b/package/spi-tools/spi-tools.hash
index 1595cd3d2..7a840b915 100644
--- a/package/spi-tools/spi-tools.hash
+++ b/package/spi-tools/spi-tools.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256  81bb9f7218123f86c3644d92ad2c427343758df2143ee5da38e6f743f18714fd  spi-tools-1.0.1.tar.gz
+sha256  f6a93ae4f729d42e9200ba491cf9088202b63cb88e011cf6bcb0a7d12432cdc4  spi-tools-1.0.2.tar.gz
 sha256  a01259a1b522cf0de95824f9860613b453153eebac468e96196d5d7dba84786c  LICENSE
diff --git a/package/spi-tools/spi-tools.mk b/package/spi-tools/spi-tools.mk
index d623babf4..c3732fcb8 100644
--- a/package/spi-tools/spi-tools.mk
+++ b/package/spi-tools/spi-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SPI_TOOLS_VERSION = 1.0.1
+SPI_TOOLS_VERSION = 1.0.2
 SPI_TOOLS_SITE = $(call github,cpb-,spi-tools,$(SPI_TOOLS_VERSION))
 # autoreconf must be run as specified in package documentation
 SPI_TOOLS_AUTORECONF = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
