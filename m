Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B230AD1358B
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 00:54:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76C7C405FB;
	Mon, 28 Oct 2024 00:54:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sr3yoZuIYXHS; Mon, 28 Oct 2024 00:54:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BD6C405FD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BD6C405FD;
	Mon, 28 Oct 2024 00:54:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 35ED8112A
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 00:54:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 31D1E4028F
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 00:54:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jOLfQwnDlpLA for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 00:54:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2e; helo=mail-io1-xd2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EFADD404E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EFADD404E2
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EFADD404E2
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 00:54:37 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-83ace760016so139577039f.1
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 17:54:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730076877; x=1730681677;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U6TqboLa/pGz3GgtVw5rWkGrwsVeTVnPjf2YJ4hJiFM=;
 b=PY7OI1HvChK5q6/V4uMCndPAsQYJ8K8cds60vq+TBktZ+HCZEgwkJR8xFty/Fb+1/V
 qVmmPoPIkM7txOth2uS6XMMwjhJ/7nreUhpLRTMPr2HZMuialQMD/0BDlscz2RCBC4oa
 vc0MHteSUzZ59StQ2xME38+HwxOK2eFmfth4vZ4nB02IcnGxoGAPoXLIPIFuRtMM2IEc
 otDJs9eJwdeahycOwO2L0tET4ryV5aXyh5LNHm/R/fGgED4mBa1ybhKFWXzNIpwx6S7z
 CNyb4B2jVk8gHZHuiDucXBQN5ISQiTNLapG27HHqCtqpK60ZkBMcBgNRktDt7sPSojEs
 iYxg==
X-Gm-Message-State: AOJu0Yz+jAuc00fCOVJoxOILCWpxbY5w+TTKgTn0oUlK3QyKWPL/yGsj
 L3lb6z3h7yNhIwCwMfQBW9nZpD004KC0ZtkeifjEBf6+aTS17axmgPI+dA==
X-Google-Smtp-Source: AGHT+IHmKgv26DZUQhWMfslcLWfbCzcvfruV9+VQ78mzO7cPs1iPChCmsjDBPfK/61kk1z7rNVt//w==
X-Received: by 2002:a05:6e02:190f:b0:3a4:e6e9:2575 with SMTP id
 e9e14a558f8ab-3a4e6e9281emr70568525ab.7.1730076876717; 
 Sun, 27 Oct 2024 17:54:36 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dc726176c0sm1383733173.55.2024.10.27.17.54.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2024 17:54:36 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Oct 2024 18:54:34 -0600
Message-Id: <20241028005434.4119815-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730076877; x=1730681677; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=U6TqboLa/pGz3GgtVw5rWkGrwsVeTVnPjf2YJ4hJiFM=;
 b=GzngQOWagA6+/pRP0Uj39wgkk+D8da3LWaNQIYsrXdJmk4e79i0iopzQYSRisIP67j
 eGyNtlXiOeB3r8rQPuNyu5fLk32BNT/kpnrvjZ7CBiEg2tStimnjtJxJa2qOoNtGCmQh
 MBLrsTXArocpqiGyUGmg0kHM+GC5UCWQQztzfdV6UhLCujU3uAhNu2wEKh89/MZ7uEST
 +56KTjiw84fBhTwDlbWzEawcJZ8HFR4bcZYua5Wc7ak+DK9RoaQelVJwfwc4tyRxJaaN
 d/tfe+Dc0bUjqbMDKlHjnrsMfRGwQ1wDwUL2OhUbJAiQ/A5cTrepJ/h9DcxXymdp/8pr
 3Ptw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GzngQOWa
Subject: [Buildroot] [PATCH 1/1] package/python-urwid: bump to version 2.6.16
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
Cc: Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-urwid/python-urwid.hash | 4 ++--
 package/python-urwid/python-urwid.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-urwid/python-urwid.hash b/package/python-urwid/python-urwid.hash
index 4804555b22..871cafccd4 100644
--- a/package/python-urwid/python-urwid.hash
+++ b/package/python-urwid/python-urwid.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/urwid/json
-md5  73e4171e00a673afbc1eb32eaf7d31e0  urwid-2.6.15.tar.gz
-sha256  9ecc57330d88c8d9663ffd7092a681674c03ff794b6330ccfef479af7aa9671b  urwid-2.6.15.tar.gz
+md5  214f9cea321ccae131cecfaef2a4aa9a  urwid-2.6.16.tar.gz
+sha256  93ad239939e44c385e64aa00027878b9e5c486d59e855ec8ab5b1e1adcdb32a2  urwid-2.6.16.tar.gz
 # Locally computed sha256 checksums
 sha256  36b6d3fa47916943fd5fec313c584784946047ec1337a78b440e5992cb595f89  COPYING
diff --git a/package/python-urwid/python-urwid.mk b/package/python-urwid/python-urwid.mk
index 66b067a20c..411727660f 100644
--- a/package/python-urwid/python-urwid.mk
+++ b/package/python-urwid/python-urwid.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_URWID_VERSION = 2.6.15
+PYTHON_URWID_VERSION = 2.6.16
 PYTHON_URWID_SOURCE = urwid-$(PYTHON_URWID_VERSION).tar.gz
-PYTHON_URWID_SITE = https://files.pythonhosted.org/packages/85/b7/516b0bbb7dd9fc313c6443b35d86b6f91b3baa83d2c4016e4d8e0df5a5e3
+PYTHON_URWID_SITE = https://files.pythonhosted.org/packages/98/21/ad23c9e961b2d36d57c63686a6f86768dd945d406323fb58c84f09478530
 PYTHON_URWID_LICENSE = LGPL-2.1+
 PYTHON_URWID_LICENSE_FILES = COPYING
 PYTHON_URWID_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
