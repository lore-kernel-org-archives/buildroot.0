Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A82C001B0
	for <buildroot@archiver.kernel.org>; Mon, 14 Aug 2023 17:00:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2069813C4;
	Mon, 14 Aug 2023 17:00:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2069813C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YJ7iApC0EOS0; Mon, 14 Aug 2023 17:00:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BBFE813B9;
	Mon, 14 Aug 2023 17:00:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BBFE813B9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 869941BF35A
 for <buildroot@lists.busybox.net>; Mon, 14 Aug 2023 17:00:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5EE66813B9
 for <buildroot@lists.busybox.net>; Mon, 14 Aug 2023 17:00:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5EE66813B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LLZs6Mfe4Dmw for <buildroot@lists.busybox.net>;
 Mon, 14 Aug 2023 17:00:20 +0000 (UTC)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3AF58813B7
 for <buildroot@busybox.net>; Mon, 14 Aug 2023 17:00:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3AF58813B7
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3fe4ad22e36so42295255e9.2
 for <buildroot@busybox.net>; Mon, 14 Aug 2023 10:00:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692032418; x=1692637218;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ity7k4sO5v/T8/mfUBfkUsqQb6KVzOO5s7Obd8EIij4=;
 b=KjVvnFbBPpldeeWs+Xlbb34MoTo9wkQM9hFQHL1uhBxTeN8Zn/i2xq7owY6+eSCmr7
 ffLL+AwQi0M7L9pd+9rn+BMwcMnlep8q1gdJ5Yb2kpy2abgViz0WxNDMdJ1i/IcNyXvk
 AuRHxecS5gSUuXKPjCwlfMmtEwvQtaUg/xD3YHNent4wL6jCOMrTQDGjHzSKOy7s8Xlo
 oKvmmMN2Y/eUZmHlZyeHXslt1kttJ74MQxeIr32P2JnbE+lTqfG4LX+qArrbZqeW36kw
 55mwRUmhPlmhRCMDU7eW8L4v/kcvoamc+jw++ZGWYT9YEmAkAXmu+0JpF7wNNSRX/BDI
 EGnQ==
X-Gm-Message-State: AOJu0YwhxtQ+tU2QlWyZmSvYmAOhcoaFvjZjgqJTZALG6XCspzGaLwP/
 rD6h9jUt8vSq/NvyAMu4bG/PLRY774o=
X-Google-Smtp-Source: AGHT+IGJUAnKUAZC8aK/L5zAjuTyyEQ1+xJzEMk1fXOZTRg8PyjjajjmyYazIh708M/C5eMFLFPjXQ==
X-Received: by 2002:a7b:c38d:0:b0:3fe:179a:9eef with SMTP id
 s13-20020a7bc38d000000b003fe179a9eefmr7296996wmj.40.1692032418008; 
 Mon, 14 Aug 2023 10:00:18 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 n9-20020a1c7209000000b003fe577eb8cbsm17698520wmc.44.2023.08.14.10.00.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Aug 2023 10:00:17 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 14 Aug 2023 19:00:13 +0200
Message-Id: <20230814170013.458539-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692032418; x=1692637218;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ity7k4sO5v/T8/mfUBfkUsqQb6KVzOO5s7Obd8EIij4=;
 b=i565Jk5pFc1ASpvIWwMjtpAA1HbxPNZZ3j7wjFtYme8JaXnCyNjOEEFmPPNluibw4h
 6YwrxKZopfj8JQAfXbhioBDS9hry3qmfaC8TmImUf3n8bnZYUZenUuFl8PyiCIOqsPTW
 CD2z9qZcRwoEyCGBuGOYrPxffsnLPBs6kcRBaZEJl2xjRmuiPwJzo647Zk6CRP6nYMV8
 PbudEH2IlJx4WZIcDAgT2cqkQTquTdWRtgLJB2ljH/3uQZstnEa1aU0G0+bmaob5bix2
 uXvA772zLee7NrWNr+3bD5KGKo1jTCGBU/UqjG5QYtLL/gtaNvOvScXvEUPJDahPPe4U
 v5tA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=i565Jk5p
Subject: [Buildroot] [PATCH] package/chrony: bump to version 4.4
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
 package/chrony/chrony.hash | 4 ++--
 package/chrony/chrony.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/chrony/chrony.hash b/package/chrony/chrony.hash
index 9c0e11757..2cf6cca03 100644
--- a/package/chrony/chrony.hash
+++ b/package/chrony/chrony.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://download.tuxfamily.org/chrony/chrony-4.3-tar-gz-asc.txt
-sha256  9d0da889a865f089a5a21610ffb6713e3c9438ce303a63b49c2fb6eaff5b8804  chrony-4.3.tar.gz
+# https://download.tuxfamily.org/chrony/chrony-4.4-tar-gz-asc.txt
+sha256  eafb07e6daf92b142200f478856dfed6efc9ea2d146eeded5edcb09b93127088  chrony-4.4.tar.gz
 # Locally calculated
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
index 86f23d906..e7e6931a2 100644
--- a/package/chrony/chrony.mk
+++ b/package/chrony/chrony.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CHRONY_VERSION = 4.3
+CHRONY_VERSION = 4.4
 CHRONY_SITE = http://download.tuxfamily.org/chrony
 CHRONY_LICENSE = GPL-2.0
 CHRONY_LICENSE_FILES = COPYING
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
