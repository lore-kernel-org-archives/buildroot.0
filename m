Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7125C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 13:22:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52601417DF;
	Thu,  3 Nov 2022 13:22:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52601417DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id azS5yso5w3Tb; Thu,  3 Nov 2022 13:22:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27558417D1;
	Thu,  3 Nov 2022 13:22:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27558417D1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3F8B11BF3F4
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 13:22:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1826760FF6
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 13:22:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1826760FF6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2EptssT_1o1l for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 13:22:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9520B60FEF
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9520B60FEF
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 13:22:15 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id p141so1268335iod.6
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 06:22:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n0PTwOsdag19ocalG6wPB3TMiX+N54HtcxGVkWqKVaM=;
 b=uFtsoNrdCWewbSNxuqfO3LGeYUCYzjgIZBhEoLPppiagp0Lyhvqz6/JbAowu0XX903
 XkdNzExJFaYZ9JeP43FZQsrJfIhppSz9pI3pfD3Ap4jBeu3tu5HUSJlsxFiKvy7WKo/D
 01Fo0GzofZERy8bAICstA2lt2XUDX5F35mwWowFtm/A4uKLDdnFSiaalK+KUNDmlHrOn
 iZlYALH2VFSg4En9wEhoTYjGVP0p2ezRMwoinGETCYOAlZzbiv2JrHLOhjSRxHdQb9Pt
 sWLo1z1QdnnAUoLKzIFeVEkRpHOQdsTe7OLROrkQVIbJvNC/Yn3pfVlSZ6P4gwJggfxF
 1OOA==
X-Gm-Message-State: ACrzQf1S2tTdaArraQHCaCzrzp1KJvAxeSnbYiXRe/MaKW0W9bRmfuS+
 Hc5qe+kyeiKrLTc3On7BQqH1FWkMPH90S07y
X-Google-Smtp-Source: AMsMyM78z/s1BQ+wCK4pynmgaAfslIXV5YUixBqSST8vN5bkoaW8+tSJcKZfw2xiXB94THRfeM5qiw==
X-Received: by 2002:a05:6638:4094:b0:375:8dbb:ef89 with SMTP id
 m20-20020a056638409400b003758dbbef89mr2895098jam.93.1667481734338; 
 Thu, 03 Nov 2022 06:22:14 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 m18-20020a026d12000000b00372f8e38931sm204347jac.111.2022.11.03.06.22.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 06:22:13 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 07:22:12 -0600
Message-Id: <20221103132212.1181059-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=n0PTwOsdag19ocalG6wPB3TMiX+N54HtcxGVkWqKVaM=;
 b=grNRqs1AN+DxL0P2C84EQ8aQ0BpAupiD/+fVxTFYRq+ORj1EmOaCtI2ofDgVYLEllR
 qAK0oUVHNwM+fKh62/Nb/qLud8YBAHpPJ4h7np2xy6wNV7gQkXx9uqPyUg0tyZSbGBtE
 3IXoThZzsdymdFEwYcNu7QvN+89SSgVV9NX2arlQio3VBH9OD93noJkfSSt/45LJCMeF
 JdkmLDP0aKYc1MBqFNhdNmSE8N8Zm213Dpyg/phU38M6u+/7AD1bz6Swuo5z6KPF2rCx
 zv7U0LOyCmZ4XIbd6b2BiSafVZvWPXNE3j566wZGPmxzcLlq/ViSDr1lGJc6qVIL6AOA
 rpVg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=grNRqs1A
Subject: [Buildroot] [PATCH 1/1] package/python-networkx: bump to version
 2.8.8
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

License hash changed due to year update:
https://github.com/networkx/networkx/commit/922d587d8c556f87b664281109fefd7fc66d813f

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-networkx/python-networkx.hash | 6 +++---
 package/python-networkx/python-networkx.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-networkx/python-networkx.hash b/package/python-networkx/python-networkx.hash
index ace5c6721a..d166f0b8d8 100644
--- a/package/python-networkx/python-networkx.hash
+++ b/package/python-networkx/python-networkx.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/networkx/json
-md5  407eb28c54e08725559754ca7ab185e0  networkx-2.6.3.tar.gz
-sha256  c0946ed31d71f1b732b5aaa6da5a0388a345019af232ce2f49c766e2d6795c51  networkx-2.6.3.tar.gz
+md5  22139ab5a47818fa00cbaa91eb126381  networkx-2.8.8.tar.gz
+sha256  230d388117af870fce5647a3c52401fcf753e94720e6ea6b4197a5355648885e  networkx-2.8.8.tar.gz
 # Locally computed sha256 checksums
-sha256  f9c25c92ced5a264a3fe857231205d5eb625ae367935aaf8d61cdd5087dfb90e  LICENSE.txt
+sha256  aae9f809fb1a1592ed72e9f52df10cfad8fe226b8d4d28385f90dd4341ce7119  LICENSE.txt
diff --git a/package/python-networkx/python-networkx.mk b/package/python-networkx/python-networkx.mk
index 1908ed8f93..f097671d66 100644
--- a/package/python-networkx/python-networkx.mk
+++ b/package/python-networkx/python-networkx.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_NETWORKX_VERSION = 2.6.3
+PYTHON_NETWORKX_VERSION = 2.8.8
 PYTHON_NETWORKX_SOURCE = networkx-$(PYTHON_NETWORKX_VERSION).tar.gz
-PYTHON_NETWORKX_SITE = https://files.pythonhosted.org/packages/97/ae/7497bc5e1c84af95e585e3f98585c9f06c627fac6340984c4243053e8f44
+PYTHON_NETWORKX_SITE = https://files.pythonhosted.org/packages/cd/16/c44e8550012735b8f21b3df7f39e8ba5a987fb764ac017ad5f3589735889
 PYTHON_NETWORKX_LICENSE = BSD-3-Clause
 PYTHON_NETWORKX_LICENSE_FILES = LICENSE.txt
 PYTHON_NETWORKX_CPE_ID_VENDOR = python
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
