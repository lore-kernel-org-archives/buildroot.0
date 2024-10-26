Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0188CD10C06
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 20:47:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5908401B0;
	Sat, 26 Oct 2024 20:47:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F7E8KP7Wro6E; Sat, 26 Oct 2024 20:47:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CB56401BA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CB56401BA;
	Sat, 26 Oct 2024 20:47:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 133705C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 20:47:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 00D42605AD
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 20:47:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0GbUmmHl-9Mv for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 20:47:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::129; helo=mail-il1-x129.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 21BF5605A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21BF5605A3
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 21BF5605A3
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 20:47:16 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id
 e9e14a558f8ab-3a3aeb19ea2so11771305ab.0
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 13:47:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729975636; x=1730580436;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=74gMZ1FrbhUeDRzu7LXdMAqvwBjN0qudDaOoItbAOio=;
 b=Z9xzZq6AmLZENYvg3yvBzesJzr361Uqdp+kWHXuxN4JuXIQxtoEa/8kYE7AgDm1Krw
 0J/E1+/yYus0oZOY2IkP+dJl229bmPxHTRL7CPbO9RwW/aB2VWWqL4tmhRfmkuJiQ1X2
 qcdCfmLwClBNiQYECMw5yg0qM5KxkAwyyAdytUoMUgX07CLxq4Jrp/kIJzYTk7zLNOd9
 dlbs/SfTHIGdxVi8dM7UKxh3gPMVE0/Zc1M/cFdRCvrtMkqJeIXUtAwMHEMf2cs3rrBP
 VclUeFcn3tkX4aoK74CFXdsj+EqeVNrWlUlH8MAzTVPQjfogQS4Toz8WEWCsH6QMjBpO
 /Mew==
X-Gm-Message-State: AOJu0YwnIpuOOdP76S1MKiBrOtfhrSOF2nKst7xeRxgJitPsfAJwLK63
 CG+7EDR5M4alr7xNsbyrwykz6qe787KSMAuVuk4+uQVNYEF7yvrfjoKHqQ==
X-Google-Smtp-Source: AGHT+IFASTsaX9PkUE7F8Q5zBnwgj5hP0IS3w422GAWicUpSu0z6AqBBbi1i7hFCM0e5ipOiDzfddw==
X-Received: by 2002:a05:6e02:1568:b0:3a1:a163:ba64 with SMTP id
 e9e14a558f8ab-3a4ed264feemr29846385ab.3.1729975635746; 
 Sat, 26 Oct 2024 13:47:15 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dc725ebcd3sm894202173.24.2024.10.26.13.47.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Oct 2024 13:47:15 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 14:47:14 -0600
Message-Id: <20241026204714.3622493-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729975636; x=1730580436; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=74gMZ1FrbhUeDRzu7LXdMAqvwBjN0qudDaOoItbAOio=;
 b=ft9moXE9BDhX3ke72nmYPMUTaFAo6knkuPeLE110HHliOsnXkW1GF+XOijNwKmnGU9
 JU1JC3wnRsWHnEg/TM69Zz4VBcYTYU5yaUco0QKPPZeMvT5uJecdjv5RCEUoSML6J+OB
 w450ycbfz2k5njm6eY7GXYuH1MdFtHfMhqtZroegPilrpJL9/X2l9uN0p+kBg0H+UPnE
 ohkMNtzoBCSV57KzsFZ9RWSTlYyq4HYapUF+mhap8k3ly1RnvJPzWoSwv4dLm2tnfm9H
 TDUvpAy75gq2f1aORQ+TbOTHI6y41mR3NzKS/SfOvD5vVyjs3A3IJAtyYQ1wfAXwJm1o
 pDbA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ft9moXE9
Subject: [Buildroot] [PATCH 1/1] package/python-mako: bump to version 1.3.6
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Bernd Kuhls <bernd@kuhls.net>, James Hilliard <james.hilliard1@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-mako/python-mako.hash | 4 ++--
 package/python-mako/python-mako.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-mako/python-mako.hash b/package/python-mako/python-mako.hash
index 07caaf8f75..0a39db7db9 100644
--- a/package/python-mako/python-mako.hash
+++ b/package/python-mako/python-mako.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/mako/json
-md5  0cf9ef37c1f8ffd453ef2b2a3a5573b3  Mako-1.3.5.tar.gz
-sha256  48dbc20568c1d276a2698b36d968fa76161bf127194907ea6fc594fa81f943bc  Mako-1.3.5.tar.gz
+md5  ca119a43eb3eff532bd5d55d585d1caa  mako-1.3.6.tar.gz
+sha256  9ec3a1583713479fae654f83ed9fa8c9a4c16b7bb0daba0e6bbebff50c0d983d  mako-1.3.6.tar.gz
 # Locally computed sha256 checksums
 sha256  15627b36b38d0729cdd686df9abf606503d99d624b2f5ec5cb254a75d5afa891  LICENSE
diff --git a/package/python-mako/python-mako.mk b/package/python-mako/python-mako.mk
index 258b2db014..68cfc98bc2 100644
--- a/package/python-mako/python-mako.mk
+++ b/package/python-mako/python-mako.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MAKO_VERSION = 1.3.5
-PYTHON_MAKO_SOURCE = Mako-$(PYTHON_MAKO_VERSION).tar.gz
-PYTHON_MAKO_SITE = https://files.pythonhosted.org/packages/67/03/fb5ba97ff65ce64f6d35b582aacffc26b693a98053fa831ab43a437cbddb
+PYTHON_MAKO_VERSION = 1.3.6
+PYTHON_MAKO_SOURCE = mako-$(PYTHON_MAKO_VERSION).tar.gz
+PYTHON_MAKO_SITE = https://files.pythonhosted.org/packages/fa/0b/29bc5a230948bf209d3ed3165006d257e547c02c3c2a96f6286320dfe8dc
 PYTHON_MAKO_SETUP_TYPE = setuptools
 PYTHON_MAKO_LICENSE = MIT
 PYTHON_MAKO_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
