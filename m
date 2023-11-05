Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD113C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 04:58:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D398821D5;
	Sun,  5 Nov 2023 04:58:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D398821D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LscSG8rbu2G6; Sun,  5 Nov 2023 04:58:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E615821D0;
	Sun,  5 Nov 2023 04:58:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E615821D0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EC7021BF5A0
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 04:58:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D08DB400D6
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 04:58:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D08DB400D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gXwOXFKVzv4D for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 04:58:03 +0000 (UTC)
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 76FE8400A6
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 04:58:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76FE8400A6
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-3595eb920e9so9331495ab.0
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 21:58:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699160282; x=1699765082;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7wImixlTxp0AhUdfHCW70VG4tAcO51vengxbnX9yI6o=;
 b=GLiaZ+DCCC+EAxHfTFoZRXtnsVviiCQ5MnWjTZ3BS4r8Jt6e6wKK/RQoZTtqI/JObp
 J6ZcgZ9tia0577MJqvOKJRULW2hL5Zeyg/L3ibGdBE9/FVcP2mz+ncdOUbmL0nW84igH
 2EXHbraFnuXQQ8/eVn2hP3i2obmI4VKW1CTMaGRf7TBcunD8PyPk+UduZzbXVYWLU1fv
 noLBmKVQxMuug2VUS1OkuXihtMmipbOpRNZ6CIaAJbZKdZTT71O1gl6ZP1DV+D7gYRkn
 SsXuvMO+ErhhUlXSL9dAcLvcwZHIM5s06FFnNBdLOWy+GkUyU0++0CiiLfDMgcEue7xh
 RV4w==
X-Gm-Message-State: AOJu0Yyxds1DKn5QhX14ULbHJLNh9qkDSTalV47z1KziMeGSvUsPBdr1
 ttsZMRGCpw2IJIcmDwmURU8YusMiiec=
X-Google-Smtp-Source: AGHT+IErQbyA9j1uc+JzIpQqM56b0KmO2ewmjvVhZhSyex9kyuXSjV+sU5s3kko5Sy+kAuDMSPk61g==
X-Received: by 2002:a05:6e02:1251:b0:359:506c:8b05 with SMTP id
 j17-20020a056e02125100b00359506c8b05mr8643995ilq.20.1699160282001; 
 Sat, 04 Nov 2023 21:58:02 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 cd1-20020a056e02320100b003580ba53423sm1656019ilb.53.2023.11.04.21.58.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 21:58:01 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 22:58:00 -0600
Message-Id: <20231105045800.2824317-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699160282; x=1699765082; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7wImixlTxp0AhUdfHCW70VG4tAcO51vengxbnX9yI6o=;
 b=YLnnaB+mkFSIYuN+5TSYq2ENZx8sqIBlRNQ/r6Estxrz4kjnIluVqvmCoCROXrtMhT
 tOwOq7dqkIAB9Q88k6iGTENTz94zeKsWcrUkYlss5UQKWBmnYTR5GF6Uhj3yyCl1IHFT
 /UCO7pTgmccBW3eNAxXepGGJjT+pyjkfApRDtylEnghNQvail8dFF9l3hGMgieYSpug4
 V4B76hDqXDm3RFxrczpwVg8G9p6Hg8W2llWw7dSoEKuQ2Gjk+hOgT2HFmjp45Fm3y9fv
 sWFVfZSrQ1cBmtPXD/rDRmBB3fKgra8zsKOPhMHW2RX9o4SjB7YOUu7gDSFd76GiwYNV
 b7Ig==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YLnnaB+m
Subject: [Buildroot] [PATCH 1/1] package/python-docutils: bump to version
 0.20.1
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

License hash changed due to include header being added:
https://sourceforge.net/p/docutils/code/9280/

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-docutils/python-docutils.hash | 6 +++---
 package/python-docutils/python-docutils.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-docutils/python-docutils.hash b/package/python-docutils/python-docutils.hash
index 6a36f362e9..2386cc2891 100644
--- a/package/python-docutils/python-docutils.hash
+++ b/package/python-docutils/python-docutils.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/docutils/json
-md5  0afa992a6e93db892107c3f087d0d9df  docutils-0.19.tar.gz
-sha256  33995a6753c30b7f577febfc2c50411fec6aac7f7ffeb7c4cfe5991072dcf9e6  docutils-0.19.tar.gz
+md5  93bcfe0065cf1d0b6a0bcabeca7a2335  docutils-0.20.1.tar.gz
+sha256  f08a4e276c3a1583a86dce3e34aba3fe04d02bba2dd51ed16106244e8a923e3b  docutils-0.20.1.tar.gz
 # Locally computed sha256 checksums
-sha256  16b78bd9994588326a871ac39f64480969ebeb57ecd46a31874744560e72390a  COPYING.txt
+sha256  a0d7ee761e8d757c0b904518514f98233fd94f2398da3703130d15142ca47a77  COPYING.txt
diff --git a/package/python-docutils/python-docutils.mk b/package/python-docutils/python-docutils.mk
index d06521d10f..2b496f0d46 100644
--- a/package/python-docutils/python-docutils.mk
+++ b/package/python-docutils/python-docutils.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DOCUTILS_VERSION = 0.19
+PYTHON_DOCUTILS_VERSION = 0.20.1
 PYTHON_DOCUTILS_SOURCE = docutils-$(PYTHON_DOCUTILS_VERSION).tar.gz
-PYTHON_DOCUTILS_SITE = https://files.pythonhosted.org/packages/6b/5c/330ea8d383eb2ce973df34d1239b3b21e91cd8c865d21ff82902d952f91f
+PYTHON_DOCUTILS_SITE = https://files.pythonhosted.org/packages/1f/53/a5da4f2c5739cf66290fac1431ee52aff6851c7c8ffd8264f13affd7bcdd
 PYTHON_DOCUTILS_LICENSE = Public Domain, BSD-2-Clause, BSD-3-Clause, Python-2.0, GPL-3.0+ (emacs mode)
 PYTHON_DOCUTILS_LICENSE_FILES = COPYING.txt
 PYTHON_DOCUTILS_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
