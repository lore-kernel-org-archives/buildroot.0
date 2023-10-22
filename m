Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E250CDB474
	for <buildroot@archiver.kernel.org>; Sun, 22 Oct 2023 20:31:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1FDE401E1;
	Sun, 22 Oct 2023 20:31:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1FDE401E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0k_5Ws91UxWH; Sun, 22 Oct 2023 20:31:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D2AF840364;
	Sun, 22 Oct 2023 20:31:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2AF840364
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7AD9E1BF40F
 for <buildroot@lists.busybox.net>; Sun, 22 Oct 2023 20:31:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 60947818CA
 for <buildroot@lists.busybox.net>; Sun, 22 Oct 2023 20:31:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60947818CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E4r1kxrMVK21 for <buildroot@lists.busybox.net>;
 Sun, 22 Oct 2023 20:31:32 +0000 (UTC)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5105A818C9
 for <buildroot@buildroot.org>; Sun, 22 Oct 2023 20:31:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5105A818C9
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-408382da7f0so21980715e9.0
 for <buildroot@buildroot.org>; Sun, 22 Oct 2023 13:31:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698006690; x=1698611490;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=juKdEIXPJKpPBXL+lonzVq/vlebuDzp0YlDVJds/5KY=;
 b=PsGKF76iScNyAXyXn274lUumd25tOsArAz09x2I8ljKzRjTbGeznGLrelN75Tj97nM
 6jKK6eYfWcbTroLGDLa+kmspj8z/Qfga8KOQCVZQ9lb8rQ6v6lA9Y6anDsYx3vU8+8ji
 NCUL7yozKGv3V2MnEK37WJZvPnWiRo77y8D3XB8Aq//UPk6f9rhJk9dfof55/D/QafCG
 UreTtMxyjhCqIIn0Bcr6TTOXW8rkF1E6AM6po5dOcXneuq/VZYTv7KpnXqmUiGj+PTpI
 xGW6GmTG9V3k74j71LAUvg2nqQmd6MO+hBcewKB+fRENMBWMiP6hV8jTz639OCQOar47
 X3/A==
X-Gm-Message-State: AOJu0YxdHkZpURS4D7zU19LshK82c8xbmPoW1vhUtHs/CN8BSDwUmn75
 h2JFnZY7d1n8lNq8V4z1uSXxkCRIpVQ=
X-Google-Smtp-Source: AGHT+IGeBqP2kSBhqXQEDYXOuRPEN2SwoiSrvT0QGi7BzkWQel3Gl4u9Orn0niaR+/0/OKoNB41Rug==
X-Received: by 2002:a05:600c:1c1c:b0:402:f501:447c with SMTP id
 j28-20020a05600c1c1c00b00402f501447cmr5646712wms.0.1698006689721; 
 Sun, 22 Oct 2023 13:31:29 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 m16-20020a7bca50000000b00405d9a950a2sm12313436wml.28.2023.10.22.13.31.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Oct 2023 13:31:29 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 22 Oct 2023 22:31:23 +0200
Message-ID: <20231022203123.54493-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698006690; x=1698611490; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=juKdEIXPJKpPBXL+lonzVq/vlebuDzp0YlDVJds/5KY=;
 b=FMbkUzPFZzsPGd0/nJdv/FQf6whZ+0xSGD2fXFyTw48SgTdmHOYVUONBe8rYlq5Tsy
 +VQFmJOiUxg8IkSvIJ+jQG7LTi98aBojy+ZTnrvOdpk7nkibACPZqrkWXExrHlJJxG2o
 EJ3Re9u6IMOO6CIBjiJLTIcQefNToh0ayb7JryV+ZzU2H7iwX06ykJzGCwnH6rIlx1Rd
 cYPJzpw2iLrijiTcR+Zh5k9Xera5kYt9MSBkQ4Y4qMVvY+PcSM2sCD8tX21G2ffb6hRd
 l3xesX61tXqGO6RQSYbOtLTjLzfGZcRbIrRnehaCJFcpcVgqoHiL1u67TBFq99TLsVIP
 sOHw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=FMbkUzPF
Subject: [Buildroot] [PATCH 1/1] package/lxc: bump to version 5.0.3
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://discuss.linuxcontainers.org/t/lxc-5-0-3-lts-has-been-released/17708

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lxc/lxc.hash | 2 +-
 package/lxc/lxc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lxc/lxc.hash b/package/lxc/lxc.hash
index 2dd983a361..8b3365ddfc 100644
--- a/package/lxc/lxc.hash
+++ b/package/lxc/lxc.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  bea08d2e49efcee34fa58acd2bc95c0adc64d291c07f4cfaf4ac1d8ac5a36f45  lxc-5.0.2.tar.gz
+sha256  2693a4c654dcfdafb3aa95c262051d8122afa1b6f5cef1920221ebbdee934d07  lxc-5.0.3.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
index 4a4d3a6212..b2afb978e6 100644
--- a/package/lxc/lxc.mk
+++ b/package/lxc/lxc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LXC_VERSION = 5.0.2
+LXC_VERSION = 5.0.3
 LXC_SITE = https://linuxcontainers.org/downloads/lxc
 LXC_LICENSE = GPL-2.0 (some tools), LGPL-2.1+
 LXC_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
