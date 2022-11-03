Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23414C433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 21:30:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C722481DEF;
	Thu,  3 Nov 2022 21:30:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C722481DEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RlkMo9ExmRpJ; Thu,  3 Nov 2022 21:30:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C9C781CE1;
	Thu,  3 Nov 2022 21:30:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C9C781CE1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F0A031BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 21:23:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D9FFA6105C
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 21:23:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9FFA6105C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ki0sSJRkNFup for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 21:23:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4A5761037
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E4A5761037
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 21:23:43 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id o13so1738911ilc.7
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 14:23:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6FETUgPnBRhR4qr5TZh+CpP2uOUPUJHcsj3ZV84UisE=;
 b=MQ+ZxzCwM/hWEK92/+Rutp3TFYf/q2aBPLiTd0Pa861kbfjJBeqgbS2xD7xaTr7BPi
 NjjuIWPaAhnPZOMAapd0MTjE0l8CjiN8h5WUZSPlF2ZjgcYQ3xZqOkMPiSf3wRz0D8Ni
 8dgQcidNNrWtl8QD7LvEBsLw4Ix1BZ3oGnk1YsI2Na7REwPXVapPlFF7h6XwrbXxZR0m
 z8EG/BoOvEO2pGA23M55mQnCKU+vq2Pv/KNGenbJ1CeTxLBBAgPMvQPx6etvkThZm0Jw
 xK34EXbtfDw/pKsa98kkgmMEtd5uqxw2Wdf+Wfdw5Z7yyb253XxZiABMimNeNiYkVcXa
 J56A==
X-Gm-Message-State: ACrzQf2pST1pfv6BaQ/DdDCkksffKx6CxNt73mgsid++eduMQ5tlbWmY
 IJD1D44k4gFq1o5VqC3KlVJb752ikm2+m2Jk
X-Google-Smtp-Source: AMsMyM7v5VCcsU800sZbzqN5+ih5G4kj6y0PR/wdR2W+idcZbnf22JC5X3a/mJPNluJ7RYkpDpaooA==
X-Received: by 2002:a92:ddc2:0:b0:300:b1fb:de2a with SMTP id
 d2-20020a92ddc2000000b00300b1fbde2amr13870554ilr.29.1667510622751; 
 Thu, 03 Nov 2022 14:23:42 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 d68-20020a6bcd47000000b006bc53dd917fsm731917iog.51.2022.11.03.14.23.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 14:23:42 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 15:23:40 -0600
Message-Id: <20221103212340.393546-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6FETUgPnBRhR4qr5TZh+CpP2uOUPUJHcsj3ZV84UisE=;
 b=mm2NDxMQ/tmZxFtOwAuhnjStbjJgirdroNTQXuNgwR0wQ6lsbK74m6+uhQwsSyiBrD
 KH+Bc7vddDwMLLZiwi6W0wuepQ62d2nN3DAxRA+VMKNFf+NOpAj1xrou4nH/7nQicjdX
 Fyn+AuDDvtquxydO2207qBYADLWgmzBlMxJmILLWixdq/AZzfRL04hd9aEkDA0itYK9m
 KmZ3c6vZvzTUC8UlY4+Cnc7RnZfQIliOdOxnXuqH6HsdUhO5jO6FUJwNJwEumMyY3t3q
 Y8dpea0bXlWsddkVLFeiGCF75BL1cW1ohRIt8P70HAeUgpOGHb8GkJC3YDIfn/s0ECzG
 wFtA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=mm2NDxMQ
Subject: [Buildroot] [PATCH 1/1] package/python-zlmdb: bump to version 22.6.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-zlmdb/python-zlmdb.hash | 4 ++--
 package/python-zlmdb/python-zlmdb.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-zlmdb/python-zlmdb.hash b/package/python-zlmdb/python-zlmdb.hash
index d98dc7d12a..1ae5d72efa 100644
--- a/package/python-zlmdb/python-zlmdb.hash
+++ b/package/python-zlmdb/python-zlmdb.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/zlmdb/json
-md5  d730a394b74108933a65c9fbe76aba36  zlmdb-22.3.1.tar.gz
-sha256  0d416a47b1ee627186af8e5c99e5246f6b277df44ba5c6bb67e947eabf948e5a  zlmdb-22.3.1.tar.gz
+md5  1e217f3228cb4c2303f06461b79e593e  zlmdb-22.6.1.tar.gz
+sha256  aff353121c2eed3c18e53c82358c41932a21bf882995ee3a79c6eb1ae4c95397  zlmdb-22.6.1.tar.gz
 # Locally computed sha256 checksums
 sha256  8a139bf325dcca11e0e476ce537bf791a6cfbeed8899a9b6ddc55238e180d230  LICENSE
diff --git a/package/python-zlmdb/python-zlmdb.mk b/package/python-zlmdb/python-zlmdb.mk
index a040622d9d..d20ac9e016 100644
--- a/package/python-zlmdb/python-zlmdb.mk
+++ b/package/python-zlmdb/python-zlmdb.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ZLMDB_VERSION = 22.3.1
+PYTHON_ZLMDB_VERSION = 22.6.1
 PYTHON_ZLMDB_SOURCE = zlmdb-$(PYTHON_ZLMDB_VERSION).tar.gz
-PYTHON_ZLMDB_SITE = https://files.pythonhosted.org/packages/71/87/bb3cebd5312e670e33551317c7fc5e4b6a4a9af39075a71cd541b32cc0bf
+PYTHON_ZLMDB_SITE = https://files.pythonhosted.org/packages/97/15/992e61a18cb64b573814c9d92676b22d522f2cc2ea79ff78b834bd392b80
 PYTHON_ZLMDB_SETUP_TYPE = setuptools
 PYTHON_ZLMDB_LICENSE = MIT
 PYTHON_ZLMDB_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
