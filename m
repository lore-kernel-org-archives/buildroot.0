Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77924C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 03:32:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 048CA84BD2;
	Sun, 24 Jul 2022 03:32:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 048CA84BD2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SBpaW-XfUe28; Sun, 24 Jul 2022 03:32:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E605784BCB;
	Sun, 24 Jul 2022 03:32:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E605784BCB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B6FA01BF332
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 03:32:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8CCAE84BCB
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 03:32:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CCAE84BCB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LTz8KmCzakaV for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 03:32:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9294F84BC0
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9294F84BC0
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 03:32:44 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id o17so3888070ils.9
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 20:32:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0bx1qtmJkz2TmpfC+jdYftwGeiIUYQ9ZaKlixrQXCHA=;
 b=0GGQHX13z2Yb/q4rNhhYYkO7KLUUPPArZY+HwfAeBMz1MOcCF4NMdRm/e8C5lTz/Nx
 OIuFs2Yj/8qXPX2Y20QyGA56anFXtKKfY+tHHSUPFoaBnStWgRkNjFS4/dJIpAXGEoi1
 FZOQtVjPcPIxL6BATbpvsqldXKieArmzSaxEmKto/l2A4eJrjJO47LmaGBU0Wt1p5McZ
 08oYPQsLHe2/aR43BoBbE3y1171Ocw49okPwQq9EVXWg9dVSEH6oeVOpx7PlUppMlPfB
 XTpjy5mopYj4hVT2/g9uhum/tIF+gXNOJrtZL8qfiexabW1bL+rUdfJjNH8OekE6c7QN
 mRUA==
X-Gm-Message-State: AJIora+jI8ys7Ety3RWLpDW552+balFPEzPDZ2bRU8zD4E42P09tQQ5v
 6k83AJMTgheqV4e+eAo6NpcVsi2MAJ1IhA==
X-Google-Smtp-Source: AGRyM1s/aVx1KTzlS3bJaa/cCPpyomHzZ+XcPp2lIB8ZZnsU14BhOgxj7OdojebjjJ05tH85gZPMrg==
X-Received: by 2002:a05:6e02:1a48:b0:2dc:d059:8f5b with SMTP id
 u8-20020a056e021a4800b002dcd0598f5bmr2687566ilv.264.1658633563403; 
 Sat, 23 Jul 2022 20:32:43 -0700 (PDT)
Received: from james-x399.localdomain (71-33-133-32.hlrn.qwest.net.
 [71.33.133.32]) by smtp.gmail.com with ESMTPSA id
 x2-20020a029482000000b0033f16e84688sm3772104jah.8.2022.07.23.20.32.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 20:32:42 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 21:32:40 -0600
Message-Id: <20220724033240.1271154-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0bx1qtmJkz2TmpfC+jdYftwGeiIUYQ9ZaKlixrQXCHA=;
 b=n0I11UKD1tvu8MtxCTBgDp30s1OkFGfmKd1SDPp/zRDVJw9mGh5ndz0lR/pEUcpwKg
 3nyQFDE2bxhAkxvoAH2zxKbZxh/IZd3b5RxoQ+fR5dkuX/an+BeMqgybP5oSdn8zQYS3
 oUzAbvEPvBA6Cg9mM0QIVAp7706LNDd2hZW+cJRzrTZKU+mNOsHFIyI+SVkL09qaf22u
 KsST/HhSXeZGW3KoseZjvisMurJF6mlD0jQ1C/X8RVyx0O0cmAs5Mwj/X7Uk5RDAmrSp
 hZGLYoyFoPZZk0RBkr16MeOkmCxrrAKVPzkbVYbD/46kqQnfG8hKPZvs1NFOjh1fVWUk
 uY0A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=n0I11UKD
Subject: [Buildroot] [PATCH 1/1] package/python-requests: bump to version
 2.28.1
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
 package/python-requests/python-requests.hash | 4 ++--
 package/python-requests/python-requests.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-requests/python-requests.hash b/package/python-requests/python-requests.hash
index 1e4cbaff7b..1383e680d5 100644
--- a/package/python-requests/python-requests.hash
+++ b/package/python-requests/python-requests.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/requests/json
-md5  bcc01b73974a305cc7c5b092e7d07004  requests-2.27.1.tar.gz
-sha256  68d7c56fd5a8999887728ef304a6d12edc7be74f1cfa47714fc8b414525c9a61  requests-2.27.1.tar.gz
+md5  796ea875cdae283529c03b9203d9c454  requests-2.28.1.tar.gz
+sha256  7c5599b102feddaa661c826c56ab4fee28bfd17f5abca1ebbe3e7f19d7c97983  requests-2.28.1.tar.gz
 # Locally computed sha256 checksums
 sha256  09e8a9bcec8067104652c168685ab0931e7868f9c8284b66f5ae6edae5f1130b  LICENSE
diff --git a/package/python-requests/python-requests.mk b/package/python-requests/python-requests.mk
index 9613a2c47c..7a21cca52c 100644
--- a/package/python-requests/python-requests.mk
+++ b/package/python-requests/python-requests.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REQUESTS_VERSION = 2.27.1
+PYTHON_REQUESTS_VERSION = 2.28.1
 PYTHON_REQUESTS_SOURCE = requests-$(PYTHON_REQUESTS_VERSION).tar.gz
-PYTHON_REQUESTS_SITE = https://files.pythonhosted.org/packages/60/f3/26ff3767f099b73e0efa138a9998da67890793bfa475d8278f84a30fec77
+PYTHON_REQUESTS_SITE = https://files.pythonhosted.org/packages/a5/61/a867851fd5ab77277495a8709ddda0861b28163c4613b011bc00228cc724
 PYTHON_REQUESTS_SETUP_TYPE = setuptools
 PYTHON_REQUESTS_LICENSE = Apache-2.0
 PYTHON_REQUESTS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
