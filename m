Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD6B3C28D13
	for <buildroot@archiver.kernel.org>; Mon, 22 Aug 2022 07:11:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 40BF9405FC;
	Mon, 22 Aug 2022 07:11:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40BF9405FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YXb4ARa8vfz3; Mon, 22 Aug 2022 07:11:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6717F4013D;
	Mon, 22 Aug 2022 07:11:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6717F4013D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AB1111BF577
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 07:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 938AC60AB0
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 07:11:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 938AC60AB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0NCzlfnFp_Aa for <buildroot@lists.busybox.net>;
 Mon, 22 Aug 2022 07:11:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EF5F60671
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9EF5F60671
 for <buildroot@buildroot.org>; Mon, 22 Aug 2022 07:11:09 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-11ba6e79dd1so11817991fac.12
 for <buildroot@buildroot.org>; Mon, 22 Aug 2022 00:11:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=w0czwU82crZ6PgLd9NAiJxQNQ76HOKUd8QpuJOg4R+s=;
 b=xuPnaojZ9MHPNsqC9D2+4h3VHw/i1Sfee6Fgt4eKeR7be8Y1BQPsdeqtVdW/6z3hBF
 /DrAW4VSODCJRBfSgbvzCyRvEaoTsO4cFTKRti3n/y5/GGOdO/xIBmTeZc37o8oJKAA7
 QhP7AFYeOXkIQjwSIN2/i+wQpifmGsRWMvm/0zGY5vlWrgg2OnRGrmZM6WGILU5oJ01s
 u0q0iXlZTnzIkejeW11RsXGG6+8bqEEd9mXxwlf/3oWXpHah11YDiclMuURlATFQ8SXa
 8TNgJUXMHYjMG6vL8tfa/Ih9fm1VA8SZOXLBpnALRLxZ7sWg4kB5rM007SVA3SSA5Bb7
 y/9A==
X-Gm-Message-State: ACgBeo1FatDWopMMo9UXoVR6WZcbielr6Xiqb8KvmIXpum/t8M1n2Ihh
 s5oY5wQ1srIIR+oNMbfx0JekWzZEJZk=
X-Google-Smtp-Source: AA6agR7XTQkZGsFJnvYU5XP0N+7oEi0V3TbBD0Lf+JNMuU+nYpcxKxh3dD1qZYzp4KQMUEpk0kev/A==
X-Received: by 2002:a05:6870:2481:b0:11c:63d3:fed3 with SMTP id
 s1-20020a056870248100b0011c63d3fed3mr9098157oaq.16.1661152267328; 
 Mon, 22 Aug 2022 00:11:07 -0700 (PDT)
Received: from james-x399.localdomain (71-33-138-207.hlrn.qwest.net.
 [71.33.138.207]) by smtp.gmail.com with ESMTPSA id
 ch8-20020a056830638800b006391adb6034sm1196329otb.72.2022.08.22.00.11.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 00:11:05 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 22 Aug 2022 01:11:02 -0600
Message-Id: <20220822071102.3890085-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=w0czwU82crZ6PgLd9NAiJxQNQ76HOKUd8QpuJOg4R+s=;
 b=LvevrlcCMY45AR9Ncl1fMM0OwNk3fA/x8A8+WbpmJCZ7QeXYp4C9ebrfWh7MyU4ou9
 MeHAu30KqdmeNHYoA5t4CRqhMIXm5gMq1w4gtOdnW2Y0G2Mu77DNAjiBVJ+flzoU3O69
 js+PWUgSPlVC07BhhdAuUqVsXDUHFUb0TUh5PjAfNkPSJhC13kEncS7JWuRUCulq0Jyj
 gZwzSWyfADyanlDPP2giRNnuRZFHXtEPzSnvMPPnAUwRUPtt0qtk+bveUyVinmJy4Hsz
 t5SCan8Wivo4vFHgSfYDO4q6u/A2FexQq3TifJwRbORfZfRfQ1bsdrXu1ZL5XVtCsLxw
 ed5Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=LvevrlcC
Subject: [Buildroot] [PATCH 1/1] package/python-charset-normalizer: bump to
 version 2.1.1
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
 .../python-charset-normalizer/python-charset-normalizer.hash  | 4 ++--
 .../python-charset-normalizer/python-charset-normalizer.mk    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-charset-normalizer/python-charset-normalizer.hash b/package/python-charset-normalizer/python-charset-normalizer.hash
index 8aefddbbf1..3d50b2872d 100644
--- a/package/python-charset-normalizer/python-charset-normalizer.hash
+++ b/package/python-charset-normalizer/python-charset-normalizer.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/charset-normalizer/json
-md5  c1be418ec00773d84d793f23b2bbc3cd  charset-normalizer-2.1.0.tar.gz
-sha256  575e708016ff3a5e3681541cb9d79312c416835686d054a23accb873b254f413  charset-normalizer-2.1.0.tar.gz
+md5  a70f9fc85b6b8265c982eca6fe51381f  charset-normalizer-2.1.1.tar.gz
+sha256  5a3d016c7c547f69d6f81fb0db9449ce888b418b5b9952cc5e6e66843e9dd845  charset-normalizer-2.1.1.tar.gz
 # Locally computed sha256 checksums
 sha256  eb31a0c5a4fb09b8a4e32055d25c1e5f9c358a2752fef3cd720213d1ccfee241  LICENSE
diff --git a/package/python-charset-normalizer/python-charset-normalizer.mk b/package/python-charset-normalizer/python-charset-normalizer.mk
index c313d4cbce..72728a25b3 100644
--- a/package/python-charset-normalizer/python-charset-normalizer.mk
+++ b/package/python-charset-normalizer/python-charset-normalizer.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CHARSET_NORMALIZER_VERSION = 2.1.0
+PYTHON_CHARSET_NORMALIZER_VERSION = 2.1.1
 PYTHON_CHARSET_NORMALIZER_SOURCE = charset-normalizer-$(PYTHON_CHARSET_NORMALIZER_VERSION).tar.gz
-PYTHON_CHARSET_NORMALIZER_SITE = https://files.pythonhosted.org/packages/93/1d/d9392056df6670ae2a29fcb04cfa5cee9f6fbde7311a1bb511d4115e9b7a
+PYTHON_CHARSET_NORMALIZER_SITE = https://files.pythonhosted.org/packages/a1/34/44964211e5410b051e4b8d2869c470ae8a68ae274953b1c7de6d98bbcf94
 PYTHON_CHARSET_NORMALIZER_SETUP_TYPE = setuptools
 PYTHON_CHARSET_NORMALIZER_LICENSE = MIT
 PYTHON_CHARSET_NORMALIZER_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
